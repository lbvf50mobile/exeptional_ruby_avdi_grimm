END { p "print by END language construct."}

begin
   exit 1 
rescue SystemExit
    p "this is rescue SystemExit by exit1: %s " % $!.message
end
warn "Exit 1"
exit 1
