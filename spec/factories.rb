FactoryGirl.define do
  factory :user do
    username 'Patryk'
    password  'p'
    password_confirmation 'p'
  end

  factory :company do
    user
    company_name 'P'
    nip '111-111-11-11'
    place_of_taxes 'UK'
    city 'London'
    street 'new'
    zip_code '11-111'
    phone_number '11-111-11-11'
  end


  factory :invoice do
    user_id 1
    number_of_invoice 1
    data_of_sold '2014-02-02'
    data_build '2014-02-01'
    method_of_payment 'Gotówka'
    own_company_id 1
    other_company_id 2
  end

  factory :item do
    invoice_id 1
    name_of_service 'asdf'
    qty 12
    unit 'm2'
    unit_net_price 1
    total_net_price 1
    vat_rate 0.08
    vat_amount 1
    total_gross_price 1
  end

end
