class ItemUsage < ApplicationRecord
  belongs_to :item
  belongs_to :usage
end
