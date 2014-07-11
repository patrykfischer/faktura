require 'spec_helper'

describe InvoicesController do
  describe 'POST #create' do
    it 'create new invoice' do
      invoice_new = Invoice.new(user_id: 1, number_of_invoice: 1, data_of_sold: '2014-02-02', data_build: '2014-02-01',
      method_of_payment: 'Gotówka', own_company_id: 1, other_company_id: 2)

      expect{ post :create, invoice: invoice_new.save }.to change(Invoice, :count).by(1)
    end
  end
end
