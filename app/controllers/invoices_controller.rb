class InvoicesController < ApplicationController
  expose(:invoice, attributes: :invoice_params)

  def create
    if invoice.save
      session[:user_id] = user.id
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
    params.require(:invoice).premit(:number_of_invoice, :date_of_sold, :data_of_sold, :data_build, :method_of_paymant, :id_own_company, :id_invoice_company)
  end

  def require_login
    if !session[:user_id]
      redirect_to new_session_path, notice: "Musisz być zalogowany !!"
    else
      @user_id = session[:user_id]
    end
  end
end
