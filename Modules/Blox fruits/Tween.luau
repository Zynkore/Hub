local Module = {}
local TweenService = game:GetService("TweenService")

local TweenAc = false
local TweenInst = nil
local TempInstance = nil
function Module:TweenTo(Config)
  if typeof(Config) == "table" then
    local Target = Config[1] or Config.Target
    local StudsPS = Config[2] or Config.Speed or Config.Studs or 120
    local TargetPos = Config[3] or Config.Pos or Config.TargetPos or Config.TargetPosition or Config.TS
    if Target then
      if TargetPos then
        if StudsPS > 0 then
          local Goal
          local Position
          if typeof(TargetPos) == "CFrame" then
            Goal = {CFrame = TargetPos}
            Position = TargetPos.Position
          else
            Goal = {Position = TargetPos}
            Position = TargetPos
          end
          local Time = (Position - Target.Position).Magnitude / StudsPS
          if Time <= 0 then
            return
          end
          if TweenInst then
            if TempInstance and TempInstance.Parent == Target then
              local OldTween = TweenInst
              TweenInst = nil
              OldTween:Cancel()
            else
              Module:StopTween()
            end
          end
          local ThisTween = TweenService:Create(
            Target,
            TweenInfo.new(Time, Enum.EasingStyle.Linear),
            Goal
          )
          if TempInstance == nil then
            local BodyVelocity = Instance.new("BodyVelocity")
            BodyVelocity.Velocity = Vector3.new(0, 0, 0)
            BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            BodyVelocity.P = 10000
            BodyVelocity.Parent = Target
            TempInstance = BodyVelocity
          end
          TweenInst = ThisTween
          TweenAc = true
          ThisTween.Completed:Connect(function()
            if TweenInst == ThisTween then
              TweenInst = nil
              Module:StopTween()
            end
          end)
          ThisTween:Play()
        end
      end
    end
  end
end

function Module:StopTween()
  local ThisTween = TweenInst
  TweenInst = nil
  TweenAc = false
  if ThisTween then
    ThisTween:Cancel()
  end
  if TempInstance ~= nil then
    TempInstance:Destroy()
    TempInstance = nil
  end
end

function Module:IsTweenAc()
  return TweenAc
end

return Module
