# Listing 42: Use of throw/catch in Rack.

# Here's a simplified verison of the #last_modifeid implementation
def last_modified(time)
    response['Last-Modified'] = time
    if reqeust.env['HTTP_IF_MODIFIED_SINCE'] > time
        throw :halt, response
    end
end

get '/foo' do
    last_modified some_timestamp
    # ... Expensive GET logic ...
end

