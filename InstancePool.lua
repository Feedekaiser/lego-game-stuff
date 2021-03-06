local setmetatable  = setmetatable
local InstancePool  = {}
local PoolBlueprint = {}
PoolBlueprint.__index = PoolBlueprint

function PoolBlueprint:Get()
    local Reference

    do
        local Pool   = self.__Pool
        local Length = #Pool
        Reference = Pool[Length]
        
        if not Reference then
            return self.__Template:Clone()
        end
        
        Pool[Length] = nil
    end

    return Reference
end

function PoolBlueprint:Return(Instance)
    self.__ReturnMethod(Instance)

    local Pool = self.__Pool
    Pool[#Pool + 1] = Instance
end

function PoolBlueprint:Destroy()

    do
        local Pool = self.__Pool
        for i, Instance in next, Pool do
            Instance:Destroy()
            Pool[i] = nil
        end
    end

    self.__Template:Destroy()

    self.__ReturnMethod = nil
    self.__Template     = nil
    self.__Pool         = nil
end

function PoolBlueprint:GetLength()
    return #self.__Pool
end

function PoolBlueprint:AddAmount(Amount)
    local Template = self.__Template
    local Pool     = self.__Pool
    local Start    = #Pool + 1

    for i = Start, Start + Amount do
        Pool[i]  = Template:Clone()
    end
end

function InstancePool.new(Template, Amount, ReturnMethod)
    local Pool = {}

    for i = 1, Amount do
        Pool[i] = Template:Clone() 
    end

    return setmetatable({__Template = Template:Clone(), __Pool = Pool, __ReturnMethod = ReturnMethod}, PoolBlueprint)
end

return InstancePool