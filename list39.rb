# Listing 39: Thread-local variable cleanup.
class Prov
    def prov
        (Thread.current[:pr_e] ||= []) <<
        "This is a contirved error, and it's important for education purpose."
    end
end


def handle_p_f
    Thread.current[:pr_e] = []
    yield
    if Thread.current[:pr_e].size > 0
        p Thread.current[:pr_e]
    end
ensure
    Thread.current[:pr_e] = []
end

handle_p_f do
    prov = Prov.new
    prov.prov
end

