# Listing 46a:  Code which repeatedly has to cope with the possibility of a particular class of failure.
def something_that_might_fail
 raise IOError.new("one")
end

def something_else_that_might_fail
    raise IOError.new "two"
end

begin
    something_that_might_fail
rescue IOError
    # Handle IOError
    p $!.message
end

begin
    something_else_that_might_fail
rescue IOError
  # Hande IOError
  p $!.message
end
