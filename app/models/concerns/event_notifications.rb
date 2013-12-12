module EventNotifications
  extend ActiveSupport::Concern

  included do
    after_update :check_event_updated_notifications
  end

  def check_event_updated_notifications
    unless self.unplanned?
      if self.date_changed? or self.location_id_changed?
        notification = Notifications::OrganizerPlansEvent.new(self)
        Notification.deliver! notification

        self.all_teams.each do |team|
          notification = Notifications::MemberEventPlanned.new(team, self)
          Notification.deliver! notification
        end
      end

      if self.team_confirmed?
        notification = Notifications::MemberConfirmsEvent.new(self)
        Notification.deliver! notification
      end
    end
  end
end
