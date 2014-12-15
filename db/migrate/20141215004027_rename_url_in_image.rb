class RenameUrlInImage < ActiveRecord::Migration
  def change
    rename_column :images, :url, :location
  end
end
