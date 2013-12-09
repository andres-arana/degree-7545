class Team < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :tournament

  resourcify

  def has_members?
    User.with_role(:member, self).any?
  end

  def members_confirmed?
    not User.with_role(:member, self).where(invitation_accepted_at: nil).any?
  end

  def find_members
    User.with_role :member, self
  end
end
