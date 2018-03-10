def em(&block)
    m = Module.new
    (class << m; self; end).instance_eval do
         define_method(:===, &block)
    end
    m
end

class RetError < StandardError
    attr_reader :num_tries
    def initialize(message, num_tries)
        @num_tries = num_tries
        super("#{message} Num: #{num_tries}")
    end
end

p "About to raise"
begin
    raise RetError.new("Hi I'm supper RetError :)", 2)
rescue  em{|e| e.num_tries <= 2} => e
    p "caught #{e.message}"
end
p "Keep on work"