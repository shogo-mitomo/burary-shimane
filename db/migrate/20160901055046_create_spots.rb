class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.string :spot_name
      t.string :address
      t.integer :point

      t.timestamps
    end
  end
end
