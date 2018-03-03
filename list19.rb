a, b = nil, nil
begin
    begin
        raise "This is A"
    rescue => e
        a = e
        p e.inspect + " : " + e.object_id.inspect
        raise e, "This is B"
    end
rescue => x
    b = x
    p x.inspect + " : " + x.object_id.inspect 
end

puts " a.object_id != b.object_id # %s" % (a.object_id != b.object_id).to_s.upcase 
puts " a != b # %s " % (a  != b).to_s.upcase