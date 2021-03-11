--[[
local LatticePointNew = function(xrv, yrv, zrv, Lattice)
	local n1 = Lattice * .5
	local n2 = Lattice * 1024

	return
	{
		dxr = -xrv + n1;
		dyr = -yrv + n1;
		dzr = -zrv + n1;

		xrv =  xrv + n2;
		yrv =  yrv + n2;
		zrv =  zrv + n2;
	}
end

local Lookup = {}

for i = 0, 7 do
	local i1 = bit32.band(i, 1)
	local j1 = bit32.band(bit32.rshift(i, 1), 1)
	local k1 = bit32.band(bit32.rshift(i, 2), 1)
	local i2 = bit32.bxor(i1, 1)
	local j2 = bit32.bxor(j1, 1)
	local k2 = bit32.bxor(k1, 1)
	local i3 = bit32.bxor(i2, 1)
	local j3 = bit32.bxor(j2, 1)
	local k3 = bit32.bxor(k2, 1)

	local c0 = LatticePointNew(i1,j1,k1,0)
	local c1 = LatticePointNew(i1+i2,j1+j2,k1+k2,1)
	local c2 = LatticePointNew(i2,j1,k1,0)
	local c3 = LatticePointNew(i1,j2,k2,0)
	local c4 = LatticePointNew(i1+i3,j1+j2,k1+k2,1)
	local c5 = LatticePointNew(i1+i2,j1+j3,k1+k3,1)
	local c6 = LatticePointNew(i1,j2,k1,0)
	local c7 = LatticePointNew(i2,j1,k2,0)
	local c8 = LatticePointNew(i1+i2,j1+j3,k1+k2,1)
	local c9 = LatticePointNew(i1+i3,j1+j2,k1+k3,1)
	local cA = LatticePointNew(i1,j1,k2,0)
	local cB = LatticePointNew(i2,j2,k1,0)
	local cC = LatticePointNew(i1+i2,j1+j2,k1+k3,1)
	local cD = LatticePointNew(i1+i3,j1+j3,k1+k2,1)

	c0.NextOnFailure = c1
	c0.NextOnSuccess = c1
	c1.NextOnFailure = c2
	c1.NextOnSuccess = c2

	c2.NextOnFailure = c3
	c2.NextOnSuccess = c5
	c3.NextOnFailure = c4
	c3.NextOnSuccess = c4

	c4.NextOnFailure = c5
	c4.NextOnSuccess = c6
	c5.NextOnFailure = c6
	c5.NextOnSuccess = c6

	c6.NextOnFailure = c7
	c6.NextOnSuccess = c9
	c7.NextOnFailure = c8
	c7.NextOnSuccess = c8

	cA.NextOnFailure = cB
	cA.NextOnSuccess = cD
	cB.NextOnFailure = cC
	cB.NextOnSuccess = cC

	cC.NextOnFailure = cD

	Lookup[i] = c0
end]]
return {
	[0] = {
		["NextOnFailure"] = {
			["NextOnFailure"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = 0,
					["dyr"] = -1,
					["dzr"] = -1,
					["xrv"] = 0,
					["yrv"] = 1,
					["zrv"] = 1
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = 0,
						["dyr"] = -1,
						["dzr"] = 0,
						["xrv"] = 0,
						["yrv"] = 1,
						["zrv"] = 0
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = 0,
						["dyr"] = -1,
						["dzr"] = 0,
						["xrv"] = 0,
						["yrv"] = 1,
						["zrv"] = 0
					},
					["dxr"] = -0.5,
					["dyr"] = 0.5,
					["dzr"] = 0.5,
					["xrv"] = 1025,
					["yrv"] = 1024,
					["zrv"] = 1024
				},
				["dxr"] = -1,
				["dyr"] = 0,
				["dzr"] = 0,
				["xrv"] = 1,
				["yrv"] = 0,
				["zrv"] = 0
			},
			["NextOnSuccess"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = 0,
					["dyr"] = -1,
					["dzr"] = -1,
					["xrv"] = 0,
					["yrv"] = 1,
					["zrv"] = 1
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = 0,
						["dyr"] = -1,
						["dzr"] = 0,
						["xrv"] = 0,
						["yrv"] = 1,
						["zrv"] = 0
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = 0,
						["dyr"] = -1,
						["dzr"] = 0,
						["xrv"] = 0,
						["yrv"] = 1,
						["zrv"] = 0
					},
					["dxr"] = -0.5,
					["dyr"] = 0.5,
					["dzr"] = 0.5,
					["xrv"] = 1025,
					["yrv"] = 1024,
					["zrv"] = 1024
				},
				["dxr"] = -1,
				["dyr"] = 0,
				["dzr"] = 0,
				["xrv"] = 1,
				["yrv"] = 0,
				["zrv"] = 0
			},
			["dxr"] = -0.5,
			["dyr"] = -0.5,
			["dzr"] = -0.5,
			["xrv"] = 1025,
			["yrv"] = 1025,
			["zrv"] = 1025
		},
		["NextOnSuccess"] = {
			["NextOnFailure"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = 0,
					["dyr"] = -1,
					["dzr"] = -1,
					["xrv"] = 0,
					["yrv"] = 1,
					["zrv"] = 1
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = 0,
						["dyr"] = -1,
						["dzr"] = 0,
						["xrv"] = 0,
						["yrv"] = 1,
						["zrv"] = 0
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = 0,
						["dyr"] = -1,
						["dzr"] = 0,
						["xrv"] = 0,
						["yrv"] = 1,
						["zrv"] = 0
					},
					["dxr"] = -0.5,
					["dyr"] = 0.5,
					["dzr"] = 0.5,
					["xrv"] = 1025,
					["yrv"] = 1024,
					["zrv"] = 1024
				},
				["dxr"] = -1,
				["dyr"] = 0,
				["dzr"] = 0,
				["xrv"] = 1,
				["yrv"] = 0,
				["zrv"] = 0
			},
			["NextOnSuccess"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = 0,
					["dyr"] = -1,
					["dzr"] = -1,
					["xrv"] = 0,
					["yrv"] = 1,
					["zrv"] = 1
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = 0,
						["dyr"] = -1,
						["dzr"] = 0,
						["xrv"] = 0,
						["yrv"] = 1,
						["zrv"] = 0
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = 0,
						["dyr"] = -1,
						["dzr"] = 0,
						["xrv"] = 0,
						["yrv"] = 1,
						["zrv"] = 0
					},
					["dxr"] = -0.5,
					["dyr"] = 0.5,
					["dzr"] = 0.5,
					["xrv"] = 1025,
					["yrv"] = 1024,
					["zrv"] = 1024
				},
				["dxr"] = -1,
				["dyr"] = 0,
				["dzr"] = 0,
				["xrv"] = 1,
				["yrv"] = 0,
				["zrv"] = 0
			},
			["dxr"] = -0.5,
			["dyr"] = -0.5,
			["dzr"] = -0.5,
			["xrv"] = 1025,
			["yrv"] = 1025,
			["zrv"] = 1025
		},
		["dxr"] = 0,
		["dyr"] = 0,
		["dzr"] = 0,
		["xrv"] = 0,
		["yrv"] = 0,
		["zrv"] = 0
	},
	[1] = {
		["NextOnFailure"] = {
			["NextOnFailure"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = -1,
					["dyr"] = -1,
					["dzr"] = -1,
					["xrv"] = 1,
					["yrv"] = 1,
					["zrv"] = 1
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = -1,
						["dyr"] = -1,
						["dzr"] = 0,
						["xrv"] = 1,
						["yrv"] = 1,
						["zrv"] = 0
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = -1,
						["dyr"] = -1,
						["dzr"] = 0,
						["xrv"] = 1,
						["yrv"] = 1,
						["zrv"] = 0
					},
					["dxr"] = -0.5,
					["dyr"] = 0.5,
					["dzr"] = 0.5,
					["xrv"] = 1025,
					["yrv"] = 1024,
					["zrv"] = 1024
				},
				["dxr"] = 0,
				["dyr"] = 0,
				["dzr"] = 0,
				["xrv"] = 0,
				["yrv"] = 0,
				["zrv"] = 0
			},
			["NextOnSuccess"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = -1,
					["dyr"] = -1,
					["dzr"] = -1,
					["xrv"] = 1,
					["yrv"] = 1,
					["zrv"] = 1
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = -1,
						["dyr"] = -1,
						["dzr"] = 0,
						["xrv"] = 1,
						["yrv"] = 1,
						["zrv"] = 0
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = -1,
						["dyr"] = -1,
						["dzr"] = 0,
						["xrv"] = 1,
						["yrv"] = 1,
						["zrv"] = 0
					},
					["dxr"] = -0.5,
					["dyr"] = 0.5,
					["dzr"] = 0.5,
					["xrv"] = 1025,
					["yrv"] = 1024,
					["zrv"] = 1024
				},
				["dxr"] = 0,
				["dyr"] = 0,
				["dzr"] = 0,
				["xrv"] = 0,
				["yrv"] = 0,
				["zrv"] = 0
			},
			["dxr"] = -0.5,
			["dyr"] = -0.5,
			["dzr"] = -0.5,
			["xrv"] = 1025,
			["yrv"] = 1025,
			["zrv"] = 1025
		},
		["NextOnSuccess"] = {
			["NextOnFailure"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = -1,
					["dyr"] = -1,
					["dzr"] = -1,
					["xrv"] = 1,
					["yrv"] = 1,
					["zrv"] = 1
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = -1,
						["dyr"] = -1,
						["dzr"] = 0,
						["xrv"] = 1,
						["yrv"] = 1,
						["zrv"] = 0
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = -1,
						["dyr"] = -1,
						["dzr"] = 0,
						["xrv"] = 1,
						["yrv"] = 1,
						["zrv"] = 0
					},
					["dxr"] = -0.5,
					["dyr"] = 0.5,
					["dzr"] = 0.5,
					["xrv"] = 1025,
					["yrv"] = 1024,
					["zrv"] = 1024
				},
				["dxr"] = 0,
				["dyr"] = 0,
				["dzr"] = 0,
				["xrv"] = 0,
				["yrv"] = 0,
				["zrv"] = 0
			},
			["NextOnSuccess"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = -1,
					["dyr"] = -1,
					["dzr"] = -1,
					["xrv"] = 1,
					["yrv"] = 1,
					["zrv"] = 1
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = -1,
						["dyr"] = -1,
						["dzr"] = 0,
						["xrv"] = 1,
						["yrv"] = 1,
						["zrv"] = 0
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = -1,
						["dyr"] = -1,
						["dzr"] = 0,
						["xrv"] = 1,
						["yrv"] = 1,
						["zrv"] = 0
					},
					["dxr"] = -0.5,
					["dyr"] = 0.5,
					["dzr"] = 0.5,
					["xrv"] = 1025,
					["yrv"] = 1024,
					["zrv"] = 1024
				},
				["dxr"] = 0,
				["dyr"] = 0,
				["dzr"] = 0,
				["xrv"] = 0,
				["yrv"] = 0,
				["zrv"] = 0
			},
			["dxr"] = -0.5,
			["dyr"] = -0.5,
			["dzr"] = -0.5,
			["xrv"] = 1025,
			["yrv"] = 1025,
			["zrv"] = 1025
		},
		["dxr"] = -1,
		["dyr"] = 0,
		["dzr"] = 0,
		["xrv"] = 1,
		["yrv"] = 0,
		["zrv"] = 0
	},
	[2] = {
		["NextOnFailure"] = {
			["NextOnFailure"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = 0,
					["dyr"] = 0,
					["dzr"] = -1,
					["xrv"] = 0,
					["yrv"] = 0,
					["zrv"] = 1
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = 0,
						["dyr"] = 0,
						["dzr"] = 0,
						["xrv"] = 0,
						["yrv"] = 0,
						["zrv"] = 0
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = 0,
						["dyr"] = 0,
						["dzr"] = 0,
						["xrv"] = 0,
						["yrv"] = 0,
						["zrv"] = 0
					},
					["dxr"] = -0.5,
					["dyr"] = -1.5,
					["dzr"] = 0.5,
					["xrv"] = 1025,
					["yrv"] = 1026,
					["zrv"] = 1024
				},
				["dxr"] = -1,
				["dyr"] = -1,
				["dzr"] = 0,
				["xrv"] = 1,
				["yrv"] = 1,
				["zrv"] = 0
			},
			["NextOnSuccess"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = 0,
					["dyr"] = 0,
					["dzr"] = -1,
					["xrv"] = 0,
					["yrv"] = 0,
					["zrv"] = 1
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = 0,
						["dyr"] = 0,
						["dzr"] = 0,
						["xrv"] = 0,
						["yrv"] = 0,
						["zrv"] = 0
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = 0,
						["dyr"] = 0,
						["dzr"] = 0,
						["xrv"] = 0,
						["yrv"] = 0,
						["zrv"] = 0
					},
					["dxr"] = -0.5,
					["dyr"] = -1.5,
					["dzr"] = 0.5,
					["xrv"] = 1025,
					["yrv"] = 1026,
					["zrv"] = 1024
				},
				["dxr"] = -1,
				["dyr"] = -1,
				["dzr"] = 0,
				["xrv"] = 1,
				["yrv"] = 1,
				["zrv"] = 0
			},
			["dxr"] = -0.5,
			["dyr"] = -0.5,
			["dzr"] = -0.5,
			["xrv"] = 1025,
			["yrv"] = 1025,
			["zrv"] = 1025
		},
		["NextOnSuccess"] = {
			["NextOnFailure"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = 0,
					["dyr"] = 0,
					["dzr"] = -1,
					["xrv"] = 0,
					["yrv"] = 0,
					["zrv"] = 1
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = 0,
						["dyr"] = 0,
						["dzr"] = 0,
						["xrv"] = 0,
						["yrv"] = 0,
						["zrv"] = 0
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = 0,
						["dyr"] = 0,
						["dzr"] = 0,
						["xrv"] = 0,
						["yrv"] = 0,
						["zrv"] = 0
					},
					["dxr"] = -0.5,
					["dyr"] = -1.5,
					["dzr"] = 0.5,
					["xrv"] = 1025,
					["yrv"] = 1026,
					["zrv"] = 1024
				},
				["dxr"] = -1,
				["dyr"] = -1,
				["dzr"] = 0,
				["xrv"] = 1,
				["yrv"] = 1,
				["zrv"] = 0
			},
			["NextOnSuccess"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = 0,
					["dyr"] = 0,
					["dzr"] = -1,
					["xrv"] = 0,
					["yrv"] = 0,
					["zrv"] = 1
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = 0,
						["dyr"] = 0,
						["dzr"] = 0,
						["xrv"] = 0,
						["yrv"] = 0,
						["zrv"] = 0
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = 0,
						["dyr"] = 0,
						["dzr"] = 0,
						["xrv"] = 0,
						["yrv"] = 0,
						["zrv"] = 0
					},
					["dxr"] = -0.5,
					["dyr"] = -1.5,
					["dzr"] = 0.5,
					["xrv"] = 1025,
					["yrv"] = 1026,
					["zrv"] = 1024
				},
				["dxr"] = -1,
				["dyr"] = -1,
				["dzr"] = 0,
				["xrv"] = 1,
				["yrv"] = 1,
				["zrv"] = 0
			},
			["dxr"] = -0.5,
			["dyr"] = -0.5,
			["dzr"] = -0.5,
			["xrv"] = 1025,
			["yrv"] = 1025,
			["zrv"] = 1025
		},
		["dxr"] = 0,
		["dyr"] = -1,
		["dzr"] = 0,
		["xrv"] = 0,
		["yrv"] = 1,
		["zrv"] = 0
	},
	[3] = {
		["NextOnFailure"] = {
			["NextOnFailure"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = -1,
					["dyr"] = 0,
					["dzr"] = -1,
					["xrv"] = 1,
					["yrv"] = 0,
					["zrv"] = 1
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = -1,
						["dyr"] = 0,
						["dzr"] = 0,
						["xrv"] = 1,
						["yrv"] = 0,
						["zrv"] = 0
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = -1,
						["dyr"] = 0,
						["dzr"] = 0,
						["xrv"] = 1,
						["yrv"] = 0,
						["zrv"] = 0
					},
					["dxr"] = -0.5,
					["dyr"] = -1.5,
					["dzr"] = 0.5,
					["xrv"] = 1025,
					["yrv"] = 1026,
					["zrv"] = 1024
				},
				["dxr"] = 0,
				["dyr"] = -1,
				["dzr"] = 0,
				["xrv"] = 0,
				["yrv"] = 1,
				["zrv"] = 0
			},
			["NextOnSuccess"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = -1,
					["dyr"] = 0,
					["dzr"] = -1,
					["xrv"] = 1,
					["yrv"] = 0,
					["zrv"] = 1
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = -1,
						["dyr"] = 0,
						["dzr"] = 0,
						["xrv"] = 1,
						["yrv"] = 0,
						["zrv"] = 0
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = -1,
						["dyr"] = 0,
						["dzr"] = 0,
						["xrv"] = 1,
						["yrv"] = 0,
						["zrv"] = 0
					},
					["dxr"] = -0.5,
					["dyr"] = -1.5,
					["dzr"] = 0.5,
					["xrv"] = 1025,
					["yrv"] = 1026,
					["zrv"] = 1024
				},
				["dxr"] = 0,
				["dyr"] = -1,
				["dzr"] = 0,
				["xrv"] = 0,
				["yrv"] = 1,
				["zrv"] = 0
			},
			["dxr"] = -0.5,
			["dyr"] = -0.5,
			["dzr"] = -0.5,
			["xrv"] = 1025,
			["yrv"] = 1025,
			["zrv"] = 1025
		},
		["NextOnSuccess"] = {
			["NextOnFailure"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = -1,
					["dyr"] = 0,
					["dzr"] = -1,
					["xrv"] = 1,
					["yrv"] = 0,
					["zrv"] = 1
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = -1,
						["dyr"] = 0,
						["dzr"] = 0,
						["xrv"] = 1,
						["yrv"] = 0,
						["zrv"] = 0
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = -1,
						["dyr"] = 0,
						["dzr"] = 0,
						["xrv"] = 1,
						["yrv"] = 0,
						["zrv"] = 0
					},
					["dxr"] = -0.5,
					["dyr"] = -1.5,
					["dzr"] = 0.5,
					["xrv"] = 1025,
					["yrv"] = 1026,
					["zrv"] = 1024
				},
				["dxr"] = 0,
				["dyr"] = -1,
				["dzr"] = 0,
				["xrv"] = 0,
				["yrv"] = 1,
				["zrv"] = 0
			},
			["NextOnSuccess"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = -1,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 1
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = 0.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1024
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = 0.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1024
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = 0.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1024
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = -1,
					["dyr"] = 0,
					["dzr"] = -1,
					["xrv"] = 1,
					["yrv"] = 0,
					["zrv"] = 1
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = -1,
						["dyr"] = 0,
						["dzr"] = 0,
						["xrv"] = 1,
						["yrv"] = 0,
						["zrv"] = 0
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = 0.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1024
						},
						["dxr"] = -1,
						["dyr"] = 0,
						["dzr"] = 0,
						["xrv"] = 1,
						["yrv"] = 0,
						["zrv"] = 0
					},
					["dxr"] = -0.5,
					["dyr"] = -1.5,
					["dzr"] = 0.5,
					["xrv"] = 1025,
					["yrv"] = 1026,
					["zrv"] = 1024
				},
				["dxr"] = 0,
				["dyr"] = -1,
				["dzr"] = 0,
				["xrv"] = 0,
				["yrv"] = 1,
				["zrv"] = 0
			},
			["dxr"] = -0.5,
			["dyr"] = -0.5,
			["dzr"] = -0.5,
			["xrv"] = 1025,
			["yrv"] = 1025,
			["zrv"] = 1025
		},
		["dxr"] = -1,
		["dyr"] = -1,
		["dzr"] = 0,
		["xrv"] = 1,
		["yrv"] = 1,
		["zrv"] = 0
	},
	[4] = {
		["NextOnFailure"] = {
			["NextOnFailure"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = 0,
					["dyr"] = -1,
					["dzr"] = 0,
					["xrv"] = 0,
					["yrv"] = 1,
					["zrv"] = 0
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = 0,
						["dyr"] = -1,
						["dzr"] = -1,
						["xrv"] = 0,
						["yrv"] = 1,
						["zrv"] = 1
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = 0,
						["dyr"] = -1,
						["dzr"] = -1,
						["xrv"] = 0,
						["yrv"] = 1,
						["zrv"] = 1
					},
					["dxr"] = -0.5,
					["dyr"] = 0.5,
					["dzr"] = -1.5,
					["xrv"] = 1025,
					["yrv"] = 1024,
					["zrv"] = 1026
				},
				["dxr"] = -1,
				["dyr"] = 0,
				["dzr"] = -1,
				["xrv"] = 1,
				["yrv"] = 0,
				["zrv"] = 1
			},
			["NextOnSuccess"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = 0,
					["dyr"] = -1,
					["dzr"] = 0,
					["xrv"] = 0,
					["yrv"] = 1,
					["zrv"] = 0
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = 0,
						["dyr"] = -1,
						["dzr"] = -1,
						["xrv"] = 0,
						["yrv"] = 1,
						["zrv"] = 1
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = 0,
						["dyr"] = -1,
						["dzr"] = -1,
						["xrv"] = 0,
						["yrv"] = 1,
						["zrv"] = 1
					},
					["dxr"] = -0.5,
					["dyr"] = 0.5,
					["dzr"] = -1.5,
					["xrv"] = 1025,
					["yrv"] = 1024,
					["zrv"] = 1026
				},
				["dxr"] = -1,
				["dyr"] = 0,
				["dzr"] = -1,
				["xrv"] = 1,
				["yrv"] = 0,
				["zrv"] = 1
			},
			["dxr"] = -0.5,
			["dyr"] = -0.5,
			["dzr"] = -0.5,
			["xrv"] = 1025,
			["yrv"] = 1025,
			["zrv"] = 1025
		},
		["NextOnSuccess"] = {
			["NextOnFailure"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = 0,
					["dyr"] = -1,
					["dzr"] = 0,
					["xrv"] = 0,
					["yrv"] = 1,
					["zrv"] = 0
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = 0,
						["dyr"] = -1,
						["dzr"] = -1,
						["xrv"] = 0,
						["yrv"] = 1,
						["zrv"] = 1
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = 0,
						["dyr"] = -1,
						["dzr"] = -1,
						["xrv"] = 0,
						["yrv"] = 1,
						["zrv"] = 1
					},
					["dxr"] = -0.5,
					["dyr"] = 0.5,
					["dzr"] = -1.5,
					["xrv"] = 1025,
					["yrv"] = 1024,
					["zrv"] = 1026
				},
				["dxr"] = -1,
				["dyr"] = 0,
				["dzr"] = -1,
				["xrv"] = 1,
				["yrv"] = 0,
				["zrv"] = 1
			},
			["NextOnSuccess"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = 0,
					["dyr"] = -1,
					["dzr"] = 0,
					["xrv"] = 0,
					["yrv"] = 1,
					["zrv"] = 0
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = 0,
						["dyr"] = -1,
						["dzr"] = -1,
						["xrv"] = 0,
						["yrv"] = 1,
						["zrv"] = 1
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = 0,
						["dyr"] = -1,
						["dzr"] = -1,
						["xrv"] = 0,
						["yrv"] = 1,
						["zrv"] = 1
					},
					["dxr"] = -0.5,
					["dyr"] = 0.5,
					["dzr"] = -1.5,
					["xrv"] = 1025,
					["yrv"] = 1024,
					["zrv"] = 1026
				},
				["dxr"] = -1,
				["dyr"] = 0,
				["dzr"] = -1,
				["xrv"] = 1,
				["yrv"] = 0,
				["zrv"] = 1
			},
			["dxr"] = -0.5,
			["dyr"] = -0.5,
			["dzr"] = -0.5,
			["xrv"] = 1025,
			["yrv"] = 1025,
			["zrv"] = 1025
		},
		["dxr"] = 0,
		["dyr"] = 0,
		["dzr"] = -1,
		["xrv"] = 0,
		["yrv"] = 0,
		["zrv"] = 1
	},
	[5] = {
		["NextOnFailure"] = {
			["NextOnFailure"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = -1,
					["dyr"] = -1,
					["dzr"] = 0,
					["xrv"] = 1,
					["yrv"] = 1,
					["zrv"] = 0
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = -1,
						["dyr"] = -1,
						["dzr"] = -1,
						["xrv"] = 1,
						["yrv"] = 1,
						["zrv"] = 1
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = -1,
						["dyr"] = -1,
						["dzr"] = -1,
						["xrv"] = 1,
						["yrv"] = 1,
						["zrv"] = 1
					},
					["dxr"] = -0.5,
					["dyr"] = 0.5,
					["dzr"] = -1.5,
					["xrv"] = 1025,
					["yrv"] = 1024,
					["zrv"] = 1026
				},
				["dxr"] = 0,
				["dyr"] = 0,
				["dzr"] = -1,
				["xrv"] = 0,
				["yrv"] = 0,
				["zrv"] = 1
			},
			["NextOnSuccess"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = -1,
					["dyr"] = -1,
					["dzr"] = 0,
					["xrv"] = 1,
					["yrv"] = 1,
					["zrv"] = 0
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = -1,
						["dyr"] = -1,
						["dzr"] = -1,
						["xrv"] = 1,
						["yrv"] = 1,
						["zrv"] = 1
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = -1,
						["dyr"] = -1,
						["dzr"] = -1,
						["xrv"] = 1,
						["yrv"] = 1,
						["zrv"] = 1
					},
					["dxr"] = -0.5,
					["dyr"] = 0.5,
					["dzr"] = -1.5,
					["xrv"] = 1025,
					["yrv"] = 1024,
					["zrv"] = 1026
				},
				["dxr"] = 0,
				["dyr"] = 0,
				["dzr"] = -1,
				["xrv"] = 0,
				["yrv"] = 0,
				["zrv"] = 1
			},
			["dxr"] = -0.5,
			["dyr"] = -0.5,
			["dzr"] = -0.5,
			["xrv"] = 1025,
			["yrv"] = 1025,
			["zrv"] = 1025
		},
		["NextOnSuccess"] = {
			["NextOnFailure"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = -1,
					["dyr"] = -1,
					["dzr"] = 0,
					["xrv"] = 1,
					["yrv"] = 1,
					["zrv"] = 0
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = -1,
						["dyr"] = -1,
						["dzr"] = -1,
						["xrv"] = 1,
						["yrv"] = 1,
						["zrv"] = 1
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = -1,
						["dyr"] = -1,
						["dzr"] = -1,
						["xrv"] = 1,
						["yrv"] = 1,
						["zrv"] = 1
					},
					["dxr"] = -0.5,
					["dyr"] = 0.5,
					["dzr"] = -1.5,
					["xrv"] = 1025,
					["yrv"] = 1024,
					["zrv"] = 1026
				},
				["dxr"] = 0,
				["dyr"] = 0,
				["dzr"] = -1,
				["xrv"] = 0,
				["yrv"] = 0,
				["zrv"] = 1
			},
			["NextOnSuccess"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = 0.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1024,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = 0,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 0,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = 0.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1024,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = 0.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1024,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 1
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = -1,
					["dyr"] = -1,
					["dzr"] = 0,
					["xrv"] = 1,
					["yrv"] = 1,
					["zrv"] = 0
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = -1,
						["dyr"] = -1,
						["dzr"] = -1,
						["xrv"] = 1,
						["yrv"] = 1,
						["zrv"] = 1
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = 0.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1024,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = -1,
						["dyr"] = -1,
						["dzr"] = -1,
						["xrv"] = 1,
						["yrv"] = 1,
						["zrv"] = 1
					},
					["dxr"] = -0.5,
					["dyr"] = 0.5,
					["dzr"] = -1.5,
					["xrv"] = 1025,
					["yrv"] = 1024,
					["zrv"] = 1026
				},
				["dxr"] = 0,
				["dyr"] = 0,
				["dzr"] = -1,
				["xrv"] = 0,
				["yrv"] = 0,
				["zrv"] = 1
			},
			["dxr"] = -0.5,
			["dyr"] = -0.5,
			["dzr"] = -0.5,
			["xrv"] = 1025,
			["yrv"] = 1025,
			["zrv"] = 1025
		},
		["dxr"] = -1,
		["dyr"] = 0,
		["dzr"] = -1,
		["xrv"] = 1,
		["yrv"] = 0,
		["zrv"] = 1
	},
	[6] = {
		["NextOnFailure"] = {
			["NextOnFailure"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = 0,
					["dyr"] = 0,
					["dzr"] = 0,
					["xrv"] = 0,
					["yrv"] = 0,
					["zrv"] = 0
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = 0,
						["dyr"] = 0,
						["dzr"] = -1,
						["xrv"] = 0,
						["yrv"] = 0,
						["zrv"] = 1
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = 0,
						["dyr"] = 0,
						["dzr"] = -1,
						["xrv"] = 0,
						["yrv"] = 0,
						["zrv"] = 1
					},
					["dxr"] = -0.5,
					["dyr"] = -1.5,
					["dzr"] = -1.5,
					["xrv"] = 1025,
					["yrv"] = 1026,
					["zrv"] = 1026
				},
				["dxr"] = -1,
				["dyr"] = -1,
				["dzr"] = -1,
				["xrv"] = 1,
				["yrv"] = 1,
				["zrv"] = 1
			},
			["NextOnSuccess"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = 0,
					["dyr"] = 0,
					["dzr"] = 0,
					["xrv"] = 0,
					["yrv"] = 0,
					["zrv"] = 0
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = 0,
						["dyr"] = 0,
						["dzr"] = -1,
						["xrv"] = 0,
						["yrv"] = 0,
						["zrv"] = 1
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = 0,
						["dyr"] = 0,
						["dzr"] = -1,
						["xrv"] = 0,
						["yrv"] = 0,
						["zrv"] = 1
					},
					["dxr"] = -0.5,
					["dyr"] = -1.5,
					["dzr"] = -1.5,
					["xrv"] = 1025,
					["yrv"] = 1026,
					["zrv"] = 1026
				},
				["dxr"] = -1,
				["dyr"] = -1,
				["dzr"] = -1,
				["xrv"] = 1,
				["yrv"] = 1,
				["zrv"] = 1
			},
			["dxr"] = -0.5,
			["dyr"] = -0.5,
			["dzr"] = -0.5,
			["xrv"] = 1025,
			["yrv"] = 1025,
			["zrv"] = 1025
		},
		["NextOnSuccess"] = {
			["NextOnFailure"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = 0,
					["dyr"] = 0,
					["dzr"] = 0,
					["xrv"] = 0,
					["yrv"] = 0,
					["zrv"] = 0
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = 0,
						["dyr"] = 0,
						["dzr"] = -1,
						["xrv"] = 0,
						["yrv"] = 0,
						["zrv"] = 1
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = 0,
						["dyr"] = 0,
						["dzr"] = -1,
						["xrv"] = 0,
						["yrv"] = 0,
						["zrv"] = 1
					},
					["dxr"] = -0.5,
					["dyr"] = -1.5,
					["dzr"] = -1.5,
					["xrv"] = 1025,
					["yrv"] = 1026,
					["zrv"] = 1026
				},
				["dxr"] = -1,
				["dyr"] = -1,
				["dzr"] = -1,
				["xrv"] = 1,
				["yrv"] = 1,
				["zrv"] = 1
			},
			["NextOnSuccess"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = -1,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 1,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = 0.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1024,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = 0,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 0,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = -1,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 1,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = 0.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1024,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = 0,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 0,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["dxr"] = 0.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1024,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = 0,
					["dyr"] = 0,
					["dzr"] = 0,
					["xrv"] = 0,
					["yrv"] = 0,
					["zrv"] = 0
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = 0,
						["dyr"] = 0,
						["dzr"] = -1,
						["xrv"] = 0,
						["yrv"] = 0,
						["zrv"] = 1
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = -1,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 1,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = 0.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1024,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = 0,
						["dyr"] = 0,
						["dzr"] = -1,
						["xrv"] = 0,
						["yrv"] = 0,
						["zrv"] = 1
					},
					["dxr"] = -0.5,
					["dyr"] = -1.5,
					["dzr"] = -1.5,
					["xrv"] = 1025,
					["yrv"] = 1026,
					["zrv"] = 1026
				},
				["dxr"] = -1,
				["dyr"] = -1,
				["dzr"] = -1,
				["xrv"] = 1,
				["yrv"] = 1,
				["zrv"] = 1
			},
			["dxr"] = -0.5,
			["dyr"] = -0.5,
			["dzr"] = -0.5,
			["xrv"] = 1025,
			["yrv"] = 1025,
			["zrv"] = 1025
		},
		["dxr"] = 0,
		["dyr"] = -1,
		["dzr"] = -1,
		["xrv"] = 0,
		["yrv"] = 1,
		["zrv"] = 1
	},
	[7] = {
		["NextOnFailure"] = {
			["NextOnFailure"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = -1,
					["dyr"] = 0,
					["dzr"] = 0,
					["xrv"] = 1,
					["yrv"] = 0,
					["zrv"] = 0
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = -1,
						["dyr"] = 0,
						["dzr"] = -1,
						["xrv"] = 1,
						["yrv"] = 0,
						["zrv"] = 1
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = -1,
						["dyr"] = 0,
						["dzr"] = -1,
						["xrv"] = 1,
						["yrv"] = 0,
						["zrv"] = 1
					},
					["dxr"] = -0.5,
					["dyr"] = -1.5,
					["dzr"] = -1.5,
					["xrv"] = 1025,
					["yrv"] = 1026,
					["zrv"] = 1026
				},
				["dxr"] = 0,
				["dyr"] = -1,
				["dzr"] = -1,
				["xrv"] = 0,
				["yrv"] = 1,
				["zrv"] = 1
			},
			["NextOnSuccess"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = -1,
					["dyr"] = 0,
					["dzr"] = 0,
					["xrv"] = 1,
					["yrv"] = 0,
					["zrv"] = 0
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = -1,
						["dyr"] = 0,
						["dzr"] = -1,
						["xrv"] = 1,
						["yrv"] = 0,
						["zrv"] = 1
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = -1,
						["dyr"] = 0,
						["dzr"] = -1,
						["xrv"] = 1,
						["yrv"] = 0,
						["zrv"] = 1
					},
					["dxr"] = -0.5,
					["dyr"] = -1.5,
					["dzr"] = -1.5,
					["xrv"] = 1025,
					["yrv"] = 1026,
					["zrv"] = 1026
				},
				["dxr"] = 0,
				["dyr"] = -1,
				["dzr"] = -1,
				["xrv"] = 0,
				["yrv"] = 1,
				["zrv"] = 1
			},
			["dxr"] = -0.5,
			["dyr"] = -0.5,
			["dzr"] = -0.5,
			["xrv"] = 1025,
			["yrv"] = 1025,
			["zrv"] = 1025
		},
		["NextOnSuccess"] = {
			["NextOnFailure"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = -1,
					["dyr"] = 0,
					["dzr"] = 0,
					["xrv"] = 1,
					["yrv"] = 0,
					["zrv"] = 0
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = -1,
						["dyr"] = 0,
						["dzr"] = -1,
						["xrv"] = 1,
						["yrv"] = 0,
						["zrv"] = 1
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = -1,
						["dyr"] = 0,
						["dzr"] = -1,
						["xrv"] = 1,
						["yrv"] = 0,
						["zrv"] = 1
					},
					["dxr"] = -0.5,
					["dyr"] = -1.5,
					["dzr"] = -1.5,
					["xrv"] = 1025,
					["yrv"] = 1026,
					["zrv"] = 1026
				},
				["dxr"] = 0,
				["dyr"] = -1,
				["dzr"] = -1,
				["xrv"] = 0,
				["yrv"] = 1,
				["zrv"] = 1
			},
			["NextOnSuccess"] = {
				["NextOnFailure"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["NextOnSuccess"] = {
								["NextOnFailure"] = {
									["NextOnFailure"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["NextOnSuccess"] = {
										["dxr"] = -0.5,
										["dyr"] = -1.5,
										["dzr"] = -0.5,
										["xrv"] = 1025,
										["yrv"] = 1026,
										["zrv"] = 1025
									},
									["dxr"] = 0,
									["dyr"] = -1,
									["dzr"] = 0,
									["xrv"] = 0,
									["yrv"] = 1,
									["zrv"] = 0
								},
								["NextOnSuccess"] = {
									["dxr"] = -1.5,
									["dyr"] = -0.5,
									["dzr"] = -1.5,
									["xrv"] = 1026,
									["yrv"] = 1025,
									["zrv"] = 1026
								},
								["dxr"] = -1,
								["dyr"] = 0,
								["dzr"] = -1,
								["xrv"] = 1,
								["yrv"] = 0,
								["zrv"] = 1
							},
							["dxr"] = -0.5,
							["dyr"] = -1.5,
							["dzr"] = -1.5,
							["xrv"] = 1025,
							["yrv"] = 1026,
							["zrv"] = 1026
						},
						["NextOnSuccess"] = {
							["NextOnFailure"] = {
								["NextOnFailure"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["NextOnSuccess"] = {
									["dxr"] = -0.5,
									["dyr"] = -1.5,
									["dzr"] = -0.5,
									["xrv"] = 1025,
									["yrv"] = 1026,
									["zrv"] = 1025
								},
								["dxr"] = 0,
								["dyr"] = -1,
								["dzr"] = 0,
								["xrv"] = 0,
								["yrv"] = 1,
								["zrv"] = 0
							},
							["NextOnSuccess"] = {
								["dxr"] = -1.5,
								["dyr"] = -0.5,
								["dzr"] = -1.5,
								["xrv"] = 1026,
								["yrv"] = 1025,
								["zrv"] = 1026
							},
							["dxr"] = -1,
							["dyr"] = 0,
							["dzr"] = -1,
							["xrv"] = 1,
							["yrv"] = 0,
							["zrv"] = 1
						},
						["dxr"] = -1.5,
						["dyr"] = -0.5,
						["dzr"] = -0.5,
						["xrv"] = 1026,
						["yrv"] = 1025,
						["zrv"] = 1025
					},
					["dxr"] = -1,
					["dyr"] = 0,
					["dzr"] = 0,
					["xrv"] = 1,
					["yrv"] = 0,
					["zrv"] = 0
				},
				["NextOnSuccess"] = {
					["NextOnFailure"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = -1,
						["dyr"] = 0,
						["dzr"] = -1,
						["xrv"] = 1,
						["yrv"] = 0,
						["zrv"] = 1
					},
					["NextOnSuccess"] = {
						["NextOnFailure"] = {
							["NextOnFailure"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["NextOnSuccess"] = {
								["dxr"] = -0.5,
								["dyr"] = -1.5,
								["dzr"] = -0.5,
								["xrv"] = 1025,
								["yrv"] = 1026,
								["zrv"] = 1025
							},
							["dxr"] = 0,
							["dyr"] = -1,
							["dzr"] = 0,
							["xrv"] = 0,
							["yrv"] = 1,
							["zrv"] = 0
						},
						["NextOnSuccess"] = {
							["dxr"] = -1.5,
							["dyr"] = -0.5,
							["dzr"] = -1.5,
							["xrv"] = 1026,
							["yrv"] = 1025,
							["zrv"] = 1026
						},
						["dxr"] = -1,
						["dyr"] = 0,
						["dzr"] = -1,
						["xrv"] = 1,
						["yrv"] = 0,
						["zrv"] = 1
					},
					["dxr"] = -0.5,
					["dyr"] = -1.5,
					["dzr"] = -1.5,
					["xrv"] = 1025,
					["yrv"] = 1026,
					["zrv"] = 1026
				},
				["dxr"] = 0,
				["dyr"] = -1,
				["dzr"] = -1,
				["xrv"] = 0,
				["yrv"] = 1,
				["zrv"] = 1
			},
			["dxr"] = -0.5,
			["dyr"] = -0.5,
			["dzr"] = -0.5,
			["xrv"] = 1025,
			["yrv"] = 1025,
			["zrv"] = 1025
		},
		["dxr"] = -1,
		["dyr"] = -1,
		["dzr"] = -1,
		["xrv"] = 1,
		["yrv"] = 1,
		["zrv"] = 1
	}
}