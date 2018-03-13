tries = 0

begin
    tries += 1
    p "Try ##{tries}"
    raise
rescue 
    retry if tries < 3
    p "Stop Retrying and continue work"
end
