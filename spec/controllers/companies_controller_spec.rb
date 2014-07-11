require 'spec_helper'

describe CompaniesController do
  describe '#create users' do
    let!(:user){create(:user)}
    before do
      session[:user_id] = user.id

    end

      it 'check create last company' do
        #company = Company.new(company_name: 'P', nip: '111-111-11-11', place_of_taxes: 'UK', city: 'London', street: 'new',
        #  zip_code: '11-111', phone_number: '11-111-11-11')
        #company.user = user
        #company.save
        post :create, company: create(:company).attributes
        expect(Company.last).to eq(company)
      end
    end

  describe 'POST #create' do
    it 'create new company' do
      expect { post :create, company: create(:company).attributes }.to change(Company, :count).by(1)
    end
  end


end
