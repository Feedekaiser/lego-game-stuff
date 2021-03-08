--// File:   DeepEqual.lua
--// Author: Feedekaiser


--// Ignores metatables, __eq is still called.

local __equal

__equal = function(a, b)

    if a == b then
        return true
    end

    do
        local Type = type(a)
        if Type ~= type(b) or Type ~= 'table' then
            return false
        end
    end


    local UsedKeys = {}
    for k1, v1 in next, a do
        if b[k1] ~= nil then
            if not __equal(v1, b[k1]) then
                return false
            end
        else
            local Found = false

            for k2, v2 in next, b do

                if not UsedKeys[k2] and __equal(k2, k1) and __equal(v2, v1) then

                    UsedKeys[k2] = true
                    Found = true

                    break
                end
            end

            if not (Found and next(b) ~= nil) then
                return false
            end
        end
    end

    return true
end

return __equal
