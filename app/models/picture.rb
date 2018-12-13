class Picture < ApplicationRecord
  belongs_to :item, optional: true
  mount_uploader :content, PictureUploader
end
