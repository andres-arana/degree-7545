module Notifications
  class OrganizerPlansEvent < Base
    def initialize(event)
      @event = event
    end

    def description
      "Has planificado el encuentro #{@event.first_team.name} vs. #{@event.second_team.name} para el #{I18n.l @event.date, format: :long} a realizarse en #{@event.location.name} (#{@event.location.address})"
    end

    def link
      url_helpers.tournament_fixture_path(@event.tournament)
    end

    def users
      User.with_role(:organizer, @event.tournament)
    end
  end
end
