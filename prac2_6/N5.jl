function dot_in_figure(x::Float64, y::Float64, polygon::Vector{Tuple{Float64, Float64}})
    n = length(polygon)
    angle_sum = 0.0

    for i in 1:n
        p1x, p1y = polygon[i]
        p2x, p2y = polygon[i % n + 1]

        v1x = p1x - x
        v1y = p1y - y
        v2x = p2x - x
        v2y = p2y - y

        dot_product = v1x * v2x + v1y * v2y # (a,b)
        cross_product = v1x * v2y - v1y * v2x # [a, b]

        angle = atan(cross_product, dot_product)

        if dot_product < 0.0
            angle += π
        end

        angle_sum += angle
    end

    if (angle_sum == 0)
        return false
    end

    return true
end
