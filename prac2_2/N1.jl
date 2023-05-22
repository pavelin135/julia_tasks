function pow_(a::T, n::T) where T
    p, k = a, n
    t = 1
    #ИНВАРИАНТ: p^k * t == a^n
    while k > 1
        if k % 2 == 0
            k /= 2
            p *= p
        else
            k -= 1
            t *= p
        end
    end

    return p * t
end