function walk!(r,s,side)
    for j in 1:s
        if ismarker(r)
            return true
        end
        move!(r,side)
    end
    return false
end

left(side)::HorizonSide = HorizonSide((Int(side) + 1) % 4)

function start(robot)
    side = Ost # сторона
    s = 1 # длина шага
    while true
        for j in 1:2            
            if walk!(robot, s, side)
                return
            end
            
            side = left(side)
        end
        s += 1
    end
end