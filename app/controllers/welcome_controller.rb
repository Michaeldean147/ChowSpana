class WelcomeController < ApplicationController

  def home

  end

  def current_user
    User.find_by(id: session[:user_id])
  end

end
