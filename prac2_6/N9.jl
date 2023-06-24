function area_trapezoid(vert::Vector{Tuple{Float64, Float64}})
    n = length(vert)

    area = 0.0

    for i in 1 : n
        j = i % n + 1

        area += (vert[j][1] - vert[i][1]) * (vert[j][2] + vert[i][2])
    end

    area /= 2

    return area

end