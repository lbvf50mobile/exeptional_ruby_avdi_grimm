# Listing 44a: Do we really need to raise an exception when the user fails to answer either 'y' or 'n' to a question?
puts "Confirm (y/n)"
answer = gets.chomp
raise "Huh?" unless %w[y n].include?(answer)