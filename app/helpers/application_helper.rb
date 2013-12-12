module ApplicationHelper
  def manage_tournament_path(tournament)
    case tournament.status
    when "new"
      edit_tournament_path(tournament)
    when "playing"
      tournament_fixture_path(tournament)
    end
  end

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
