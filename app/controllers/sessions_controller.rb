class SessionsController < ApplicationController

skip_before_action :require_sign_in, only: [:new,:create]
skip_before_action :current_user, only: [:new, :create]


def new

end


def create
  if params[:session]
    @user = User.find_by(name: session_params[:name], password: session_params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to controller: 'users', action: 'show', id: session[:user_id]
      # redirect_to user_path(session[:user_id])
    else
      render("sessions/new")
    end
  end
end

def destroy
  session.delete(:user_id)
  @current_user = nil
  redirect_to sessions_login_path
end


private
  def session_params
    params.require(:session).permit(:name,:password)
  end

end
