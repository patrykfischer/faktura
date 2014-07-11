 require 'spec_helper'

describe ItemsController do
  describe 'POST #create' do
    it 'create new item' do
      item = Item.new( invoice_id: 1, name_of_service: 'asdf', qty: 12, unit: 'm2', unit_net_price: 1,
      total_net_price: 1, vat_rate: 0.08, vat_amount: 1, total_gross_price: 1)
      expect{post :create, invoice_id: 1, item: item.save }.to change(Item, :count).by(1)
    end
    it 'check #count_value' do
      item = Item.new( invoice_id: 1, name_of_service: 'asdf', qty: 12, unit: 'm2', unit_net_price: 1,
      vat_rate: 0.08)
      item.count_value
      expect{post :create, invoice_id: 1, item: item.save }.to change(Item, :count).by(1)
    end
    it 'returns 200 code' do
      item = Item.new( invoice_id: 1, name_of_service: 'asdf', qty: 12, unit: 'm2', unit_net_price: 1,
      vat_rate: 0.08)
      item.count_value
      item.save
      expect(response.status).to eq(200)
    end
    context 'check redirect after create item' do
      let!(:user){create(:user)}
      before do
        session[:user_id] = user.id
      end
    end
  end
end
