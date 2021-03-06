class RoomsController < ApplicationController

  def index
  end

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

  # インスタンス変数ではなく変数としてroomを定義し、destroyメソッドを使用します
  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end