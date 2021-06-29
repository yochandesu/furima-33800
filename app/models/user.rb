class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  
  with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i} do
  validates :password
  end
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
  validates :familyname
  validates :firstname
  end

  validates :family_kana, presence: true
  validates :first_kana, presence: true
  validates :birthday, presence: true
  
  # バリデーションのオプション追記
  # アソシエーションを記述


end
