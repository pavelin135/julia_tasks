function log_(a::T, x::T) where T
    z = x
    t = 1
    y = 0
    ep = eps()
    
    i = 1
    if (a == 1 || a <= 0)
        return nothing
    elseif (a < 1)
        a = 1/a
        i = -1
    end
    
    
    #ИНВАРИАНТ:  x = z^t * a^y
    while z < 1/a || z > a || t > ep
        if (z < 1/a)
            y -= t
            z *= a
        elseif ( z > a)
            y += t
            z /= a
        elseif (t > ep)
            t /= 2
            z *= z
        end
    end

    return i * y
end