class TeamParticipationsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @team = Team.find(params[:id])
    return unless check_team_membership
  end

  def confirm
    @team = Team.find(params[:team_id])
    return unless check_team_membership

    event = Event.find(params[:id])
    event.confirm_team!(@team)

    redirect_to team_path(@team), notice: "Se ha confirmado la participación."
  end

  protected
  def check_team_membership
    unless current_user.has_role? :member, @team
      redirect_to root_path, alert: "No puede administrar este equipo dado que no es miembro de él."
      false
    else
      true
    end
  end
end
