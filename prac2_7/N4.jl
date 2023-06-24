function indicator(n::Integer, k::Integer)
    val = zeros(Integer, n)

    for k in (0 : k - 1)
        val[n - k] = 1
    end 
    

    cnt = factorial(n)/(factorial(k) * factorial(n - k))
    println(val)
    for i in (2 : cnt)
        
        for j in (1 : n-1)
            if val[n - j] == 0 && val[n - j + 1] == 1
                val[n - j] = 1
                val[n - j + 1] = 0
                println(val)
                sum = 0
                for s in (n - j + 1 : n)
                    if val[s] == 1
                        sum += 1
                    end
                    val[s] = 0
                end
                for q in (0 : sum - 1)
                    val[n - q] = 1
                end
                println(val)
                break
            end
        end
    end
end
