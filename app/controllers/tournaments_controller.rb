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

  def destroy
    @tournament = current_user.tournaments.find(params[:id])
    @tournament.destroy
    redirect_to profile_path, alert: "El torneo ha sido eliminado"
  end

  private
  def tournament_params
    params.require(:tournament).permit(:name)
  end
end
