class SaveError < StandardError
    attr :prev
    def initialize(msg, prev = $!)
        @prev = prev
        super(msg)
    end 
end

begin
    begin
        raise "Error One"
        rescue => e 
        raise SaveError, "Error Two"
    end
rescue SaveError => e
    p e.message
    p e.prev.message
end