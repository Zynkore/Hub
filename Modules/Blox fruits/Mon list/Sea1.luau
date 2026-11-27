local Module = {}
function Module:GetMon(MyLevel)
  if MyLevel >= 0 and MyLevel <= 9 then
    return {
      QuestName = "BanditQuest1",
      QuestLevel = 1,
      QuestTitle = "Defeat 5 Bandits",
      QuestCFrame = CFrame.new(1054.04968, 14.8068714, 1553.323, -0.928394914, -6.62100206e-08, 0.371595085, -8.79542057e-08, 1, -4.15673398e-08, -0.371595085, -7.12742576e-08, -0.928394914),
      MonCFrame = CFrame.new(1045.41174, 72.8298569, 1609.47424, 0.844322562, 1.46325148e-08, -0.535835266, -6.86517296e-08, 1, -8.0867558e-08, 0.535835266, 1.05064323e-07, 0.844322562),
      MonName = "Bandit"
    }
  elseif MyLevel >= 10 and MyLevel <= 14 then
    return {
      QuestName = "JungleQuest",
      QuestLevel = 1,
      QuestTitle = "Defeat 6 Monkeys",
      QuestCFrame = CFrame.new(-1684.35083, 50.0839424, 174.501541, -0.102880262, -1.175877e-08, -0.994693756, -4.92555188e-08, 1, -6.72704514e-09, 0.994693756, 4.8302077e-08, -0.102880262),
      MonCFrame = CFrame.new(-1685.49292, 53.0046806, 153.61412, -0.954835117, 2.27732659e-08, 0.297136098, 2.19921823e-08, 1, -5.97153438e-09, -0.297136098, 8.32840408e-10, -0.954835117),
      MonName = "Monkey"
    }
  elseif MyLevel >= 15 then
    return {
      QuestName = "JungleQuest",
      QuestLevel = 2,
      QuestTitle = "Defeat 8 Gorillas",
      QuestCFrame = CFrame.new(-1684.35083, 50.0839424, 174.501541, -0.102880262, -1.175877e-08, -0.994693756, -4.92555188e-08, 1, -6.72704514e-09, 0.994693756, 4.8302077e-08, -0.102880262),
      MonCFrame = CFrame.new(-1411.31311, 26.6425056, -509.711945, 0.418954581, 1.1697753e-08, -0.908007205, -2.88594459e-09, 1, 1.1551311e-08, 0.908007205, -2.21901608e-09, 0.418954581),
      MonName = "Gorilla"
    }
  end
end
return Module
