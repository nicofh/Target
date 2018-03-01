class Target < ApplicationRecord
  validates :topic, :length, :title, :latitude, :longitude, presence: true
  TOPICS = %w[football travel politics art dating music movies series food].freeze
end
