class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # パスワード確認のカスタムバリデーション
  validates :password, confirmation: { message: "もう一度パスワードを入力してください" }, on: :create
  has_many :posts  
  has_many :favorites, dependent: :destroy
end
