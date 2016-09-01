class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.text :spot_detail
      t.text :image
      t.string :address
      t.string :spot_name
      t.integer :spot_id

      t.timestamps
    end
  end
end
