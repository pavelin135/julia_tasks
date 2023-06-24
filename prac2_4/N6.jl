function SortBubbleVectStr(A::Array{Float64,2}, str::Integer, n::Integer, Vect::Array{Float64, 1})
    for i in (n : str - 1)
        for j in (n : str - 1)
            if A[j,n] < A[j + 1, n]
                t = A[j, :]
                A[j, :] = A[j + 1, :]
                A[j + 1, :] = t

                s = Vect[j]
                Vect[j] = Vect[j + 1]
                Vect[j + 1] = s
            end
        end
    end

    return (A, Vect)
end

function StairType(A::Array{Float64,2}, str::Integer, col::Integer, Vect::Array{Float64, 1})

    for j in (1 : col  )
       
        R = SortBubbleVectStr(A, str, j, Vect)

        A = R[1]
        Vect = R[2]

        for i in (j + 1 : str)
            if A[j,j] == 0
                break
            end

            k = A[i,j] / A[j,j]

            A[i,:] -= A[j, :] * k
            Vect[i] -= Vect[j] * k
        end    
    end

    return (A, Vect)
end

function JordGaus(A::Array{Float64, 2}, Vect::Array{Float64, 1}, str::Integer, col::Integer)
    R = StairType(A, str, col, Vect)
    A = R[1]
    Vect = R[2]

    S = str
    if col < str
        S = col
    end

    for j in (0 : S - 1)
        k = S - j
        while A[k, S - j] == 0 && k > 0
            k -= 1
        end

        if (k < 2)
            continue
        end

        for i in (1 : k - 1)
            p = A[i, S - j] / A[k, S - j]

            A[i, :] -= A[k, :] * p
            Vect[i] -= Vect[k] * p
        end
    end

    return (A, Vect)

end