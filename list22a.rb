def buggy_log message
    raise "Error in log message."
end

def ignore_errors code
    eval(code)
    buggy_log "Success running code #{code}"
rescue Exception => e
    puts "Error in code #{e}"
end

ignore_errors "puts 'hi'"