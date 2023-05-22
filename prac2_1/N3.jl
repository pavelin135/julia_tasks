function gcdx_(a::T, b::T) where T
    u , v = 1, 0
    u_, v_ = v, u

    while b != 0
        if (b > a)
            t = b
            b = a
            a = t
            
            t = u
            u = u_
            u_ = t

            t = v
            v = v_
            v_ = t
        end

        u -= u_
        v -= v_
        a -= b
    end
    
    return a, u, v
end

function invmod_(a::T, M::T) where T
    RES = gcdx_(a, M)

    if (RES[1] != 1)
        return nothing
    end

    return RES[2]
end