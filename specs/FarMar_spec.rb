require_relative 'Spec_helper'
require_relative '../far_mar'


describe FarMar do

  it 'Check @@market_info length in Market' do
    expect( FarMar::Market.all.length ).must_equal(500)
  end

  it 'Check for proper returnd id info market' do
    expect( FarMar::Market.find(342).id ).must_equal("342")
  end

  it 'Check @@market_info length in Vendor' do
    expect( FarMar::Vendor.all.length ).must_equal(2690)
  end

  it 'Check for proper returnd id info vendor' do
    expect( FarMar::Vendor.find(663).id ).must_equal("663")
  end

end
