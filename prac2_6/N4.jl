function dot_cross(a::Array{Float64, 1}, b::Array{Float64, 1}, c::Array{Float64, 1}, d::Array{Float64, 1})
    N1 = 0
    M1 = 0
    if b[1] > a[1]
        N1 = b[2] - a[2]
    else
        N1 = a[2] - b[2]
    end

    M1 = abs(b[1] - a[1])

    k1 = N1/M1
    
    q1 = a[2] - k1 * a[1]


    N2 = 0
    M2 = 0
    if d[1] > c[1]
        N2 = d[2] - c[2]
    else
        N2 = c[2] - d[2]
    end

    M2 = abs(d[1] - c[1])

    k2 = N2/M2
    
    q2 = c[2] - k2 * c[1]

    # y1 = k1 * x + q1
    # y2 = k2 * x + q2
    # y1 = y2
    # k1 * x + q1 = k2 * x + q2

    x = (q2 - q1) / (k1 - k2) #
    y = k1 * x + q1           # (x,y) -- crossing

    if a[1] <= x && x <= b[1] && c[1] <= x && x <= d[1]
        x1 = [a[1],b[1]]
        y1 = k1 .* x1 .+ q1
        y2 = k2 .* x1 .+ q2
        p = plot(x1, [y1,y2])
        display(p)

        return (x,y)

    elseif a[1] >= x && x >= b[1] && c[1] >= x && x >= d[1]
        x1 = [a[1],b[1]]
        y1 = k1 .* x1 .+ [q1,q1]
        y2 = k2 .* x1 .+ [q2,q2]
        p = plot(x1, [y1,y2])
        display(p)

        return (x,y)
    
    elseif a[1] >= x && x >= b[1] && c[1] <= x && x <= d[1]
        x1 = [a[1],b[1]]
        y1 = k1 .* x1 .+ [q1,q1]
        y2 = k2 .* x1 .+ [q2,q2]
        p = plot(x1, [y1,y2])
        display(p)

        return (x,y)

    elseif a[1] <= x && x <= b[1] && c[1] >= x && x >= d[1]
        x1 = [a[1],b[1]]
        y1 = k1 .* x1 .+ [q1,q1]
        y2 = k2 .* x1 .+ [q2,q2]
        p = plot(x1, [y1,y2])
        display(p)
        
        return (x,y)

    else
        return nothing
    end

end