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

local autoGreenEnabled = false

local Toggle = LegitTab:CreateToggle({
    Name = "AutoGreen",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        autoGreenEnabled = Value
    end,
})

local u = game:GetService("UserInputService")
local v = game:GetService("VirtualInputManager")

local tK = Enum.KeyCode.Q
local hK = Enum.KeyCode.E
local hD = 0.335

local function sKP(k, d)
    v:SendKeyEvent(true, k, false, game)
    wait(d)
    v:SendKeyEvent(false, k, false, game)
end

local function oKP(i, g)
    if g then return end
    if i.KeyCode == tK and autoGreenEnabled then
        sKP(hK, hD)
    end
end

u.InputBegan:Connect(oKP)
-------------------------------------------------

local LegitSection = LegitTab:CreateSection("Shift Teleport")

local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
local h = c:WaitForChild("Humanoid")
local u = game:GetService("UserInputService")

local d = 0
local m = 0.1

local function t(dir)
    local r = c:WaitForChild("HumanoidRootPart")
    local n = r.Position + dir * d
    r.CFrame = CFrame.new(n)
end

u.InputBegan:Connect(function(i)
    if i.KeyCode == Enum.KeyCode.LeftShift or i.KeyCode == Enum.KeyCode.RightShift then
        local dir = h.MoveDirection
        if dir.magnitude > m then
            dir = dir.Unit * Vector3.new(dir.X, 0, dir.Z).Magnitude
            t(dir)
        end
    end
end)

u.InputEnded:Connect(function(i)
    if i.KeyCode == Enum.KeyCode.LeftShift or i.KeyCode == Enum.KeyCode.RightShift then
        -- Code for when Shift is released (if needed)
    end
end)

local Slider = LegitTab:CreateSlider({
    Name = "ShiftTeleport Recommended - (0.5)",
    Range = {0, 5},
    Increment = 0.1,
    Suffix = "Teleport",
    CurrentValue = 0,
    Flag = "Slider1",
    Callback = function(v)
        d = v
    end,
})

-------------------------------------------------

local BlatantTab = Window:CreateTab("Blatant", nil)
local Section = BlatantTab:CreateSection("AutoBlock")

-------------------------------------------------

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
-------------------------------------------------

local Section = BlatantTab:CreateSection("Teleporting to the ball")

-------------------------------------------------

local p = game.Players.LocalPlayer
local u = game:GetService("UserInputService")
local d = 50  -- Max distance
local k = Enum.KeyCode.F  -- Teleport key
local t = false  -- TeleportToBall toggle

-- Find the nearest basketball
local function gNB()
    local c = p.Character or p.CharacterAdded:Wait()
    local h = c:WaitForChild("HumanoidRootPart")
    local b, minDist = nil, math.huge
    for _, o in pairs(workspace:GetChildren()) do
        if o:IsA("BasePart") and o.Name == "Basketball" then
            local dist = (o.Position - h.Position).Magnitude
            if dist < minDist then
                minDist = dist
                b = o
            end
        end
    end
    return b, minDist
end

-- Teleport to the nearest basketball
local function tTB()
    local b, dist = gNB()
    if b and dist <= d then
        local c = p.Character or p.CharacterAdded:Wait()
        local h = c:WaitForChild("HumanoidRootPart")
        local hum = c:FindFirstChildOfClass("Humanoid")
        if hum and hum.Sit then hum.Sit = false end
        for _, p in ipairs(c:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
        h.Velocity = Vector3.new()
        h.CFrame = b.CFrame
        wait(0.1)
        for _, p in ipairs(c:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = true end
        end
    end
end

-- Toggle for teleport to ball
local Toggle = BlatantTab:CreateToggle({
    Name = "Teleport To Ball | F",
    CurrentValue = false,
    Flag = "T2",
    Callback = function(v)
        t = v
    end,
})

-- Listen for key press
u.InputBegan:Connect(function(i)
    if i.KeyCode == k and t then
        tTB()
    end
end)


-------------------------------------------------

local Section = BlatantTab:CreateSection("PhaseTeleportation")

-------------------------------------------------

local p = game.Players.LocalPlayer
local u = game:GetService("UserInputService")

local v = false  -- Phase toggle value
local k = Enum.KeyCode.J  -- Phase key

-- Handle the Phase feature
local function Ph(i, g)
    if not p.Character or g then return end
    local sP = p.Character:FindFirstChild("SavedPosition")
    if i.KeyCode == k and v then
        if sP then
            p.Character:SetPrimaryPartCFrame(CFrame.new(sP.Value))
            sP:Destroy()
        else
            local sp = Instance.new("Vector3Value", p.Character)
            sp.Name = "SavedPosition"
            sp.Value = p.Character.PrimaryPart.Position
        end
    end
end

-- Toggle for the Phase feature
local PhaseToggle = BlatantTab:CreateToggle({
    Name = "Phase",
    CurrentValue = false,
    Flag = "T3",
    Callback = function(val)
        v = val
    end,
})

-- Listen for key presses
u.InputBegan:Connect(Ph)


-------------------------------------------------

local OtherTab = Window:CreateTab("Other", nil)
local Section = OtherTab:CreateSection("FovChanger")

-------------------------------------------------

local c = workspace.CurrentCamera
local f = c.FieldOfView

local Input = OtherTab:CreateInput({
    Name = "FOV",
    PlaceholderText = "Enter FOV",
    Callback = function(t)
        local n = tonumber(t)
        if n and n > 0 then
            f = n
            c.FieldOfView = f
        end
    end,
})

game:GetService("RunService").RenderStepped:Connect(function()
    if c.FieldOfView ~= f then
        c.FieldOfView = f
    end
end)
-------------------------------------------------


