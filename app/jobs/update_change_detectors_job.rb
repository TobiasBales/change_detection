class UpdateChangeDetectorsJob < ApplicationJob
  queue_as :default

  def perform
    ChangeDetector.all.each do |change_detector|
      response = Faraday.get(change_detector.url)

      return unless response.body == change_detector.result

      Rails.logger.info("Change detected for #{change_detector.url}")

      change_detector.result = response.body
    end
  end
end
