inverse(side)::HorizonSide = HorizonSide((Int(side) + 2) % 4)
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
    return (side = Ost, num_steps = numsteps_along!(robot, West)), (side = Nord, num_steps = numsteps_along!(robot, Sud))
end

function move_to_back!(robot, back_path)
    N1 = 0
    N2 = 0
    D1 = Nord
    D2 = Ost
    cnt = 1
    for i in back_path
        if cnt == 1
            N2 = i.num_steps
            cnt += 1
        else
            N1 = i.num_steps
        end   
    end
    along!(robot, D1, N1)
    along!(robot, D2, N2)
end

function find_internal_border!(robot)

    function row(side)
        while true
            if isborder(robot, Nord)
                return true
            elseif isborder(robot, side)
                return false
            end
            move!(robot, side)
        end
    end

    function border(robot, side)
        while isborder(robot, Nord)
            move!(robot, side)
        end
    end

    counter = 0
    side = West
    while !isborder(robot, Nord) || !isborder(robot, side)
        side = inverse(side)
        while row(side)
            counter += 1
            border(robot, side)
        end
        move!(robot, Nord)
    end
    return counter
end

function start(robot)
    back_path = move_to_angle!(robot)
    amount = find_internal_border!(robot)
    move_to_angle!(robot)
    move_to_back!(robot, back_path)
    return amount
end