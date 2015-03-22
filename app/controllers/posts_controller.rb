class PostsController < ApplicationController

  def index
    @posts = Post.all.sort_by &:created_at
  end

  def new
    if current_user.nil?
      redirect_to root_path
      return
    end
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.new(post_params)
    if current_user.nil?
      redirect_to posts_path
    end

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def search
    render json: Post.all.reverse
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
      if @post.update(post_params)
        redirect_to @post
      else
        render "edit"
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
      @post.destroy
      redirect_to posts_path
    else
      redirect_to @post
    end
  end

  private

  def post_params
    params.require(:post).permit(
    :productname,
    :description,
    :price,
    :location,
    :address,
    :city,
    :state,
    :image,
    :user_id
    )
  end


end
