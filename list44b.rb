# Listing 44b: Maybe we could just loop until we get a sesible responce?
begin
puts "Confirm (y/n)"
answer = gets.chomp
end until %w[y n].include?(answer)