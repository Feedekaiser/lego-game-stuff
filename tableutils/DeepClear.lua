--// Ignores metatables.

local __DeepClear

__DeepClear = function(a)
    if type(a) ~= "table" then return end

    for k, v in next, a do
        if type(v) == "table" then
            __DeepClear(v)
        end
        __DeepClear(k)

        a[k] = nil
    end
end

return __DeepClear