function comb_A(n::Integer, k::Integer)
    val = ones(Integer, k)

    val[k] = 0

    for i in (1 : n^k)
        if val[k] == n
            val[k] = 1
            for j in (1 : k-1)
                if val[k - j] == n
                    if i == n^k
                        break
                    end
                    val[k - j] = 1
                else
                    val[k - j] += 1
                    break
                end
            end
        else
            val[k] += 1
        end

        println(val)
    end
end