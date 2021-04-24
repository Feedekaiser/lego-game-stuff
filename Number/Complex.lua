--[[
	<Complex> Complex.new(<Number> re, <Number> im)
	returns a Complex object. Essentially an array where the 1st element is the real part, and the 2nd element is the complex part.

	<Number> Complex.abs(<Complex> z)
	returns the modulus (absolute value) of z.

	Addition, subtraction, unary minus, multiplication, division and exponeniation are implemented as metamethods that expects the other operand to be a Complex object.
	This includes complex exponents.


	Note: The __pow metamethod is not very optimized for raising numbers to a real exponents. I cannot add check. However, it should still be relatively quick
	UNLESS you are using this for Mandelbrot/Julia sets and raising to a real exponent, in which case, I will recommend forking the __pow metamethod itself for faster speed.

	__tostring metamethod is implemented.
]]
local setmetatable = setmetatable
local exp = math.exp
local sin = math.sin
local cos = math.cos
local log = math.log
local atan2 = math.atan2

local Complex = {}

local new = function(re, im)
  return setmetatable({re; im}, Complex)
end

local abs = function(z)
	return (z[1] ^ 2 + z[2] ^ 2) ^ 0.5
end

Complex.abs = abs
Complex.new = new

function Complex.__tostring(z)
	return z[2] >= 0 and ("%.4f%s%.4fi"):format(z[1], "+", z[2]) or ("%.4f%.4fi"):format(z[1], z[2])
end

function Complex.__unm(z)
	return new(-z[1], -z[2])
end

function Complex.__add(z, w)
	return new(z[1] + w[1], z[2] + w[2])
end

function Complex.__sub(z, w)
	return -w + z
end

function Complex.__mul(z, w)
	local zr, zi, wr, wi = z[1], z[2], w[1], w[2]

	return new(zr * wr - zi * wi, zr * wi + zi * wr)
end

function Complex.__div(z, w)
	local zr, zi, wr, wi = z[1], z[2], w[1], w[2]
	local div = wr * wr + wi * wi

	return new((zr * wr + zi * wi)/div, (zi * wr - zr * wi)/div)
end

function Complex.__pow(z, w)
	local exponent = w * new(log(abs(z)), atan2(z[2], z[1]))
	local exp = exp(exponent[1])
	local im = exponent[2]

	return new(exp * cos(im), exp * sin(im))
end

return Complex
