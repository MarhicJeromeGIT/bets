class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :match_id
      t.integer :player_id
      t.string :result

      t.timestamps null: false
    end
  end
end
