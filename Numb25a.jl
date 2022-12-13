function pMark!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
    else
        return
    end
    walk_to!(robot, side)
end

function walk_to!(robot, side)
    putmarker!(robot)
    if !isborder(robot, side)
        move!(robot, side)
    else
        return
    end
    pMark!(robot, side)
end