local Characters = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'g', 'h', 'i', 'j', 'k', 'l'}

return function(Number,) 
    local Negative = Number < 0
    if Number < Base then return tostring(Number) end

    Number = math.abs(Number)

    local Result = ""
    while Number > 0 do
        Result = Characters[math.floor(Number % Base) + 1] .. Result
        Number = math.floor(Number / Base)
    end

    if Negative then
        Result = "-" .. Result
    end
    return Result
end