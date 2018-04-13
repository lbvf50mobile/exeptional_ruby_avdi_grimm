# Listing 43a: Using #detect to supply fallbacks
require 'minitest/autorun'

describe 'Caller-suppled fallback strategy in #detct' do
    it "must return value on detect if value exists" do
        assert_equal 2,[1,2,8,6,4,12,14].detect(->{'default'}){|x| x.even? }
    end
    it "must default valueon detect if value dose not exitst" do
        assert_equal 'default',[2,8,6,4,12,14].detect(->{'default'}){|x| x.odd? }
    end
    it "must fire excepton from suplied bock if value dosenot exist" do
        begin
            [2,8,6,4,12,14].detect(->{ raise "Boom"}){|x| x.odd? }
        rescue => exception
            assert_equal exception.message, "Boom"
        end
    end
end
