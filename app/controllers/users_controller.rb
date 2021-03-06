class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where("user_id = #{@user.id}").paginate(:page => params[:page]).order('created_at DESC')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    @edit = true
  end

  def update
    @user = User.find(params[:id])

    @user.update(user_params)

    if @user.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
  params.require(:user).permit(
  :username,
  :email,
  :password,
  :password_confirmation
  )
  end

end
