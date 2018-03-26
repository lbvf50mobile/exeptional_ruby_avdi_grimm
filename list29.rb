def fib(n)
    return n if n < 2
    v = [0,1]
    n.times do
        v.push(v[-1]+v[-2])
    end
    return v.last
end

def fib_r(n)
    return n if n < 2
    v = [0,1]
    i = 0
    loop do
        v.push(v[-1]+v[-2])
        i += 1
        raise if i>=n
    end
rescue RuntimeError
  v.last
end

require 'benchmark'
Benchmark.bm(22) do |bm|
    bm.report("fib"){ 10_0000.times {fib(100)}}
    bm.report("fib_raise"){10_0000.times{fib_r(100)}}
end