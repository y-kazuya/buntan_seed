class Item < ApplicationRecord
  belongs_to :user
  has_one :building_info, dependent: :destroy
  has_one :food_info, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :item_usages, dependent: :destroy
  has_many :usages, through: :item_usages
  has_many :pictures, dependent: :destroy

  has_and_belongs_to_many :tags

  accepts_nested_attributes_for :building_info, reject_if: :reject_build
  accepts_nested_attributes_for :food_info, reject_if: :reject_food
  accepts_nested_attributes_for :pictures, reject_if: :reject_blank
  accepts_nested_attributes_for :tags, reject_if: :tag_blank

  enum category: {土地: 1, 建物: 2, 廃棄食材: 3, その他: 4}
  enum status: {審査: 0, 公開: 1, 下書き: 2}
  enum sub_land_category: {山: 1, 畑: 2, 空き地: 3}
  enum sub_build_category: {空家: 10, 小屋: 11, 公共施設跡: 12, 商業施設跡: 13}

  enum state: {
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :category, presence: true
  validates :profile, presence: true, length: { maximum: 800 }
  validates :remark,:comment,
            length: { maximum: 800 }
  validates :state,:city,
            presence: true

  validate :need_usage
  validate :need_picture
  validate :check_picture_count

  private
    def reject_build
      self.category != "建物"
    end

    def reject_blank(attributed)
      attributed['content'].blank?
    end


    def reject_food
      self.category != "廃棄食材"
    end

    def tag_blank(attributed)
      attributed['name'].blank?
    end

    def need_usage
      if self.category == "建物"
        errors[:base] << '使用可能用途を一つ以上選択してください' if self.usages.length == 0
      end
    end

    def need_picture
      errors[:base] << '写真は一枚以上必要です' if self.pictures.length == 0
    end

    def check_picture_count
      errors[:base] << '写真は5枚以下にする必要があります' if self.pictures.length >5
    end



end
