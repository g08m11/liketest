class LikesController < ApplicationController

  def create
    @like = Like.create(user_id: current_user.id, account_id: params[:account_id])
    @likes = Like.where(account_id: params[:account_id])
  end

  def destroy
    @like = current_user.likes.find_by(account_id: params[:account_id])
    @like.destroy
    @likes = Like.where(account_id: params[:account_id])
  end

end
