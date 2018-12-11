class Usage < ApplicationRecord
  has_many :item_usages, dependent: :destroy
  has_many :items, through: :item_usages

  validates :name, presence: true, uniqueness: true
end
