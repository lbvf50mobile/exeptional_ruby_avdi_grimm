def generate_module(pattern)
    m = Module.new
    (class << m; self; end).instance_eval do
        define_method(:===) do |e|
            pattern === e.message
        end
    end
    m
end

puts "Start to raise"
begin
    raise "This is nice example"
rescue generate_module(/nice/) => e
    puts "I caought this '%s'" % e.message
end
puts "Keep on work"
