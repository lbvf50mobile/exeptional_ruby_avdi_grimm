# Listing 44: Example of caller-supplied fallback strategy.
require "minitest/autorun"
require 'ostruct'

def inspect_user(user)
    if user.name && user.age
        "#{user.name} : #{user.age}"
    else
        yield
    end
end

describe "Caller-supplyed strategy" do
 it "Work normaly with conditions" do
    tester = OpenStruct.new(name: "Tester", age: 19)
    assert_equal "Tester : 19", inspect_user(tester){"Unknown"}
 end
 it "Retur defalut value from block" do
    tester = OpenStruct.new(name: false, age: 19)
    assert_equal "Unknown", inspect_user(tester){"Unknown"}
 end
 it "Fire exception from the block" do
    begin
        tester = OpenStruct.new(name: false, age: 19)
        assert_equal "Unknown", inspect_user(tester){ raise "Boom"}
    rescue => x
        assert_equal x.message, "Boom"
    end
 end
end
