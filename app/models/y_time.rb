class YTime < ApplicationRecord
  validates :time, presence: true
  belongs_to :goal
  belongs_to :user
end
