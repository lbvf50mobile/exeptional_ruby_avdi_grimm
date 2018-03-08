# define a custom matche that mathces classes starting with "i"

start_with_i = Class.new
def start_with_i.===(e)
    /^i/ === e.message
end

begin
    raise IOError, "i this is starts from I"
rescue start_with_i => e
    p "I cauth the #{e.message}"
end