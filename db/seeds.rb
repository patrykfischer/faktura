user = User.create(username: 'p', password: 'p', password_confirmation: 'p')
company = Company.create(user_id: User.first.id, company_name: 'Black', nip: '111-111-11-11',
  place_of_taxes: 'UK', city: 'London', street:'London-Street', zip_code:'12-122', phone_number: '123-123-123')
company = Company.create(user_id: User.first.id, company_name: 'White', nip: '111-111-11-11',
  place_of_taxes: 'UK', city: 'London', street:'London-Street', zip_code:'12-122', phone_number: '123-123-123')
invoice = Invoice.create(user_id: User.first.id, number_of_invoice: Invoice.any? ? Invoice.last.number_of_invoice + 1 : 1,
  data_of_sold: '2014-01-01', data_build: '2014-02-02', method_of_payment: 'Gotówka', own_company_id: Company.first.id,
  other_company_id: Company.last.id)
item = Item.create(invoice_id: Invoice.first.id, name_of_service: 'Malowanie Fasady', qty: 10,
  unit: 'm2', unit_net_price: 12.99, vat_rate: 0.22)
