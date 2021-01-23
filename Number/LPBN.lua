--[[
	File: LPBN.lua
	
	--Low quality code.
	
	--Ultra low precision. Hence LP. Works great(?) for games tho.
	If you need precision see https://github.com/ennorehling/euler/blob/master/BigNum.lua
	
	--Didn't use __eq  __add and the likes meta events. 
	Very inhuman but whatever.

	Notes:
	--They do not mutate the value. Meaning:
	a = BigNum.new(1000)
	print(BigNum.Normalize(a).Exponent) --> 3
	print(a.Mantissa, a.Exponent) --> 1000, 0
	--THESE OPERATIONS MIGHT BE INACCURATE IF THE VALUE PASSED IS NOT NORMALIZED!
	--THESE OPERATIONS MIGHT BE INACCURATE IF THE VALUE PASSED IS NOT NORMALIZED!
	--THESE OPERATIONS MIGHT BE INACCURATE IF THE VALUE PASSED IS NOT NORMALIZED!

	--Value change per update have limits. If you just changed the mantissa by setting it manually and called 
	update, this is due to the fact that everything will overflow, so a primitive check is done to prevent so and if 
	the mantissa is at math.huge or -math.huge, it snap the value to either 2 ^ 1023 or its negative counterpart.
	
	----------------------------------------------------------------Line of seperation---------------------------------------------------------------
	
	----------------------------------------------------------------------Functions---------------------------------------------------------------------
	
	BigNum.new(Mantissa: number | nil, Exponent: number | nil)
	
	BigNum.new() --> {Mantissa = 0, Exponent = 0}
	BigNum.new(3) --> {Mantissa = 3, Exponent = 0}
	BigNum.new(1, 6) --> {Mantissa = 1, Exponent = 6}
	
	We will be refering to the table returned as BigNumObject below.

	----------------------------------------------------------------Line of seperation---------------------------------------------------------------
	
	BigNum.Clone(BigNumObject)
	
	Returns a clone of the BigNumObject. This might be essential in some situation since they are tables and are
	inherently prone to being mutated.
	
	This function just calls BigNum.new() with the parameters of the BigNumObject.
	
	----------------------------------------------------------------Line of seperation---------------------------------------------------------------
	
	BigNum.Normalize(BigNumObject)
	
	Returns a normalized BigNumObject, in decimal.
	
	BigNum.Normalize(BigNum.new(11)) --> {Mantissa = 1, Exponent = 1}
	
	----------------------------------------------------------------Line of seperation---------------------------------------------------------------
	
	BigNum.Denormalize(BigNumObject, displacement: number)
	
	Returns a "Denormalized" BigNumObject, adjusted to the displacement.
	
	In it's very core, it is no different from BigNum.Normalize.
	
	BigNum.new(11) --> {Mantissa = 11, Exponent = 0}
	BigNum.Denormalize(BigNum.new(11), -1) --> {Mantissa = 1, Exponent = 1}
	BigNum.Denormalize(BigNum.new(11), 1) --> {Mantissa = 110, Exponent = -1}
	
	----------------------------------------------------------------Line of seperation---------------------------------------------------------------
	
	BigNum.IntegerExponentiate(BigNumObject, tuple: BigNumObject)
	
	Exponentiation that only works for Integer. You can pass several BigNumObjects and it will compute all inside a
	for loop.
	
	----------------------------------------------------------------Line of seperation---------------------------------------------------------------
	
	BigNum.Raw(BigNumObject)
	
	Returns a string depicting the value in scientific notation. Basically the "tostring" global that works here.
	Precision is by default 3 digits after the floating point.
	
	BigNum.Raw(BigNum.new(1)) --> "1e0"
	BigNum.Raw(BigNum.new(1.1235)) --> "1.124e0"
	BigNum.Raw(BigNum.new(1, 10)) --> "1e10"
	
	----------------------------------------------------------------Line of seperation---------------------------------------------------------------
	
	BigNum.Read(string)
	
	Returns a BigNumObject. Basically the "tonumber" global, except translated to fit here.
	
	BigNum.Read("1e1") --> {Mantissa = 1, Exponent = 1}
	BigNum.Read("5e0") --> {Mantissa = 5, Exponent = 0}
	
	----------------------------------------------------------------Line of seperation---------------------------------------------------------------
	
	Undocumentated functions:
	
	Accepts one value only:
	
	BigNum.Floor
	BigNum.Abs
	BigNum.IsEven
	BigNum.ln
	
	Accepts two value:
	
	BigNum.GreaterThan
	BigNum.SmallerThan
	
	Accepts tuple:
	
	BigNum.Max
	BigNum.Min
	BigNum.Add
	BigNum.Subtract
	BigNum.Multiply
	BigNum.Divide

	-----------------------------------------------------------------End of Functions----------------------------------------------------------------
	
	---------------------------------------------------------------------Constants---------------------------------------------------------------------
	
	BigNum.Zero
	BigNum.One
	BigNum.Two
	
	BigNum.MinusOne
	
	Note: 
	Despite named constants, I did not make them read-only. That said, you are not advised to change them, as they 
	are used in some functions, mainly BigNum.IntegerExponentiate.
	They exist for efficiency reasons.
	
	You should also do the same if you plan on using the same value multiple times.
	
	---------------------------------------------------------------------Example---------------------------------------------------------------------
	
	Examples on adding a value by 5 repeatedly and stopping when the value is bigger than 40:
	
	Efficient:
	local Value = BigNum.new(1)
	local Addend = BigNum.new(5)
	local StopAt = BigNum.new(4,1)
	while 1 do
		Value = BigNum.Add(Value, Addend)
		if BigNum.GreaterThan(Value, StopAt) then break end
	end
	
	Less efficient:
	local Value = BigNum.new(1)
	while 1 do
		Value = BigNum.Add(Value, BigNum.new(5))
		if BigNum.GreaterThan(Value, BigNum.new(4,1)) then break end
	end
	
	While it achieves the same effect, the time complexity is much higher.
	
	TL;DR, treat BigNum.new like CFrame.new, if the same value is used multiple times, store it as a variable.
]]

