class InvoicesController < ApplicationController
  expose(:invoice, attributes: :invoice_params)
  expose(:companies){ @user.companies }
  expose(:invoices){ @user.invoices }
  expose(:invoice_decorate) { invoice.decorate }
  before_action :require_login

  def create
    invoice.user = @user
    set_number_invoice
    if invoice.save
      redirect_to invoices_path
    else
      render action: 'new'
    end
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'invoice',
        template: 'invoices/show.html.haml'
      end
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:data_of_sold, :data_build, :method_of_payment, :own_company_id, :other_company_id, :paid)
  end

  def set_number_invoice
    invoice.number_of_invoice = invoices.count + 1
  end
end
