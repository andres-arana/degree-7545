class Team < ActiveRecord::Base
  belongs_to :tournament

  validates :name, presence: true

  def has_members?
    User.with_role(:member, self).any?
  end

  def find_members
    User.with_role :member, self
  end
end
