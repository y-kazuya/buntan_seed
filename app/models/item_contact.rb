class ItemContact < ApplicationRecord
  belongs_to :item
  belongs_to :user

  has_many :messages, dependent: :destroy


  def have_yet_look_message?
    self.messages.each do |mes|
      return true unless mes.looked
    end
    return false
  end
end