local BigNum = {}

BigNum.new = function(Mantissa: number | nil, Exponent: number | nil)
	return {Mantissa = (Mantissa or 0), Exponent = (Exponent or 0)}
end

BigNum.Clone = function(BigNumObject)
	return BigNum.new(BigNumObject.Mantissa, BigNumObject.Exponent)
end

BigNum.MinusOne = BigNum.new(-1)
BigNum.One = BigNum.new(1)
BigNum.Zero = BigNum.new(0)
BigNum.Two = BigNum.new(2)

BigNum.Normalize = function(OriginalValue)
	local Value
	if OriginalValue.Mantissa < 1 or OriginalValue.Mantissa >= 10 then
		Value = BigNum.Clone(OriginalValue)
		if math.abs(Value.Mantissa) == math.huge then
			Value.Mantissa = (Value.Mantissa > 0 and math.huge or -math.huge)
		end

		local Overflow = math.floor(math.log10(Value.Mantissa))

		Value.Exponent += Overflow
		Value.Mantissa /= (10 ^ Overflow)
	end
	return Value or OriginalValue
end

BigNum.Denormalize = function(Value, Displacement: number)
	local Value = BigNum.Clone(Value)

	Value.Mantissa *= 10 ^ Displacement
	Value.Exponent -= Displacement

	return Value
end

BigNum.GreaterThan = function(Comparand1, Comparand2)
	if Comparand1.Exponent < Comparand2.Exponent then
		return false
	elseif Comparand1.Mantissa < Comparand2.Mantissa then
		return false
	end
	return true
end

BigNum.SmallerThan = function(Comparand1, Comparand2)
	if Comparand1.Exponent > Comparand2.Exponent then
		return false
	elseif Comparand1.Mantissa > Comparand2.Mantissa then
		return false
	end
	return true
end

BigNum.Equals = function(Comparand1, Comparand2)
	if Comparand1.Exponent ~= Comparand2.Exponent then
		return false
	elseif Comparand1.Mantissa ~= Comparand2.Mantissa then
		return false
	end
	return true
end

BigNum.Add = function(...)
	local Sum = BigNum.Clone(BigNum.Zero)

	for _, Addend in next, {...} do
		if Sum.Exponent ~= Addend.Exponent then
			Sum.Mantissa += BigNum.Denormalize(Addend, Addend.Exponent - Sum.Exponent).Mantissa
		else
			Sum.Mantissa += Addend.Mantissa
		end
	end
	return BigNum.Normalize(Sum)
end

