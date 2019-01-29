class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable

  before_save   :downcase_email
  mount_uploader :avatar, AvatarsUploader

  has_many :items, dependent: :destroy
  has_many :item_contacts, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one :owner_profile, dependent: :destroy
  has_one :manager_profile, dependent: :destroy

  accepts_nested_attributes_for :owner_profile, reject_if: :reject_owner
  accepts_nested_attributes_for :manager_profile, reject_if: :reject_manager

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name,
            presence: true,
            length: { maximum: 20 }

  validates :email, presence: true, length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :profile,length: { maximum: 500 }





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


  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        # userモデルが持っているカラムをそれぞれ定義していく
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
        user.avatar = auth.info.image
        user.uid = auth.uid
        user.provider = auth.provider

        # If you are using confirmable and the provider(s) you use validate emails,
        # uncomment the line below to skip the confirmation emails.
        user.skip_confirmation!
      end
    end
  end

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムトークン
  def self.new_token
    SecureRandom.urlsafe_base64
  end

   # 永続セッションのためにユーザーをデータベースに記憶する
   def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end


  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # ユーザーのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end



  def owner_category
    owner_profile.category || nil
  end

  def manager_category
    manager_profile.category || nil
  end

  def manager_phone_number
    manager_profile.phone_number || nil
  end

  def yet_look_message_items
    Item.joins(item_contacts: [:messages]).where(user_id: self.id).distinct.where("looked = ?", "0")
  end

  def reject_items
    Item.where(user_id: self.id, status: 3)
  end

  private
    def downcase_email
      self.email = email.downcase
    end


    def reject_owner(attributed)
      !self.owner
    end

    def reject_manager(attributed)
      !self.manager
    end
end
