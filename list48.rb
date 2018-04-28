# Listing 48: Over-broad rescue.

begin
    # ...
    raise "BOOM"
rescue Exception
end
