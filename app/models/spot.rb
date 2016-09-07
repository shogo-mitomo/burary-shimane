# frozen_string_literal: true
# == Schema Information
#
# Table name: spots
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  address    :string
#  point      :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Spot < ApplicationRecord
  has_many :answers

  scope :autocomplete, ->(term){
    where("name LIKE ?", "#{term}%").order(:name)
  }
end
