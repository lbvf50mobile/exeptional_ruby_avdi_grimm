# Listing 47a: Pop quiz: What parts of the following code might raise an exception?
size = File.size('Gemfile')
kbytes = size / 1024
puts "File size is #{kbytes}k"