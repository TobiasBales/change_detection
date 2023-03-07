class UpdateChangeDetectorsJob < ApplicationJob
  queue_as :default

  def perform
    puts('Updating change detectors')

    ChangeDetector.all.each do |change_detector|
      puts("Processing change detector for #{change_detector.url} for #{change_detector.user.email}")

      change_detector.migrate_to_result_model

      response = Faraday.get(change_detector.url)

      return puts('No change detected') unless change_detector.changed?(response.body)

      message = "Change detected for #{change_detector.url}"
      puts(message)
      send_telegram_message(change_detector.user.telegram_id, message)

      change_detector.store_result(response.body)
    end

    nil
  end

  private

  def telegram_secret
    Rails.configuration.telegram_secret
  end

  def send_telegram_message(chat_id, message)
    return puts('Not sending telegram message because no telegram secret is present') unless telegram_secret

    return puts('Not sending telegram message because no chat id is present') unless chat_id

    Faraday.post("https://api.telegram.org/#{telegram_secret}/sendMessage?chat_id=#{chat_id}&text=#{message}")
  end
end
