function along!(robot, dir, num_steps)
    for i in 1:num_steps
        move!(robot, dir)
    end
end

function try_move!(robot, dir)
    if isborder(robot, dir)
        return false
    end
    move!(robot, dir)
    putmarker!(robot)
    return true
end

function numsteps_along!(robot, dir)::Integer
    num = 0
    while try_move!(robot, dir)
        num += 1
    end
    return num
end

inverse(side)::HorizonSide = HorizonSide((Int(side) + 2) % 4)


function start(robot)
    for side in (Nord, Ost, Sud, West)
        along!(robot, inverse(side), numsteps_along!(robot, side))
    end
    putmarker!(robot)
end