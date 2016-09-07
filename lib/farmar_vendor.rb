# lib/farmar_market.rb
class FarMar::Vendor < FarMar::AllInfo

  attr_accessor :id, :name, :num_employees, :market_id
  def initialize(hash_parameter)
    super
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

end
