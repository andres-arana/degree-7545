class EventsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_tournament
  before_filter :check_tournament_ownership
  before_filter :load_event

  def edit

  end

  def update
    if @event.update_attributes event_params
      redirect_to tournament_fixture_path, notice: "El evento ha sido actualizado exitosamente."
    else
      render :edit
    end
  end

  protected
  def load_event
    @event = @tournament.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:date, :location_id)
  end
end
