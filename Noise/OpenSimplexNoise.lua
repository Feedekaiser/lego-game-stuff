--// File:    OpenSimplex3D.lua
--// Author:  Feedekaiser#8530

--// Credits to " https://github.com/KdotJPG/OpenSimplex2 ", this is merely an implementation in lua.

--[[
	This is a (possibly garbage and slow and bad) implementation of OpenSimplex noise in lua.
	The generations of the lookup tables's code can be at the top of the of the lookup table as comments.

	They are printed with https://raw.githubusercontent.com/Feedekaiser/lego-game-stuff/master/stringify.lua , If someone were to update it, it could be done quite quickly.
	The empirically established lower bound limit seems to around -0.9999991422062759, while the (still empirically established) upperbound limit seems to around 0.9999997656965113

	SEED BEFORE USING!!
	SEED BEFORE USING!!
	SEED BEFORE USING!!
--]]

--// Dependencies
local Lattice4D_Lookup
local Lattice3D_Lookup
local Lattice2D_Lookup
local Grad4D_Lookup
local Grad3D_Lookup
local Grad2D_Lookup

if script then
	Lattice4D_Lookup = require(script.Lattice4D)
	Lattice3D_Lookup = require(script.Lattice3D)
	Lattice2D_Lookup = require(script.Lattice2D)
	Grad4D_Lookup = require(script.Grad4D)
	Grad3D_Lookup = require(script.Grad3D)
	Grad2D_Lookup = require(script.Grad2D)
else
	Lattice4D_Lookup = require "Lattice4D"
	Lattice3D_Lookup = require "Lattice3D"
	Lattice2D_Lookup = require "Lattice2D"
	Grad4D_Lookup = require "Grad4D"
	Grad3D_Lookup = require "Grad3D"
	Grad2D_Lookup = require "Grad2D"
end

--// Constants
--// Note that 24 bit integers are used instead of 64 bit due to lua number types complications.
local INT_POSITIVE_LIMIT_24 =  8388607
local INT_NEGATIVE_LIMIT_24 = -8388608

local PMASK = 2047

--// Permutation table used to generate noise.
local Permutation = {}
local Grad4D = {}
local Grad3D = {}
local Grad2D = {}

--// localizing globals.
local floor   = math.floor
local modf    = math.modf --// Used to simulate casting numbers to integers

local bit_and = bit32.band
local bit_or  = bit32.bor
local bit_xor = bit32.bxor

local Base2D = function(xs, ys)
	local xsb = floor(xs)
	local ysb = floor(ys)

	local xi
	local yi
	local idx

	do
		local xsi = xs - xsb
		local ysi = ys - ysb
		local ss  = xsi + ysi

		do
			local a  = modf(ss)
			local a2 = a * 0.5

			idx = bit_or(a * 4, modf(xsi - ysi*0.5 + 1 - a2) * 8, modf(ysi - xsi*0.5 + 1 - a2) * 16)
		end

		local ssi = ss * -0.211324865405187

		xi = xsi + ssi
		yi = ysi + ssi
	end

	local Result = 0

	for i = 0, 3 do
		local LatticePoint = Lattice2D_Lookup[idx + i]
		local dx = xi + LatticePoint.dx
		local dy = yi + LatticePoint.dy

		local attn = 0.6666666666666666 - (dx * dx) - (dy * dy)

		if attn > 0 then
			local Grad = Grad2D[bit_xor(Permutation[bit_and(xsb + LatticePoint.xsv, PMASK)], bit_and(ysb + LatticePoint.ysv, PMASK))]
			attn = attn * attn
			Result = Result + (attn * attn) * (Grad.dx * dx + Grad.dy * dy)
		end
	end

	return Result
end

local Base3D = function(xr, yr, zr)
	local xrb = floor(xr)
	local yrb = floor(yr)
	local zrb = floor(zr)

	--// {xri, yri, zri} ->	[0, 1)
	local xri = xr - xrb
	local yri = yr - yrb
	local zri = zr - zrb

	local LatticePoint = Lattice3D_Lookup[bit_or(xri >= .5 and 1 or 0, yri >= .5 and 2 or 0, zri >= .5 and 4 or 0)] --// Left shifts. Multiplying seems to be ~30 % faster than using shifts.

	local Value = 0

	while LatticePoint do
		local dxr = xri + LatticePoint.dxr
		local dyr = yri + LatticePoint.dyr
		local dzr = zri + LatticePoint.dzr
		local attn = 0.75 - (dxr * dxr) - (dyr * dyr) - (dzr * dzr)

		if attn < 0 then
			LatticePoint = LatticePoint.NextOnFailure
		else
			local Grad = Grad3D[bit_xor(Permutation[bit_xor(Permutation[bit_and(xrb + LatticePoint.xrv, PMASK)], bit_and(yrb + LatticePoint.yrv, PMASK))],bit_and(zrb + LatticePoint.zrv, PMASK))]
			attn = attn * attn
			Value = Value + (attn * attn) * (Grad.dx * dxr + Grad.dy * dyr + Grad.dz * dzr)

			LatticePoint = LatticePoint.NextOnSuccess
		end
	end

	return Value
end

