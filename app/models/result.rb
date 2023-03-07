class Result < ApplicationRecord
  belongs_to :change_detector

  validates :result, presence: true
end
