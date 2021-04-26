class Room < ApplicationRecord
  # 中間テーブル
  belongs_to :room
  belongs_to :user
end
