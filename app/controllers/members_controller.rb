class MembersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_tournament
  before_filter :check_tournament_ownership
  before_filter :load_team

  def new
    @member = User.new
  end

  def create
    @member = User.invite! member_params, current_user
    @member.add_role :member, @team
    redirect_to edit_tournament_team_path(@tournament, @team), notice: "El miembro del equipo ha sido registrado exitosamente."
  end

  def destroy
    @member = User.find params[:id]
    @member.remove_role :member, @team
    redirect_to edit_tournament_team_path(@tournament, @team), notice: "el miembro ha sido removido del equipo exitosamente."
  end

  protected
  def load_team
    @team = Team.find params[:team_id]
  end

  def member_params
    params.require(:user).permit(:email)
  end
end
