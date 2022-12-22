inverse(side)::HorizonSide = HorizonSide((Int(side) + 2) % 4)
left(side)::HorizonSide = HorizonSide((Int(side) + 1) % 4)
right(side)::HorizonSide = HorizonSide((Int(side) + 3) % 4)

mutable struct Coordinates
    X::Integer
    Y::Integer
end

function HorizonSideRobots.move!(coord::Coordinates, side::HorizonSide)
    if side == Nord
        coord.Y += 1
    elseif side == Sud
        coord.Y -= 1
    elseif side == Ost
        coord.X += 1
    else
        coord.X -= 1
    end
end

get_coord(coord::Coordinates) = (coord.X, coord.Y)

using HorizonSideRobots
HSR = HorizonSideRobots

mutable struct CoordsRobot
    robot::Robot
    coord::Coordinates
    direct::HorizonSide # направление движение робот
    border_side::HorizonSide # ориентация робота (сторона, где находится грница относительно робота)
end

function HSR.move!(robot::CoordsRobot, side)
    move!(robot.robot, side)
    move!(robot.coord, side)
end

HSR.isborder(robot::CoordsRobot, side) = isborder(robot.robot, side)
HSR.ismarker(robot::CoordsRobot) = ismarker(robot.robot)
HSR.putmarker!(robot::CoordsRobot) = putmarker!(robot.robot)

get_coord(robot::CoordsRobot) = get_coord(robot.coord)

function turn_robot_move!(robot::CoordsRobot)
    if !isborder(robot, robot.border_side) # поворачивает робота вышедшего за стенку
        turn = robot.direct
        robot.direct = robot.border_side
        robot.border_side = inverse(turn)
        putmarker!(robot)
        move!(robot, robot.direct)
    else
        if robot.border_side == left(robot.direct) # поворачивает робота упершивося в стенку
            while isborder(robot, robot.direct)
                robot.direct = right(robot.direct)
                robot.border_side = right(robot.border_side)
            end
            putmarker!(robot)
            move!(robot, robot.direct)
        else
            while isborder(robot, robot.direct)
                robot.direct = left(robot.direct)
                robot.border_side = left(robot.border_side)
            end
            putmarker!(robot)
            move!(robot, robot.direct)
        end
    end
end

function find_border(robot)
    for side in (Nord, Ost, Sud, West)
        if isborder(robot, side)
            return side
        end
    end
end

function surround(robot::CoordsRobot)
    turn_robot_move!(robot)
    if robot.coord.X == 0 && robot.coord.Y == 0
        if !isborder(robot, robot.direct)
            move!(robot, robot.direct)
            if !ismarker(robot)
                surround(robot)
            end
        end
        return
    end
    surround(robot)
end

function start(robot)
    side = find_border(robot)
    N_robot = CoordsRobot(robot, Coordinates(0, 0), left(side), side)
    surround(N_robot)
end
