olocal Module = {}

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
  if Config ~= nil and typeof(Config) == "table" then
    local Target = Config[1] or Config.Target or nil
    local StudsPS = Config[2] or Config.Speed or Config.Studs or 120
    local TargetPos = Config[3] or Config.Pos or Config.TargetPos or Config.TargetPosition or Config.TS or nil
    if Target ~= nil then
      if StudPS ~= 0 then
        if TargetPos ~= nil then

        end
      end
    end
  end
end

function Module:StopTween()
  
end

function Module:IsTweenAc()
  return TweenAc
end

return Module
