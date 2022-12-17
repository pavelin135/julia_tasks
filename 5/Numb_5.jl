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
function mark_along!(robot,side)
    while !isborder(robot, side)
        move!(robot, side)
        putmarker!(robot)
    end
end
function mark_along!(robot,side, border)
    while isborder(robot, border)
        move!(robot, side)
        putmarker!(robot)
    end
end
inverse(side)::HorizonSide = HorizonSide((Int(side) + 2) % 4)
left(side)::HorizonSide = HorizonSide((Int(side) + 1) % 4)

function move_to_angle!(robot)
    return (side = Nord, num_steps = numsteps_along!(robot, Sud)), (side = Ost, num_steps = numsteps_along!(robot, West))
end

function move_to_back!(robot, back_path)
    for i in back_path
        along!(robot, i.side, i.num_steps)
    end
end

function find_internal_border!(robot)
    function row(side)
        while !isborder(robot, Nord) && !isborder(robot, side)
            move!(robot, side)
        end
    end

    side = Ost
    row(side)
    while !isborder(robot, Nord)
        move!(robot, Nord)
        side = inverse(side)
        row(side)
    end
end

function move_to_internal_subwest!(robot)
    while isborder(robot, Nord)
        move!(robot, West)
    end
end

function mark_external_rect!(robot)
    for side in (Nord, Ost, Sud, West)
        mark_along!(robot, side)
    end
end

function mark_internal_rect!(robot)
    for side in (Ost, Nord, West, Sud)
        move!(robot, side)
        putmarker!(robot)
        mark_along!(robot, side, left(side))
    end
end


function mark_external_internal(robot)
    back_path = move_to_angle!(robot)
    mark_external_rect!(robot)
    find_internal_border!(robot)
    move_to_internal_subwest!(robot)
    mark_internal_rect!(robot)
    move_to_angle!(robot)
    move_to_back!(robot, back_path)
end