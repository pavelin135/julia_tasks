inverse(side)::HorizonSide = HorizonSide((Int(side) + 2) % 4)

function walk_2!(robot, side)
    if isborder(robot,side)
        move!(robot, inverse(side))
        return
    end
    move!(robot, side)
    walk_1!(robot, side)
    move!(robot, inverse(side))
end
function walk_1!(robot, side)
    if isborder(robot, side)
        return
    end
    move!(robot, side)
    walk_2!(robot, side)
end