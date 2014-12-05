class AddPlayToComment < ActiveRecord::Migration
  def change
    add_column :comments, :play_id, :integer
  end
end
