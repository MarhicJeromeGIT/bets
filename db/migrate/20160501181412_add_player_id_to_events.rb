class AddPlayerIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :owner_player_id, :integer
  end
end
