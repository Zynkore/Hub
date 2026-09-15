repeat task.wait(0.25) until game:IsLoaded()

local GameToJoin = 6250795236
if game.PlaceId == GameToJoin then -- :3
  local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/tlredz/Library/refs/heads/main/redz-V5-remake/main.luau'))()
  
  local Window = Library:MakeWindow({
    Title = 'Zynkore Hub : SNK:Rumbling',
    SubTitle = 'By zynkore',
    ScriptFolder = 'SNK-Rumbling'
  })
  
  -- Services
  local plr = (cloneref and cloneref(game:GetService('Players')) or game:GetService('Players'))
  local WS = (cloneref and cloneref(game:GetService('Workspace')) or game:GetService('Workspace'))
  local RST = (cloneref and cloneref(game:GetService('ReplicatedStorage')) or game:GetService('ReplicatedStorage'))
  
  -- LocalPlayer
  local LP = plr.LocalPlayer
  local Char = LP.Character or LP.CharacterAdded:Wait()
  local HRP = Char:WaitForChild('HumanoidRootPart')
  local Humanoid = Char:WaitForChild('Humanoid')
  LP.CharacterAdded:Connect(function(V)
    Char = V
    HRP = V:WaitForChild('HumanoidRootPart')
    Humanoid = V:WaitForChild('Humanoid')
  end)
  local PlayerGui = LP:WaitForChild('PlayerGui')
  local StarterGui = (cloneref and cloneref(game:GetService('StarterGui')) or game:GetService('StarterGui'))
  local PConnect = nil
  LP.ChildAdded:Connect(function(Obj)
    if Obj.Name == 'PlayerGui' then
      PlayerGui = LP:WaitForChild('PlayerGui')
      if PConnect then
        PConnect:Disconnect()
        PConnect = nil
      end
      PConnect = PlayerGui.ChildAdded:Connect(function(Object)
        if Object.Name == 'Base' then
          BaseGui = Obj:WaitForChild('Base')
          if Object:WaitForChild('HumanoBotao') then
            HumanoBotao = Object:WaitForChild('HumanoBotao')
          end
        end
      end)
    end
  end)
  local BaseGui = PlayerGui:WaitForChild('Base')
  local HumanoBotao = BaseGui:WaitForChild('HumanoBotao')
  PConnect = PlayerGui.ChildAdded:Connect(function(Object)
    if Object.Name == 'Base' then
      BaseGui = PlayerGui:WaitForChild('Base')
      if Object:WaitForChild('HumanoBotao') then
        HumanoBotao = Object:WaitForChild('HumanoBotao')
      end
    end
  end)
  
  -- Modules
  local TweenModule = loadstring(game:HttpGet('https://raw.githubusercontent.com/Zynkore/Hub/refs/heads/main/Modules/Universal/TweenModule.luau'))()
  TweenModule:SetGameMode('R15')
  
  -- RemoteEvent
  local GrabEV = RST:WaitForChild('Remoted'):WaitForChild('Aleatorio'):WaitForChild('GrabEV')
  local RainRemoted = RST:WaitForChild('Remoted'):WaitForChild('Climate'):WaitForChild('Rain'):WaitForChild('RainRemoted')
  local CordenateMessage = RST:WaitForChild("Remoted"):WaitForChild("GlobalMessage"):WaitForChild("CordenateMessage")
  local ComprouEV = RST:WaitForChild("Remoted"):WaitForChild("Loja"):WaitForChild("ComprouEV")
  
  -- Map
  local ItemFolder = WS:WaitForChild('Mapa'):WaitForChild('Itens')
  
  local MainTab = Window:MakeTab({'Main', 'Home'})
  MainTab:AddSection('ODM')
  
  local Odm_inf_gas = nil
  MainTab:AddToggle({
    Name = 'Infinite gas',
    Default = false,
    Flag = 'Odm_inf_gas',
    Callback = function(V)
      if V then
        LP:SetAttribute('Gas_Odm', math.huge)
        Odm_inf_gas = LP:GetAttributeChangedSignal('Gas_Odm'):Connect(function()
          LP:SetAttribute('Gas_Odm', math.huge)
        end)
      else
        if Odm_inf_gas then
          Odm_inf_gas:Disconnect()
          Odm_inf_gas = nil
        end
        LP:SetAttribute('Gas_Odm', 150)
      end
    end
  })
  MainTab:AddSection('Titan')
  
  function GetNearestPlayer(IsTitan, Seat)
    local MinDist = math.huge
    local Nearest = nil
    
    for _, p in pairs(game.Players:GetPlayers()) do
      if p and p ~= LP then
        if p.Character and p.Character:FindFirstChild('Humanoid') and p.Character.Humanoid.Health >= 1 then
          if Char and Humanoid and Humanoid.Health >= 1 then
            if p.Character:FindFirstChild('HumanoidRootPart') and HRP then
              if p:GetAttribute('Titan') == IsTitan or false and p.Character:FindFirstChild('Humanoid').Sit == Seat or false then
                if (p.Character:FindFirstChild('HumanoidRootPart').Position - HRP.Position).Magnitude < MinDist then
                  MinDist = (p.Character:FindFirstChild('HumanoidRootPart').Position - HRP.Position).Magnitude
                  Nearest = p
                end
              end
            end
          end
        end
      end
    end
    
    return Nearest or nil
  end
  
  MainTab:AddButton({
    Name = 'Grab nearest player',
    Description = "Only if you're a Titan and the target is human.",
    Debounce = 0.5,
    Callback = function()
      if LP:GetAttribute('Titan') == true then
        local NearestP = GetNearestPlayer(false)
        if NearestP ~= nil then
          if NearestP:GetAttribute('Grabed') == false and LP:GetAttribute('TitanGraber') == false then
            Args = {
              'Grab',
              NearestP.Character:WaitForChild('Humanoid'),
              'AbacateUI'
            }
            GrabEV:FireServer(unpack(Args))
          else
            Window:Notify({
              Title = 'Alert',
              Content = 'Target grabed!.',
              Image = 'rbxassetid://10734953451',
              Duration = 3
            })
          end
        else
          Window:Notify({
            Title = 'Alert',
            Content = "Couldn't find a target.",
            Image = 'rbxassetid://10734953451',
            Duration = 3
          })
        end
      else
        Window:Notify({
          Title = 'Alert',
          Content = 'Please transform.',
          Image = 'rbxassetid://10734953451',
          Duration = 3
        })
      end
    end
  })
  
  local Auto_grab_player = false
  MainTab:AddToggle({
    Name = 'Auto grab nearest player',
    Description = "Only if you're a Titan and the target is human.",
    Default = false,
    Flag = 'Auto_grab_player',
    Callback = function(V)
      Auto_grab_player = V
      if V then
        while Auto_grab_player do
          if Auto_grab_player == false then
            break
          end
          if Char and Char:WaitForChild('Humanoid').Health >= 1 then
            if LP:GetAttribute('Titan') == true then
              local NearestP = GetNearestPlayer(false, false)
              if NearestP ~= nil then
                if LP:GetAttribute('TitanGraber') == false then
                  if LP:GetAttribute('Grabed') == false then
                    Args = {
                      'Grab',
                      NearestP.Character:WaitForChild('Humanoid'),
                      'AbacateUI'
                    }
                    GrabEV:FireServer(unpack(Args))
                  else
                    Window:Notify({
                      Title = 'Info',
                      Content = 'Waiting to release',
                      Image = 'rbxassetid://10734953451',
                      Duration = 0.63
                    })
                  end
                else
                  Window:Notify({
                    Title = 'Info',
                    Content = 'Waiting to drop or eat player',
                    Image = 'rbxassetid://10734953451',
                    Duration = 0.63
                  })
                end
              else
                Window:Notify({
                  Title = 'Info',
                  Content = "Couldn't find a target.",
                  Image = 'rbxassetid://10734953451',
                  Duration = 0.63
                })
              end
            else
              Window:Notify({
                Title = 'Alert',
                Content = 'Please transform.',
                Image = 'rbxassetid://10734953451',
                Duration = 0.63
              })
            end
          else
            Window:Notify({
              Title = 'Info',
              Content = 'Waiting for respawn.',
              Image = 'rbxassetid://10734953451',
              Duration = 0.63
            })
          end
          task.wait(0.63)
        end
      end
    end
  })
  
  local Auto_eat_player = false
  MainTab:AddToggle({
    Name = 'Auto eat player',
    Description = "Only if you're a Titan.",
    Default = false,
    Flag = 'Auto_eat_player',
    Callback = function(V)
      Auto_eat_player = V
      while Auto_eat_player do
        if Auto_eat_player == false then
          break
        end
        if LP:GetAttribute('TitanGraber') == true then
          local Args = {
            'Eat',
            {},
            'AbacateUI'
          }
          GrabEV:FireServer(unpack(Args))
        end
        task.wait(0.15)
      end
    end
  })
  
  local No_transform_cooldown = nil
  MainTab:AddToggle({
    Title = 'No transform cooldown',
    Description = 'Only knife.',
    Default = false,
    Flag = 'No_transform_cooldown',
    Callback = function(V)
      if V then
        if LP:GetAttribute('KnifeTransform') == false then
          LP:SetAttribute('KnifeTransform', true)
        end
        No_transform_cooldown = LP:GetAttributeChangedSignal('KnifeTransform'):Connect(function()
          LP:SetAttribute('KnifeTransform', true)
        end)
      else
        if No_transform_cooldown then
          No_transform_cooldown:Disconnect()
          No_transform_cooldown = nil
        end
      end
    end
  })

  local No_unshift_cooldown = false
  MainTab:AddToggle({
    Title = 'No unshift cooldown',
    Description = 'Only Titan.',
    Default = false,
    Flag = 'No_unshift_cooldown',
    Callback = function(V)
      No_unshift_cooldown = V
      while No_unshift_cooldown do
        HumanoBotao.BackgroundTransparency = 0.5
        HumanoBotao.TextTransparency = 0
        HumanoBotao.AutoButtonColor = true
        HumanoBotao.Active = true
        task.wait(0.25)
      end
    end
  })
  MainTab:AddSection('Rain')
  
  MainTab:AddButton({
    Name = 'Start rain',
    Debounce = 0.5,
    Callback = function()
      firesignal(RainRemoted.OnClientEvent,
        'Start_Rain'
      )
    end
  })
  
  MainTab:AddButton({
    Name = 'Stop rain',
    Debounce = 0.5,
    Callback = function()
      firesignal(RainRemoted.OnClientEvent, 
        'Stop_Rain'
      )
    end
  })
  
  local LocalPlayerTab = Window:MakeTab({'Local player', 'User'})
  LocalPlayerTab:AddSection('Local player')
  
  local OriginalPlayerSpeed = 16
  local PlayerSpeed = 16
  
  
  
  local NoclipParts = {}
  local Noclip = false
  LocalPlayerTab:AddToggle({
    Title = 'Noclip',
    Default = false,
    Flag = 'Noclip',
    Callback = function(V)
      Noclip = V
      if V then
        while Noclip do
          for _, Part in pairs(Char:GetDescendants()) do
            if Part:IsA('BasePart') then
              if Part.CanCollide == true then
                NoclipParts[Part.Name] = Part.CanCollide
                Part.CanCollide = false
              end
            end
          end
          task.wait(0.25)
        end
      else
        if Noclip == false then
          for _, Part in pairs(Char:GetDescendants()) do
            if Part:IsA('BasePart') then
              for name, Value in pairs(NoclipParts) do
                if Part.Name == name then
                  Part.CanCollide = Value
                end
              end
            end
          end
        end
        NoclipParts = {}
      end
    end
  })
  
  local ItemTab = Window:MakeTab({'Item', 'Hammer'})
  ItemTab:AddSection('Proximity prompt')
  
  ItemTab:AddButton({
    Name = 'No proximity prompt cooldown',
    Debounce = 0.5,
    Callback = function()
      for _, pp in pairs(WS:GetDescendants()) do
        if pp:IsA('ProximityPrompt') then
          pp.HoldDuration = 0
        end
      end
    end
  })
  ItemTab:AddSection('Item info')
  
  local ItemInfo = ItemTab:AddParagraph('Item spawned', 'Jaw air drop: ❌\nAmmo: ❌\nScrewdriver: ❌\nGasoline: ❌\nHammer: ❌\nCoal: ❌')
  
  function StartItemInfoUpdate()
    while true do
      local ItemTable = {}
      if WS:FindFirstChild('JawAirDrop') then
        ItemTable['JawAirDrop'] = true
      elseif not WS:FindFirstChild('JawAirDrop') then
        ItemTable['JawAirDrop'] = false
      end
      
      if ItemFolder:FindFirstChild('Ammo') then
        ItemTable['Ammo'] = true
      elseif not ItemFolder:FindFirstChild('Ammo') then
        ItemTable['Ammo'] = false
      end
      
      if ItemFolder:FindFirstChild('Screwdriver') then
        ItemTable['Screwdriver'] = true
      elseif not ItemFolder:FindFirstChild('Screwdriver') then
        ItemTable['Screwdriver'] = false
      end
      
      if ItemFolder:FindFirstChild('Gasoline') then
        ItemTable['Gasoline'] = true
      elseif not ItemFolder:FindFirstChild('Gasoline') then
        ItemTable['Gasoline'] = false
      end
      
      if ItemFolder:FindFirstChild('Hammer') then
        ItemTable['Hammer'] = true
      elseif not ItemFolder:FindFirstChild('Hammer') then
        ItemTable['Hammer'] = false
      end
      
      if ItemFolder:FindFirstChild('Coal') then
        ItemTable['Coal'] = true
      elseif not ItemFolder:FindFirstChild('Coal') then
        ItemTable['Coal'] = false
      end
      
      ItemInfo:SetDescription('Jaw air drop: ' .. (ItemTable.JawAirDrop and '✅' or '❌') .. '\nAmmo: ' .. (ItemTable.Ammo and '✅' or '❌') .. '\nScrewdriver: ' .. (ItemTable.Screwdriver and '✅' or '❌') .. '\nGasoline: ' .. (ItemTable.Gasoline and '✅' or '❌') .. '\nHammer: ' .. (ItemTable.Hammer and '✅' or '❌') .. '\nCoal: ' .. (ItemTable.Coal and '✅' or '❌'))
      task.wait(1)
    end
  end
  ItemTab:AddSection('Item in map')
  
  local SelectedItem = 'Ammo'
  ItemTab:AddDropdown({
    Name = 'Select item',
    MultiSelect = false,
    Options = {'Ammo', 'Screwdriver', 'Gasoline', 'Hammer', 'Coal'},
    Default = 'Ammo',
    Flag = 'SelectedItem',
    Callback = function(V)
      SelectedItem = V
    end
  })
  
  local TeleportMode = 'Teleport'
  local TweenSpeed = 170
  ItemTab:AddButton({
    Name = 'Get item',
    Debounce = 0.5,
    Callback = function()
      local ItemsOfType = {}
      for _, Item in pairs(ItemFolder:GetChildren()) do
        if Item:IsA('Model') and Item.Name == SelectedItem then
          table.insert(ItemsOfType, Item)
        end
      end

      if #ItemsOfType == 0 then
        Window:Notify({
          Title = 'Alert',
          Content = 'Item not found.',
          Image = 'rbxassetid://10734953451',
          Duration = 4
        })
        return
      end

      local MinDist = math.huge
      local NearestItem = nil
      for _, Item in ipairs(ItemsOfType) do
        local Dist = (Item:GetPivot().Position - HRP.Position).Magnitude
        if Dist < MinDist then
          MinDist = Dist
          NearestItem = Item
        end
      end

      if not NearestItem then
        return
      end

      while NearestItem.Parent do
        if TeleportMode == 'Teleport' then
          if TweenModule:GetActiveTween() then
            TweenModule:CancelTween()
          end
          HRP.CFrame = NearestItem:GetPivot()
          fireproximityprompt(NearestItem:WaitForChild('ProximityPrompt'), 1)
        elseif TeleportMode == 'Tween' then
          if LP:GetAttribute('Titan') == false then
            TweenModule:TweenTo({
              CFrame = NearestItem:GetPivot() + Vector3.new(0, 4.5, 0),
              Speed = TweenSpeed
            })
          else
            TweenModule:TweenTo({
              CFrame = NearestItem:GetPivot(),
              Speed = TweenSpeed
            })
          end
          
          if TweenModule:GetActiveTween() == nil then
            return
          end
          
          if (NearestItem:GetPivot().Position - HRP.Position).Magnitude < 10 then
            fireproximityprompt(NearestItem:WaitForChild('ProximityPrompt'), 1)
          end
        end
        task.wait(0.25)
      end
    end
  })

  local TeleportTab = Window:MakeTab({'Telport', 'Map'})
  TeleportTab:AddSection('Teleport ( Map )')
  
  local TeleportPos = CFrame.new(-108.688034, 259.693909, -4785.80518, 0.99932152, -4.69233052e-09, -0.03683047, 4.62053418e-09, 1, -2.03449302e-09, 0.03683047, 1.86293625e-09, 0.99932152)
  TeleportTab:AddDropdown({
    Title = 'Map position',
    MultiSelect = false,
    Options = {'Ammo ( Rumbling )'},
    Default = 'Ammo ( Rumbling )',
    Flag = 'TeleportPos',
    Callback = function(V)
      if V == 'Ammo ( Rumbling )' then
        TeleportPos = CFrame.new(-108.688034, 259.693909, -4785.80518, 0.99932152, -4.69233052e-09, -0.03683047, 4.62053418e-09, 1, -2.03449302e-09, 0.03683047, 1.86293625e-09, 0.99932152)
      end
    end
  })

  TeleportTab:AddButton({
    Title = 'Teleport to position',
    Callback = function()
      if TeleportMode == 'Teleport' then
        HRP.CFrame = TeleportPos
      elseif TeleportMode == 'Tween' then
        if TweenModule:GetActiveTween() then
          TweenModule:CancelTween()
        end
        TweenModule:TweenTo({
          CFrame = TeleportPos,
          Speed = TweenSpeed
        })
      end
    end
  })
  
  TeleportTab:AddButton({
    Title = 'Cancel any tween',
    Callback = function()
      if TweenModule:GetActiveTween() then
        TweenModule:CancelTween()
      end
    end
  })

  local ShopTab = Window:MakeTab({'Shop', 'shoppingcart'})
  ShopTab:AddSection('Skin')
  
  local Auto_buy_1_skin = false
  ShopTab:AddToggle({
    Title = 'Auto buy 1 skin',
    Default = false,
    Flag = 'Auto_buy_1_skin',
    Callback = function(V)
      Auto_buy_1_skin = V
      while Auto_buy_1_skin do
        ComprouEV:FireServer('1 Skin Spin')
        task.wait(0.25)
      end
    end
  })

  local Auto_buy_10_skin = false
  ShopTab:AddToggle({
    Title = 'Auto buy 10 skin',
    Default = false,
    Flag = 'Auto_buy_10_skin',
    Callback = function(V)
      Auto_buy_10_skin = V
      while Auto_buy_1_skin do
        ComprouEV:FireServer('10 Skin Spin')
        task.wait(0.25)
      end
    end
  })

  ShopTab:AddButton({
    Title = 'Buy 1 skin',
    Debounce = 0.5,
    Callback = function()
      ComprouEV:FireServer('1 Skin Spin')
    end
  })

  ShopTab:AddButton({
    Title = 'Buy 10 skin',
    Debounce = 0.5,
    Callback = function()
      ComprouEV:FireServer('10 Skin Spin')
    end
  })

  local MessageTab = Window:MakeTab({'Message', 'square'})
  MessageTab:AddSection('Global message')
  
  local MessageText = 'Hello'
  MessageTab:AddTextBox({
    Title = 'Message text',
    Default = 'Hello',
    Placeholder = 'Enter a text',
    ClearOnFocus = false,
    Flag = 'MessageText',
    Callback = function(V)
      MessageText = V
    end
  })

  MessageTab:AddButton({
    Title = 'Send message',
    Callback = function()
      CordenateMessage:FireServer(MessageText)
    end
  })
  
  local SettingsTab = Window:MakeTab({'Settings', 'Settings'})
  SettingsTab:AddSection('Teleport settings')
  
  SettingsTab:AddDropdown({
    Title = 'Teleport mode',
    MultiSelect = false,
    Options = {'Teleport', 'Tween'},
    Default = 'Teleport',
    Flag = 'TeleportMode',
    Callback = function(V)
      TeleportMode = V
    end
  })
  
  SettingsTab:AddSlider({
    Title = 'Tween speed',
    Min = 25,
    Max = 250,
    Increment = 1,
    Default = 170,
    Flag = 'TweenSpeed',
    Callback = function(V)
      TweenSpeed = V
    end
  })
  
  SettingsTab:AddDropdown({
    Title = 'Hub language',
    MultiSelect = false,
    Options = {'EN', 'PT-BR'},
    Default = 'EN',
    Flag = 'SelectedLanguage',
    Callback = function(V)
      if V == 'EN' then
        
      elseif V == 'PT-BR' then
        
      end
    end
  })
  
  Window:Notify({
    Title = 'Notification',
    Content = 'Library and hub loaded!',
    Image = 'rbxassetid://10734953451',
    Duration = 4
  })
  StartItemInfoUpdate()
else
  print('Join game: ', GameToJoin)
end
