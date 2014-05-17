class ItemsController < ApplicationController
  expose(:item, attributes: :items_params)
  before_action :require_login

  def create
    if item.save
      render action: 'index'
    else
      render action: 'new'
    end
  end

  private

  def items_params
    params.require(:item).permit(:name_of_service, :qty, :unit, :unit_net_price)
  end

  def require_login
    if !session[:user_id]
      redirect_to new_session_path, notice: "Musisz być zalogowany !!"
    else
      @user_id = session[:user_id]
    end
  end
end
