local stringify

stringify = function(v,spaces, usesemicolon, depth)
	if type(v) ~= 'table' then
		return tostring(v)
	elseif not next(v) then
		return '{}'
	end
	
	spaces = spaces or 4
	depth = depth or 1
	
	local space = (" "):rep(depth*spaces)
	local sep = usesemicolon and ";" or ","
	local s = "{"
	
	for k, x in next, v do
		s = s..("\n%s\[%s\] = %s%s"):format(space,type(k)=='number'and tostring(k)or('"%s"'):format(tostring(k)), stringify(x, spaces, usesemicolon, depth+1), sep)
	end
	
	return ("%s\n%s}"):format(s:sub(1,-2), space:sub(1, -spaces-1))
end

return stringify