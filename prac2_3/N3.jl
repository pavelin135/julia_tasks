function eratos(n::Integer)
    index = ones(Bool, n)
    
    for i::Integer in 2:ceil(sqrt(n))
        if (index[i])
            d = 2
            while i * d <= n
                index[i * d] = 0
                d += 1
            end
        end
    end
    
    return findall(index)
end

function PrimeDiv(n::Integer)
    arr = Integer[]
    for i in eratos(n)
        if i == 1
            continue
        end

        while n % i == 0
            push!(arr,i)
            n /= i
        end
    end

    return arr
end

