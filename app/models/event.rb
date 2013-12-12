class Event < ActiveRecord::Base
  include EventNotifications

  belongs_to :first_team, class_name: 'Team'
  belongs_to :second_team, class_name: 'Team'
  belongs_to :location
  belongs_to :tournament

  validates :first_team, presence: true
  validates :second_team, presence: true
  validates :tournament, presence: true

  after_initialize :default_values

  def unplanned?
    !(self.date and self.location)
  end


  def team_confirmation_pending?(team)
    if self.first_team.id == team.id
      !first_team_confirmed_at
    elsif self.second_team.id == team.id
      !second_team_confirmed_at
    else
      false
    end
  end

  def team_confirmed?
    (self.first_team_confirmed_at_changed? and self.first_team_confirmed_at) or
      (self.second_team_confirmed_at_changed? and self.second_team_confirmed_at)
  end

  def confirm_team!(team)
    if self.first_team.id == team.id
      self.update_attributes first_team_confirmed_at: DateTime.now
    elsif self.second_team.id == team.id
      self.update_attributes second_team_confirmed_at: DateTime.now
    end
  end

  def all_teams
    [self.first_team, self.second_team]
  end

  protected
  def default_values
    self.pending = true if self.pending.nil?
  end
end
