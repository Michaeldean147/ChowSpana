class PostsController < ApplicationController

  def index
     # @posts = Post.all.sort_by &:created_at
     @posts = Post.paginate(:page => params[:page]).order('created_at DESC')
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
    @searchTerm = params[:keyTerm].downcase
    @posts = Post.where("lower(productname) like ? or lower(city) like ?", "%#{@searchTerm}%", "%#{@searchTerm}%").paginate(:page => params[:page])
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

  def map
    @posts = Post.all


    #  @locations = @posts.map do |post|
    #    if post.latitude.nil?
    #      nil
    #    else
    #      [post.latitude, post.longitude]
    #    end
    # end.compact
    # render json: @locations
    @locations = @posts.map do |post|
      if post.latitude.nil?
        nil
      else
        {
          type: 'Feature',
          "geometry" => { "type"=> "Point", "coordinates"=> [post.longitude, post.latitude]},
          "properties" => {
            "image"=> post.image.url,
            "marker-symbol"=> "star",
            "marker-color"=> "#ff8888",
            "marker-size"=> "large",
            "product_name"=> post.productname,
            "post_id"=> post.id,
            "city"=> post.city,
            "state"=> post.state
          }
        }
      end
    end.compact
    # render json: @locations



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
    :user_id,
    :latitude,
    :longitude
    )
  end


end
