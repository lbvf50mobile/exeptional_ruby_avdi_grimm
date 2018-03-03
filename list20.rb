# re-raising with a modifed backtrace
begin
begin
begin
    raise "Err: A"
    p "2"
rescue => e
    puts e.message
    puts "e.backtrace: %s" %  e.backtrace.class.inspect
    puts  "e.backtrace: %s" % e.backtrace.inspect
    puts "e.baktrace.first: %s" % e.backtrace.first
    raise e, "Err: B", ["The Message B"]    
end
rescue => b
    puts b.message
    puts "b.backtrace %s" % b.backtrace.inspect
    raise b, "Err: C"
end
rescue => c
    puts c.message
    puts "c.macktrace %s" % c.backtrace.inspect
end