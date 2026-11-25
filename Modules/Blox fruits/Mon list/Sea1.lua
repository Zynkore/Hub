local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Module = {}

function Module:GetMon(MyLevel)
  if MyLevel >= 0 then
    return {}
  end
end
return Module
