class SessionsController < ApplicationController
  expose(:user, attributes: :user_params)

  def create
    user = User.find_by(username: user_params[:username])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: t('sessions.online')
    else
      flash.now[:alert] = t('sessions.incorrect_password')
      render action: 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: t('sessions.offline')
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
