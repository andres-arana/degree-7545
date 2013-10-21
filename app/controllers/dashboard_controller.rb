class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def show
    if not current_user.has_tournaments?
      redirect_to new_tournament_path
    end
  end
end
