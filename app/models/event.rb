class Event < ActiveRecord::Base
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
      !first_team_confirmed?
    elsif self.second_team.id == team.id
      !second_team_confirmed?
    else
      false
    end
  end

  def confirm_team!(team)
    if self.first_team.id == team.id
      self.update_attributes first_team_confirmed: true
    elsif self.second_team.id == team.id
      self.update_attributes second_team_confirmed: true
    end
  end

  protected
  def default_values
    self.pending = true if self.pending.nil?
  end
end
