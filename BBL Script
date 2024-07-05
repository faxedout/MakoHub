local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create Window
local Window = Rayfield:CreateWindow({
   Name = "BasketBall Legends Script",
   LoadingTitle = "MakoHub",
   LoadingSubtitle = "By Fax",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Rein"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "BasketBall Legends KeySystem",
      Subtitle = "Key In Discord Server",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

--LEGIT
local LegitTab = Window:CreateTab("Legit", nil) -- Title, Image
local LegitSection = LegitTab:CreateSection("AutoGreen")

-- Initialize the autoGreenEnabled variable
local autoGreenEnabled = false

-- Create Toggle
local Toggle = LegitTab:CreateToggle({
   Name = "AutoGreen",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      autoGreenEnabled = Value
   end,
})

-- Services
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- Variables
local triggerKey = Enum.KeyCode.Q
local holdKey = Enum.KeyCode.E
local holdDuration = 0.335

-- Function to simulate pressing and holding the 'E' key
local function simulateKeyPress(key, duration)
    VirtualInputManager:SendKeyEvent(true, key, false, game)
    wait(duration)
    VirtualInputManager:SendKeyEvent(false, key, false, game)
end

-- Event listener for key press
local function onKeyPress(input, gameProcessedEvent)
    if gameProcessedEvent then
        return
    end
    
    if input.KeyCode == triggerKey then
        -- Check if the AutoGreen toggle is enabled
        if autoGreenEnabled then
            simulateKeyPress(holdKey, holdDuration)
        end
    end
end

-- Connect the event listener
UserInputService.InputBegan:Connect(onKeyPress)

local LegitSection = LegitTab:CreateSection("Shift Teleport")

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local userInputService = game:GetService("UserInputService")

local TELEPORT_DISTANCE = 0  -- Default value
local MOVEMENT_THRESHOLD = 0.1  -- Adjust this threshold as needed

-- Function to handle teleportation
local function teleport(direction)
    local rootPart = character:WaitForChild("HumanoidRootPart")
    local newPosition = rootPart.Position + direction * TELEPORT_DISTANCE
    rootPart.CFrame = CFrame.new(newPosition)
end

-- Listen for input events
userInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.RightShift then
        local direction = humanoid.MoveDirection
        -- Check if the magnitude of direction vector is greater than the threshold
        if direction.magnitude > MOVEMENT_THRESHOLD then
            direction = direction.Unit * Vector3.new(direction.X, 0, direction.Z).Magnitude
            teleport(direction)
        end
    end
end)

userInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.RightShift then
        -- You can add code here for when Shift is released, if needed
    end
end)

-- Slider to adjust TELEPORT_DISTANCE
local Slider = LegitTab:CreateSlider({
   Name = "ShiftTeleport Recommended - (0.5)",
   Range = {0, 5},
   Increment = 0.1,
   Suffix = "Teleport",
   CurrentValue = 0,  -- Set a default value
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       TELEPORT_DISTANCE = Value
   end,
})

--BLATANT

local BlatantTab = Window:CreateTab("Blatant", nil)
local Section = BlatantTab:CreateSection("AutoBlock")

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local autoblockvalue = false  -- Default value for the AutoBlock toggle
local h = 50  -- Distance threshold for blocking

-- Function for AutoBlock
local function autoblock()
    while autoblockvalue do
        local b = game:GetService("Players")
        local c = b.LocalPlayer 
        local d = c.Character or c.CharacterAdded:Wait()
        local e = d:WaitForChild("HumanoidRootPart")
        local f = "Basketball"
        local g = nil 

        local function i(j)
            local k = nil 
            local l = h 
            for _, m in ipairs(b:GetPlayers()) do 
                if m ~= c and m.Team == c.Team and m.Character and m.Character:FindFirstChild(j) then 
                    local n = (e.Position - m.Character.HumanoidRootPart.Position).magnitude 
                    if n < l then 
                        l = n 
                        k = m 
                    end 
                end 
            end 
            return k 
        end 

        local function o(p)
            if p and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then 
                local q = p.Character:FindFirstChild("HumanoidRootPart")
                local r = (e.Position - q.Position).magnitude 
                if r <= h then 
                    local s = q.Position 
                    local t = q.CFrame.LookVector 
                    local u = s + (t * 3)
                    e.CFrame = CFrame.new(u, s)
                end 
            end 
        end 

        g = i(f)
        if g then o(g) end 
        wait(0.001)
    end 
end

-- Toggle to enable/disable AutoBlock
local Toggle = BlatantTab:CreateToggle({
   Name = "AutoBlock",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       autoblockvalue = Value  -- Update the autoblockvalue based on the toggle
       if Value then
           -- Start AutoBlock function when the toggle is enabled
           spawn(autoblock)
       end
   end,
})

-- Listen for changes to the AutoBlock toggle and update the `autoblockvalue` variable
Toggle.Callback = function(Value)
    autoblockvalue = Value
    if Value then
        -- Start AutoBlock function when the toggle is enabled
        spawn(autoblock)
    end
end

local Section = BlatantTab:CreateSection("Teleporting to the ball")

