Rails.application.routes.draw do
  devise_for :users
  root to:"rooms#index"
  resources :users, only: [:edit, :update]
  
  # 新規チャットルームの作成で動くアクションは「new」と「create」
  resources :rooms, only: [:new, :create]
  
  # メッセージ送信機能に必要なindexとcreateのルーティング
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end
end
