# frozen_string_literal: true
class AddIndexNameToUser < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :name, unique: true
  end
end
