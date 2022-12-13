function swap(side)
    side = (side + 2)%4
    return side
end

function walk_to!(robot, side::Integer) # здесь side числовое значение
    if isborder(robot, HorizonSide(side))
        putmarker!(robot)
        return
    else
        move!(robot, HorizonSide(side))
        walk_to!(robot, side)
    end
    move!(robot, HorizonSide(swap(side)))
end