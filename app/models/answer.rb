# frozen_string_literal: true
class Answer < ApplicationRecord
  mount_uploader :image, PictureUploader
  belongs_to :spot
  belongs_to :question
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
