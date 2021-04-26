class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    # この「room_usersテーブル」は中間テーブルなので、どのユーザーがどのチャットルームに参加しているかを管理しています。
    create_table :room_users do |t|
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
