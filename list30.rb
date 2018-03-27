require 'net/http'
require 'json'
def a
  response = Net::HTTP.get_response('www.google_no_such.com', '/index.html')
  JSON.parse(response.body)
rescue SocketError
  {'stock_quote' => "<Unavalable>"}
end

p a