# Listing 47b: Exception safety testing. Let use a simple #swap_keys method as our unit-under-test.

def swap_keys(hash, x_key, y_key)
    tmp = hash[x_key]
    hash[x_key] = hash[y_key]
    hash[y_key] = tmp
end

require "minitest/autorun"

describe "safety testing" do
    it "should swap keys" do
        x = {a: 1, b: 2}
        y = {a: 2, b: 1}
        swap_keys(x,:b,:a)
        assert_equal x,y
    end
end