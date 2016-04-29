class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :host_name
      t.string :guest_name
      t.string :result
      t.datetime :date

      t.timestamps null: false
    end
  end
end
