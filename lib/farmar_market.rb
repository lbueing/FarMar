# lib/farmar_market.rb
class FarMar::Market #< FarMar::AllInfo


  attr_accessor :id, :name, :address, :city, :county, :state, :zip
  def initialize(hash_parameter)
    # super
    @id = hash_parameter[:id] #fixnum
    @name = hash_parameter[:name] #string
    @address = hash_parameter[:address]
    @city = hash_parameter[:city]
    @county = hash_parameter[:county]
    @state = hash_parameter[:state]
    @zip = hash_parameter[:zip]
  end


  def self.all
    @market_info = []
    CSV.open("support/markets.csv", "r").each do |line|
        @market_info << FarMar::Market.new(id: line[0], name: line[1], address: line[2], city: line[3], country: line[4], state: line[5], zip: line[6])
      end
    return @market_info
  end

  def self.find(id)
    all
    @market_info.each do |i|
      if i.id.to_i == id
        return i
      end
    end
  end

  def vendors
    # FarMar::Market.all
    #WHY 17?!?!?!?!?!?!?!?!?!?!
    vendor_list = FarMar::Vendor.by_market(self.id.to_i)
    return vendor_list
    # market_info = FarMar::Market.all
    # counter = 1
    # vendors_by_market = Hash.new
    # market_info.each do |i|
    #   if i.id.to_i == counter
    #     vendors_by_market["#{counter}"] = FarMar::Vendor.by_market(counter)
    #   end
    #   counter += 1
    # end
    # return vendors_by_market
  end

  # def self.find(id)
  #   #returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
  # end


end
