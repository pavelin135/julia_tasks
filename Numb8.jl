function walk(r,s,side)
    for j in 1:s
        if ismarker(r)
            return true
        end
        move!(r,side)
    end
    return false
end
function start(robot)
    i = 1 # сторона
    s = 1 # длина шага
    while true
        for j in 1:2
            side = HorizonSide(i % 4)
            
            if walk(robot, s, side)
                return
            end
            
            i += 1
        end
        s += 1
    end
end
