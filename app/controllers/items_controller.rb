class ItemsController < ApplicationController
  expose(:item, attributes: :item_params)
  expose(:items) { Item.where(invoice_id: params[:invoice_id]) }
  before_action :require_login

  def create
    item.invoice_id = params[:invoice_id]
    if item.count_value
      redirect_to  invoice_items_path if item.save
    else
      render action: 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name_of_service, :qty, :unit, :unit_net_price, :vat_rate, :pkwiu)
  end
end
