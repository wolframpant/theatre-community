class AddToProduction < ActiveRecord::Migration
  def change
    add_column :productions, :address, :string
    add_column :productions, :longitute, :float
    add_column :productions, :latitude, :float
  end
end
