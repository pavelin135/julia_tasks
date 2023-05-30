function isprime(n::IntType) where IntType <: Integer
    for d in 2: ceil(sqrt(n))
        if n % d == 0
            return false
        end
    end
    return true
end
