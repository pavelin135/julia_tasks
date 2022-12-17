function snake!(robot)
    function row(side)
        while !isborder(robot, side)
            putmarker!(robot)
            move!(robot, side)
        end
    end

    side = Ost
    row(side)
    while !isborder(robot, Nord)
        putmarker!(robot)
        move!(robot, Nord)
        side = inverse(side)
        row(side)
    end
    putmarker!(robot)
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

function start(robot)
    back_path = move_to_angle!(robot)
    snake!(robot)
    move_to_angle!(robot)
    move_to_back!(robot, back_path)
end