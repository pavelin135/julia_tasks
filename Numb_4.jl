inverse(side)::HorizonSide = HorizonSide((Int(side) + 2) % 4)

function cross(robot, side1, side2)
    if !isborder(robot, side1)
        move!(robot, side1)
    else
        return
    end
    if !isborder(robot, side2)
        move!(robot, side2)
        putmarker!(robot)
        cross(robot, side1, side2)
    else
        move!(robot, inverse(side1))
        return
    end
    move!(robot,inverse(side2)) #возвращаемся обратно
    move!(robot,inverse(side1))
end

function start(robot)
    for i in (West, Ost)
        for j in (Nord, Sud)
            cross(robot,i,j)
        end
    end
    putmarker!(robot)
end