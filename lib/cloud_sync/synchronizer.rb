module CloudSync
  class Synchronizer

    attr_accessor :source, :destination

    def initialize source, destination
      @source       = Resource.new source
      @destination  = Resource.new destination
    end

    def synchronize
      raise "Not implemented"
    end

  end
end