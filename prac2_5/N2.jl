function comb_sort!(arr::Array{Float64, 1})
    gap = length(arr)
    shrink = 1.3
    sorted = false

    while !sorted
        gap = Int(floor(Float64(gap) / shrink))
        if gap <= 1
            gap = 1
            sorted = true
        end

        i = 1
        while i + gap <= length(arr)
            if arr[i] > arr[i + gap]
                arr[i], arr[i + gap] = arr[i + gap], arr[i]
                sorted = false
            end
            i += 1
        end
    end

    return arr
end

