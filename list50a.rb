# Listing 50a: To compensate for occasional connections failures, we've wrapped the call an IOError handler that retrice the call.

require "net/http"
require "uri"

a = 0;

begin
    resp  = Net::HTTP.get("example.com","/service")
rescue IOError => exception
    sleep 1
    a += 1
    p a
    retry unless a> 3
end

p resp
