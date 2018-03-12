f = open("no_such_file_at_all.txt") rescue $!
p f