class BuildingInfo < ApplicationRecord
  belongs_to :item, optional: true

  validates :about,:status,:price,
            length: { maximum: 800 },
            presence: true

  validates :rent, inclusion: { in: [true, false] }
end
