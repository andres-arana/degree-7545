class FixturesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_tournament
  before_filter :check_tournament_ownership

  def show

  end
end
