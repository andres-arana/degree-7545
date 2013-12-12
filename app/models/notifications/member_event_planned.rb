module Notifications
  class MemberEventPlanned < Base
    def initialize(team, event)
      @team = team
      @event = event
    end

    def description
      "En el torneo #{@event.tournament.name} se ha confirmado la fecha y ubicación para el encuentro #{@event.first_team.name} vs. #{@event.second_team.name}"
    end

    def link
      url_helpers.team_path(@team)
    end

    def users
      @team.find_members
    end
  end
end
