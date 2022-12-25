inverse(side)::HorizonSide = HorizonSide((Int(side) + 2) % 4)

function try_move!(robot, dir)
    if isborder(robot, dir)
        return false
    end
    move!(robot, dir)
    return true
end
function walk_to!(robot, side)
    if isborder(robot, side)
        return
    end
    move!(robot, side)
    walk_to!(robot, side)
    sideR = inverse(side)
    if try_move!(robot, sideR)
        if try_move!(robot, sideR)
            return true
        else
            return false
        end
    else
        return false
    end
end