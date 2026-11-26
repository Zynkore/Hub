local Module = {}

function new(instance, Prop)
  local Inst = Instance.new(instance)
  for pp, v in pairs(Prop or {}) do
    Inst[pp] = v
  end
  return Inst
end

local TweenAc = false
local TweenInst = nil
local TempInstance = nil
function Module:TweenTo(Config)
  if Config ~= nil and Config ~= {} then
    
  end
end

function Module:StopTween()
  
end

function Module:IsTweenAc()
  return TweenAc
end

return Module
