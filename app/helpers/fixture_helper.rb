module FixtureHelper
  def event_container_class(event)
    if event.unplanned?
      "alert alert-danger"
    elsif event.pending?
      "alert alert-info"
    elsif event.incomplete?
      "alert alert-warning"
    else
      "alert alert-success"
    end
  end
end
