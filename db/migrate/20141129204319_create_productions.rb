class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.string :Company
      t.date :Date
      t.string :City
      t.string :State
      t.integer :play_id

      t.timestamps
    end
  end
end
