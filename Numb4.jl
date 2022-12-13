function swap(side)
    side = (side + 2)%4
    return side
end

function along(robot, side1, side2)
    if !isborder(robot, HorizonSide(side1))
        move!(robot, HorizonSide(side1))
    else
        return
    end
    if !isborder(robot, HorizonSide(side2))
        move!(robot, HorizonSide(side2))
        putmarker!(robot)
        along(robot, side1, side2)
    else
        move!(robot, HorizonSide(swap(side1)))
        return
    end
    move!(robot,HorizonSide(swap(side2))) #возвращаемся обратно
    move!(robot,HorizonSide(swap(side1)))
end

function start(r)
    for i in (3, 1)
        for j in (0, 2)
            along(r,i,j)
        end
    end
    putmarker!(r)
end


