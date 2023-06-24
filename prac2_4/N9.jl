function Deter(A::Array{Float64, 2}, dim::Integer)
    
    if dim == 2
        return A[1,1] * A[2,2] - A[1,2] * A[2,1]
    end

    D = 0.0

    for i in (1 : dim)
        B = Array{Float64, 2}(undef, dim - 1, dim - 1)

        for j in (1 : dim)
            if j == i
                continue
            end

            C = Array{Float64, 1}(undef,  dim - 1)
            for c in (2 : dim)
                C[c - 1] = A[c,j]
            end

            if j < i
                B[:, j] = C
            else
                B[:, j - 1] = C
            end
        end

        D += (-1)^(1 + i) * A[1,i] * Deter(B, dim - 1)
    end

    return D
end