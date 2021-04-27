class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  # 値が空の場合送信できないようにバリデーションを設定
  validates :content, presence: true

end
