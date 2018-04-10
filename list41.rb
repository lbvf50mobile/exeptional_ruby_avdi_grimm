# Listing 41: The Cond gem.
require 'cond/dsl'

def divide(x,y)
    restartable do
        restart :return_this do |val|
            return val
        end
        raise ZeroDivisionError if 0 == y
        x/y
    end
end

handling do
    handle ZeroDivisionError do
        invoke_restart :return_this, 42
    end
    puts divide(10,2)
    puts divide(4,0)
end
