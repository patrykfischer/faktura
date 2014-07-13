require 'spec_helper'

describe InvoicesController do
  describe '#create users' do
    let!(:user){create(:user)}
    before do
      session[:user_id] = user.id
    end

    describe 'POST #create' do
      let(:invoice) { attributes_for(:invoice) }
      it 'create new invoice' do
        expect{ post :create, invoice: invoice}.to change(Invoice, :count).by(1)
      end
    end

    describe '#create' do
      it 'Redirect after #create' do
        post :create, invoice: attributes_for(:invoice)
        expect(response).to redirect_to(invoices_path)
      end
    end
  end
end
