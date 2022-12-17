inverse(side)::HorizonSide = HorizonSide((Int(side) + 2) % 4)
left(side)::HorizonSide = HorizonSide((Int(side) + 1) % 4)



function walk!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        if ismarker(robot)
            move!(robot, inverse(side))
            return
        end
        putmarker!(robot)
    else
        return
    end
    sideH = inverse(side)
    for i in 0:2
        sideH = left(sideH)
        walk!(robot, sideH)
    end
    move!(robot, inverse(side))
    return
end

function start(robot)
    for side in (Nord, West, Sud, Ost)
        walk!(robot, side)
    end
    putmarker!(robot)
end