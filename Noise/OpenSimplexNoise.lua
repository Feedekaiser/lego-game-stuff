--// File:    OpenSimplex3D.lua
--// Author:  Feedekaiser#8530

--// Credits to " https://github.com/KdotJPG/OpenSimplex2 ", this is merely an implementation in lua.

--[[
	This is a (possibly garbage and slow and bad) implementation of OpenSimplex noise in lua.
	
	The generations of the lookup tables's code can be found parented under their respective table.
	They are printed with https://raw.githubusercontent.com/Feedekaiser/lego-game-stuff/master/stringify.lua , If someone were to update it, it could be done quite quickly.

	The empirically established lower bound limit seems to around -0.9426782066251109, while the (still empirically established) upperbound limit seems to around 0.9381975576001091

	SEED BEFORE USING!!
	SEED BEFORE USING!!
	SEED BEFORE USING!!
--]]

--// Dependencies
local Lattice3D_Lookup
local Lattice2D_Lookup
local Grad3D_Lookup
local Grad2D_Lookup

if script then
	Lattice3D_Lookup = require(script.Lattice3D)
	Lattice2D_Lookup = require(script.Lattice2D)
	Grad3D_Lookup = require(script.Grad3D)
	Grad2D_Lookup = require(script.Grad2D)
else
	Lattice3D_Lookup = require "Lattice3D"
	Lattice2D_Lookup = require "Lattice2D"
	Grad3D_Lookup = require "Grad3D"
	Grad2D_Lookup = require "Grad2D"
end

--// Constants
--// Note that 24 bit integers are used instead of 64 bit due to lua number types complications.
local INT_POSITIVE_LIMIT_24   =  8388607
local INT_NEGATIVE_LIMIT_24   = -8388608
local INT_NEGATIVE_COMPLEMENT = -8388607

local PMASK = 2047

--// Permutation table used to generate noise.
local Permutation = {}
local Grad3D = {}
local Grad2D = {}

--// localizing globals.
local floor   = math.floor
local modf    = math.modf --// Used to simulate casting numbers to integers

local bit_and = bit32.band
local bit_or  = bit32.bor
local bit_xor = bit32.bxor

local FastRound = function(x)
	return x >= 0.5 and 1 or 0
end

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

		local attn = 0.6666666666666666 - (dx ^ 2) - (dy ^ 2)

		if attn > 0 then
			local Grad = Grad2D[bit_xor(Permutation[bit_and(xsb + LatticePoint.xsv, PMASK)], bit_and(ysb + LatticePoint.ysv, PMASK))]

			Result = Result + (attn ^ 4) * (Grad.dx * dx + Grad.dy * dy)
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

	local LatticePoint = Lattice3D_Lookup[bit_or(FastRound(xri), FastRound(yri) * 2, FastRound(zri) * 4)] --// Left shifts. Multiplying seems to be ~30 % faster than using shifts.

	local Value = 0

	while LatticePoint do
		local dxr = xri + LatticePoint.dxr
		local dyr = yri + LatticePoint.dyr
		local dzr = zri + LatticePoint.dzr
		local attn = 0.75 - (dxr ^ 2) - (dyr ^ 2) - (dzr ^ 2)

		if attn < 0 then
			LatticePoint = LatticePoint.NextOnFailure
		else
			local Grad = Grad3D[bit_xor(Permutation[bit_xor(Permutation[bit_and(xrb + LatticePoint.xrv, PMASK)],bit_and(yrb + LatticePoint.yrv, PMASK))],bit_and(zrb + LatticePoint.zrv, PMASK))]
			Value = Value + (attn ^ 4) * (Grad.dx * dxr + Grad.dy * dyr + Grad.dz * dzr)

			LatticePoint = LatticePoint.NextOnSuccess
		end
	end

	return Value
end

local Noise = {}

function Noise.Seed(Seed) --// undefined behavior for non integers that are not within the [-2^23, 2^23 - 1] signed integer range. (Duplicates probably)5
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
		--// End of voodoo magic

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

return Noise
