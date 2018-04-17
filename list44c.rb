require "minitest/autorun"

# Listing 44c: Exception in method that going to finish a program if it will not be caught.
class UserGreetings
    def self.vals
        {"summer_holidays" => "This is summer!"}
    end
    def self.find_by_name!(x)
        self.vals.fetch(x){ raise "Boom!"}
    end
    def self.find_by_name(x)
        self.vals.fetch(x){nil}
    end
end

describe "Record nil and benign value" do
 it "Find by name! should work" do
    ug = UserGreetings.find_by_name!("summer_holidays")
    assert_equal ug,"This is summer!"
 end
 it "find_by_name sholud work too" do
    ug = UserGreetings.find_by_name("summer_holidays")
    assert_equal ug,"This is summer!"
 end
 it "find_by_name should return nil if there is no such key" do
    ug = UserGreetings.find_by_name("winter_holidays")
    assert_nil ug
 end
 it "find_by_name shold raise exception if there is no such key" do
    begin
        ug = UserGreetings.find_by_name!("winter_holidays")    
    rescue => exception
        ans = (/Boom/ === exception.message)
        assert_equal ans, true
    end
 end
end
