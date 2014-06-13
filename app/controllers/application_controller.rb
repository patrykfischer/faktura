class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  private

  def require_login
    if !session[:user_id]
      redirect_to new_session_path, notice: "Musisz być zalogowany !!"
    else
      @user = User.find_by(id: session[:user_id])
    end
  end

end
