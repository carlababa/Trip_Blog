class PostsController < ApplicationController
  # GET /posts
  def index
    @post = Post.new

    if params[:search]
      @posts = Post.where("title ILIKE ?", "%#{params[:search]}%")
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to root_url, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.user = current_user

    if @post.destroy
      redirect_to root_url, notice: "post was destroyed"
    else
      render @post
    end

  end

  private

  def post_params
    params.require(:post).permit(:title, :message)
  end
end
