function swap(side)
    side = (side + 2)%4
    return side
end

function walk_to!(robot, side::Integer)
    if !isborder(robot, HorizonSide(side))
        move!(robot, HorizonSide(side))
        return
    end
    sideR = (side + 1) % 4
    move!(robot, HorizonSide(sideR))
    walk_to!(robot,side)
    move!(robot, HorizonSide(swap(sideR)))
end