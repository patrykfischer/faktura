class ItemsController < ApplicationController
  expose(:items, attributes: :items_params)

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
end
