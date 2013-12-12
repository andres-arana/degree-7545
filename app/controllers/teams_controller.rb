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
  def team_params
    params.require(:team).permit(:name)
  end
end
