require 'spec_helper'

describe Company do
  #pending "add some examples to (or delete) #{__FILE__}"
  before :each do
    @company = Company.new
  end

  it 'should not be valid if all record are blank' do
    @company.should_not be_valid
    @company.should have(1).error_on(:company_name)
    @company.should have(2).error_on(:nip)
    @company.should have(2).error_on(:place_of_taxes)
    @company.should have(2).error_on(:city)
    @company.should have(1).error_on(:street)
    @company.should have(2).error_on(:zip_code)
    @company.should have(2).error_on(:phone_number)
  end
end
