class RemovePlayfromComment < ActiveRecord::Migration
  def change
    remove_column :comments, :play_id
  end
end
