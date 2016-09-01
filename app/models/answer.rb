class Answer < ApplicationRecord
  mount_uploader :image, PictureUploader
  belongs_to :spot
  belongs_to :question
end
