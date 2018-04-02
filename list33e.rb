END { p "this is END."}
begin
    exit!
rescue SystemExit
    p "SystemExit rescued"
end
p "Line after all."
