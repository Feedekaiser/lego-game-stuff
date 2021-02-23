local NegativeInfinity = -math.huge
local Infinity = {}
local mt = {}

local Base = 1e15

mt.__index = mt
mt.__tostring = function(self)
	return ("%.13fe%d"):format(self.Mantissa, self.Exponent)
end

Infinity.new = function(Mantissa, Exponent)
	return setmetatable({Mantissa = (Mantissa or 0),Exponent = (Exponent or 0)}, mt)
end

Infinity.Clone = function(Value)
	return Infinity.new(Value.Mantissa, Value.Exponent)
end

Infinity.IntegerExponentiation = function(Base, Exponent)
	local Result = Infinity.new(1)
	local Zero, One, Two = Infinity.Zero, Infinity.One, Infinity.Two
	local Base = Infinity.Clone(Base)
	local Exponent = Infinity.Clone(Exponent)

	while Exponent > Zero do
		if Exponent % Two == One then
			Result = Result * Base
		end
		Base = Base * Base
		Exponent = Infinity.floor(Exponent/Two)
	end

	return Result
end

Infinity.sqrt = function(Value)
	--// Babylonian method.

	local Clone = Infinity.Clone(Value)
	local Approx = Infinity.new(1)

	local Two = Infinity.Two

	for _ = 1, 6 do --// Should be good enugh. Change to a bigger value if you somehow need more precision.
		Clone = (Clone + Approx) / Two
		Approx = Value / Clone
	end

	return Clone
end

Infinity.NaturalLog = function(Value)
	--https://en.wikipedia.org/wiki/Remez_algorithm

	local Log2 = 0 --// Not realistic for it to be higher than the limit of the 64 bit integers.
	local Two = Infinity.Two

	do
		local Value = Infinity.Clone(Value)
		while Value > Two do
			Log2 = Log2 + 1
			Value = Value / Two
		end
	end

	Log2 = Infinity.new(Log2)

	local v = Value / Infinity.IntegerExponentiation(Two, Log2) -- [1, 2]

	return (Infinity.new(-1.7417937) + (Infinity.new(2.82120261) + (Infinity.new(-1.4699565) + (Infinity.new(0.44717955) - (Infinity.new(0.056570851) * v)) * v) * v) * v) + (Log2 * Infinity.new(0.69314718))
end

do
	local Prototype = function(f, name)
		Infinity[name] = function(Value)
			if Value.Exponent >= 16 then --// Exceeds precision.
				return Infinity.Clone(Value)
			elseif Value.Exponent < 0 then
				return Infinity.new(0)
			end

			local Copy = Infinity.Clone(Value):Denormalize(Value.Exponent)

			Copy.Mantissa = f(Copy.Mantissa)

			return Copy:Normalize()
		end
	end

	Prototype(math.floor, "floor")
	Prototype(math.ceil, "ceil")
end

Infinity.abs = function(Value)
	return Infinity.new(math.abs(Value.Mantissa), Value.Exponent)
end

function mt:Denormalize(Displacement)
	if Displacement ~= NegativeInfinity then
		self.Exponent = self.Exponent - Displacement
		self.Mantissa = tonumber(tostring(self.Mantissa * (Base ^ Displacement))) --// Fix floating point being too precise and mess things up. WEIRD FIX, I KNOW.
	end
	return self
end

function mt:Normalize()
	return self:Denormalize(-math.floor(math.log(math.abs(self.Mantissa), Base)))
end

mt.__unm = function(Value)
	return Infinity.new(-Value.Mantissa, Value.Exponent)
end

mt.__add = function(Value, Addend)
	local Copy = Infinity.Clone(Value)

	if Copy.Exponent ~= Addend.Exponent then
		Copy.Mantissa = Copy.Mantissa + Addend:Denormalize(Addend.Exponent - Copy.Exponent).Mantissa
	else
		Copy.Mantissa = Copy.Mantissa + Addend.Mantissa
	end

	return Copy:Normalize()
end

mt.__sub = function(Value, Subtrahend)
	return Value + (-Subtrahend)
end

mt.__mul = function(Value, Factor)
	local Copy = Infinity.Clone(Value)

	Copy.Mantissa = Copy.Mantissa * Factor.Mantissa
	Copy.Exponent = Copy.Exponent + Factor.Exponent

	return Copy:Normalize()
end

mt.__div = function(Value, Factor)
	local Copy = Infinity.Clone(Value)

	Copy.Mantissa = Copy.Mantissa / Factor.Mantissa
	Copy.Exponent = Copy.Exponent - Factor.Exponent

	return Copy:Normalize()
end

mt.__mod = function(Value, Modulus)
	if Value < Modulus then return Infinity.Clone(Value) end
	local Result = Value - (Modulus * (Infinity.floor(Value/Modulus)))
	return (Result.Mantissa ~= Result.Mantissa and Infinity.new(0) or Result:Normalize()) --// NaN != NaN
end

mt.__pow = function(Value, Exponent)
	if Infinity.floor(Exponent) == Exponent then
		return Infinity.IntegerExponentiation(Value, Exponent)
	end
	--// fractional support not yet.
end

mt.__lt = function(Value, Other)
	return (Value.Exponent < Other.Exponent or (Value.Exponent == Other.Exponent and Value.Mantissa < Other.Mantissa))
end

mt.__eq = function(Value, Other)
	return (Value.Exponent == Other.Exponent and Value.Mantissa == Other.Mantissa) --// Floating imprecision fix.
end

mt.__le = function(Value, Other)
	return (Value < Other or Value == Other)
end

--// Some constants to make it a bit faster.
Infinity.EulerConstant = Infinity.new(math.exp(1))
Infinity.Tau = Infinity.new(math.pi * 2)
Infinity.Zero = Infinity.new(0)
Infinity.One = Infinity.new(1)
Infinity.Two = Infinity.new(2)

return Infinity