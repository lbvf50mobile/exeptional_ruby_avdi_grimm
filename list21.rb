puts "Raise and rescue new exceptions"
begin
    raise "Exception one"
rescue => exception
    puts "I caught exception %s" % exception.inspect
end
puts "After begin block the $! is a %s " % $!.inspect 

module NoDobuleRaise
    def e_h!
        p "here1"
        $! = nil
        p "here2"
    end
    def raise(*args)
        p "this is $! : " + $!.object_id.inspect
        p "Nil object_id is a : " + nil.object_id.inspect
        p "this is args firs : " + args.first.object_id.inspect
        if $! && args.first != $!
            warn "Aaaaa!"
            exit! false
        else
            super
        end
    end
end
p "And continue"
class Object
    include NoDobuleRaise
end

begin
    begin
        p "first raise exception"
        raise "The Exception"
    rescue => e
        p "caght " + e.message
        e.e_h!
        raise
    end
rescue => exception
    p exception.message
end

begin
    begin
        raise "A"
    rescue => e
        p e.message
        raise e
    end
rescue => e1
    p "this is e1 message " + e1.message
    p "this is e message " + e.message 
end


begin
    begin
        raise 1
    rescue => e
        e_h!
        raise "2222"
    end
rescue => e1
    p "this is e1!!"
    p e1.message
end

begin
    begin
        raise "1"
    rescue => e
        p e.message
        p "here it is must exit"
        raise "2"
    end
rescue => e1
    p e1.message
end


