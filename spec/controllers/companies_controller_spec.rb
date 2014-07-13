require 'spec_helper'

describe CompaniesController do
  describe '#create users' do
    let!(:user){create(:user)}
    before do
      session[:user_id] = user.id
    end

    describe 'POST #create' do
      let!(:company){attributes_for(:company)}
      it 'create new company' do
        expect { post :create, company: company }.to change(Company, :count).by(1)
      end
    end

    describe '#create' do
      it 'Redirect to root_path' do
        post :create, company: attributes_for(:company)
        expect(response).to redirect_to(root_path)
      end
    end

    describe 'PUT #update/:id' do
      let!(:company){create(:company)}
      it 'Update company' do
        put :update, id: company.id, company: company.attributes = { company_name: 'pp'}
        company.reload
        expect(company.company_name).to eq('pp')
      end

      it 'Redirect to companies_path' do
        put :update, id: company.id, company: company.attributes = { company_name: 'pp'}
        expect(response).to redirect_to(companies_path)
      end
    end
  end
end
