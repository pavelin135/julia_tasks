function gcdx_(a::T, b::T) where T
    u , v = 1, 0
    u_, v_ = v, u
    #ИНВАРИАНТ: НОД(a,b) = HОД(a0,b0) && a = u*a0 + v*b0 && b = u_*a0 + v_ * b0

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