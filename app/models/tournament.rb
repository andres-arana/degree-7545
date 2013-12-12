class Tournament < ActiveRecord::Base
  extend Enumerize

  include TournamentNotifications

  validates :name, presence: true
  validates :status, presence: true
  validates :strategy, presence: true

  has_many :teams, dependent: :destroy
  has_many :events, dependent: :destroy, autosave: true

  resourcify

  enumerize :status,
    in: [:new, :playing],
    default: :new,
    predicates: {prefix: true},
    scope: true

  enumerize :strategy,
    in: [:free_for_all],
    default: :free_for_all

  def can_be_deleted?
    self.status_new?
  end

  def has_teams?
    self.teams.any?
  end

  def has_minimum_teams?
    self.teams.count >= 2
  end

  def start!
    self.status = :playing

    matchups = self.teams.
      product(self.teams).
      select {|pair| pair.first.id != pair.last.id}

    matchups.each do |matchup|
      self.events.build first_team: matchup.first, second_team: matchup.last
    end

    self.save!
  end
end
