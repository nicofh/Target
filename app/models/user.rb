class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :targets

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      auth_info = auth.info
      user.email = auth_info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth_info.name   # assuming the user model has a name
      user.image = auth_info.image # assuming the user model has an image
    end
  end
end
