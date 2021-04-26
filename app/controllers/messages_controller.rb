class MessagesController < ApplicationController
  # form_withに必要な情報を取得
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
  end

  # messagesコントローラーにcreateアクションを定義します。
  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    # メッセージを保存できた場合とできなかった場合で条件分岐の処理
    if @message.save
      redirect_to room_messages_path(@room)
    else
      render :index
    end
  end

  private
  # privateメソッドとしてmessage_paramsを定義し、メッセージの内容contentをmessagesテーブルへ保存できるようにします。
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
