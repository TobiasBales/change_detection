class ChangeDetector < ApplicationRecord
  belongs_to :user

  has_many :results

  def changed?(result)
    last_result = results.order(created_at: :desc).first

    return true if last_result.nil?

    last_result.result != result
  end

  def store_result(result)
    results.build(result:).save!
  end

  def migrate_to_result_model
    return if result.nil?

    ActiveRecord::Base.transaction do
      store_result(result)

      self.result = nil
      save!
    end
  end
end
