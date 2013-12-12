module Notifications
  class MemberConfirmsEvent < Base
    def initialize(event)
      @event = event
    end

    def description
      team = if @event.first_team_confirmed_changed?
               @event.first_team
             else
               @event.second_team
             end

      "El equipo #{team.name} del torneo #{@event.tournament.name} confirmó su asistencia al encuentro #{@event.first_team.name} vs. #{@event.second_team.name} del #{I18n.l @event.date, format: :long}"
    end

    def link
      url_helpers.tournament_fixture_path(@event.tournament)
    end

    def users
      User.with_role :organizer, @event.tournament
    end
  end
end
