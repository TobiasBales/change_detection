class UpdateChangeDetectorsJob < ApplicationJob
  queue_as :default

  def perform
    Rails.logger.info('Updating change detectors')

    ChangeDetector.all.each do |change_detector|
      Rails.logger.info("Processing change detector for #{change_detector.url} for #{change_detector.user.email}")

      response = Faraday.get(change_detector.url)
      normalized_response = change_detector.normalize(response.body)

      return Rails.logger.info('No change detected') unless change_detector.changed?(normalized_response)

      message = "Change detected for #{change_detector.url}"
      Rails.logger.info(message)
      send_telegram_message(change_detector.user.telegram_id, message)

      change_detector.store_result(normalized_response)
    end

    nil
  end

  private

  def telegram_secret
    Rails.configuration.telegram_secret
  end

  def send_telegram_message(chat_id, message)
    unless telegram_secret
      return Rails.logger.info('Not sending telegram message because no telegram secret is present')
    end

    return Rails.logger.info('Not sending telegram message because no chat id is present') unless chat_id

    Faraday.post("https://api.telegram.org/#{telegram_secret}/sendMessage?chat_id=#{chat_id}&text=#{message}")
  end
end
