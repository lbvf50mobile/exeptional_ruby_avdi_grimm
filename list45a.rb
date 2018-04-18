# Listing 45a: Am I throwing away valuable diagnostics?
require 'ostruct'
require 'minitest/autorun'

def some_fifteen_minutes_operation()
    OpenStruct.new(has_raisins_in_it?: true)
end

describe "Valueable diagnostic" do
    it "some time rasing an exception eliminate result of long diagnostic" do
        begin
            result = some_fifteen_minutes_operation()
            if result.has_raisins_in_it?
                raise "I HATE RAISINS"
            end
        rescue  RuntimeError => exception
            assert (/I/ === exception.message)
        end
    end
end