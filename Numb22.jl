function swap(side)
    side = (side + 2)%4
    return side
end

function around!(robot, side::Integer)
    if !isborder(robot, HorizonSide(side))
        move!(robot, HorizonSide(side))
        return
    end
    sideR = (side + 1) % 4
    move!(robot, HorizonSide(sideR))
    around!(robot,side)
    move!(robot, HorizonSide(swap(sideR)))
end
function walk_to!(robot, side::Integer)
    if !isborder(robot, HorizonSide(side))
        move!(robot, HorizonSide(side))
        walk_to!(robot, side)
    else
        around!(robot, side)
        return
    end
    move!(robot, HorizonSide(side))
end