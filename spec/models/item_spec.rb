require 'spec_helper'

describe Item do
  it { is_expected.to validate_presence_of(:invoice_id)}
  it { is_expected.to validate_presence_of(:name_of_service)}
  it { is_expected.to validate_presence_of(:qty)}
  it { is_expected.to validate_presence_of(:unit)}
  it { is_expected.to validate_presence_of(:unit_net_price)}
  it { is_expected.to validate_presence_of(:vat_rate)}
  it { is_expected.to belong_to(:invoice)}

  describe '#count_value' do
    let!(:item_b) {create(:item)}
    it 'return right value of item' do
      item_b.count_value
      expect(item_b.total_net_price).to eq(12)
      expect(item_b.total_gross_price).to eq(12.96)
      expect(item_b.vat_amount).to eq(0.96)
    end
  end
end
