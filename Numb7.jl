function walk(r,i,side)
    for j in 1:i
        move!(r,side)
    end
end
function chek(r)
    if !isborder(r,Nord)
        return true
    end
    return false
end

function start(r)
    i = 1
    while true
        walk(r,i,Ost)
        if chek(r)
            return
        else
            i = i + 1
        end

        walk(r,i,West)

        if chek(r)
            return
        else
            i = i + 1
        end
    end
end