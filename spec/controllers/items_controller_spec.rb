 require 'spec_helper'

describe ItemsController do
  describe '#create users' do
    let!(:user){create(:user)}
    before do
      session[:user_id] = user.id
    end

    describe 'POST #create' do
      let!(:item){attributes_for(:item)}
      it 'create new item' do
        expect{post :create, invoice_id: 1, item: item }.to change(Item, :count).by(1)
      end
    end

    describe '#create' do
      it 'Redirect to invoice_items_path' do
        post :create, invoice_id: 1, item: attributes_for(:item)
        expect(response).to redirect_to(invoice_items_path)
      end
    end
  end
end
