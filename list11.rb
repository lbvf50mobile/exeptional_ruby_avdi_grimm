def ignore_exceptions(*ex)
    yield
    rescue *ex => e
     p "Igonire #{e}"
end

def ie(*ex)
    begin
    yield 
    rescue *ex => exception
        p "Catch " + exception.message.to_s
    end
end

p "Doing risky stuff with standard error"
ignore_exceptions(IOError,StandardError) do
    raise StandrdError
end
p "Continue and Doing risky stuff with IOError"
ignore_exceptions(StandardError, IOError) do
    raise IOError
end

p "And now repit it: StandardError"
ie(IOError, StandardError) do
    raise StandardError
end
p "And now repit it wit IError and message"
ie(IOError, StandardError) do
    raise IOError, "This is a IOError message"
end

p "And continue work"