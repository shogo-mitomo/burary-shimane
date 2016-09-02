class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.string :name, null: false
      t.string :address
      t.integer :point, null: false, default: 0

      t.timestamps
    end
  end
end
