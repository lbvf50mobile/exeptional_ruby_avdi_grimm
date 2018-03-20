def buggy_log(text)
  raise 'Error in Logging'
  puts "log: #{text}"
end

def ignore_errors_with_else(code)
  eval(code)
rescue Exception => e
  puts "Error during code: #{e}"
else
  buggy_log "Succesfully run code: #{code}"
end

ignore_errors_with_else '2+2'
