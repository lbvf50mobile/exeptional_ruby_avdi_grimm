END { p "Print by END lang. struct."}

begin
    exit 1
rescue SystemExit=> e
    p e.message
end

begin
    abort "hey"
rescue SystemExit => x
    p x.message    
end

abort "Hey"
