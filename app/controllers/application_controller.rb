class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
     stored_location_for(resource) || profile_path
  end

  def load_tournament
    @tournament = Tournament.find params[:tournament_id]
  end

  def check_tournament_ownership
    unless current_user.has_role? :organizer, @tournament
      redirect_to root_path, alert: "No puede administrar equipos en un torneo que no organiza."
      false
    else
      true
    end
  end

end
