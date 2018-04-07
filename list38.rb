# Listing 38: Using a thread-local variable for failure reporting.

class Provisioner
    def provison
        (Thread.current[:pr_e] ||= []) << "Here is an Error."
    end
end

prov = Provisioner.new
prov.provison

p Thread.current[:pr_e].class
p Array(Thread.current[:pr_e]).class

if Array(Thread.current[:pr_e]).size > 0
    p "Here I'm inside the IF"
    p Thread.current[:pr_e]
end
