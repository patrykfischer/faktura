require 'spec_helper'

describe Item do
  subject {Item.new()}

  it { is_expected.to validate_presence_of(:invoice_id)}
  it { is_expected.to validate_presence_of(:name_of_service)}
  it { is_expected.to validate_presence_of(:qty)}
  it { is_expected.to validate_presence_of(:unit)}
  it { is_expected.to validate_presence_of(:unit_net_price)}
  it { is_expected.to validate_presence_of(:vat_rate)}
end
