class ItemsController < ApplicationController
  expose(:item, attributes: :item_params)
  before_action :require_login

  def create
    if item.save
      render action: 'index'
    else
      render action: 'new'
    end
  end

  def new
    item = invoice.items.new(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name_of_service, :qty, :unit, :unit_net_price)
  end

  def require_login
    if !session[:user_id]
      redirect_to new_session_path, notice: "Musisz być zalogowany !!"
    else
      binding.pry
      @invoice = Invoice.where(user_id: session[:user_id]).last

      #@user_id = session[:user_id]
    end
  end
end
