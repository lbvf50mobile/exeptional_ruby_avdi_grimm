# Listing 35: Returning a structure. (Side band pattern)
require "ostruct"
def foo
    OpenStruct.new(result: 42, status: :success)
end
p foo.result
p foo.status
