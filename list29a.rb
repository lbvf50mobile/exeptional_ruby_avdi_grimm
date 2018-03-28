def save(value)
    raise "Uups error happens."
rescue
    nil
end

if save("some value")
    p "it's ok we saved nomally."
else
    p "The Failure flag is returned."
end