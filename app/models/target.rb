class Target < ApplicationRecord
  validates :topic, presence: true
  validates :length, presence: true
  validates :title, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
