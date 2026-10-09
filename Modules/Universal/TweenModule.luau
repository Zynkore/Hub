-- By Claude
local TweenModule = {}
local GM = nil
local TS = nil

local LP = nil
local HRP = nil
local TorsoPart = nil
local CurrentTween = nil
function TweenModule:Setup(GeneralModule)
	GM = GeneralModule
	TS = GM:Service('TweenService')
	LP = GM:Service('Players').LocalPlayer
	local Char = LP.Character or LP.CharacterAdded:Wait()
	HRP = Char:WaitForChild('HumanoidRootPart')
	local Humanoid = Char:WaitForChild('Humanoid')
	TorsoPart = Humanoid.RigType == Enum.HumanoidRigType.R6 and Char:FindFirstChild('Torso') or Char:FindFirstChild('UpperTorso')
	LP.CharacterAdded:Connect(function(NewChar)
		HRP = NewChar:WaitForChild('HumanoidRootPart')
		local NewHumanoid = NewChar:WaitForChild('Humanoid')
		TorsoPart = NewHumanoid.RigType == Enum.HumanoidRigType.R6 and NewChar:FindFirstChild('Torso') or NewChar:FindFirstChild('UpperTorso')
	end)
end

function TweenModule:TweenTo(Config)
	local TweenCframe = Config[1] or Config.CF or Config.CFrame or Config.Pos or Config.Position
	local TweenSpeed = Config[2] or Config.Speed or Config.S or 250
	if not HRP or not TweenCframe then return end
	if CurrentTween then
		CurrentTween:Cancel()
		CurrentTween = nil
	end

	local bv = HRP:FindFirstChild('StabDontDelete')
	if bv then bv:Destroy() end
	if TorsoPart then TorsoPart.CanCollide = true end
	local dist = (TweenCframe.Position - HRP.Position).Magnitude
	local info = TweenInfo.new(dist / TweenSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	GM:new('BodyVelocity', {
		Name = 'StabDontDelete',
		Velocity = Vector3.one,
		MaxForce = Vector3.one * math.huge,
		Parent = HRP
	})
	if TorsoPart then TorsoPart.CanCollide = false end
	CurrentTween = TS:Create(HRP, info, {CFrame = TweenCframe})
	CurrentTween:Play()
	CurrentTween.Completed:Connect(function()
		CurrentTween = nil
		local doneBV = HRP:FindFirstChild('StabDontDelete')
		if doneBV then doneBV:Destroy() end
		if TorsoPart then TorsoPart.CanCollide = true end
	end)
	return CurrentTween
end

function TweenModule:GetActiveTween()
	return CurrentTween
end

function TweenModule:CancelTween()
	if CurrentTween then
		CurrentTween:Cancel()
		CurrentTween = nil
	end
	local bv = HRP and HRP:FindFirstChild('StabDontDelete')
	if bv then bv:Destroy() end
	if TorsoPart then TorsoPart.CanCollide = true end
end
return TweenModule