local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")
local maxDistance = 50  -- Set your desired maximum distance to teleport
local teleportballKey = Enum.KeyCode.F  -- Key to press for teleporting to the ball
local ballteleportvalue = false  -- Default value for the TeleportToBall toggle

-- Function to find the nearest basketball
local function getNearestBasketball()
    local v1 = player
    local v2 = v1.Character or v1.CharacterAdded:Wait()
    local v3 = v2:WaitForChild("HumanoidRootPart")
    local v4 = nil
    local v5 = math.huge
    for v6, v7 in pairs(workspace:GetChildren()) do
        if v7:IsA("BasePart") and v7.Name == "Basketball" then
            local v8 = (v7.Position - v3.Position).Magnitude
            if v8 < v5 then
                v5 = v8
                v4 = v7
            end
        end
    end
    return v4, v5
end

-- Function to teleport to the nearest basketball
local function teleportToBall()
    local v1, v2 = getNearestBasketball()
    if v1 and v2 <= maxDistance then
        local v3 = player
        local v4 = v3.Character or v3.CharacterAdded:Wait()
        local v5 = v4:WaitForChild("HumanoidRootPart")
        local v6 = v4:FindFirstChildOfClass("Humanoid")
        if v6 and v6.Sit then
            v6.Sit = false
        end
        for v10, v11 in ipairs(v4:GetDescendants()) do
            if v11:IsA("BasePart") then
                v11.CanCollide = false
            end
        end
        v5.Velocity = Vector3.new(0, 0, 0)
        v5.CFrame = v1.CFrame
        wait(0.1)
        for v12, v13 in ipairs(v4:GetDescendants()) do
            if v13:IsA("BasePart") then
                v13.CanCollide = true
            end
        end
    end
end

-- Toggle to enable/disable TeleportToBall
local Toggle = BlatantTab:CreateToggle({
   Name = "Teleport To Ball | F",
   CurrentValue = false,
   Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       ballteleportvalue = Value  -- Update the ballteleportvalue based on the toggle
   end,
})

-- Listen for key presses to teleport to the ball if the toggle is enabled
userInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == teleportballKey and not gameProcessed then
        if ballteleportvalue then
            teleportToBall()
        end
    end
end)

local Section = BlatantTab:CreateSection("PhaseTeleportation")

local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")

local PhaseValue = false  -- Default value for the Phase toggle
local phaseKey = Enum.KeyCode.J  -- Key to press for the Phase feature

-- Function to handle the Phase feature
local function Phase(input, gameProcessedEvent)
    local character = player.Character
    if not character or gameProcessedEvent then
        return
    end

    if input.KeyCode == phaseKey and PhaseValue == true then
        local savedPosition = character:FindFirstChild("SavedPosition")
        if savedPosition then
            character:SetPrimaryPartCFrame(CFrame.new(savedPosition.Value))
            savedPosition:Destroy()
        else
            local savedPositionValue = Instance.new("Vector3Value")
            savedPositionValue.Name = "SavedPosition"
            savedPositionValue.Value = character.PrimaryPart.Position
            savedPositionValue.Parent = character
        end
    end
end

-- Toggle to enable/disable Phase feature
local PhaseToggle = BlatantTab:CreateToggle({
   Name = "Phase",
   CurrentValue = false,
   Flag = "Toggle3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       PhaseValue = Value  -- Update the PhaseValue based on the toggle
   end,
})

-- Listen for key presses to activate the Phase feature if the toggle is enabled
userInputService.InputBegan:Connect(Phase)

local OtherTab = Window:CreateTab("Other", nil)
local Section = OtherTab:CreateSection("FovChanger")

local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera

-- Create the Adaptive Input UI component for the FOV Changer
local Input = OtherTab:CreateInput({
   Name = "FOV Changer",
   PlaceholderText = tostring(camera.FieldOfView),  -- Set initial text to current FOV
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
       local newFOV = tonumber(Text)
       if newFOV and newFOV >= 1 and newFOV <= 120 then
           camera.FieldOfView = newFOV
           Input:SetPlaceholderText(tostring(newFOV))  -- Update placeholder text with the new FOV
           saveFOV()  -- Save the FOV setting
       else
           Input:SetPlaceholderText("Invalid FOV! Enter a value between 1 and 120.")
       end
   end,
})

-- Function to save the FOV setting
local function saveFOV()
    local fovSetting = Instance.new("StringValue")
    fovSetting.Name = "FOVSetting"
    fovSetting.Value = tostring(camera.FieldOfView)
    fovSetting.Parent = player:FindFirstChild("PlayerGui")
end

-- Function to load the FOV setting
local function loadFOV()
    local fovSetting = player:FindFirstChild("PlayerGui"):FindFirstChild("FOVSetting")
    if fovSetting then
        local savedFOV = tonumber(fovSetting.Value)
        if savedFOV and savedFOV >= 1 and savedFOV <= 120 then
            camera.FieldOfView = savedFOV
            Input:SetText(tostring(savedFOV))  -- Update the text box with the saved FOV
        end
    end
end

-- Load the FOV when the script starts
loadFOV()

-- Save the FOV when the player leaves the game
player.AncestryChanged:Connect(function(_, parent)
    if not parent then
        saveFOV()
    end
end)
