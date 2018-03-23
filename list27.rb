thread1 = Thread.new{ raise "Thread 1 Exception"}
lambda = ->{ raise "Thread 2 Exception"}
thread2 = Thread.new(&lambda)

sleep 2

begin
    thread1.join
rescue => e
    puts "Block1: #{e.message}"
end
begin
    thread2.join
rescue => x
    puts "Block2: #{x.message}"
end
