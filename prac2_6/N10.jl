function square(q, r)
    val = (q[1] * r[2] - r[1] * q[2]) # square triangle with direction
    return val
end

function area_triangle(vert::Vector{Tuple{Float64, Float64}})
    n = length(vert)

    area = 0.0

    for i in 1 : n
        j = i % n + 1

        area += square(vert[i], vert[j])
    end

    return area/2

end