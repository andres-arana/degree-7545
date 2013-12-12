module ApplicationHelper
  def manage_tournament_path(tournament)
    case tournament.status
    when "new"
      edit_tournament_path(tournament)
    when "playing"
      tournament_fixture_path(tournament)
    end
  end
end
