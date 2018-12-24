class Message < ApplicationRecord
  belongs_to :user
  belongs_to :item_contact


  validates :text, presence: true, unless: :image?
  mount_uploader :image, PictureUploader

end
