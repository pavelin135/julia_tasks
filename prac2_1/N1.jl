function gcd_(a::T, b::T) where T
    while b != 0
        if (b > a)
            b += a
            a = b - a
            b -= a
        end

        a -= b
    end
    
    return a
end