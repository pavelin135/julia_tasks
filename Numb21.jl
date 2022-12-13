function swap(side)
    side = (side + 2)%4
    return side
end
function check_and_step!(robot, side)
    if !isborder(robot, HorizonSide(side))
        move!(robot, HorizonSide(side))
        return true
    else
        return false
    end
end
function walk_to!(robot, side::Integer) # здесь side числовое значение
    if isborder(robot, HorizonSide(side))
        return
    end
    move!(robot, HorizonSide(side))
    walk_to!(robot, side)
    sideR = swap(side)
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