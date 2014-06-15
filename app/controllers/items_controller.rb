class ItemsController < ApplicationController
  expose(:item, attributes: :item_params)
  before_action :require_login
  before_action :current_invoice

  def create
    item.invoice_id = @@current_invoice.id
    if item.save
      count_value
      redirect_to  invoice_items_path if item.save
    else
      render action: 'new'
    end
  end

  def index
    @items = Item.where(invoice_id: @@current_invoice.id)
  end

  private

  def item_params
    params.require(:item).permit(:name_of_service, :qty, :unit, :unit_net_price, :vat_rate, :pkwiu)
  end

  def current_invoice
    if params[:invoice_id]
      @@current_invoice = Invoice.find_by(id: params[:invoice_id])
    else
      @@current_invoice
    end
  end

  def count_value
    item.total_net_price = item.qty * item.unit_net_price
    item.vat_amount = item.total_net_price * item.vat_rate
    item.total_gross_price = item.total_net_price + item.vat_amount
  end

end
