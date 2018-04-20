# Listing 45c: Programs that use exceptions inappropriatelly have spaghetti code problems.

def try_something
    "boom"
end

begin
    try_something
rescue 
    begin
        try_something
        rescue
            # handle failure
    end
end
