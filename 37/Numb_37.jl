mutable struct Coordinates
    X::Integer
    Y::Integer
end
mutable struct Side
    dir::HorizonSide # направление движения робота
    bor::HorizonSide # сторона границы
end
inverse(side)::HorizonSide = HorizonSide((Int(side) + 2) % 4)
left(side)::HorizonSide = HorizonSide((Int(side) + 1) % 4)
right(side)::HorizonSide = HorizonSide((Int(side) + 3) % 4)
function step!(robot, dir, k::Coordinates) # ставит маркер и передвигает робота, при этом меняем координаты
    if dir == Nord
        k.Y += 1
    elseif dir == Ost
        k.X += 1
    elseif dir == Sud
        k.Y -= 1
    elseif dir == West
        k.X -= 1
    end
    putmarker!(robot)
    move!(robot, dir)
end

function find_border(robot) # находит границу
    for side in (Nord, Ost, Sud, West)
        if isborder(robot, side)
            return side
        end
    end
end

function turn_robot(side::Side) # поворачивает робота, когда вышел за стенку
    sw = side.dir
    side.dir = side.bor
    side.bor = inverse(sw) 
end
function turn_side(robot, side::Side) # поворачивает робота, когда он упёрся в стенку
    if isborder(robot, left(side.dir))
        side.dir = right(side.dir)
        side.bor = right(side.bor)
    else
        side.dir = left(side.dir)
        side.bor = left(side.bor)
    end
end

function turn_and_step!(robot, side::Side,cor::Coordinates)
    turn_robot(side)
    step!(robot, side.dir, cor)
end

function surround(robot, side::Side,cor :: Coordinates)
    if !isborder(robot, side.dir)
        if isborder(robot, side.bor)
            step!(robot, side.dir, cor)
        else
            turn_and_step!(robot, side, cor)
        end
    else
        if !isborder(robot, side.bor)
            turn_and_step!(robot, side, cor)
        else
            while isborder(robot, side.dir)
                turn_side(robot, side)
            end
            step!(robot, side.dir, cor)
        end
        
    end
    if cor.X == 0 && cor.Y == 0
        if !isborder(robot, side.dir)
            step!(robot, side.dir, cor)
            if !ismarker(robot)
                surround(robot, side,cor)
                return
            else
                return
            end
        else
            return
        end
    end
    surround(robot, side, cor)
end

function start(robot)
    dir_border = find_border(robot)
    side = Side(left(dir_border), dir_border)
    coords = Coordinates(0,0)
    surround(robot,side,coords)
end
