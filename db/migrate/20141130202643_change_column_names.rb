class ChangeColumnNames < ActiveRecord::Migration
  def change
    rename_column :productions, :Company, :company
    rename_column :productions, :Date, :date
    rename_column :productions, :City, :city
    rename_column :productions, :State, :state
  end
end
