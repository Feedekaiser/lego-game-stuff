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
	--// add more if needed.
}

return function(Number, Base)
	local Negative

	if Number < 0 then
		Negative = true
		Number = -Number
	end

	local Result = ""
	repeat
		Result = Characters[floor(Number % Base)] .. Result
		Number = floor(Number / Base)
	until Number == 0

	return Negative and "-" .. Result or Result
end
