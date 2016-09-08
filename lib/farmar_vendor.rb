# lib/farmar_market.rb

class FarMar::Vendor #< FarMar::AllInfo

  attr_accessor :id, :name, :num_employees, :market_id
  def initialize(hash_parameter)
    # super
    @id = hash_parameter[:id] #fixnum
    @name = hash_parameter[:name] #string
    @num_employees = hash_parameter[:num_employees] #fixnum
    @market_id = hash_parameter[:market_id] #fixnum
  end

  def self.all
    @vendor_info = []
    CSV.open("support/vendors.csv", "r").each do |line|
        @vendor_info << FarMar::Vendor.new(id: line[0], name: line[1], num_employees: line[2], market_id: line[3])
    end
    return @vendor_info
  end

  def self.find(id)
    all
    @vendor_info.each do |i|
      if i.id.to_i == id
        return i
      end
    end
  end

  def self.by_market(market_id)
    all
    markets = []
    @vendor_info.each do |i|
      if i.market_id.to_i == market_id
        markets << i
      end
    end
    return markets
  end

  def market
    market_name = FarMar::Market.find(self.market_id.to_i).name
    return market_name
  end

end
