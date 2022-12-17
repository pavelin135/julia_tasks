function along!(robot, dir, num_steps)
    for i in 1:num_steps
        if !isborder(robot, Nord)
            return false
        end
        move!(robot, dir)
    end
    return true
end

inverse(side)::HorizonSide = HorizonSide((Int(side) + 2) % 4)


function start(robot)
    side = Ost
    nums = 1
    while along!(robot, side, nums)
        side = inverse(side)
        nums += 1
    end
end