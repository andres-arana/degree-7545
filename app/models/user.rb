class User < ActiveRecord::Base

  has_many :notifications, dependent: :destroy, autosave: true

  devise :invitable, :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable, :confirmable, :omniauthable,
    omniauth_providers: [:facebook]

  rolify

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

  def organizes_tournaments?
    Tournament.with_role(:organizer, self).any?
  end

  def organized_tournaments
    Tournament.with_role :organizer, self
  end

  def organized_tournaments_label
    self.organized_tournaments.map(&:name).join(", ")
  end

  def joined_teams?
    Team.with_role(:member, self).any?
  end

  def joined_teams
    Team.with_role(:member, self)
  end

  def has_notifications?
    !self.notifications.empty?
  end

  def latest_notifications
    self.notifications.order('created_at DESC').limit(10)
  end
end
