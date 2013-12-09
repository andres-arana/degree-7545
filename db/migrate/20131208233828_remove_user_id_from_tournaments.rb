class RemoveUserIdFromTournaments < ActiveRecord::Migration
  def change
    change_table :tournaments do |t|
      t.remove :user_id
    end
  end
end
