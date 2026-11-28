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
  elseif MyLevel >= 15 and MyLevel <= 29 then
    return {
      QuestName = "JungleQuest",
      QuestLevel = 2,
      QuestTitle = "Defeat 8 Gorillas",
      QuestCFrame = CFrame.new(-1684.35083, 50.0839424, 174.501541, -0.102880262, -1.175877e-08, -0.994693756, -4.92555188e-08, 1, -6.72704514e-09, 0.994693756, 4.8302077e-08, -0.102880262),
      MonCFrame = CFrame.new(-1408.54639, 26.6425018, -510.006226, 0.270421386, 1.3805681e-08, -0.96274209, 1.56684354e-09, 1, 1.47800634e-08, 0.96274209, -5.50531132e-09, 0.270421386),
      MonName = "Gorilla"
    }
  elseif MyLevel >= 30 and MyLevel <= 39 then
    return {
      QuestName = "BuggyQuest1",
      QuestLevel = 1,
      QuestTitle = "Defeat 8 Pirates",
      QuestCFrame = CFrame.new(-1150.63599, 17.3089924, 3858.5542, -0.98744756, 2.54645407e-08, 0.157947183, 2.6892419e-08, 1, 6.90302482e-09, -0.157947183, 1.10639569e-08, -0.98744756),
      MonCFrame = CFrame.new(-1216.83472, 39.6823883, 4014.42798, 0.986065984, -4.24446256e-09, -0.166354835, 3.76103637e-09, 1, -3.22102078e-09, 0.166354835, 2.5504725e-09, 0.986065984),
      MonName = "Pirate"
    }
  elseif MyLevel >= 40 and MyLevel <= 59 then
    return {
      QuestName = "BuggyQuest1",
      QuestLevel = 2,
      QuestTitle = "Defeat 8 Brutes",
      QuestCFrame = CFrame.new(-1150.63599, 17.3089924, 3858.5542, -0.98744756, 2.54645407e-08, 0.157947183, 2.6892419e-08, 1, 6.90302482e-09, -0.157947183, 1.10639569e-08, -0.98744756),
      MonCFrame = CFrame.new(-1209.59839, 32.7910347, 4351.46436, -0.772964776, 1.22627721e-08, -0.634448946, 8.29626234e-09, 1, 9.22068466e-09, 0.634448946, 1.86370963e-09, -0.772964776),
      MonName = "Brute"
    }
  elseif MyLevel >= 60 and MyLevel <= 74 then
    return {
      QuestName = "DesertQuest",
      QuestLevel = 1,
      QuestTitle = "Defeat 8 Desert Bandits",
      QuestCFrame = CFrame.new(918.621643, 5.97015429, 4205.06396, 0.460304826, 3.51166527e-08, -0.887760937, -9.5817585e-09, 1, 3.45882789e-08, 0.887760937, -7.41484163e-09, 0.460304826),
      MonCFrame = CFrame.new(849.709167, 24.5362835, 4492.87354, -0.396440089, -1.30420768e-08, -0.918060601, 2.91968205e-09, 1, -1.54669042e-08, 0.918060601, -8.81214568e-09, -0.396440089),
      MonName = "Desert Bandit"
    }
  elseif MyLevel >= 75 then
    return {
      QuestName = "DesertQuest",
      QuestLevel = 2,
      QuestTitle = "Defeat 6 Desert Officers",
      QuestCFrame = CFrame.new(918.621643, 5.97015429, 4205.06396, 0.460304826, 3.51166527e-08, -0.887760937, -9.5817585e-09, 1, 3.45882789e-08, 0.887760937, -7.41484163e-09, 0.460304826),
      MonCFrame = CFrame.new(1604.82422, 32.2997437, 4084.09985, -0.695431113, 1.08753611e-08, 0.718592763, -2.8935343e-09, 1, -1.79345179e-08, -0.718592763, -1.45514951e-08, -0.695431113),
      MonName = "Desert Officer"
    }
  end
end
return Module
