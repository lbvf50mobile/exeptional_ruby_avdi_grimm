# Listing 45: Substituting a benign value for a missing record.
require "minitest/autorun"
require "ostruct"

class Logger
    def self.val
        @@val ||= []
        @@val
    end
    def self.error x
        self.val << x
    end
end
class UserGreetings
    def self.vals
        {"summer_holidays" => OpenStruct.new(welcome: "This is summer!")}
    end
    def self.find_by_name!(x)
        self.vals.fetch(x){ raise "Boom!"}
    end
    def self.find_by_name(x)
        self.vals.fetch(x){nil}
    end
end

describe "Record nil and benign value" do
 it "Should rais exeption when there is no such recored, and this going to stop program" do
    begin
        ug = UserGreetings.find_by_name!("winter_holidays")
    rescue 
        assert (/Boom/ === $!.message)
    else
        assert false
    end
 end
 it "Substituting a beging value for a missing record." do
    ug = UserGreetings.find_by_name("winter_holidays")
    unless ug
        Logger.error "Someone forgot to run db:populate!"
        ug = OpenStruct.new(welcome: "Hello")
    end
    assert_equal "Hello", ug.welcome
    assert Logger.val.find {|s| /db/ === s}
 end
 ####################################### not read bellow it just development ##############
 it "Logger should log" do
    logger = Logger
    logger.error "First Error."
    assert Logger.val.include?("First Error.")
 end
 it "Find by name! should work" do
    ug = UserGreetings.find_by_name!("summer_holidays")
    assert_equal ug.welcome,"This is summer!"
 end
 it "find_by_name sholud work too" do
    ug = UserGreetings.find_by_name("summer_holidays")
    assert_equal ug.welcome,"This is summer!"
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
