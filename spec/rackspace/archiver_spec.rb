require File.dirname(__FILE__) + "/../helper"

describe CloudSync::Archivers::Rackspace do

    it "should extend Archiver when the path starts with rackspace:" do
    
        @archiver = CloudSync::Archiver.new "rackspace:"
    
    end


end

