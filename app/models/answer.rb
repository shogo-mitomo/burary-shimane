class Answer < ApplicationRecord
  mount_uploader :image, PictureUploader
  belongs_to :spot
end
