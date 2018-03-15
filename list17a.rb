class MyErr < StandardError
    attr_accessor :prev
    def initialize(msg,prev = $!)
        @prev = prev
        super(msg)
    end
end

begin
    begin
        raise "Hopa"
        rescue => e
            raise MyErr.new("Opa", e)
    end

rescue MyErr=> exception
    p exception.message
    p exception.prev.message
end