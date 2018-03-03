#reraising same exception
a  = nil
b = nil
begin
    begin
        raise "This is A"
    rescue => e
        a = e.object_id
        p a
        raise e
    end
rescue => x
    b = x.object_id
    p b
end

puts "e.object_id == x.object_id #%s" % (a==b)