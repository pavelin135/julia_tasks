
function mix!(arr::Array{Float64, 1}, left::Integer, mid::Integer, right::Integer)
    x1 = 0
    x2 = 0
    a = Vector{Float64}(undef, right - left)

    while (left + x1 < mid) && (mid + x2 < right)
        if arr[left + x1] < arr[mid + x2]
            a[x1 + x2 + 1] = arr[left + x1]
            x1 += 1
        else
            a[x1 + x2 + 1] = arr[mid + x2]
            x2 += 1
        end
    end

    
    while left + x1 < mid
        a[x1 + x2 + 1] = arr[left + x1]
        x1 += 1
    end

    while mid + x2 < right
        a[x1 + x2 + 1] = arr[mid + x2]
        x2 += 1
    end

    for i in 1:(x1 + x2)
        arr[left + i - 1] = a[i]
    end

    return arr
end

function sort_mix!(arr::Array{Float64, 1}, left::Integer, right::Integer)
    if left + 1 >= right
        return arr
    end

    mid = div(left + right, 2)

    arr = sort_mix!(arr, left, mid)
    arr = sort_mix!(arr, mid, right)
    return mix!(arr, left, mid, right)
end

function sort_merge!(arr::Array{Float64, 1}, left::Integer, right::Integer)
    arr = sort_mix!(arr, left, right)

    return mix!(arr, left, right, right + 1)
end

