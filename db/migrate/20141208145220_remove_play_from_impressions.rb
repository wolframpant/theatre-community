class RemovePlayFromImpressions < ActiveRecord::Migration
  def change
    remove_column :impressions, :play_id, :integer
  end
end
