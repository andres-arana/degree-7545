class TournamentsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @tournament = current_user.tournaments.build
  end

  def create
    @tournament = current_user.tournaments.build tournament_params
    if @tournament.save
      redirect_to profile_path
    else
      render :new
    end
  end

  private
  def tournament_params
    params.require(:tournament).permit(:name)
  end
end
