function partition(arr::Array{Float64,1}, low::Integer, high::Integer)
    pivot = arr[high]
    i = low - 1

    for j = low:high-1
        if arr[j] < pivot
            i += 1
            arr[i], arr[j] = arr[j], arr[i]
        end
    end

    arr[i + 1], arr[high] = arr[high], arr[i + 1]
    return (i + 1, arr)
end

function quicksort!(arr::Array{Float64,1}, low::Integer, high::Integer)
    if low < high
        R = partition(arr, low, high)

        pivot_index = R[1]
        arr = R[2]
        arr = quicksort!(arr, low, pivot_index - 1)
        arr = quicksort!(arr, pivot_index + 1, high)
    end

    return arr
end