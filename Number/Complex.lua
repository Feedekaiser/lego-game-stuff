--[[
	<Complex> Complex.new(<Number> re, <Number> im)
	returns a Complex object. Essentially an array where the 0th element is the real part, and the 1st element is the complex part.

	<Number> Complex.abs(<Complex> z)
	returns the modulus (absolute value) of z.

	Addition, subtraction, unary minus, multiplication, division and exponeniation are implemented as metamethods that expects the other operand to be a Complex object.
	This includes complex exponents.


	Note: The __pow metamethod is not very optimized for raising numbers to a real exponents. I cannot add check. However, it should still be relatively quick
	UNLESS you are using this for Mandelbrot/Julia sets and raising to a real exponent, in which case, I will recommend forking the __pow metamethod itself for faster speed.

	__tostring metamethod is implemented.
]]
local exp = math.exp
local sin = math.sin
local cos = math.cos
local log = math.log
local atan2 = math.atan2

local Complex = {}

local new = function(re, im)
  return setmetatable({[0] = re, [1] = im}, Complex)
end

local abs = function(z)
	return (z[0] ^ 2 + z[1] ^ 2) ^ 0.5
end

Complex.abs = abs
Complex.new = new

function Complex.__tostring(z)
	return z[1] >= 0 and ("%.4f%s%.4fi"):format(z[0], "+", z[1]) or ("%.4f%.4fi"):format(z[0], z[1])
end

function Complex.__unm(z)
	return new(-z[0], -z[1])
end

function Complex.__add(z, w)
	return new(z[0] + w[0], z[1] + w[1])
end

function Complex.__sub(z, w)
	return -w + z
end

function Complex.__mul(z, w)
	local zr, zi, wr, wi = z[0], z[1], w[0], w[1]

	return new(zr * wr - zi * wi, zr * wi + zi * wr)
end

function Complex.__div(z, w)
	local zr, zi, wr, wi = z[0], z[1], w[0], w[1]
	local div = wr * wr + wi * wi

	return new((zr * wr + zi * wi)/div, (zi * wr - zr * wi)/div)
end

function Complex.__pow(z, w)
	local exponent = w * new(log(abs(z)), atan2(z[1], z[0]))
	local re, im = exponent[0], exponent[1]

	return new(exp(re) * cos(im), exp(re) * sin(im))
end

return Complex
