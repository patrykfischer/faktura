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

end
