END { p "this is END structure."}

begin
    exit! false
rescue SystemExit
   p $!
end
p "this will not be printed out."
