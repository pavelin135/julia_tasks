inverse(side)::HorizonSide = HorizonSide((Int(side) + 2) % 4)
left(side)::HorizonSide = HorizonSide((Int(side) + 1) % 4)
right(side)::HorizonSide = HorizonSide((Int(side) + 3) % 4)





struct CoordsRobot
    side2::HorizonSide
    side1::HorizonSide
    
end

function start(robot)

end