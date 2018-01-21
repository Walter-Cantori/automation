class Vehicle
    attr_accessor :doors
    @engines

    def initialize(doors, engines)
        @doors = doors
        @engines = engines
    end

    def get_engines
        @engines
    end

    def set_engines(engines)
        @engines = engines
    end
end