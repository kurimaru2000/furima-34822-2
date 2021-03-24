class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birth_day, presence: true
  validates :encrypted_password, :password, :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/ } # 半角英数字混合での入力ようのバリデーション

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates_format_of :first_name, :last_name, with: NAME_REGEX

  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates_format_of :first_name_kana, :last_name_kana, with: NAME_KANA_REGEX 
end
