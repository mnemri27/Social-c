class MessagesController < ApplicationController

    def create
        @message = current_account.messages.create(body: msg_params[:body], room_id: params[:room_id])
        redirect_to request.referrer
    end
    private
    def msg_params
        params.require(:message).permit(:body)
    end
end
