# lib/farmar_market.rb
class FarMar::Sale  < FarMar::AllInfo

  # attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id
  def initialize(hash_parameter)
    super
    # @id = hash_parameter[:id] #fixnum
    # @amount = hash_parameter[:amount] #fixnum
    # @purchase_time = hash_parameter[:purchase_time] #date time
    # @vendor_id = hash_parameter[:vendor_id] #fixnum
    # @product_id = hash_parameter[:product_id] #fixnum
  end

  def self.all
    @sale_info = []
  CSV.open("support/sales.csv", "r").each do |line|
      @sale_info << FarMar::Sale.new(id: line[0], amount: line[1], purchase_time: line[2], vendor_id: line[3], product_id: line[4])
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

end
