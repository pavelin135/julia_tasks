function SortBubbleVectCol(A::Array{Float64,2}, col::Integer)
    for i in (1 : col - 1)
        for j in (1 : col - 1)
            if A[1,j] < A[1, j + 1]
                t = A[:, j]
                A[:, j] = A[:, j + 1]
                A[:, j + 1] = t
            end
        end
    end

    return A
end


function SortBubbleVectStr(A::Array{Float64,2}, str::Integer)
    for i in (1 : str - 1)
        for j in (1 : str - 1)
            if A[j,1] < A[j + 1, 1]
                t = A[j, :]
                A[j, :] = A[j + 1, :]
                A[j + 1, :] = t
            end
        end
    end

    return A
end

function StairType(A::Array{Float64,2}, str::Integer, col::Integer)
    

    A = SortBubbleVectStr(A, str)

    A = SortBubbleVectCol(A, col)

    for j in (1 : col  )
        if (A[1,j] == 0)
            return A
        end

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


function RangMatrix(A::Array{Float64,2}, str::Integer, col::Integer)
    A = StairType(A, str, col)

    count = 0
    for i in (1 : str)
        f = false
        for j in (1 : col)
            if A[i, j] != 0
                f = true
                break
            end
        end
        if f
            count += 1
        end
    end

    return count
end