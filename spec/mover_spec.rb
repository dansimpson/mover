require File.dirname(__FILE__) + "/helper"

describe CloudSync do

    it "should have a version" do
        CloudSync.const_defined?("VERSION").should == true
    end
  
    it "should allow scheduling" do
        CloudSync.should respond_to(:schedule)
    end

    it "should allow testing" do
        CloudSync.should respond_to(:test)
    end
    
end
