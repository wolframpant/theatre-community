class AddPlayIdToImpressions < ActiveRecord::Migration
  def change
    add_column :impressions, :play_id, :integer
  end
end
