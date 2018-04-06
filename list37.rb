# Listing 37: Caller-supplied fallback strategy.
def make_user_accounts(host, fp = method(:raise))
    puts "* Make user account."
    # ...
rescue => e
    fp.call(e)
end

def install_pachages(host, fp = method(:raise))
    puts "* Intalling packages."
    raise "Packages 'foo' install failed on #{host}"
rescue => e
    fp.call(e)
end

def provision_host(host, fp)
    make_user_accounts(host,fp)
    install_pachages(host,fp)
end

policy = ->(x){ puts x.message}
provision_host('localhost',policy)
