class Item < ApplicationRecord
  attr_accessor :before_tags
  include TagsHelper
  belongs_to :user
  belongs_to :category
  belongs_to :sub_category ,optional: true

  has_one :building_info, dependent: :destroy
  has_one :food_info, dependent: :destroy
  has_many :item_usages, dependent: :destroy
  has_many :usages, through: :item_usages
  has_many :pictures, dependent: :destroy
  has_many :item_contacts, dependent: :destroy

  has_and_belongs_to_many :tags

  accepts_nested_attributes_for :building_info, reject_if: :reject_build
  accepts_nested_attributes_for :food_info, reject_if: :reject_food
  accepts_nested_attributes_for :pictures, reject_if: :reject_blank
  accepts_nested_attributes_for :tags, reject_if: :tag_blank

  enum status: {審査中: 0, 公開中: 1, 下書き: 2, 審査落ち:3}


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

  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 40 }

  validates :profile, presence: true, length: { maximum: 800 }
  validates :comment,
            length: { maximum: 800 }
  validates :state,:city,:price,
            presence: true

  validates :is_rent, inclusion: {in: [true, false]}


  # validates :sub_category_id , presence: true, if: :need_sub_categroy



  validate :need_usage
  # validate :need_picture
  validate :check_picture_count


  before_destroy :delete_unuse_tag
  after_destroy :delete_unuse_tag

  before_save :make_path_name

  def category_name
    return unless self.category
    self.category.name
  end

  def sub_category_name
    return  unless self.sub_category
    self.sub_category.name
  end

  def need_food_info?
    return false unless self.category_name
    self.category_name == "廃棄食材"
  end

  def food_info_raw
    food_info.raw
  end

  def food_info_amount
    food_info.amount
  end

  def need_building_info?
    self.category_name == "建物"
  end

  def building_info_about
    building_info.about
  end

  def building_info_status
    building_info.status
  end

  def building_info_price
    building_info.price
  end

  def building_info_rent
    building_info.rent
  end

  # def to_param
  #   id
  # end

  # def find_by!(arg, *args)
  #   where(arg, *args).take!
  # rescue ::RangeError
  #   raise RecordNotFound.new("Couldn't find #{@klass.name} with an out of range value",
  #                            @klass.name)
  # end

  def make_path_name
    self.path_name = ".#{self.title}"
  end

  def need_sub_categroy
    need_sub_cateroy_categories = ["建物", "土地"]

    return need_sub_cateroy_categories.include?(self.category_name)
  end


  private
    def reject_build
      # self.category_name != "建物"
      true
    end

    def reject_blank(attributed)
      attributed['content'].blank?
    end


    def reject_food
      # self.category_name != "廃棄食材"
      true
    end

    def tag_blank(attributed)
      attributed['name'].blank?
    end

    def same_tag(attributed)
    end

    def need_usage
      if self.category_name == "建物"
        errors[:base] << '使用可能用途を一つ以上選択してください' if self.usages.length == 0
      end
    end

    def need_picture
      errors[:base] << '写真は一枚以上必要です' if self.pictures.length == 0
    end

    def check_picture_count
      errors[:base] << '写真は5枚以下にする必要があります' if self.pictures.length >5
    end

    def destroy_items_tags
      ItemsTag.where(item_id: self.id).destroy_all
    end






end
