class OwnerProfile < ApplicationRecord
  belongs_to :user, optional: true

  validates :category, presence: true

  enum category: { 地域おこし協力隊: 1, 関係ボランティア: 2, オーナー: 3, 自治体関係者: 4, その他: 5}
end
