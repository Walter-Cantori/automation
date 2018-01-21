require './vehicle_class.rb'

class Motorcycle < Vehicle
    attr_accessor :brand
    @price
    def set_price(price)
        @price = price
    end

    def get_price
        @price
    end
end