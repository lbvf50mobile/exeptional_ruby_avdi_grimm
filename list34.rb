def foo
    result = 50
    success = true
    [result, success]
end

result, success = foo

p "#{success ? 'Succeedded' : 'Failured '}"