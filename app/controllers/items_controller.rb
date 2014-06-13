class ItemsController < ApplicationController
  expose(:item, attributes: :item_params)
  before_action :require_login
  before_action :current_invoice

  def create
    item.invoice_id = @@current_invoice.id
    if item.save
      redirect_to  items_path
    else
      render action: 'new'
    end
  end

  def index
    @items = Item.where(invoice_id: @@current_invoice.id)
  end

  private

  def item_params
    params.require(:item).permit(:name_of_service, :qty, :unit, :unit_net_price)
  end

  def current_invoice
    if params[:invoice_id]
      @@current_invoice = Invoice.find_by(id: params[:invoice_id])
    else
      @@current_invoice
    end
  end

end
