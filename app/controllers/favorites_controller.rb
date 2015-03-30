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
      render @post, error: 'There was a problem'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    puts "*"*80
    p params
    @favorite = Favorite.find_by(post_id: @post)
    if current_user.id == @favorite.user_id
      @favorite.destroy
       redirect_to favorites_path
     else
       render @post
     end
  end

  def oldest_sort
    @favorites = current_user.favorited_posts
    data = []
    @favorites.each do |fave|
      hash = {}
      hash[:productname] = fave.productname
      hash[:user_id] = fave.user_id
      hash[:city] = fave.city
      hash[:state] = fave.state
      hash[:username] = User.find(fave.user_id).username
      hash[:price] = fave.price
      hash[:image_name] = fave.image_file_name
      hash[:image_url] = fave.image.url
      data.push(hash)
    end
    render json: data
  end

  def newest_sort
    @favorites = current_user.favorited_posts.reverse
    data = []
    @favorites.each do |fave|
      hash = {}
      hash[:productname] = fave.productname
      hash[:user_id] = fave.user_id
      hash[:city] = fave.city
      hash[:state] = fave.state
      hash[:username] = User.find(fave.user_id).username
      hash[:price] = fave.price
      hash[:image_name] = fave.image_file_name
      hash[:image_url] = fave.image.url
      data.push(hash)
    end
    render json: data
  end

end
