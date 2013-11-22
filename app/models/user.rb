class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :confirmable,
    :omniauthable, omniauth_providers: [:facebook]

  has_many :tournaments, dependent: :destroy

  def has_tournaments?
    tournaments.exists?
  end

  def self.find_or_create_for_facebook(auth)
    # First try to fetch the user based on the auth information
    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first
    user ||= create_from_facebook(auth)
    user
  end

  def self.create_from_facebook(auth)
    user = User.new(
      name: auth.extra.raw_info.name,
      provider: auth.provider,
      uid: auth.uid,
      email: auth.info.email,
      password: Devise.friendly_token[0, 20])
    user.skip_confirmation!
    user.save!
    user
  end
end
