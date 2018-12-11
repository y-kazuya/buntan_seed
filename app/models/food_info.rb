class FoodInfo < ApplicationRecord
  belongs_to :item, optional: true

  validates :raw, length: { maximum: 800 }, presence: true
  validates :amount, length: { maximum: 800 }
end
