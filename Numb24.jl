function swap(side)
    side = (side + 2)%4
    return side
end

function walk_2!(robot, side)
    if isborder(robot, HorizonSide(side))
        move!(robot, HorizonSide(swap(side)))
        return
    end
    move!(robot, HorizonSide(side))
    walk_1!(robot, side)
    move!(robot, HorizonSide(swap(side)))
end
function walk_1!(robot, side::Integer)
    if isborder(robot, HorizonSide(side))
        return
    end
    move!(robot, HorizonSide(side))
    walk_2!(robot, side)
end