class InvoicesController < ApplicationController
  expose(:invoice, attributes: :invoice_params)
  before_action :require_login

  def create
    if invoice.save
      invoice.user_id = @user_id
      render action: 'index'
    else
      render action: 'new'
    end
  end

  def index
    require_login
  end

  private

  def invoice_params
    params.require(:invoice).permit(:number_of_invoice, :data_of_sold, :data_build, :method_of_payment, :id_own_company, :id_invoice_company)
  end

  def require_login
    if !session[:user_id]
      redirect_to new_session_path, notice: "Musisz być zalogowany !!"
    else
      @user_id = session[:user_id]
    end
  end
end
