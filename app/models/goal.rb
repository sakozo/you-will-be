class Goal < ApplicationRecord
  has_many :y_times
  has_many :users
end
