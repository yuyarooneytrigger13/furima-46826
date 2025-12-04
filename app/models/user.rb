class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  JAPANESE_REGEX =/\A[ぁ-んァ-ヶー一-龥々ヴ]+\z/
  KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/
  
  validates :nickname, presence: true
  validates :firstname_kanji, presence: true, format: { with: JAPANESE_REGEX }
  validates :lastname_kanji, presence: true, format: { with: JAPANESE_REGEX }
  validates :firstname_kana, presence: true, format: { with: KATAKANA_REGEX }
  validates :lastname_kana, presence: true, format: { with: KATAKANA_REGEX }
  validates :birth_date, presence: true

  #has_many :items
  #has_many :orders


end
