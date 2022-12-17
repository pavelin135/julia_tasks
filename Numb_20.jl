inverse(side)::HorizonSide = HorizonSide((Int(side) + 2) % 4)


function walk_to!(robot, side)
    if isborder(robot, side)
        putmarker!(robot)
        return
    else
        move!(robot, side)
        walk_to!(robot, side)
    end
    move!(robot, inverse(side))
end