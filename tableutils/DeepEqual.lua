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
		if Type ~= 'table' or Type ~= type(b) then
			return false
		end
	end


	local UsedKeys = {}
	local Size_A = 0
	
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

			if not Found then
				return false
			end
		end
		
		Size_A = Size_A + 1
	end
	
	local Size_B = 0
	
	for _ in next, b do
		Size_B = Size_B + 1
	end

	return Size_A == Size_B
end

return __equal
