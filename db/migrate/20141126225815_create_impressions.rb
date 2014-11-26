class CreateImpressions < ActiveRecord::Migration
  def change
    create_table :impressions do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
