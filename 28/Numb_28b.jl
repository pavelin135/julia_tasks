function count(n,a,b)
    if n - 1 == 0
        return a + b
    end
    c = a + b
    count(n - 1, b, c)
end

function fib_member(n::Integer)
    a = 1
    b = 0
    count(n,a,b)
end
