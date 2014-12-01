class AddProductionIdToImpressions < ActiveRecord::Migration
  def change
    add_column :impressions, :production_id, :integer
  end
end
