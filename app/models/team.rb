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

  def all_events
    Event.
      where("first_team_id = ? or second_team_id = ?", self.id, self.id)
  end
end
