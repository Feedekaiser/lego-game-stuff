local stringify

stringify = function(v, usesemicolon, depth)
	if next(v) == nil then --// might be using [false] as keys.
		return '{}'
	end

	depth = depth or 1

	local tabs = ("\t"):rep(depth)
	local sep = usesemicolon and ";" or ","
	local s = {"{"}
	local n = 2

	for k, x in next, v do
		s[n] = ("\n%s[%s] = %s%s"):format(tabs, type(k) == 'number' and tostring(k) or ('"%s"'):format(tostring(k)), type(x) == 'table' and stringify(x, usesemicolon, depth + 1) or tostring(v), sep)
		n = n + 1
	end

  	local r = n - 1
	s[r] = s[r]:sub(1, -2)
	s[n] = ("\n%s}"):format(tabs:sub(1, -2))

	return table.concat(s)
end

return stringify
