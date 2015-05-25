class ChangeLonginProductions < ActiveRecord::Migration
  def change
    rename_column :productions, :longitute, :longitude
  end
end
