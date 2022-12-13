function swap(side) # меняет направление на противоположное 
    side = (side + 2)%4
    return side
end


function along(robot, side)
    if !isborder(robot,HorizonSide(side))
        move!(robot,HorizonSide(side))
        putmarker!(robot)
        along(robot, side)
    else
        return
    end
    move!(robot,HorizonSide(swap(side)))
    
end

function start(r)
    for i in 0:3
        along(r,i)
    end
    putmarker!(r)
end

