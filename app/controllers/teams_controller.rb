class TeamsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_tournament
  before_filter :check_tournament_ownership

  def new
    @team = @tournament.teams.build
  end

  def create
    @team = @tournament.teams.build team_params
    if @team.save
      redirect_to edit_tournament_team_path(@tournament, @team), notice: "El equipo ha sido creado exitosamente."
    else
      render :new
    end
  end

  def edit
    @team = @tournament.teams.find params[:id]
  end

  def update
    @team = @tournament.teams.find params[:id]
    if @team.update_attributes team_params
      redirect_to edit_tournament_path(@tournament), notice: "El equipo ha sido actualizado exitosamente."
    else
      render :edit
    end
  end

  def destroy
    @team = @tournament.teams.find params[:id]
    @team.destroy
    redirect_to edit_tournament_path(@tournament), notice: "El equipo ha sido eliminado exitosamente."
  end

  protected
  def load_tournament
    @tournament = Tournament.find params[:tournament_id]
  end

  def check_tournament_ownership
    unless current_user.has_role? :organizer, @tournament
      redirect_to root_path, alert: "No puede crear un equipo en un torneo que no organiza."
      false
    else
      true
    end
  end

  def team_params
    params.require(:team).permit(:name)
  end
end
