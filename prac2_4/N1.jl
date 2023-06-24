function Teylor(x::Float64, n::Integer)
    if (n == 0)
        return 1
    end

    k = 1
    for i in (1:n)
        k = k * i
    end

    return (x^n)/k + Teylor(x,n - 1)
end

