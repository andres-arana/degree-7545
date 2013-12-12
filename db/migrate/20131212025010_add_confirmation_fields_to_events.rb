class AddConfirmationFieldsToEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.boolean :first_team_confirmed
      t.boolean :second_team_confirmed
    end
  end
end
