# frozen_string_literal: true
class AddColumnToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :latitude, :float
    add_column :answers, :longitude, :float
  end
end
