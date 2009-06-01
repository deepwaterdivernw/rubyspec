require File.dirname(__FILE__) + '/../../spec_helper'

ruby_version_is "1.9" do
  describe "Fiber.new" do
    it "creates a fiber from the given block" do
      fiber = Fiber.new {}
      fiber.should be_an_instance_of(Fiber)
    end
    
    it "raises an ArgumentError if called without a block" do
      lambda { Fiber.new }.should raise_error(ArgumentError)
    end

    it "does not invoke the block" do
      invoked = false
      fiber = Fiber.new { invoked = true }
      invoked.should be_false
    end

    it "raises a SyntaxError when the block contains a retry statement" do
      lambda { eval 'Fiber.new { retry; }' }.should raise_error(SyntaxError)
    end  
  end
end
