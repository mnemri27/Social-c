class LikesController < ApplicationController
  def create
    @like = current_account.likes.new(like_params)
    if !@like.save
      flash[:alert] = "You already liked this post"
    end
    redirect_to request.referrer
  end

  def destroy
    @like = current_account.likes.find(params[:id])
    @like.destroy
    redirect_to request.referrer
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end
