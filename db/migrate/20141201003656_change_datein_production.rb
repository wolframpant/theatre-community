class ChangeDateinProduction < ActiveRecord::Migration
  def change
    rename_column :productions, :date, :date_opened
  end
end
