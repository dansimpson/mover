require File.dirname(__FILE__) + "/../helper"

describe Mover::Archivers::Rackspace do

    it "should extend Archiver when the path starts with rackspace:" do
    
        @archiver = Mover::Archiver.new "rackspace:"
    
    end


end

