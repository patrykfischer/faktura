class CompaniesController < ApplicationController
	expose(:company, attributes: :company_params)
	before_action :require_login

	def create
		company = Company.new(company_params)
		binding.pry
		company.user_id = @user_id
		if company.save
			redirect_to root_path, notice: "Save Complete"
		else
			render :new
		end
	end

	private

	def company_params
		params.require(:company).permit(:company_name, :nip, :place_of_taxes, :city, :street, :zip_code, :phone_number)
	end

	def require_login
		if !session[:user_id]
			redirect_to logins_path, notice: "Musisz być zalogowany !!"
		else
			@user_id = session[:user_id]
		end
	end
end
