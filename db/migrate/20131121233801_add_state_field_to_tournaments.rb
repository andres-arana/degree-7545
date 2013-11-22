class AddStateFieldToTournaments < ActiveRecord::Migration
  def change
    change_table :tournaments do |t|
      t.string :state
    end
  end
end