local Base4D = function(xs, ys, zs, ws)
	local value = 0

	local xsb = floor(xs)
	local ysb = floor(ys)
	local zsb = floor(zs)
	local wsb = floor(ws)

	local xi
	local yi
	local zi
	local wi

	do
		local xsi = xs - xsb
		local ysi = ys - ysb
		local zsi = zs - zsb
		local wsi = ws - wsb

		local ssi = (xsi + ysi + zsi + wsi) * -0.138196601125011
		xi = xsi + ssi
		yi = ysi + ssi
		zi = zsi + ssi
		wi = wsi + ssi
	end

	for _, LatticePoint in next, Lattice4D_Lookup[bit_or(bit_and(floor(xs * 4), 3), bit_and(floor(ys * 4), 3) * 4, bit_and(floor(zs * 4), 3) * 16, bit_and(floor(ws * 4), 3) * 64)] do
		local dx = xi + LatticePoint.dx
		local dy = yi + LatticePoint.dy
		local dz = zi + LatticePoint.dz
		local dw = wi + LatticePoint.dw
		local attn = 0.8 - (dx * dx) - (dy * dy) - (dz * dz) - (dw * dw)

		if attn > 0 then
			local grad = Grad4D[bit_xor(Permutation[bit_xor(Permutation[bit_xor(Permutation[bit_and(xsb + LatticePoint.xsv, PMASK)], bit_and(ysb + LatticePoint.ysv, PMASK))], bit_and(zsb + LatticePoint.zsv, PMASK))], bit_and(wsb + LatticePoint.wsv, PMASK))]
			attn = attn * attn
			value = value + (attn * attn) * (grad.dx * dx + grad.dy * dy + grad.dz * dz + grad.dw * dw)
		end
	end

	return value
end

local Noise = {}

function Noise.Seed(Seed) --// undefined behavior where x does not fall within the [-2^23, 23^23-1] range. Decimal places already generate different maps.
	local Hash = {}

	for i = 0, PMASK do --// 0 to PSIZE -1, which is for (short i = 0; i < PSIZE; i++), since #Grad returns 2047 due to lua being 0 indexed.
		Hash[i] = i
	end

	for i = PMASK, 0, -1 do  -- for (int i = PSIZE - 1; i >= 0; i--)
		Seed = Seed * 5788148 + 1312124

		--// Simulate integer overflow with voodoo magic.
		if Seed >= INT_POSITIVE_LIMIT_24 then
			Seed = (Seed % INT_POSITIVE_LIMIT_24) - INT_POSITIVE_LIMIT_24
		elseif Seed <= INT_NEGATIVE_LIMIT_24 then
			Seed = (Seed % INT_POSITIVE_LIMIT_24) + INT_POSITIVE_LIMIT_24
		end

		local r

		do
			local normal = i + 1
			r = modf((Seed + 31) % normal) --// Cast to int, round towards 0.

			if r < 0 then
				r = r + normal
			end
		end

		do
			local rand = Hash[r]
			Grad4D[i] = Grad4D_Lookup[rand]
			Grad3D[i] = Grad3D_Lookup[rand]
			Grad2D[i] = Grad2D_Lookup[rand]

			Permutation[i] = rand
		end

		Hash[r] = Hash[i]
	end
end

function Noise.Classic2D(x, y)
	local s = 0.366025403784439 * (x + y)
	return Base2D(x + s, y + s)
end

function Noise.XBeforeY2D(x, y)
	local xx = x * 0.7071067811865476
	local yy = y * 1.224744871380249

	return Base2D(yy + xx, yy - xx)
end

function Noise.Classic3D(x, y, z)
	local r = 0.6666666666666666 * (x + y + z)

	return Base3D(r - x, r - y, r - z)
end

function Noise.XYBeforeZ3D(x, y, z)
	local xy = x + y
	local zz = z * 0.577350269189626
	local ss = xy * -0.211324865405187 - zz

	return Base3D(x + ss, y + ss, xy * 0.577350269189626 + zz)
end

function Noise.XZBeforeY3D(x, y, z)
	local xz = x + z
	local yy = y * 0.577350269189626

	local mi = (xz * -0.211324865405187) - yy
	return Base3D(x + mi, xz * 0.577350269189626 + yy, z + mi)
end

function Noise.Classic4D(x, y, z, w)
	local s = 0.309016994374947 * (x + y + z + w)

	return Base4D(x + s, y + s, z + s, w + s)
end

function Noise.XYBeforeZW4D(x, y, z, w)
	local xy = x + y
	local zw = z + w
	local s2 = xy * -0.28522513987434876941 + zw *  0.83897065470611435718
	local t2 = zw *  0.21939749883706435719 + xy * -0.48214856493302476942

	return Base4D(x + s2, y + s2, z + t2, w + t2)
end

function Noise.XZBeforeYW4D(x, y, z, w)
	local xz = x + z
	local yw = y + w
	local s2 = xz * -0.28522513987434876941 + yw *  0.83897065470611435718
	local t2 = yw *  0.21939749883706435719 + xz * -0.48214856493302476942

	return Base4D(x + s2, y + t2, z + s2, w + t2);
end

function Noise.XYZBeforeW4D(x, y, z, w)
	local xyz = x + y + z
	local ww = w * 1.118033988749894
	local s2 = xyz * -0.16666666666666666 + ww

	return Base4D(x + s2, y + s2, z + s2, -0.5 * xyz + ww)
end

return Noise
