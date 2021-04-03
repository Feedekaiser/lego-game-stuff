--// <Complex> Complex.new (<number> re, <number> im)
--// returns a Complex number, where re is the real part, and im is the complex part.
--// Every basic mathematical operation except for modulo (including exponentation with imaginary exponents) is included.
--// Complex is an array containing both the real and complex part. The zero-th element is the real part, and the 1st element is the complex part.

--// <number> Complex.abs (<Complex> z)
--// returns the absolute / modulus of the complex number. (sqrt(a^2 + b^2))

local Complex = {}

local new = function(r, c)
  return setmetatable({[0] = r, [1] = c}, Complex)
end

local abs = function(c)
	return (c[0] ^ 2 + c[1] ^ 2) ^ 0.5
end

Complex.abs = abs
Complex.new = new

function Complex.__tostring(c)
	return c[1] >= 0 and ("%.4f%s%.4fi"):format(c[0], "+", c[1]) or ("%.4f%.4fi"):format(c[0], c[1])
end

function Complex.__unm(a)
	return new(-a[0], -a[1])
end

function Complex.__add(a, b)
	return new(a[0] + b[0], b[1] + b[1])
end

function Complex.__sub(a, b)
	return -b + a
end

function Complex.__mul(c0, c1)
	local a,b,c,d = c0[0],c0[1],c1[0],c1[1]

	return new(a*c - b*d, a*d + b*c)
end

function Complex.__div(c0, c1)
	local a,b,c,d = c0[0],c0[1],c1[0],c1[1]
	local div = c*c + d*d

	return new((a*c + b*d)/div, (b*c - a*d)/div)
end

function Complex.__pow(z, w)
	local exponent = w * new(math.log(abs(z)), math.atan2(z[1], z[0]))
	local re, im = exponent[0], exponent[1]

	return new(math.exp(re) * math.cos(im), math.exp(re) * math.sin(im))
end

--// Still haven't figured what the heck is z mod w where both is a complex number

return Complex
