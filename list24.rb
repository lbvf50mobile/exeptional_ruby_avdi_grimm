begin
  puts "-> body"
rescue
  puts "-> rescue"
else 
  puts "-> else"
ensure
  puts "-> ensure"
end
puts "-- End when no raise --"

begin
  puts "-> body"
  raise "-> Error"
rescue => e
  puts "-> rescue: #{e}"
else
  puts '-> else'
ensure
  puts '-> ensure'
end
puts "-- End when raise an error --"
