# Listing 46: Implicit begin block.
require "minitest/autorun"

def foo
    raise "Oops"
    # mainline logic goes here
rescue
    # failure handling goes here
    "I save you"
end

describe "Implicit begin block" do
    it "should handling failures inside method" do
        assert_equal "I save you", foo
    end
end