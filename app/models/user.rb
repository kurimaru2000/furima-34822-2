class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :birth_day
  end

  validates :encrypted_password, :password, :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ } # 半角英数字混合での入力ようのバリデーション

  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  validates_format_of :first_name, :last_name, with: NAME_REGEX

  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates_format_of :first_name_kana, :last_name_kana, with: NAME_KANA_REGEX
end
