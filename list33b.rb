END { p "printed by END lang. construct."}

begin
 exit 1   
rescue SystemExit => e
    p e
    p e.message
end

begin
    raise SystemExit.new(1)
rescue SystemExit => x
  p x
  p x.message
end

raise SystemExit.new(1)
