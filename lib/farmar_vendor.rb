# lib/farmar_market.rb
class FarMar::Vendor < FarMar::AllInfo

  attr_accessor :id, :name, :num_employees, :market_id
  def initialize(hash_parameter)
    super
  end

  def self.all
    super
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
