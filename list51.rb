# Listing 51: Tagging exception with modules.

begin
    begin
        raise IOError, "Some IO Error"
    rescue Exception => error
        error.extend(AcmeHttp::Error)
        raise
    end
rescue AcmeHttp::Error=> error
    puts "Rescue AcmeHttp::Error: #{error}"
end