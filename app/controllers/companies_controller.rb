class CompaniesController < ApplicationController
  expose(:company, attributes: :company_params)
  expose(:companies) {@user.companies}
  before_action :require_login

  def create
    company.user = @user
    if company.save
      redirect_to root_path, notice: "Save Complete"
    else
      render :new
    end
  end

  def update
    company.save
    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(:company_name, :nip, :place_of_taxes, :city, :street, :zip_code, :phone_number)
  end

end
