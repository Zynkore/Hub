local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/Library.lua"))()

local Window = Library:CreateWindow({
  Title = "Zynkore Hub",
  Footer = "By zynkore / Universal / Open source",
  AlwaysOnTop = true,
  Icon = 95816097006870,
  NotifySide = "Right",
  Resizable = true,
  ShowMobileButtons = true,
  EnableSidebarResize = true,
  EnableCompacting = true
})
Library:Notify("Beta version!", 3)

local GeneralModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/Zynkore/Hub/refs/heads/main/Modules/Universal/General.luau"))()
local TweenModule = GeneralModule:GetHttp("https://raw.githubusercontent.com/Zynkore/Hub/refs/heads/main/Modules/Universal/TweenModule.luau")
TweenModule:Setup(GeneralModule)

local plr = GeneralModule:Service("Players")
local LP = plr.LocalPlayer
local Char = LP.Character or LP.CharacterAdded:Wait()
local Humanoid = Char:WaitForChild("Humanoid")
local HRP = Char:WaitForChild("HumanoidRootPart")
LP.CharacterAdded:Connect(function(Value)
  Char = Value
  Humanoid = Char:WaitForChild("Humanoid")
  HRP = Char:WaitForChild("HumanoidRootPart")
end)

local MainTab = Window:AddTab("Main", "house")
local NotifyTab = Window:AddTab("Notify", "bell")

local MainTabA = MainTab:AddGroupbox({
  Side = "Left",
  Name = "Main",
  IconName = "star",
  Visible = true,
  Collapsed = false,
  DisableCollapsing = false,
  PopOut = false
})

local NotifyTabA = NotifyTab:AddGroupbox({
  Side = "Left",
  Name = "Notify",
  IconName = "bell",
  Visible = true,
  Collapsed = false,
  DisableCollapsing = false,
  PopOut = false
})

local PlayerList = {}
for _, p in pairs(plr:GetPlayers()) do
  table.insert(PlayerList, p.Name)
end

local PlayerSelected = nil
local PlayerSelected_dropdown = MainTabA:AddDropdown("Index_no_value_1", {
  Text = "Select player",
  Values = PlayerList,
  Default = 1,
  Multi = false,
  DragSelect = false,
  AllowNull = false,
  Searchable = true,
  Callback = function(V)
    PlayerSelected = plr:FindFirstChild(V)
  end
})

local NotifySelectedJoin = false
local NotifySelectedLeave = false
local NotifyAnyJoin = false
local NotifyAnyLeave = false
local NotifyFriendJoin = false
local NotifyFriendLeave = false

NotifyTabA:AddToggle("NotifySelectedJoin", {
  Text = "Selected player joined",
  Default = false,
  Callback = function(V)
    NotifySelectedJoin = V
  end,
  Visible = true
})
NotifyTabA:AddToggle("NotifySelectedLeave", {
  Text = "Selected player left",
  Default = false,
  Callback = function(V)
    NotifySelectedLeave = V
  end,
  Visible = true
})
NotifyTabA:AddToggle("NotifyAnyJoin", {
  Text = "Any player joined",
  Default = false,
  Callback = function(V)
    NotifyAnyJoin = V
  end,
  Visible = true
})
NotifyTabA:AddToggle("NotifyAnyLeave", {
  Text = "Any player left",
  Default = false,
  Callback = function(V)
    NotifyAnyLeave = V
  end,
  Visible = true
})
NotifyTabA:AddToggle("NotifyFriendJoin", {
  Text = "Friend joined",
  Default = false,
  Callback = function(V)
    NotifyFriendJoin = V
  end,
  Visible = true
})
NotifyTabA:AddToggle("NotifyFriendLeave", {
  Text = "Friend left",
  Default = false,
  Callback = function(V)
    NotifyFriendLeave = V
  end,
  Visible = true
})

task.spawn(function()
  plr.PlayerAdded:Connect(function(p)
    table.insert(PlayerList, p.Name)
    PlayerSelected_dropdown:SetValues(PlayerList)
    if NotifyAnyJoin then
      Library:Notify(p.Name .. " joined.", 3)
    end
    if NotifySelectedJoin and PlayerSelected and p == PlayerSelected then
      Library:Notify(p.Name .. " (selected) joined.", 3)
    end
    if NotifyFriendJoin and LP:IsFriendsWith(p.UserId) then
      Library:Notify(p.Name .. " (friend) joined.", 3)
    end
  end)
end)
task.spawn(function()
  plr.PlayerRemoving:Connect(function(p)
    local Index = table.find(PlayerList, p.Name)
    if Index then
      table.remove(PlayerList, Index)
      PlayerSelected_dropdown:SetValues(PlayerList)
    end
    if NotifyAnyLeave then
      Library:Notify(p.Name .. " left.", 3)
    end
    if NotifySelectedLeave and PlayerSelected and p == PlayerSelected then
      Library:Notify(p.Name .. " (selected) left.", 3)
    end
    if NotifyFriendLeave and LP:IsFriendsWith(p.UserId) then
      Library:Notify(p.Name .. " (friend) left.", 3)
    end
  end)
end)

