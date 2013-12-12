class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date
      t.belongs_to :first_team, index: true
      t.belongs_to :second_team, index: true
      t.belongs_to :location, index: true
      t.belongs_to :tournament, index: true
      t.boolean :pending

      t.timestamps
    end
  end
end
