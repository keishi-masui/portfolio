class UsersController < ApplicationController

  def show
    @current_user ||= User.find_by(id: session[:user_id])

  end

end
