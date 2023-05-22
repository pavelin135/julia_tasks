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

function diaphant_solve(a::T,b::T,c::T) where T
    RES = gcdx_(a, b)
    if (RES[1] != c)
        return nothing
    end

    return RES[2], RES[3]
end