module Notifications
  class MemberTournamentStarted < Base
    def initialize(tournament, team)
      @tournament = tournament
      @team = team
    end

    def description
      "¡El torneo #{@tournament.name} en el que participas con el equipo #{@team.name} ha comenzado!"
    end

    def link
      url_helpers.team_path @team
    end

    def users
      @team.find_members
    end
  end
end
