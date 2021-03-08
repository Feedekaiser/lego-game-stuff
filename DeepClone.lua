--// Ignores metatables.


local __Clone

__Clone = function(a)
    if type(a) ~= 'table' then
        return a
    end

    local Result = {}
    for k, v in next, a do
        Result[__Clone(k)] = __Clone(v)
    end

    return Result
end

return __Clone