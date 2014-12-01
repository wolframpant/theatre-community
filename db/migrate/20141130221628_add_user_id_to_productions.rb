class AddUserIdToProductions < ActiveRecord::Migration
  def change
    add_column :productions, :user_id, :integer
  end
end
