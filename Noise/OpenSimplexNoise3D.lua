--!strict

--// File:    OpenSimplex3D.lua

--// Credits to " https://github.com/KdotJPG/OpenSimplex2 ", this is merely an implementation in lua.

--[[
	This is a (possibly garbage and slow and bad) implementation of OpenSimplex noise in lua.
	Only the 3D (XZBeforeY) part tho. You can implement others if you want to, just refer to the S version.
	The generations of the lookup tables's code are in the respective lookup table's file.
	They are printed with https://raw.githubusercontent.com/Feedekaiser/lego-game-stuff/master/stringify.lua
--]]

--// Dependencies
local Lattice_Lookup = require("Lattice.lua") --// use require(path) in roblox.
local Grad_Lookup    = require("Grad.lua")

--// Constants
--// They are used for simulating integer overflow. Note that they are 64bit integers instead of 32 in the original implementation.
local INT_UNSIGNED_LIMIT_32 =  4294967296
local INT_POSITIVE_LIMIT_32 =  2147483647
local INT_NEGATIVE_LIMIT_32 = -2147483648

--// Permutation table used to generate noise.
local perm = {}
local grad = {}

--// localizing globals.
local floor   = math.floor
local ceil    = math.ceil
local modf    = math.modf

local bit_and = bit32.band
local bit_or  = bit32.bor
local bit_xor = bit32.bxor


local FastRound = function(x)
	return x >= 0.5 and 1 or 0
end

local BCC = function(xr, yr, zr)
	local xrb = floor(xr)
	local yrb = floor(yr)
	local zrb = floor(zr)

	--// {xri, yri, zri} ->	[0, 1)
	local xri = xr - xrb
	local yri = yr - yrb
	local zri = zr - zrb

	local LatticePoint = Lattice_Lookup[bit_or(FastRound(xri), FastRound(yri) * 2, FastRound(zri) * 4)] --// Left shifts. Multiplying seems to be ~30 % faster than using shifts.

	local Value = 0

	if LatticePoint then
		local dxr = xri + LatticePoint.dxr
		local dyr = yri + LatticePoint.dyr
		local dzr = zri + LatticePoint.dzr

		while LatticePoint do
			local attn : number = 0.75 - (dxr ^ 2) - (dyr ^ 2) - (dzr ^ 2)

			if attn < 0 then
				LatticePoint = LatticePoint.NextOnFailure
			else
				local Grad = Grad_Lookup[bit_xor(perm[bit_xor(perm[bit_and(xrb + LatticePoint.xrv, 2047)],bit_and(yrb + LatticePoint.yrv, 2047))],bit_and(zrb + LatticePoint.zrv, 2047))]
				Value += (attn ^ 4) * (Grad.dx * dxr + Grad.dy * dyr + Grad.dz * dzr)

				LatticePoint = LatticePoint.NextOnSuccess
			end
		end
	end

	return Value
end

local Noise = {}

function Noise.Seed(Seed) --// undefined behavior for non integers that are not within the 32bit signed integer range. (Duplicates probably)
	local source= {}
	local GRAD_LENGTH = #Grad_Lookup --// PSIZE -1

	for i = 0, GRAD_LENGTH do --// 0 to PSIZE -1, which is for (short i = 0; i < PSIZE; i++), since #Grad returns 2047 due to lua being 0 indexed.
		source[i] = i
	end

	for i = GRAD_LENGTH, 0, -1 do  -- for (int i = PSIZE - 1; i >= 0; i--)
		Seed = Seed * 1481765933 + 335903615

		--// Simulate integer overflow with voodoo magic.
		if Seed >= INT_POSITIVE_LIMIT_32 then
			Seed = (Seed % INT_UNSIGNED_LIMIT_32) - INT_UNSIGNED_LIMIT_32
		elseif Seed <= INT_NEGATIVE_LIMIT_32 then
			Seed = (Seed % INT_UNSIGNED_LIMIT_32) + INT_UNSIGNED_LIMIT_32
		end

		local r

		do
			local normal = i + 1
			r = modf((Seed + 31) % normal) --// round towards 0.
			
			if r < 0 then
				r += normal
			end
		end
		
		do
			local rand = source[r]
			perm[i] = rand
			grad[i] = Grad_Lookup[rand]
		end

		source[r] = source[i]
	end
end

function Noise.Get(x, y, z)
	local xz = x + z
	local s2 = xz * -0.211324865405187
	local yy = y * 0.577350269189626
	local mi = s2 - yy
	return BCC(x + mi, xz * 0.577350269189626 + yy, z + mi)
end

return Noise