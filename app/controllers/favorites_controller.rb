class FavoritesController < ApplicationController

  def index
    @favorites = current_user.favorited_posts
  end

  def create
    @post = Post.find(params[:post])
    @favorite = Favorite.new(post: @post, user: current_user)

    if @favorite.save
      redirect_to @post, notice: 'Favorited!'
    else
      redirect_to @post, error: 'There was a problem'
    end
  end

  def oldest_sort
    @favorites = current_user.favorited_posts
    render json: @favorites
  end

end
