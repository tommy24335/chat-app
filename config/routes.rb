Rails.application.routes.draw do
  devise_for :users
  root to:"rooms#index"
  resources :users, only: [:edit, :update]
  
  # 新規チャットルームの作成で動くアクションは「new」と「create」
  # メッセージ送信機能に必要なindexとcreateのルーティング
  # チャットルームの削除機能を実装するために、resources :roomsにdestroyアクションのルーティングを追記
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
