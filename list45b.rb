# Listing 45b: Sometimes it's better to rais earlier than latter.
require "minitest/autorun"
def might_return_nil(x = nil)
    if :not_nil == x
        1
    else
        nil
    end
end

codes_to_messages = {1 => "error one"}

describe "Sometime it's better to rais earlier than latter." do
    it "Going wrong in in less easy-to-diagnose way down the road" do
        begin
        response_code = might_return_nil()
        message = codes_to_messages[response_code]
        response = "System Status: " + message
        # What do you mean "Can't convert nil inot string" ?!
        rescue TypeError => e
            assert (/no/ === e.message)
        end
    end
    it "In case like this, it's better to raise earlier than leter." do
        begin
            response_code = might_return_nil() or raise "No response code"
        rescue RuntimeError => x
            assert (/response/===x.message)
        end
    end
    ###### Development #############################
    it "Should return nil" do
        assert_nil might_return_nil()
    end
    it "Should return 1 if :no_nil is arg" do
        assert_equal might_return_nil(:not_nil), 1
    end
    it "should perform not nil response" do
        response_code = might_return_nil(:not_nil)
        message = codes_to_messages[response_code]
        response = "System Status: " + message
        assert_equal response, "System Status: error one"
    end

end

