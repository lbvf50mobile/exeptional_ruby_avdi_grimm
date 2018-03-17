module NoDoubleRaize
    def error_handled!
        $! = nil
    end
    def raise(*args)
        if $! && args.first != $!
            warn "Double Raise at #{caller.first}"
            exit #here exit without exclamation mark
        else
            super(*args)
        end
    end
end

class Object
    include NoDoubleRaize
end

begin
    begin
        raise "First"
    rescue => x
        error_handled!
        raise "Second"
    end
rescue => e
    p "Here recue second call supe(*args)"
    p e
    p e.message #how do we got message?
end
begin
begin
    raise "one"
rescue 
    "Here NoDoubleRaise module going to call exit"
    raise "two"
end
rescue SystemExit => x
    p x
end