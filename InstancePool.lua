--[[
	<return_type> function_name (<argument_type> argument_name)
	--------------------------------------------------------------------------------------------------------------------------------
	
	<Pool> InstancePool.new(<integer> amount, <function> createMethod, <function> returnMethod)
	
	Returns a Pool object prefilled with amount of instances.
	
	The createMethod is called for instance creation. It expects the instances to be returned.
	The returnMethod is called passing the instance returned as a parameter.
	
	See example for example usage.
	
	--------------------------------------------------------------------------------------------------------------------------------
	
	<void> Pool:Refill(<integer> amount)

	Add amount of instances to the pool.
	
	--------------------------------------------------------------------------------------------------------------------------------
	
	<integer> Pool:GetSize(void)
	
	Returns the remaining amount of instances in the pool.
	
	--------------------------------------------------------------------------------------------------------------------------------
	
	<Instance> Pool:Get(void)
	
	Returns an instance. If none exist a newly created one is returned instead.
	
	--------------------------------------------------------------------------------------------------------------------------------
	
	<void> Pool:Return(<Instance> instance)
	
	The instance is added to the available pool.
	
	--------------------------------------------------------------------------------------------------------------------------------

	<void> Pool:MassReturn(<Array> {[any] : instance})
	
	Similar to Pool:Return, but more optimized for large amounts.
	
	--------------------------------------------------------------------------------------------------------------------------------
	
	<void> Pool:Destroy(void)
	
	Destroys the pool.
	Essentially becomes an empty table with metamethods attached ( that will error when called ).

	--------------------------------------------------------------------------------------------------------------------------------
	
	Example:
	
	local pool
	
	do
		local CreatePart = function()
			return Instance.new("Part") --// something like, model:Clone() is also ok.
		end
		
		local FAR = CFrame.new(9e9,0,0)
		local ReturnPart = function(Part)
			Part.CFrame = FAR
		end
		
		pool = InstancePool.new(10, CreatePart, ReturnPart)
	end
	
	local used = 0
	local size = pool:GetSize()
	local p
	for i = 1, size do
		local part = pool:Get()
		part.Anchored = true
		part.Position = Vector3.new(math.sin(used) * 10, 0, math.cos(used) * 10)
		
		used += .6283185 
		
		part.Parent = workspace
		
		if i == 10 then
			p = part
		end
	end
	print(Pool:GetSize()) --> 0
	
	Pool:Return(p)
	
	print(Pool:GetSize()) --> 1
	
	Pool:Refill(10)

	print(Pool:GetSize()) --> 11
	
	Pool:Destroy()
	
	local _, err = pcall(Pool.GetSize, Pool)
	
	print(err) --> something along the lines of attemt to get the length of nil.
]]
local setmetatable  = setmetatable
local pop           = table.remove
local InstancePool  = {}
local PoolBlueprint = {}

PoolBlueprint.__index = PoolBlueprint

function PoolBlueprint:Get()
	local Pool = self.__Pool

	return pop(Pool, #Pool) or self.__CreateMethod()
end

function PoolBlueprint:Return(Instance)
	self.__ReturnMethod(Instance)

	local Pool = self.__Pool
	Pool[#Pool + 1] = Instance
end

function PoolBlueprint:MassReturn(Array)
	local ReturnMethod = self.__ReturnMethod
	local Pool = self.__Pool
	
	for _, Instance in next, Array do
		ReturnMethod(Instance)
		Pool[#Pool + 1] = Instance
	end
end

function PoolBlueprint:Destroy()

	do
		local Pool = self.__Pool
		for i, Instance in next, Pool do
			Instance:Destroy()
			Pool[i] = nil
		end
	end

	self.__CreateMethod = nil
	self.__ReturnMethod = nil
	self.__Pool         = nil
end

function PoolBlueprint:GetSize()
	return #self.__Pool
end

function PoolBlueprint:Refill(Amount)
	local CreateMethod = self.__CreateMethod
	local Pool         = self.__Pool
	local Start        = #Pool + 1

	for i = Start, Start + Amount - 1 do
		Pool[i] = CreateMethod()
	end
end

function InstancePool.new(Amount, CreatMethod, ReturnMethod)
	local self = setmetatable({__Pool = {}, __CreateMethod = CreatMethod, __ReturnMethod = ReturnMethod}, PoolBlueprint)

	self:Refill(Amount)

	return self
end

return InstancePool
