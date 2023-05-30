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