module DisallowDobuleRaise
    def error_handled!
        $! = nil
    end
    def raise(*args)
        if $! && args.first != $!
            p "caller.class #{caller.class}"
            p caller
            warn "Doubple rase at #{caller.first}, aborting"
            exit! false
        else
            super
        end
    end
end

class Object
    include DisallowDobuleRaise
end


    begin
        raise "one"
        rescue
         raise "two"
    end