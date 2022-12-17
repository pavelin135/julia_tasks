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

function check(N, B, robot)
    if B
        if N % 2 == 0
            putmarker!(robot)
        end
    else
        if N % 2 == 1
            putmarker!(robot)
        end
    end
end

function snake!(robot, B::Bool)
    ind = 0
    function row(side)
        while !isborder(robot, side)
            check(ind, B, robot)
            move!(robot, side)
            ind += 1
        end
    end

    side = Ost
    row(side)
    while !isborder(robot, Nord)
        check(ind, B, robot)
        move!(robot, Nord)
        ind += 1
        side = inverse(side)
        row(side)
    end
    check(ind, B, robot)
end


function start(robot)
    back_path = move_to_angle!(robot)
    sum = 0 # сумматор шагов до угла, чтобы определить, в какой последовательности закрашивать маркер
    B = true
    for i in back_path
        sum += i.num_steps
    end
    if sum % 2 == 0
        B = true
    else
        B = false
    end
    snake!(robot, B)
    move_to_angle!(robot)
    move_to_back!(robot, back_path)
end