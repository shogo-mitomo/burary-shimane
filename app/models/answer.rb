# frozen_string_literal: true
# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  question_id :integer          not null
#  spot_detail :text             not null
#  image       :text
#  address     :string
#  spot_name   :string
#  spot_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  latitude    :float
#  longitude   :float
#

class Answer < ApplicationRecord
  mount_uploader :image, PictureUploader
  belongs_to :spot
  belongs_to :question
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :spot_detail, presence: true
end
