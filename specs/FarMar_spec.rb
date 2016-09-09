require_relative 'Spec_helper'
require_relative '../far_mar'


describe FarMar do

#################################MARKET
  let(:shrek) { FarMar::Market.find(10) }

  it 'Check @market_info length in Market' do
    expect( FarMar::Market.all.length ).must_equal(500)
  end

  it 'Check for proper returned id info market' do
    expect( FarMar::Market.find(342).id ).must_equal(342)
  end

  it 'Check vendor and market id matching' do
    expect( shrek.vendors.length ).must_equal(9)
  end

################################VENDOR

  let(:fiona) { FarMar::Vendor.find(663) }

  it 'Check @vendor_info length in Vendor' do
    expect( FarMar::Vendor.all.length ).must_equal(2690)
  end

  it 'Check for proper returned id info vendor' do
    expect( fiona.id ).must_equal(663)
  end

  it 'Check for proper length of markets array' do
    expect( FarMar::Vendor.by_market(34).length ).must_equal(9)
  end

  it 'Check for proper length of markets array' do
    expect( FarMar::Vendor.by_market(4).length ).must_equal(4)
  end

  it 'Check for proper returned market name from vendor' do
    expect( fiona.market ).must_equal("Lenoir County Farmers Market")
  end

  it 'Check for proper returned id info vendor' do
    expect( fiona.products.length ).must_equal(2)
  end

  it 'Check for correct instances of sales (Vendor)' do
    expect( fiona.sales.length ).must_equal(2)
  end

  it 'Check for correct instances of sales (Vendor)' do
    expect( fiona.revenue ).must_equal(81.51)
  end

################################SALE

  let(:donkey) { FarMar::Sale.find(12001) }

  it 'Check @sale_info length in Sale' do
    expect( FarMar::Sale.all.length ).must_equal(12798)
  end

  it 'Check for proper returned id info sale' do
    expect( donkey.id ).must_equal(12001)
  end

  it 'Check for proper returned vendor name from product' do
    expect( donkey.vendor ).must_equal("Mann-Lueilwitz")
  end

  it 'Check for proper returned vendor name from product' do
    expect( donkey.product ).must_equal("Tasteless Apples")
  end

  it 'Check for sales between certain time' do
    expect( FarMar::Sale.between("2013-11-08 04:31:41 -0800", "2013-11-09 01:51:24 -0800").length ).must_equal(1704)
  end

################################PRODUCT

let(:farquad) { FarMar::Product.find(14) }

it 'Check @product_info length in Product' do
  expect( FarMar::Product.all.length ).must_equal(8193)
end

it 'Check for proper returned id info product' do
  expect( farquad.id ).must_equal(14)
end

it 'Check for proper returned number of sales' do
  expect( farquad.number_of_sales ).must_equal(7)
end

it 'Check for correct instances of sales (Product)' do
  expect( farquad.sales.length ).must_equal(7)
end

it 'Check for proper length of markets array' do
  expect( FarMar::Product.by_vendor(27).length ).must_equal(5)
end

it 'Check for proper length of markets array' do
  expect( FarMar::Product.by_vendor(188).length ).must_equal(1)
end

it 'Check for proper returned vendor name from product' do
  expect( farquad.vendor ).must_equal("Bechtelar Inc")
end

end
