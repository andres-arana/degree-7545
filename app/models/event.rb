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

  protected
  def default_values
    self.pending = true if self.pending.nil?
  end
end
