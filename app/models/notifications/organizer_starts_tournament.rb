module Notifications
  class OrganizerStartsTournament < Base
    def initialize(tournament)
      @tournament = tournament
    end

    def description
      "¡El torneo #{@tournament.name} ha comenzado!"
    end

    def link
      url_helpers.tournament_fixture_path(@tournament)
    end

    def users
      User.with_role(:organizer, @tournament)
    end
  end
end
