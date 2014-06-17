class InvoicesController < ApplicationController
  expose(:invoice, attributes: :invoice_params)
  before_action :require_login

  def create
    invoice.user = @user
    if invoice.save
      redirect_to invoices_path
    else
      render action: 'new'
    end
  end

  def index
    @invoices = Invoice.where(user_id: @user.id)
    @company = Company.all
  end

  private

  def invoice_params
    params.require(:invoice).permit(:number_of_invoice, :data_of_sold, :data_build, :method_of_payment, :id_own_company, :id_invoice_company)
  end

end
