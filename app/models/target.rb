class Target < ApplicationRecord
  TOPICS = %w[football travel politics art dating music movies series food].freeze
  validates :topic, :length, :title, :latitude, :longitude, :user, presence: true
  belongs_to :user

  scope :shared_topic, ->(target) { where(topic: target.topic).where.not(user_id: target.user_id) }

  def matches
    radius_query = "earth_distance(ll_to_earth(#{latitude},#{longitude}),"\
                    " ll_to_earth(latitude, longitude)) <= (#{length} + length)"
    Target.shared_topic(self).where(radius_query).to_a
  end
end
