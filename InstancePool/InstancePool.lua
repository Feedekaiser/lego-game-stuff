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
local InstancePool  = {}

InstancePool.__index = InstancePool

function InstancePool:Get()
	return table.remove(self[1]) or self[2]()
end

function InstancePool:Return(Instance)
	self[3](Instance)
	table.insert(self[1], Instance)
end

function InstancePool:MassReturn(Array)
	local ReturnMethod = self[3]
	local Pool         = self[1]

	for _, Instance in next, Array do
		ReturnMethod(Instance)
		table.insert(Pool, Instance)
	end
end

function InstancePool:Destroy()

	do
		local Pool = self[1]
		for i, Instance in next, Pool do
			Pool[i] = nil
			Instance:Destroy()
		end
	end

	self[1] = nil
	self[2] = nil
	self[3] = nil
end

function InstancePool:Refill(Amount)
	local CreateMethod = self[2]
	local Pool         = self[1]

	for _ = 1, Amount do
		table.insert(Pool, CreateMethod())
	end
end

function InstancePool.new(Amount, CreatMethod, ReturnMethod)
	local self = setmetatable({table.create(Amount), CreatMethod, ReturnMethod}, InstancePool)

	self:Refill(Amount)

	return self
end

return InstancePool
