if $DEBUG
    module Kernel
        def warn(message)
            raise message
        end
    end
end

begin
    warn "I write 'warn' in the code"
rescue
    p $!
else
    p "there is no errors been raised"
end