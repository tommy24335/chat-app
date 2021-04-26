class CreateMessages < ActiveRecord::Migration[6.0]
  # テキストの内容：「content」カラム
  # メッセージの投稿をしたチャットルームのid：「room_id」カラム
  # メッセージの投稿をしたユーザーのid：「user_id」カラム
  def change
    create_table :messages do |t|
      t.string :content
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
