class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# nameカラムが空の状態ではDBに保存できない」というバリデーション
validates :name, presence: true

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages

end
