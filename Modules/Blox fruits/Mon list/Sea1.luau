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
  elseif MyLevel >= 75 and MyLevel <= 89 then
    return {
      QuestName = "DesertQuest",
      QuestLevel = 2,
      QuestTitle = "Defeat 6 Desert Officers",
      QuestCFrame = CFrame.new(918.621643, 5.97015429, 4205.06396, 0.460304826, 3.51166527e-08, -0.887760937, -9.5817585e-09, 1, 3.45882789e-08, 0.887760937, -7.41484163e-09, 0.460304826),
      MonCFrame = CFrame.new(1604.82422, 32.2997437, 4084.09985, -0.695431113, 1.08753611e-08, 0.718592763, -2.8935343e-09, 1, -1.79345179e-08, -0.718592763, -1.45514951e-08, -0.695431113),
      MonName = "Desert Officer"
    }
  elseif MyLevel >= 90 and MyLevel <= 99 then
    return {
      QuestName = "SnowQuest",
      QuestLevel = 1,
      QuestTitle = "Defeat 7 Snow Bandits",
      QuestCFrame = CFrame.new(1397.05127, 78.1017609, -1308.61316, 0.613278389, 6.19385716e-08, -0.789866865, -2.07908162e-08, 1, 6.22738057e-08, 0.789866865, -2.17691998e-08, 0.613278389),
      MonCFrame = CFrame.new(1409.28931, 98.235733, -1345.54419, 0.685011029, -6.11849416e-08, 0.728532732, 2.63858557e-09, 1, 8.15028329e-08, -0.728532732, -5.39080425e-08, 0.685011029),
      MonName = "Snow Bandit"
    }
  elseif MyLevel >= 100 and MyLevel <= 119 then
    return {
      QuestName = "SnowQuest",
      QuestLevel = 2,
      QuestTitle = "Defeat 8 Snowmans",
      QuestCFrame = CFrame.new(1397.05127, 78.1017609, -1308.61316, 0.613278389, 6.19385716e-08, -0.789866865, -2.07908162e-08, 1, 6.22738057e-08, 0.789866865, -2.17691998e-08, 0.613278389),
      MonCFrame = CFrame.new(1204.96814, 111.984756, -1577.62793, 0.744608521, -7.05700529e-08, 0.66750145, 4.07791205e-08, 1, 6.02329422e-08, -0.66750145, -1.76298407e-08, 0.744608521),
      MonName = "Snowman"
    }
  elseif MyLevel >= 120 and MyLevel <= 149 then
    return {
      QuestName = "MarineQuest2",
      QuestLevel = 1,
      QuestTitle = "Defeat 8 Chief Petty Officers",
      QuestCFrame = CFrame.new(-4698.49756, 5.95408297, 4223.32764, -0.984895825, 9.75294956e-10, 0.173147887, 1.73589931e-09, 1, 4.24137481e-09, -0.173147887, 4.4778794e-09, -0.984895825),
      MonCFrame = CFrame.new(-4827.93311, 25.3921242, 4274.28955, 0.534880698, -2.95744484e-10, -0.844927609, -3.3768941e-09, 1, -2.48776333e-09, 0.844927609, 4.18388746e-09, 0.534880698),
      MonName = "Chief Petty Officer"
    }
  elseif MyLevel >= 150 and MyLevel <= 174 then
    return {
      QuestName = "SkyQuest",
      QuestLevel = 1,
      QuestTitle = "Defeat 7 Sky Bandits",
      QuestCFrame = CFrame.new(-5402.5625, 410.802032, -696.504333, -0.656015694, -5.43260725e-08, 0.754747272, -3.72416338e-08, 1, 3.96092545e-08, -0.754747272, -2.12372986e-09, -0.656015694),
      MonCFrame = CFrame.new(-5119.0459, 375.269836, -1089.03052, -0.99984628, -2.55593626e-08, 0.0175328515, -2.47454786e-08, 1, 4.6637421e-08, -0.0175328515, 4.61963943e-08, -0.99984628),
      MonName = "Sky Bandit"
    }
  elseif MyLevel >= 175 and MyLevel <= 189 then
    return {
      QuestName = "SkyQuest",
      QuestLevel = 2,
      QuestTitle = "Defeat 8 Dark Masters",
      QuestCFrame = CFrame.new(-5402.5625, 410.802032, -696.504333, -0.656015694, -5.43260725e-08, 0.754747272, -3.72416338e-08, 1, 3.96092545e-08, -0.754747272, -2.12372986e-09, -0.656015694),
      MonCFrame = CFrame.new(-5399.53662, 510.711365, -279.90683, 0.567566276, -1.5923689e-08, -0.82332772, -1.15979903e-09, 1, -2.01401598e-08, 0.82332772, 1.23857697e-08, 0.567566276),
      MonName = "Dark Master"
    }
  elseif MyLevel >= 190 and MyLevel >= 209 then
    return {
      QuestName = "PrisonerQuest",
      QuestLevel = 1,
      QuestTitle = "Defeat 8 Prisoners",
      QuestCFrame = CFrame.new(5203.16406, 19.6239586, 736.721924, 0.0288513508, -2.17757847e-08, -0.999583721, 5.35497779e-09, 1, -2.16302904e-08, 0.999583721, -4.72868544e-09, 0.0288513508),
      MonCFrame = CFrame.new(5165.35059, 85.4458008, 500.826111, 0.437378407, -2.05616431e-08, -0.899277568, 2.36835209e-08, 1, -1.13457537e-08, 0.899277568, -1.63356706e-08, 0.437378407),
      MonName = "Prisoner"
    }
  elseif MyLevel >= 210 then
    return {
      QuestName = "PrisonerQuest",
      QuestLevel = 2,
      QuestTitle = "Defeat 8 Dangerous Prisoners",
      QuestCFrame = CFrame.new(5203.16406, 19.6239586, 736.721924, 0.0288513508, -2.17757847e-08, -0.999583721, 5.35497779e-09, 1, -2.16302904e-08, 0.999583721, -4.72868544e-09, 0.0288513508),
      MonCFrame = CFrame.new(5422.4248, 52.5919495, 1002.87952, 0.685022712, -2.83732216e-09, 0.728521705, -6.56876296e-08, 1, 6.56601458e-08, -0.728521705, -9.28335524e-08, 0.685022712),
      MonName = "Dangerous Prisoner"
    }
  end
end
return Module
