# lib/farmar_market.rb
class FarMar::Product < FarMar::AllInfo

  # attr_accessor :id, :name, :vendor_id
  def initialize(hash_parameter)
    super
    # @id = hash_parameter[:id] #fixnum
    # @name = hash_parameter[:name] #string
    # @vendor_id = hash_parameter[:vendor_id] #fixnum
  end

  def self.all
    @product_info = []
    CSV.open("support/products.csv", "r").each do |line|
        @product_info << FarMar::Product.new(id: line[0], name: line[1], vendor_id: line[2])
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

end
