class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :user_id, :null => false
      t.text :content
      t.string :address
      t.timestamps
    end
  end
end
