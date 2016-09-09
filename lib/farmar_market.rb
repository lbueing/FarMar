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
        @market_info << FarMar::Market.new(id: line[0].to_i, name: line[1], address: line[2], city: line[3], country: line[4], state: line[5], zip: line[6])
      end
    return @market_info
  end

  def self.find(id)
    all
    @market_info.each do |i|
      if i.id == id
        return i
      end
    end
  end

  def vendors
    vendor_list = FarMar::Vendor.by_market(self.id)
    return vendor_list
  end

  #optional
  def self.search(word)
    all
    word_instances = []
    @market_info.each do |i|
      if i.name.include?(word)
        word_instances << i
      end
    end
    FarMar::Vendor.all.each do |i|
      if i.name.include?(word)
        word_instances << self.find(i.market_id)
      end
    end
    return word_instances
  end

  def products
    product_list = []
    FarMar::Vendor.by_market(self.id).each do |i|
      product_list << FarMar::Product.by_vendor(i.id)
    end
  return product_list.flatten
  end

end


# Below returns a master list of vendors for each market:
# # def vendors
  # # market_info = FarMar::Market.all
  # # counter = 1
  # # vendors_by_market = Hash.new
  # # market_info.each do |i|
  # #   if i.id.to_i == counter
  # #     vendors_by_market["#{counter}"] = FarMar::Vendor.by_market(counter)
  # #   end
  # #   counter += 1
  # # end
  # # return vendors_by_market
# #end
