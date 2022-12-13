x = 0 #--------d
y = 0 #position

function step(robot, side)
    global x
    global y
    dir = HorizonSide(side)
    if !isborder(robot, dir)
        move!(robot, dir)
        
        if side == 0
            y += 1
        elseif side == 2
            y -= 1
        elseif side == 3
            x += 1
        elseif side == 1
            x -= 1
        end
        
    end
end

function startPos(robot)
    global x
    global y
    if x > 0
        for i in 1:x
            move!(robot, West)
        end
    elseif x < 0
        for i in 1:abs(x)
            move!(robot, Ost)
        end
    end
    if y > 0
        for i in 1:y
            move!(robot, Sud)
        end
    elseif y < 0
        for i in 1:abs(y)
            move!(robot, Nord)
        end
    end
end

function start(r)
    while !(isborder(r,Ost) && isborder(r,Sud))
        step(r,3)
        step(r,2)
    end
    for i in 0:3
        while !isborder(r,HorizonSide(i))
            step(r,i)
            putmarker!(r)
        end
    end
    startPos(r)
end