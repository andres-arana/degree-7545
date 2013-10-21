class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.belongs_to :user
      t.string :name

      t.timestamps
    end
  end
end
