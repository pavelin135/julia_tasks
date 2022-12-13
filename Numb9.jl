x = 0 #--------
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
        return true
    end
    return false
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
ind = 0 # индекс клетки

function check(robot, ind) # проверка на четность/нечетность + ставим маркер
    global ind
    if ind % 2 == 0
        putmarker!(robot)
    end
end

function start(r)
    while !(isborder(r,Ost) && isborder(r,Sud))
        global ind
        if step(r,3)
            ind += 1
        end
        if step(r,2)
            ind += 1
        end
    end
    i = 1
    while true
        global i
        global ind
        side = i % 4
        while !(isborder(r,HorizonSide(side)))
            check(r,ind)
            step(r,side)
            ind += 1
        end
        if isborder(r,Nord)
            check(r,ind)
            break
        else
            check(r,ind)
            step(r,0)
            ind += 1
        end
        i += 2
    end
    startPos(r)
end