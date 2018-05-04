# Listing 50b: One day we replace our Net::HTTP calls with a new HTTP client library. Sudenly we start getting a failures.
a = 0
begin
    responce = AcmeHttmp.get("http://example.com/service")
rescue IOError => erro
    sleep 5
    a += 1
    retry unless a > 10
end