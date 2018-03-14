p "Start execution"
begin
    p "I am here"
    begin
        p "I am here too"
        raise "Exception A"
    rescue => exception
        p "I cought exception: '%s'" % exception.message
        raise "Exception B"
    end
rescue => h
    p "Finaly I cought: %s" % h.message
    p h.message

end
p "And still work"
p "And work succesfully"
