inverse(side)::HorizonSide = HorizonSide((Int(side) + 2) % 4)
left(side)::HorizonSide = HorizonSide((Int(side) + 1) % 4)

function around!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        return
    end
    sideR = left(side)
    move!(robot, sideR)
    around!(robot,side)
    move!(robot, inverse(sideR))
end
function walk_to!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        walk_to!(robot, side)
    else
        around!(robot, side)
        return
    end
    move!(robot,side)
end