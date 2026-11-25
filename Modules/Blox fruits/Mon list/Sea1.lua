local Module = {}
function Module:GetMon(MyLevel)
  if MyLevel >= 0 then
    return {
      QuestName = "BanditQuest1",
      QuestLevel = 1,
      QuestTitle = "",
      QuestCFrame = CFrame.new(1054.04968, 14.8068714, 1553.323, -0.928394914, -6.62100206e-08, 0.371595085, -8.79542057e-08, 1, -4.15673398e-08, -0.371595085, -7.12742576e-08, -0.928394914),
      MonCFrame = CFrame.new(1045.41174, 72.8298569, 1609.47424, 0.844322562, 1.46325148e-08, -0.535835266, -6.86517296e-08, 1, -8.0867558e-08, 0.535835266, 1.05064323e-07, 0.844322562),
      MonName = "Bandit"
    }
  end
end
return Module
