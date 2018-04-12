# Listing 43: Using fetch to supply fallbacks.
require "minitest/autorun"

describe "Caller supply strategy in fetch" do
    it "must return value on fetch" do
        h = {one: 1, two: 2}
        assert_equal 1,h.fetch(:one)
    end
    it "must return default value if there is no such key in array" do
        h = {one: 1, two: 2}
        assert_equal "default", h.fetch(:five){'default'}
    end
    it "may raise exception in supplied block" do
        begin
            h = {one: 1, two: 2}
            h.fetch(:five){raise 'Boom'}    
        rescue => x
            assert_equal 'Boom', x.message
        end
    end
end
