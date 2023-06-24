
using Plots

function orientation(p, q, r)
    val = (q[2] - p[2]) * (r[1] - q[1]) - (q[1] - p[1]) * (r[2] - q[2]) # square triangle with direction
    if val == 0
        return 0
    elseif val > 0
        return 1
    else
        return 2
    end
end

function Jarws(points)
    n = length(points)
    if n < 3
        error("Недостаточно точек для построения выпуклой оболочки")
    end

    hull = []

    l = 1
    for i in 2:n
        if points[i][1] < points[l][1]
            l = i
        end
    end

    p = l
    q = 0
    while true
        push!(hull, points[p])
        q = (p % n) + 1
        for i in 1:n
            if orientation(points[p], points[i], points[q]) == 2
                q = i
            end
        end
        if points[q] == points[l]
            break
        end
        p = q
    end

    push!(hull, hull[1])

    p = scatter([point[1] for point in points], [point[2] for point in points], label="Точки")
    plot!([point[1] for point in hull], [point[2] for point in hull], label="Выпуклая оболочка")


    plot!(aspect_ratio=:equal, legend=:bottomright)

    display(p)

    return hull
end


