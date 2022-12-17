inverse(side)::HorizonSide = HorizonSide((Int(side) + 2) % 4)
left(side)::HorizonSide = HorizonSide((Int(side) + 1) % 4)


function walk_to!(robot, side)
    if !isborder(robot,side)
        move!(robot, side)
        return
    end
    sideR = left(side)
    move!(robot, sideR)
    walk_to!(robot,side)
    move!(robot, inverse(sideR))
end