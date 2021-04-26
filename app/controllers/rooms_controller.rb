class RoomsController < ApplicationController

  # チャットルームの新規作成なので「new」アクションを定義
  # また、form_withに渡す引数として、値が空のRoomインスタンスを@roomに代入
  def new
    @room = Room.new
  end

  # チャットルーム保存機能
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end