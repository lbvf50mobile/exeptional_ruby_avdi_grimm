# Listing 47: A contingency method.

def something_that_might_fail
    raise IOError.new "one: something_that_might_fail."
end

def something_else_that_might_fail
    raise IOError.new "two: something_else_that_might_fail."
end

def with_io_error_handling
    yield
rescue
    # handle IOError
    puts "Message: %s" % $!.message
end

with_io_error_handling { something_that_might_fail }
with_io_error_handling { something_else_that_might_fail}