# Listing 40: Representing a process as an object.
class Provisionment
    attr_accessor :error_log
    def initialize
        @error_log = []
    end
    def perform
        @error_log << "Here is an error #1 (one)."
        @error_log << "Here is an error #2 (two)."
    end
end

prv = Provisionment.new
prv.perform

if prv.error_log.size > 0
    p prv.error_log
end
