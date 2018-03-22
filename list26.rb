require 'yaml'
at_exit do
    if $!
        open('tmp.log','a') do |l|
            e = {
                timestamp: Time.now,
                message: $!.message,
                backtrace: $!.backtrace,
                gems: Gem.loaded_specs.reduce({}){|m,(n,v)| m.merge(n=>v)}
            }
            YAML.dump(e,l)
        end
    end
end

raise "Test"
