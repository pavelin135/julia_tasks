function check_angles(angles)
    for angle in angles
        if angle > π
            return false
        end
    end
    return true
end

function compute_angles(polygon::Vector{Tuple{Float64, Float64}})
    n = length(polygon)
    angles = []

    for i in 1:n
        p1x, p1y = polygon[i]
        p2x, p2y = polygon[i % n + 1]
        p3x, p3y = polygon[(i + 1) % n + 1]

        v1x = p1x - p2x
        v1y = p1y - p2y
        v2x = p3x - p2x
        v2y = p3y - p2y

        dot_product = v1x * v2x + v1y * v2y
        cross_product = v1x * v2y - v1y * v2x

        angle = atan(cross_product, dot_product)

        if dot_product < 0.0
            angle += π
        end

        push!(angles, angle)
    end

    return check_angles(angles)
end



