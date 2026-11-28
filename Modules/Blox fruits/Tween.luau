local Module = {}
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local TweenAc = false
local TweenInst = nil
local HoldTarget = nil
local HoldConnection = nil
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
          if HoldTarget ~= Target then
            local OldBV = HoldTarget and HoldTarget:FindFirstChild("TweenBV")
            if OldBV then
              OldBV:Destroy()
            end
            HoldTarget = Target
          end
          if HoldConnection == nil then
            HoldConnection = RunService.Heartbeat:Connect(function()
              if not HoldTarget or not HoldTarget.Parent then
                return
              end
              local BodyVelocity = HoldTarget:FindFirstChild("TweenBV")
              if BodyVelocity == nil then
                BodyVelocity = Instance.new("BodyVelocity")
                BodyVelocity.Name = "TweenBV"
                BodyVelocity.P = 10000
                BodyVelocity.Parent = HoldTarget
              end
              BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
              BodyVelocity.Velocity = Vector3.new(0, 0, 0)
            end)
          end
          local Time = (Position - Target.Position).Magnitude / StudsPS
          if Time <= 0 then
            return
          end
          if TweenInst then
            local OldTween = TweenInst
            TweenInst = nil
            OldTween:Cancel()
          end
          local ThisTween = TweenService:Create(
            Target,
            TweenInfo.new(Time, Enum.EasingStyle.Linear),
            Goal
          )
          TweenInst = ThisTween
          TweenAc = true
          ThisTween.Completed:Connect(function()
            if TweenInst == ThisTween then
              TweenInst = nil
              TweenAc = false
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
  if HoldConnection then
    HoldConnection:Disconnect()
    HoldConnection = nil
  end
  if HoldTarget then
    local BodyVelocity = HoldTarget:FindFirstChild("TweenBV")
    if BodyVelocity then
      BodyVelocity:Destroy()
    end
    HoldTarget = nil
  end
  if ThisTween then
    ThisTween:Cancel()
  end
end

function Module:IsTweenAc()
  return TweenAc
end
return Module
