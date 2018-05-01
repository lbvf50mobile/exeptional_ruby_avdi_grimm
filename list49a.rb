# Listing 49a: Every libraly codebase should have, at the very least, a defenition such as the following.

module MyLibrary
    class Error < StandardError
    end
end

def test (type = true)
    if type
        p type
        raise MyLibrary::Error.new("This is my lib error") 
    else
        p type
        raise "This is not MyLibrary" 
    end
     p type
rescue MyLibrary::Error => x 
    $!.message
end

p test(true)
p test(false) 

