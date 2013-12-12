module Api
  class ConfirmationsController < ApplicationController
    def index
      tournament = Tournament.find(params[:tournament_id])
      marker = DateTime.parse(params[:since])

      events = tournament.events.
        where("first_team_confirmed_at > :since or second_team_confirmed_at > :since", since: marker)

      render json: events
    end
  end
end
