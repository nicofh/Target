class Target < ApplicationRecord
  TOPICS = %w[football travel politics art dating music movies series food].freeze
  NUMBER_OF_PERMITTED_TARGETS = 10
  validate :validate_targets_limit
  validates :topic, :length, :title, :latitude, :longitude, :user, presence: true
  belongs_to :user

  scope :shared_topic, ->(target) { where(topic: target.topic).where.not(user_id: target.user_id) }

  def matches
    radius_query = "earth_distance(ll_to_earth(#{latitude},#{longitude}),"\
                    " ll_to_earth(latitude, longitude)) <= (#{length} + length)"
    Target.shared_topic(self).where(radius_query).to_a
  end

  private

  def validate_targets_limit
    errors.add(:user, 'limit reached') if user && user.targets.count >= NUMBER_OF_PERMITTED_TARGETS
  end
end
