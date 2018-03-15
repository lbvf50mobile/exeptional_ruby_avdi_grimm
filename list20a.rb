# Re-rasing with no arguments simply reraises the currenlty active Exception
x_one = 0
y_one = 0
begin
    begin
        raise "Yes this is Error"
        rescue => error
         x_one = error.object_id
         raise
    end
rescue => exception
    y_one = exception.object_id
end
p y_one == x_one
p x_one

# ... is equivalent to:
x_two = 0
y_two = 0
begin
    begin
        raise
        rescue => e
            x_two = e.object_id
            raise e

    end
rescue => err
     y_two = err.object_id

end
p x_two == y_two
p x_two

p "And the last one"
# ... which is equivaltent to
y_three = 0
x_three = 0
begin
     begin
        raise "hi"
        rescue => e_three
            x_three = e_three.object_id
            raise $!
     end
rescue => err_three
    y_three = err_three.object_id
end

p y_three == x_three
p x_three
