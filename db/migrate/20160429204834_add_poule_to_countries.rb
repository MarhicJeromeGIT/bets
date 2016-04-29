class AddPouleToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :poule, :string
  end
end
