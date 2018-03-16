class Target < ApplicationRecord
  validates :topic, :length, :title, :latitude, :longitude, :user, presence: true
  TOPICS = %w[football travel politics art dating music movies series food].freeze
  belongs_to :user
end
