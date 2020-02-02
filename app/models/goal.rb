class Goal < ApplicationRecord
  validates :name, presence: true
  validates :time, presence: true
  validates :image, presence: true

  has_many :y_times
  has_many :users
  mount_uploader :image, ImageUploader
end
