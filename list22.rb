def test
    yield
rescue
    puts "The error is rescued"
else
    puts "There is no error at all"
ensure
    puts "this code is always fired"
end

test{ puts "Will be error"; raise "Boom"}
puts "-----------------"
test {puts "No error at all"}