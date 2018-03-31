class Logger
    def error e
        p e
    end
end

logger = Logger.new

begin
    Service.some_request
rescue Exception => exception
    logger.error "Exception in Service request"
    logger.error exception.message
    logger.error exception.backtrace.join(" ")
end