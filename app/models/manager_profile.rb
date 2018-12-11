class ManagerProfile < ApplicationRecord
  belongs_to :user, optional: true

  validates :category, presence: true
  validates :phone_number, presence: true

  enum category: { 経営者: 1,個人事業主: 2, 自治体関係者: 3, 会社員: 4, 学生: 5, "NPO": 6 }
end
