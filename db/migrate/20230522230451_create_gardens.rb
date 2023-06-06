class CreateGardens < ActiveRecord::Migration[6.1]
  def change
    create_table :gardens do |t|
      t.string :name
      t.string :indoor_outdoor
      t.string :sunlight
      t.string :rain
      t.integer :gardener_id
      t.timestamps
    end
  end
end
