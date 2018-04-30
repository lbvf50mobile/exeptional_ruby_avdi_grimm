# Listing 49: Matching exceptions by message.

def match_by_message message
 # ...
 raise message
rescue => error
    raise unless error.message =~ /foo bar/
end

match_by_message "hi" rescue p "It is #{$!.message}"
match_by_message "why" rescue p "It is #{$!.message}"
match_by_message "foo bar"
p match_by_message "foo bar"

require "minitest/autorun"

describe "Matching by message" do
    it "sometimes raise some times not" do
        hey = match_by_message("hi") rescue $!.message
        assert_equal "hi", hey
        assert_nil match_by_message("foo bar")
    end
end
