require 'time'

# lib/farmar_market.rb
class FarMar::Sale  #< FarMar::AllInfo

  attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id
  def initialize(hash_parameter)
    # super
    @id = hash_parameter[:id] #fixnum
    @amount = hash_parameter[:amount] #fixnum
    @purchase_time = hash_parameter[:purchase_time] #date time
    @vendor_id = hash_parameter[:vendor_id] #fixnum
    @product_id = hash_parameter[:product_id] #fixnum
  end

  def self.all
    @sale_info = []
  CSV.open("support/sales.csv", "r").each do |line|
      @sale_info << FarMar::Sale.new(id: line[0].to_i, amount: line[1].to_i, purchase_time: line[2], vendor_id: line[3].to_i, product_id: line[4].to_i)
    end
    return @sale_info
  end

  def self.find(id)
    all
    @sale_info.each do |i|
      if i.id.to_i == id
        return i
      end
    end
  end

  def vendor
    vendor_name = FarMar::Vendor.find(self.vendor_id).name
    return vendor_name
  end

  def product
    product_name = FarMar::Product.find(self.product_id).name
    return product_name
  end

  def self.between(beg_time, end_time)
    all
    times_good = []
    @sale_info.each do |i|
      # if Time.parse(beg_time) < Time.parse(i.purchase_time) < Time.parse(end_time)
      if Time.parse(i.purchase_time).between?(Time.parse(beg_time), Time.parse(end_time))
        times_good << i
      end
    end
    return times_good
  end

end
