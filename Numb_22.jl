inverse(side)::HorizonSide = HorizonSide((Int(side) + 2) % 4)

function check_and_step!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        return true
    else
        return false
    end
end
function walk_to!(robot, side)
    if isborder(robot, side)
        return
    end
    move!(robot, side)
    walk_to!(robot, side)
    sideR = inverse(side)
    if check_and_step!(robot, sideR)
        if check_and_step!(robot, sideR)
            return true
        else
            return false
        end
    else
        return false
    end
end