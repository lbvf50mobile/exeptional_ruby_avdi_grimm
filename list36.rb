# Listing 36: Passing in a transcript parameter.
require 'stringio'

def make_use_account(host, t = StringIO.new)
    t.puts "* Making user accounts..."
    # ... code that captures stdout and STDERR ot the transcript
end

def install_packages(host, t = StringIO.new)
    t.puts "* Installing pachages..."
    # ... code that captures STDOUT and STDERR to the transcript
end

def provision_host(host, t)
    make_use_account(host, t)
    install_packages(host, t)
end

t  = StringIO.new
provision_host('192.168.1.123', t)
puts "Provistion transcript: "
puts t.string
