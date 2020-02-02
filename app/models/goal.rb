class Goal < ApplicationRecord
  has_many :y_times
  has_many :users

  mount_uploader :image, ImageUploader
end
