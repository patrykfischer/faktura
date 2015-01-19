class InvoiceDecorator < Draper::Decorator
  delegate_all

  def net_price_8
    count = 0
    get_items_vat_rate_8.each { |item| count =+ item.total_net_price }
    count
  end

  def vat_rate_8
    count = 0
    get_items_vat_rate_8.each { |item| count =+ item.vat_amount }
    count
  end

  def net_price_23
    count = 0
    get_items_vat_rate_8.each { |item| count =+ item.total_net_price }
    count
  end

  def vat_rate_23
    count = 0
    get_items_vat_rate_23.each { |item| count =+ item.vat_amount }
    count
  end

  def price_total_8
    count = 0
    get_items_vat_rate_8.each { |item| count =+ item.total_gross_price }
    count
  end

  def price_total_23
    count = 0
    get_items_vat_rate_8.each { |item| count =+ item.total_gross_price }
    count
  end

  def summation_net
    net_price_23 + net_price_8
  end

  def summation_vat
    vat_rate_23 + vat_rate_8
  end

  def summation_total
    price_total_23 + price_total_8
  end

  private

  def get_items_vat_rate_8
    invoice.items.where(vat_rate: '0.8')
  end

  def get_items_vat_rate_23
    invoice.items.where(vat_rate: '0.23')
  end
end
