function SortBubbleVectStr(A::Array{Float64,2}, str::Integer, n::Integer)
    for i in (n : str - 1)
        for j in (n : str - 1)
            if A[j,n] < A[j + 1, n]
                t = A[j, :]
                A[j, :] = A[j + 1, :]
                A[j + 1, :] = t
            end
        end
    end

    return A
end

function StairType(A::Array{Float64,2}, str::Integer, col::Integer)

    for j in (1 : col  )
       
        A = SortBubbleVectStr(A, str, j)

        for i in (j + 1 : str)
            if A[j,j] == 0
                break
            end

            k = A[i,j] / A[j,j]

            A[i,:] -= A[j, :] * k
        end    
    end

    return A
end