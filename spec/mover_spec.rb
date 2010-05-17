require File.dirname(__FILE__) + "/helper"

describe Mover do

    it "should have a version" do
        Mover.const_defined?("VERSION").should == true
    end
  
    it "should allow scheduling" do
        Mover.should respond_to(:schedule)
    end

    it "should allow testing" do
        Mover.should respond_to(:test)
    end
    
end
