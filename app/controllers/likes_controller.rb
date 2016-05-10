class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = Like.new
    @like.post = @post
    @like.user = current_user

    if @like.save
      redirect_to @post, notice: "Thank you for your like"
    else
      redirect_to @post, alert: "Could not like, please retry"
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
