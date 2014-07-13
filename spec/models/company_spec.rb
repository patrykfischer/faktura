require 'spec_helper'

describe Company do
  it { is_expected.to validate_presence_of(:user_id)}
  it { is_expected.to validate_presence_of(:company_name)}
  it { is_expected.to validate_presence_of(:nip)}
  it { is_expected.to validate_presence_of(:place_of_taxes)}
  it { is_expected.to validate_presence_of(:city)}
  it { is_expected.to validate_presence_of(:street)}
  it { is_expected.to validate_presence_of(:zip_code)}
  it { is_expected.to validate_presence_of(:phone_number)}
  it { is_expected.to belong_to(:user)}
end
