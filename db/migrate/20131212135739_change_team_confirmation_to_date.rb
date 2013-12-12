class ChangeTeamConfirmationToDate < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.remove :first_team_confirmed
      t.remove :second_team_confirmed
      t.datetime :first_team_confirmed_at
      t.datetime :second_team_confirmed_at
    end
  end
end
