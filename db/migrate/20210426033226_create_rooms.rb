class CreateRooms < ActiveRecord::Migration[6.0]
  # マイグレーション実行時に「nameカラム」に空の値を許可しないNOT NULL制約で作成
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
