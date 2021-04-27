class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  # 値が空の場合送信できないようにバリデーションを設定
  validates :content, presence: true, unless: :was_attached?

  # 指定されたwas_attached?メソッドは、self.image.attached?という記述によって、画像があればtrue、なければfalseを返す仕組み
  def was_attached?
    self.image.attached?
  end
end
