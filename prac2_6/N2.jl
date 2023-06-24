function check_side(a::Array{Float64, 1}, b::Array{Float64, 1}, c::Array{Float64, 1}, d::Array{Float64, 1})
    N = 0
    M = 0
    if d[1] > c[1]
        N = d[2] - c[2]
    else
        N = c[2] - d[2]
    end

    M = abs(d[1] - c[1])

    k = N/M
    
    q = c[2] - k * c[1]
    
    y1 = k * a[1] + q
    y2 = k * b[1] + q

    if (a[2] >= y1 && b[2] >= y2) || (a[2] < y1 && b[2] < y2) 
        return true
    end

    return false
end