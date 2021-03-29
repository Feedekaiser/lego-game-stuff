--[[
	<return_type> function_name (<argument_type> argument_name)
	--------------------------------------------------------------------------------------------------------------------------------

	<Pool> InstancePool.new(<integer> amount, <function> Constructor, <function> Destructor)

	Returns a Pool object prefilled with amount of instances.

	The Constructor is called for instance creation. It expects the instance to be returned.
	The Destructor is called, passing the instance returned as a parameter.

	--------------------------------------------------------------------------------------------------------------------------------

	<void> Pool:Refill(<integer> amount)

	Add amount of instances to the pool.

	--------------------------------------------------------------------------------------------------------------------------------

	<Instance> Pool:Get(void)

	Returns an instance. If none exist a newly created one is returned instead.

	--------------------------------------------------------------------------------------------------------------------------------

	<void> Pool:Return(<Instance> instance)

	The instance is added to the available pool.

	--------------------------------------------------------------------------------------------------------------------------------

	<void> Pool:MassReturn(<Array> {[any] : instance})

	Similar to Pool.Return, but more optimized for large amounts.

	--------------------------------------------------------------------------------------------------------------------------------

	<void> Pool:Destroy(void)

	Destroys the pool, along with the instances in it.
	Essentially becomes an empty table with metamethods attached.
]]

local setmetatable  = setmetatable
local next          = next
local InstancePool  = {}
local PoolBlueprint = {}

PoolBlueprint.__index = PoolBlueprint

function PoolBlueprint:Get()
	local Pool     = self.__Pool
	local Instance = next(Pool) 
	
	if Instance then
		Pool[Instance] = nil
		return Instance
	end
	
	return self.__CreateMethod()
end

function PoolBlueprint:Return(Instance)
	self.__ReturnMethod(Instance)

	self.__Pool[Instance] = true
end

function PoolBlueprint:MassReturn(Array)
	local ReturnMethod = self.__ReturnMethod
	local Pool         = self.__Pool

	for _, Instance in next, Array do
		ReturnMethod(Instance)
		Pool[Instance] = true
	end
end

function PoolBlueprint:Destroy()

	do
		local Pool = self.__Pool
		for Instance in next, Pool do
			Pool[Instance] = nil
			Instance:Destroy()
		end
	end

	self.__CreateMethod = nil
	self.__ReturnMethod = nil
	self.__Pool         = nil
end

function PoolBlueprint:Refill(Amount)
	local CreateMethod = self.__CreateMethod
	local Pool         = self.__Pool

	for i = 1, Amount do
		Pool[CreateMethod()] = true
	end
end

function InstancePool.new(Amount, CreatMethod, ReturnMethod)
	local self = setmetatable({__Pool = {}, __CreateMethod = CreatMethod, __ReturnMethod = ReturnMethod}, PoolBlueprint)

	self:Refill(Amount)

	return self
end

return InstancePool
