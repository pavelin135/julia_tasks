function fib_member(n)
    a = 1
    b = 0
    c = 0
    for i in 1:n
        c = a + b
        a = b
        b = c
    end
    println(c)
end