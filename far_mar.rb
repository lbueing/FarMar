# gems your project needs
require 'csv'




module FarMar

  class AllInfo

  attr_accessor :id, :name, :address, :city, :county, :state, :zip, :num_employees, :market_id, :amount
    def initialize(hash_parameter)
      @id = hash_parameter[:id] #fixnum
      @name = hash_parameter[:name] #string
      @address = hash_parameter[:address]
      @city = hash_parameter[:city]
      @county = hash_parameter[:county]
      @state = hash_parameter[:state]
      @zip = hash_parameter[:zip]
      @num_employees = hash_parameter[:num_employees] #fixnum
      @market_id = hash_parameter[:maket_id] #fixnum
      @amount = hash_parameter[:amount]
    end

    def self.all
      @market_info = []
      CSV.open("support/markets.csv", "r").each do |line|
          @market_info << FarMar::Market.new(id: line[0], name: line[1], address: line[2], city: line[3], country: line[4], state: line[5], zip: line[6])
        end
        @vendor_info = []
      CSV.open("support/vendors.csv", "r").each do |line|
          @vendor_info << FarMar::Vendor.new(id: line[0], name: line[1], num_employees: line[2], market_id: line[3])
        end
    end
  end


end

# all of our data classes that live in the module
require_relative 'lib/farmar_market'
require_relative 'lib/farmar_vendor'
require_relative 'lib/farmar_product'
require_relative 'lib/farmar_sale'
