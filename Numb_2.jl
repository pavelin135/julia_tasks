function mark_along!(robot,side)
    while !isborder(robot, side)
        move!(robot, side)
        putmarker!(robot)
    end
end
function try_move!(robot, dir)
    if isborder(robot, dir)
        return false
    end
    move!(robot, dir)
    return true
end

function numsteps_along!(robot, dir)::Integer
    num = 0
    while try_move!(robot, dir)
        num += 1
    end
    return num
end
function move_to_angle!(robot)
    return (side = Nord, num_steps = numsteps_along!(robot, Sud)), (side = Ost, num_steps = numsteps_along!(robot, West))
end

function move_to_back!(robot, back_path)
    for i in back_path
        along!(robot, i.side, i.num_steps)       
    end
end

function mark_external_rect!(robot)
    for side in (Nord, Ost, Sud, West)
        mark_along!(robot, side)
    end
end

function start(robot)
    back_path = move_to_angle!(robot)
    mark_external_rect!(robot)
    move_to_back!(robot, back_path)
end
