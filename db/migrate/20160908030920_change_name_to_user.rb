class ChangeNameToUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :name, :string, null: false, unique: true, limit: User::NAME_MAX_LENGTH
  end
end