BigNum.Subtract = function(Subtrahend, ...)
	local Subtrahend = BigNum.Clone(Subtrahend)

	for _, Minuend in next, {...} do
		if Subtrahend.Exponent ~= Minuend.Exponent then
			Subtrahend.Mantissa -= BigNum.Denormalize(Minuend, Minuend.Exponent - Subtrahend.Exponent).Mantissa
		else
			Subtrahend.Mantissa -= Minuend.Mantissa
		end
	end
	return BigNum.Normalize(Subtrahend)
end

BigNum.Multiply = function(Base, ...)
	local Product = BigNum.Clone(Base)

	for _, Factor in next, {...} do
		Product.Mantissa *= Factor.Mantissa
		Product.Exponent += Factor.Exponent
	end
	return BigNum.Normalize(Product)
end

BigNum.Divide = function(Dividend, ...)
	local Quotient = BigNum.Clone(Dividend)

	for _, Divisor in next, {...} do
		Quotient.Mantissa /= Divisor.Mantissa
		Quotient.Exponent -= Divisor.Exponent
	end
	return BigNum.Normalize(Quotient)
end

BigNum.Floor = function(Value)	
	local Floor = BigNum.Denormalize(Value, (Value.Exponent < 14 and Value.Exponent or 14))

	Floor.Mantissa = math.floor(Floor.Mantissa)

	return BigNum.Normalize(Floor)
end

BigNum.Modulo = function(Value, Modulus)
	local Result = BigNum.Subtract(Value, BigNum.Multiply(Modulus, BigNum.Floor(BigNum.Divide(Value, Modulus))))
	return (Result.Exponent ~= -math.huge and Result or BigNum.Clone(BigNum.Zero))
end

BigNum.IsEven = function(Value)
	local StringMantissa = tostring(Value.Mantissa):gsub("%.", "")
	if #StringMantissa <= Value.Exponent then
		return tonumber(StringMantissa:sub(-1, -1)) % 2 == 0
	end
	return true
end

BigNum.IntegerExponentiate = function(Base, ...)
	local Base = BigNum.Clone(Base)
	
	for _, Exponent in next, {...} do
		if BigNum.SmallerThan(Exponent, BigNum.Zero) then
			Base = BigNum.Divide(BigNum.One, Base)
			Exponent = BigNum.Multiply(Exponent, BigNum.MinusOne)
		elseif BigNum.Equals(Exponent, BigNum.Zero) then
			return BigNum.Clone(BigNum.One)
		end
		
		local Factor = BigNum.Clone(BigNum.One)
		Exponent = BigNum.Floor(Exponent)
		
		--Evil iterative exponentiation by squaring.lua
		--Pretty efficient, not always the most, generally is.
		while BigNum.GreaterThan(Exponent, BigNum.One) do
			--if BigNum.Equals(BigNum.Modulo(Exponent, BigNum.Two), BigNum.Zero) then
			--Proved to be slower than just making another function that handles it. About 35% or so.
			if BigNum.IsEven(Exponent) then
				Base = BigNum.Multiply(Base, Base)
				Exponent = BigNum.Divide(Exponent, BigNum.Two)
			else
				Factor = BigNum.Multiply(Base, Factor)
				Base = BigNum.Multiply(Base, Base)
				Exponent = BigNum.Divide(BigNum.Subtract(Exponent, BigNum.One), BigNum.Two)
			end
		end
		Base = Factor
	end
	return Base
end

BigNum.Abs = function(Value)
	local Value = BigNum.Clone(Value)
	Value.Mantissa = math.abs(Value.Mantissa)
	
	return Value
end

BigNum.Min = function(Value, ...)
	local Min = Value
	
	for _, Comparand in next, {...} do
		if BigNum.SmallerThan(Comparand, Min) then
			Min = Comparand
		end
	end
	
	return Min
end

BigNum.Max = function(Value, ...)
	local Max = Value

	for _, Comparand in next, {...} do
		if BigNum.GreaterThan(Comparand, Max) then
			Max = Comparand
		end
	end

	return Max
end

BigNum.Raw = function(Value)
	return ("%.3fe%d"):format(Value.Mantissa, Value.Exponent)
end

BigNum.Read = function(Value: string)
	local Separated = Value:split"e"
	return BigNum.new(Separated[1], Separated[2]) 
end

return BigNum
