class InvoicesController < ApplicationController
  expose(:invoice, attributes: :invoice_params)
  expose(:companies){ @user.companies }
  expose(:invoices){ @user.invoices }
  before_action :require_login

  def create
    invoice.user = @user
    if invoice.save
      redirect_to invoices_path
    else
      render action: 'new'
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:number_of_invoice, :data_of_sold, :data_build, :method_of_payment, :own_company_id, :other_company_id)
  end

end
