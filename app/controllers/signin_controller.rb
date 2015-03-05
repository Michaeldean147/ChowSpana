class SigninController < ApplicationController

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @sign_in_error = "Username/Password Combination Is Invalid"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
