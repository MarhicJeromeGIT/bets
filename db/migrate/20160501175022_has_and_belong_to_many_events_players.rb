class HasAndBelongToManyEventsPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :event_id
    
    create_table :events_players, id: false do |t|
      t.belongs_to :event, index: true
      t.belongs_to :player, index: true
    end
  end
end
