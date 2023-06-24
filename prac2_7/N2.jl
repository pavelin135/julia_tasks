function generate_permutations(n::Integer)
    permutations = []
    current_permutation = collect(1:n)
    push!(permutations, copy(current_permutation))

    while true
        j = n - 1
        while j >= 1 && current_permutation[j] >= current_permutation[j+1]
            j -= 1
        end
        if j == 0
            break
        end

        k = n
        while current_permutation[j] >= current_permutation[k]
            k -= 1
        end

        current_permutation[j], current_permutation[k] = current_permutation[k], current_permutation[j]
        current_permutation[j+1:end] = reverse(current_permutation[j+1:end])
        push!(permutations, copy(current_permutation))
    end

    return permutations
end
