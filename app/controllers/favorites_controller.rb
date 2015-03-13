class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post])
    @favorite = Favorite.new(post: @post, user: current_user)

    if @favorite.save
      redirect_to @post, notice: 'Favorited!'
    else
      redirect_to @post, error: 'There was a problem'
    end
  end
end
