function find_partitions_recursive(n, max_val, partition, partitions)
    if n == 0
        push!(partitions, copy(partition))
        return
    end
    
    for i in 1:min(n, max_val)
        push!(partition, i)
        find_partitions_recursive(n - i, i, partition, partitions)
        pop!(partition)
    end
end

function print_partitions(partitions)
    for partition in partitions
        println(partition)
    end
end

function find_partitions(n)
    partitions = []
    partition = []
    find_partitions_recursive(n, n, partition, partitions)
    return partitions
end