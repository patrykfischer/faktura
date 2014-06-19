class ItemsController < ApplicationController
  expose(:item, attributes: :item_params)
  before_action :require_login

  def create
    item.invoice_id = params[:invoice_id]
    if item.save
      Item.count_value(item)
      redirect_to  invoice_items_path if item.save
    else
      render action: 'new'
    end
  end

  def index
    @items = Item.where(invoice_id: params[:invoice_id])
  end

  private

  def item_params
    params.require(:item).permit(:name_of_service, :qty, :unit, :unit_net_price, :vat_rate, :pkwiu)
  end
end
