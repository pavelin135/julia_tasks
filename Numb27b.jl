function swap(side) # меняет направление на противоположное 
    side = (side + 2)%4
    return side
end

function walk!(robot, side::Integer)
    if !isborder(robot, HorizonSide(side))
        move!(robot, HorizonSide(side))
        if ismarker(robot)
            move!(robot, HorizonSide(swap(side)))
            return
        end
        putmarker!(robot)
    else
        return
    end
    sideH = swap(side)
    for i in 0:2
        sideH = (sideH + 1) % 4
        walk!(robot, sideH)
    end
    move!(robot, HorizonSide(swap(side)))
    return
end

function start(robot)
    for i in 0:3
        walk!(robot, i)
    end
    putmarker!(robot)
end