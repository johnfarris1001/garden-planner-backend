class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :variety
      t.integer :garden_id
      t.timestamps
    end
  end
end
