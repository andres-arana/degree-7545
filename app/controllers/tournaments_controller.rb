class TournamentsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new tournament_params
    if @tournament.save
      current_user.add_role :organizer, @tournament
      redirect_to profile_path, notice: "El torneo ha sido creado."
    else
      render :new
    end
  end

  def destroy
    @tournament = Tournament.find(params[:id])
    if current_user.has_role? :organizer, @tournament
      @tournament.destroy
      redirect_to profile_path, notice: "El torneo ha sido eliminado."
    else
      redirect_to profile_path, alert: "No es el organizador del torneo que quiere eliminar."
    end
  end

  private
  def tournament_params
    params.require(:tournament).permit(:name)
  end
end
