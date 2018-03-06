# Listing 10: comparing case and rescue

def case_show obj
    case obj
    when  Numeric, String, NilClass, FalseClass, TrueClass
        "Scalar"
    else
        "Not scalar"
    end
end

vals = [1,"dva", nil, false, true, Object.new]
vals.each do |x|
    puts x.inspect + " " + case_show(x)
end

def rescue_show err
    begin
        raise err
    rescue SystemCallError, IOError, SignalException
       p "cought #{$!}"
    end
end

[ IOError, IOError].each do |e|
    rescue_show e
end

# WORKS "plain raise"
begin
    raise IOError
rescue SystemCallError, IOError, SignalException
    p "I cought `raise IOError` #{$!}"
end

# WORKS "Raise using var"
error =  IOError
begin
    raise error
rescue SystemCallError, IOError, SignalException
    p "I cought `raise error` #{$!}"
end

# Method "Raise using method ann var argument"
def error_catch err_nice
    begin
        raise err_nice
    rescue SystemCallError, IOError, SignalException
        p "I cought `raise err_nice # this is arg` #{$!}"
    end
end
error =  IOError
error_catch error

# Call from the array
def error_catch1 err_nice1
    begin
        raise err_nice1
    rescue SystemCallError, IOError, SignalException => e
        p "I cought `raise err_nice1 # this is from arr and each` " + e.inspect
    end
end
# SystemCallError - dose not works 
[IOError,IOError,IOError].each do |x|
    error_catch1 x
end
    
    




