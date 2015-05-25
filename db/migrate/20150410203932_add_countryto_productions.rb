class AddCountrytoProductions < ActiveRecord::Migration
  def change
    add_column :productions, :country, :string
  end
end
