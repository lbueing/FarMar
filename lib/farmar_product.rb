# lib/farmar_market.rb
class FarMar::Product #< FarMar::AllInfo

  attr_accessor :id, :name, :vendor_id
  def initialize(hash_parameter)
    # super
    @id = hash_parameter[:id] #fixnum
    @name = hash_parameter[:name] #string
    @vendor_id = hash_parameter[:vendor_id] #fixnum
  end

  def self.all
    @product_info = []
    CSV.open("support/products.csv", "r").each do |line|
        @product_info << FarMar::Product.new(id: line[0].to_i, name: line[1], vendor_id: line[2].to_i)
      end
    return @product_info
  end

  def self.find(id)
    all
    @product_info.each do |i|
      if i.id.to_i == id
        return i
      end
    end
  end

  def vendor
    vendor_name = FarMar::Vendor.find(self.vendor_id).name
    return vendor_name
  end

  def self.by_vendor(vendor_id)
    all
    vendors = []
    @product_info.each do |i|
      if i.vendor_id.to_i == vendor_id
        vendors << i
      end
    end
    return vendors
  end

  def sales
    sales = []
    FarMar::Sale.all.each do |i|
      if i.product_id.to_i == self.id
        sales << i
      end
    end
    return sales
  end

  def number_of_sales
    counter = 0
    FarMar::Sale.all.each do |i|
      if i.product_id.to_i == self.id
        counter += 1
      end
    end
    return counter
  end

end
