function walk_to!(robot, side)
    if isborder(robot, side)
        return
    else
        move!(robot, side)
        walk_to!(robot, side)
    end
end
