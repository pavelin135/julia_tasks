function fib_memoiz(n::Integer)
    dict = Dict{Int,Int}()
    function fibonac(n)
        if n in (0,1)
            return 1
        end
        if n - 2 ∉ dict.keys
            fib2 = fibonac(n - 2)
        else
            fib2 = dict[n - 2]
        end
        
        if n - 1 ∉ dict.keys
            fib1= fibonac(n - 1)
        else
            fib1 = dict[n - 1]
        end
        return fib2 + fib1
    end
end