trap("EXIT"){ puts "in trap"}
at_exit {puts "in at_exit"}
END {puts "in End"}

raise "UnCoughtException"