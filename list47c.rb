# Listing 47c: The ExceptionTester instruments the script and runs it once to record a list of callpoints.
def swap_keys(hash, x_key, y_key)
    tmp = hash[x_key]
    hash[x_key] = hash[y_key]
    hash[y_key] = tmp
end

h = {a: 01, b:57}

tester = ExceptionTester.new { swap_keys(h,:a,:b)}
