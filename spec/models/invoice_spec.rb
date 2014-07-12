require 'spec_helper'

describe Invoice do
  subject { Invoice.new() }
  it { is_expected.to validate_presence_of(:user_id)}
  it { is_expected.to validate_presence_of(:number_of_invoice)}
  it { is_expected.to validate_presence_of(:data_of_sold)}
  it { is_expected.to validate_presence_of(:data_build)}
  it { is_expected.to validate_presence_of(:method_of_payment)}
  it { is_expected.to validate_presence_of(:own_company_id)}
  it { is_expected.to validate_presence_of(:other_company_id)}
  it { is_expected.to belong_to(:user)}
  it { is_expected.to have_many(:items)}
end
