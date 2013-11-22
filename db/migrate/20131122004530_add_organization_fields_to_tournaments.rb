class AddOrganizationFieldsToTournaments < ActiveRecord::Migration
  def change
    change_table :tournaments do |t|
      t.string :strategy
    end
  end
end
