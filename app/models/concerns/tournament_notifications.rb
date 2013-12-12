module TournamentNotifications
  extend ActiveSupport::Concern

  delegate :url_helpers, to: 'Rails.application.routes'

  included do
    after_update :check_tournament_started_notification
  end

  def check_tournament_started_notification
    if self.status_changed? and self.status_playing?
      notification = Notifications::OrganizerStartsTournament.new(self)
      Notification.deliver! notification

      self.teams.each do |team|
        notification = Notifications::MemberTournamentStarted.new(self, team)
        Notification.deliver! notification
      end
    end
  end
end
