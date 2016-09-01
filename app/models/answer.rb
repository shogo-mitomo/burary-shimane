# frozen_string_literal: true
class Answer < ApplicationRecord
  mount_uploader :image, PictureUploader
end
