local tostring = tostring
local floor    = math.floor

local Characters = {
	[ 0] = "0";
	[ 1] = "1";
	[ 2] = "2";
	[ 3] = "3";
	[ 4] = "4";
	[ 5] = "5";
	[ 6] = "6";
	[ 7] = "7";
	[ 8] = "8";
	[ 9] = "9";
	[10] = "A";
	[11] = "B";
	[12] = "C";
	[13] = "D";
	[14] = "E";
	[15] = "F";
	[16] = "G";
	[17] = "H";
	[18] = "I";
	[19] = "J";
	[20] = "K";
	[21] = "L";
	[22] = "M";
	[23] = "N";
}

return function(Number, Base) 
    local Negative = Number < 0

	Number = abs(Number)

    if Number < Base then return tostring(Number) end

    local Result = ""

    repeat
        Result = Characters[floor(Number % Base)] .. Result
        Number = floor(Number / Base)
    until Number == 0

    return Negative and "-" .. Result or Result
end
