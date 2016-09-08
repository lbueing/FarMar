require_relative 'Spec_helper'
require_relative '../far_mar'


describe FarMar do

#################################MARKET
  let(:shrek) { FarMar::Market.find(10) }

  it 'Check @market_info length in Market' do
    expect( FarMar::Market.all.length ).must_equal(500)
  end

  it 'Check for proper returned id info market' do
    expect( FarMar::Market.find(342).id ).must_equal("342")
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
    expect( fiona.id ).must_equal("663")
  end

  it 'Check for proper length of markets array' do
    expect( FarMar::Vendor.by_market(34).length ).must_equal(9)
  end

  it 'Check for proper length of markets array' do
    expect( FarMar::Vendor.by_market(4).length ).must_equal(4)
  end

  it 'Check for proper returned id info vendor' do
    expect( fiona.market ).must_equal("Lenoir County Farmers Market")
  end

################################SALE

  it 'Check @sale_info length in Sale' do
    expect( FarMar::Sale.all.length ).must_equal(12798)
  end

  it 'Check for proper returned id info sale' do
    expect( FarMar::Sale.find(12001).id ).must_equal("12001")
  end

################################PRODUCT

it 'Check @product_info length in Product' do
  expect( FarMar::Product.all.length ).must_equal(8193)
end

it 'Check for proper returned id info product' do
  expect( FarMar::Product.find(3664).id ).must_equal("3664")
end


end