local BangDistance = 5
local BangSpeed = 10
local Bang1 = false
MainTabA:AddToggle("Bang1", {
  Text = "Enable bang 1",
  Default = false,
  Callback = function(V)
    Bang1 = V
    if V then
      if not PlayerSelected then
        Library:Notify("Please select player first.", 2.5)
        Bang1 = false
        return
      end
      if PlayerSelected == LP then
        Library:Notify("Please select other player.", 2.5)
        Bang1 = false
        return
      end
      local TargetChar = PlayerSelected.Character
      local TargetHRP = TargetChar and TargetChar:FindFirstChild("HumanoidRootPart")
      local TargetHum = TargetChar and TargetChar:FindFirstChild("Humanoid")
      if not TargetHRP or not TargetHum or TargetHum.Health <= 0 then
        Library:Notify("Target is not available.", 2.5)
        Bang1 = false
        return
      end
      HRP.CFrame = TargetHRP.CFrame
      task.spawn(function()
        while Bang1 do
          TargetChar = PlayerSelected.Character
          TargetHRP = TargetChar and TargetChar:FindFirstChild("HumanoidRootPart")
          TargetHum = TargetChar and TargetChar:FindFirstChild("Humanoid")
          if not TargetHRP or not TargetHum or TargetHum.Health <= 0 then break end
          if (HRP.Position - TargetHRP.Position).Magnitude > 25 then
            TweenModule:CancelTween()
            HRP.CFrame = TargetHRP.CFrame
          else
            TweenModule:TweenTo({ CFrame = TargetHRP.CFrame * CFrame.new(0, 0, BangDistance), Speed = BangSpeed })
            local Tween1 = TweenModule:GetActiveTween()
            local tween1Done = false
            Tween1.Completed:Connect(function() tween1Done = true end)
            repeat
              task.wait()
              if not Bang1 then break end
              TargetHRP = PlayerSelected.Character and PlayerSelected.Character:FindFirstChild("HumanoidRootPart")
              if not TargetHRP then break end
              if (HRP.Position - TargetHRP.Position).Magnitude > BangDistance + 5 then
                TweenModule:CancelTween()
                tween1Done = true
              end
            until tween1Done
            if not Bang1 then break end
            TargetChar = PlayerSelected.Character
            TargetHRP = TargetChar and TargetChar:FindFirstChild("HumanoidRootPart")
            TargetHum = TargetChar and TargetChar:FindFirstChild("Humanoid")
            if not TargetHRP or not TargetHum or TargetHum.Health <= 0 then break end
            TweenModule:TweenTo({ CFrame = TargetHRP.CFrame * CFrame.new(0, 0, 1), Speed = BangSpeed })
            local Tween2 = TweenModule:GetActiveTween()
            local tween2Done = false
            Tween2.Completed:Connect(function() tween2Done = true end)
            repeat
              task.wait()
              if not Bang1 then break end
              TargetHRP = PlayerSelected.Character and PlayerSelected.Character:FindFirstChild("HumanoidRootPart")
              if not TargetHRP then break end
              if (HRP.Position - TargetHRP.Position).Magnitude > BangDistance + 5 then
                TweenModule:CancelTween()
                tween2Done = true
              end
            until tween2Done
            if not Bang1 then break end
          end
          task.wait()
        end
        TweenModule:CancelTween()
      end)
    else
      TweenModule:CancelTween()
    end
  end,
  Risky = true,
  Disabled = false,
  Visible = true
})

MainTabA:AddSlider("Index_no_value_2", {
  Text = "Bang distance",
  Min = 1,
  Max = 15,
  Default = 5,
  Compact = false,
  Callback = function(V)
    BangDistance = V
  end,
  Disabled = false,
  Visible = true
})
MainTabA:AddSlider("Index_no_value_3", {
  Text = "Bang speed",
  Min = 1,
  Max = 40,
  Default = 10,
  Compact = true,
  Callback = function(V)
    BangSpeed = V
  end,
  Disabled = false,
  Visible = true
})
MainTabA:AddButton({
  Text = "Goto player",
  Func = function()
    if PlayerSelected then
      TweenModule:CancelTween()
      HRP.CFrame = PlayerSelected.Character.HumanoidRootPart.CFrame
    else
      Library:Notify("Please select player first.", 2.5)
    end
  end,
  Disabled = false,
  Visible = true
})
Library:Notify("Hub loaded!", 3)
