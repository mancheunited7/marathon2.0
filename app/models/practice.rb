class Practice < ApplicationRecord
  belongs_to :user

  mount_uploader :practice_photo, PracticePhotoUploader
end
