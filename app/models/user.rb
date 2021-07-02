class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :nickname
  validates :birthday
  end
  # validates :email, presence: true
  
  with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i} do
  validates :password
  end
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
  validates :familyname
  validates :firstname
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/} do
  validates :family_kana
  validates :first_kana
  end

  has_many :items
  has_many :records
 
end
