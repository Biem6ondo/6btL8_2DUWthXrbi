-- Not abridged
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local function findAndTransferGui()
    local player = Players.LocalPlayer
    local playerGui = player:FindFirstChild("PlayerGui")

    if playerGui then
        local hyCMDsGui = playerGui:FindFirstChild("HyCMDs")
        if hyCMDsGui then
            hyCMDsGui.Parent = game:GetService("CoreGui")

            for _, element in pairs(hyCMDsGui:GetDescendants()) do
                if element:IsA("TextBox") or element:IsA("TextButton") then
                    element.BackgroundTransparency = 0.27
                    element.TextTransparency = 0.27
                end
            end
        end
    end
end

RunService.RenderStepped:Connect(findAndTransferGui)

-- Sorry
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MyGUI"
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0.5, 0, 0.5, 0)
Frame.Position = UDim2.new(0.25, 0, 0.25, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Name = "Update"
Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0.1, 0)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.Text = "Update"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextStrokeTransparency = 0.8

local TopCornersFrame = Instance.new("Frame")
TopCornersFrame.Name = "TopCornersFrame"
TopCornersFrame.Parent = Title
TopCornersFrame.Size = UDim2.new(1, 0, 1, 0)
TopCornersFrame.BackgroundColor3 = Title.BackgroundColor3
TopCornersFrame.BorderSizePixel = 0
TopCornersFrame.BackgroundTransparency = 1

local UICornerTop = Instance.new("UICorner")
UICornerTop.CornerRadius = UDim.new(0, 10)
UICornerTop.Parent = TopCornersFrame

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = Frame
CloseButton.Size = UDim2.new(0.1, 0, 0.1, 0)
CloseButton.Position = UDim2.new(0.9, 0, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CloseButton.Text = "❌"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextScaled = true

local UICornerButton = Instance.new("UICorner")
UICornerButton.CornerRadius = UDim.new(0, 10)
UICornerButton.Parent = CloseButton

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Name = "InfoLabel"
InfoLabel.Parent = Frame
InfoLabel.Size = UDim2.new(1, 0, 0.9, 0)
InfoLabel.Position = UDim2.new(0, 0, 0.1, 0)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Text = "-Optimization\n-Fix unexpected errors"
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.TextScaled = true
InfoLabel.TextSize = 5

local DontShowAgainFrame = Instance.new("Frame")
DontShowAgainFrame.Name = "DontShowAgainFrame"
DontShowAgainFrame.Parent = Frame
DontShowAgainFrame.Size = UDim2.new(1, 0, 0.1, 0)
DontShowAgainFrame.Position = UDim2.new(0, 0, 0.9, 0)
DontShowAgainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

local UICornerDontShowAgain = Instance.new("UICorner")
UICornerDontShowAgain.CornerRadius = UDim.new(0, 10)
UICornerDontShowAgain.Parent = DontShowAgainFrame

local YesButton = Instance.new("TextButton")
YesButton.Name = "YesButton"
YesButton.Parent = DontShowAgainFrame
YesButton.Size = UDim2.new(0.5, 0, 1, 0)
YesButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
YesButton.Text = "Dont Show Again (One tap)"
YesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
YesButton.TextScaled = true

local UICornerYes = Instance.new("UICorner")
UICornerYes.CornerRadius = UDim.new(0, 10)
UICornerYes.Parent = YesButton

local UICornerNo = Instance.new("UICorner")
UICornerNo.CornerRadius = UDim.new(0, 10)
UICornerNo.Parent = NoButton

Frame.Position = UDim2.new(0.25, 0, 1, 0)
Frame:TweenPosition(UDim2.new(0.25, 0, 0.25, 0), "Out", "Quad", 0.5)

local Camera = workspace.CurrentCamera
local BlurEffect = Instance.new("BlurEffect")
BlurEffect.Name = "BlurEffect"
BlurEffect.Size = 50
BlurEffect.Parent = Camera

CloseButton.MouseButton1Click:Connect(function()
    Frame:TweenPosition(UDim2.new(0.25, 0, 1, 0), "Out", "Quad", 0.5)
    for i = 50, 0, -10 do
        BlurEffect.Size = i
        wait(0)
    end
    BlurEffect:Destroy()
    wait(0.5)
    ScreenGui:Destroy()
end)

YesButton.MouseButton1Click:Connect(function()
    writefile("V0.1_1.txt", "1")
    CloseButton:MouseButton1Click()
end)


Frame.AncestryChanged:Connect(function()
    if not Frame:IsDescendantOf(ScreenGui) then
        BlurEffect:Destroy()
    end
end)

-- File
if isfile("V0.1_1.txt") then
    local value = readfile("V0.1_1.txt")
    if value == "1" then
        ScreenGui:Destroy()
    end
end

-- Gui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MyGUI"
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0.5, 0, 0.5, 0)
Frame.Position = UDim2.new(0.25, 0, 0.25, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Name = "Hey"
Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0.1, 0)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.Text = "Introduce"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextStrokeTransparency = 0.8

local TopCornersFrame = Instance.new("Frame")
TopCornersFrame.Name = "TopCornersFrame"
TopCornersFrame.Parent = Introduce
TopCornersFrame.Size = UDim2.new(1, 0, 1, 0)
TopCornersFrame.BackgroundColor3 = Title.BackgroundColor3
TopCornersFrame.BorderSizePixel = 0
TopCornersFrame.BackgroundTransparency = 1

local UICornerTop = Instance.new("UICorner")
UICornerTop.CornerRadius = UDim.new(0, 10)
UICornerTop.Parent = TopCornersFrame

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = Frame
CloseButton.Size = UDim2.new(0.1, 0, 0.1, 0)
CloseButton.Position = UDim2.new(0.9, 0, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CloseButton.Text = "❌"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextScaled = true

local UICornerButton = Instance.new("UICorner")
UICornerButton.CornerRadius = UDim.new(0, 10)
UICornerButton.Parent = CloseButton

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Name = "InfoLabel"
InfoLabel.Parent = Frame
InfoLabel.Size = UDim2.new(1, 0, 0.9, 0)
InfoLabel.Position = UDim2.new(0, 0, 0.1, 0)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Text = "Hello! Currently, this script is still risky and unorganized!"
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.TextScaled = true
InfoLabel.TextSize = 5

local DontShowAgainFrame = Instance.new("Frame")
DontShowAgainFrame.Name = "DontShowAgainFrame"
DontShowAgainFrame.Parent = Frame
DontShowAgainFrame.Size = UDim2.new(1, 0, 0.1, 0)
DontShowAgainFrame.Position = UDim2.new(0, 0, 0.9, 0)
DontShowAgainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

local UICornerDontShowAgain = Instance.new("UICorner")
UICornerDontShowAgain.CornerRadius = UDim.new(0, 10)
UICornerDontShowAgain.Parent = DontShowAgainFrame

local YesButton = Instance.new("TextButton")
YesButton.Name = "YesButton"
YesButton.Parent = DontShowAgainFrame
YesButton.Size = UDim2.new(0.5, 0, 1, 0)
YesButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
YesButton.Text = "Dont Show Again (One tap)"
YesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
YesButton.TextScaled = true

local UICornerYes = Instance.new("UICorner")
UICornerYes.CornerRadius = UDim.new(0, 10)
UICornerYes.Parent = YesButton

local UICornerNo = Instance.new("UICorner")
UICornerNo.CornerRadius = UDim.new(0, 10)
UICornerNo.Parent = NoButton

Frame.Position = UDim2.new(0.25, 0, 1, 0)
Frame:TweenPosition(UDim2.new(0.25, 0, 0.25, 0), "Out", "Quad", 0.5)

local Camera = workspace.CurrentCamera
local BlurEffect = Instance.new("BlurEffect")
BlurEffect.Name = "BlurEffect"
BlurEffect.Size = 50
BlurEffect.Parent = Camera

CloseButton.MouseButton1Click:Connect(function()
    Frame:TweenPosition(UDim2.new(0.25, 0, 1, 0), "Out", "Quad", 0.5)
    for i = 50, 0, -10 do
        BlurEffect.Size = i
        wait(0)
    end
    BlurEffect:Destroy()
    wait(0.5)
    ScreenGui:Destroy()
end)

YesButton.MouseButton1Click:Connect(function()
    writefile("DontShowAgain.txt", "1")
    CloseButton:MouseButton1Click()
end)


Frame.AncestryChanged:Connect(function()
    if not Frame:IsDescendantOf(ScreenGui) then
        BlurEffect:Destroy()
    end
end)

-- File
if isfile("DontShowAgain.txt") then
    local value = readfile("DontShowAgain.txt")
    if value == "1" then
        ScreenGui:Destroy()
    end
end

local function checkGuiExists()
    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    return playerGui:FindFirstChild("HyCMDs") ~= nil
end

local function showInitialNotification()
    local starterGui = game:GetService("StarterGui")

    starterGui:SetCore("SendNotification", {
        Title = "Script Executed";
        Text = "The script has been executed successfully.";
        Duration = 5; 
    })
end

local function showAlreadyExecutedNotification()
    local starterGui = game:GetService("StarterGui")

    starterGui:SetCore("SendNotification", {
        Title = "Script is Already Executed!";
        Text = "Please re-join and execute again or Type command: DeleteHyCMDs and execute again!.";
        Duration = 5; 
    })
end

local function checkAndNotify()
    if not checkGuiExists() then
        showInitialNotification()
    else
        showAlreadyExecutedNotification()
    end
end

checkAndNotify()

local function showInviteNotification()
    local starterGui = game:GetService("StarterGui")

    starterGui:SetCore("SendNotification", {
        Title = "It's being fixed now!";
        Text = "This script is not organized and may cause lag or errors! You can enter the help command to join!";
        Duration = 5; 
        Button1 = "Ok";
        Callback = function(result)
            if result == Enum.NotificationButtonState[1] then
            end
        end
    })
end

showInviteNotification()

--Cmd!
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
local textBox = Instance.new("TextBox")
local executeButton = Instance.new("TextButton")
local loadingLabel = Instance.new("TextLabel")
local progressBar = Instance.new("Frame")

screenGui.Name = "HyCMDs"
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

textBox.Parent = screenGui
textBox.Position = UDim2.new(0, 10, 0, 50)
textBox.Size = UDim2.new(0, 200, 0, 50)
textBox.Text = ""
textBox.PlaceholderText = "Enter Command Here!"
textBox.ClearTextOnFocus = false
textBox.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.BorderSizePixel = 0

executeButton.Parent = screenGui
executeButton.Position = UDim2.new(0, 220, 0, 50)
executeButton.Size = UDim2.new(0, 100, 0, 50)
executeButton.Text = "Execute"
executeButton.BackgroundColor3 = Color3.fromRGB(73, 73, 73)
executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

progressBar.Parent = screenGui
progressBar.Position = UDim2.new(0, 10, 1, -60)
progressBar.Size = UDim2.new(0, 200, 0, 10)
progressBar.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
progressBar.BorderSizePixel = 0

local loadingBar = Instance.new("Frame")
loadingBar.Parent = progressBar
loadingBar.Size = UDim2.new(0, 0, 1, 0)
loadingBar.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
loadingBar.BorderSizePixel = 0

loadingLabel.Parent = screenGui
loadingLabel.Position = UDim2.new(0, 10, 1, -70)
loadingLabel.Size = UDim2.new(0, 200, 0, 20)
loadingLabel.Text = "Loading..."
loadingLabel.TextColor3 = Color3.fromRGB(0, 0, 0)

local function animateTextBox()
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true)
    local goal = { BackgroundColor3 = Color3.fromRGB(200, 200, 200) }
    local tween = TweenService:Create(textBox, tweenInfo, goal)
    tween:Play()
end

local function split(str, sep)
    local fields = {}
    local pattern = string.format("([^%s]+)", sep)
    str:gsub(pattern, function(c) fields[#fields + 1] = c end)
    return fields
end
local function findPlayer(name)
    local bestMatch = nil
    local shortestDistance = math.huge
    for _, player in ipairs(Players:GetPlayers()) do
        local distance = string.len(player.Name) - string.len(name)
        if distance < shortestDistance and player.Name:lower():find(name:lower(), 1, true) then
            bestMatch = player
            shortestDistance = distance
        end
    end
    return bestMatch
end

local commands = {
    ["hello"] = function()
        print("hello")
    end,

    ["freeze"] = function(targetName)
        local targetPlayer
        if targetName == "all" then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    targetPlayer = player
                    if targetPlayer and targetPlayer.Character then
                        local character = targetPlayer.Character
                        for _, part in pairs(character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.Anchored = true
                            end
                        end
                    end
                end
            end
        elseif targetName == "friend" then
        elseif targetName == "team" then
        elseif targetName == "me" or targetName == "" then
            targetPlayer = LocalPlayer
        else
            targetPlayer = findPlayer(targetName)
        end

        if targetPlayer and targetPlayer.Character then
            local character = targetPlayer.Character
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Anchored = true
                end
            end
        end
    end,

    ["unfreeze"] = function(targetName)
        local targetPlayer
        if targetName == "all" then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    targetPlayer = player
                    if targetPlayer and targetPlayer.Character then
                        local character = targetPlayer.Character
                        for _, part in pairs(character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.Anchored = false
                            end
                        end
                    end
                end
            end
        elseif targetName == "friend" then
        elseif targetName == "team" then
        elseif targetName == "me" or targetName == "" then
            targetPlayer = LocalPlayer
        else
            targetPlayer = findPlayer(targetName)
        end

        if targetPlayer and targetPlayer.Character then
            local character = targetPlayer.Character
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Anchored = false
                end
            end
        end
    end,

["speed"] = function(speed)
    local player = Players.LocalPlayer
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = tonumber(speed) or 16
        end
    end
end,

["jumppower"] = function(power)
    local player = Players.LocalPlayer
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.JumpPower = tonumber(power) or 50
        end
    end
end,

["fov"] = function(value)
    local camera = workspace.CurrentCamera
    local newFov = tonumber(value)
    
    if newFov and newFov >= 1 and newFov <= 120 then
        camera.FieldOfView = newFov
    else
        print("invalid Fov value!. Invalid value, must be from 1 to 120.")
    end
end,

["reset"] = function()
    local player = Players.LocalPlayer
    if player and player.Character then
        player.Character:BreakJoints()
    end
end,

["exit"] = function()
    game:Shutdown()
end,

["day"] = function()
    local lighting = game:GetService("Lighting")
    lighting.TimeOfDay = "14:00:00"  
end,

["night"] = function()
    local lighting = game:GetService("Lighting")
    lighting.TimeOfDay = "00:00:00"  
end,

["sit"] = function()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.Sit = true
    end
end,

["say"] = function(message)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
end,

["hideguis"] = function()
    local player = game.Players.LocalPlayer
    local playerGui = player:FindFirstChild("PlayerGui")
    if playerGui then
        for _, gui in pairs(playerGui:GetChildren()) do
            if gui:IsA("GuiBase2d") and gui.Name ~= "HyCMDs" then
                gui.Enabled = false
            end
        end
    end
end,

["unhideguis"] = function()
    local player = game.Players.LocalPlayer
    local playerGui = player:FindFirstChild("PlayerGui")
    if playerGui then
        for _, gui in pairs(playerGui:GetChildren()) do
            if gui:IsA("GuiBase2d") and gui.Name ~= "HyCMDs" then
                gui.Enabled = true
            end
        end
    end
end,

["deletealltools"] = function()
    local backpack = game.Players.LocalPlayer.Backpack
    for _, item in ipairs(backpack:GetChildren()) do
        if item:IsA("Tool") then
            item:Destroy()
        end
    end
end,

["givedevtool"] = function()
    local player = game.Players.LocalPlayer
    local devTool = Instance.new("Tool")
    devTool.Name = "DevTool"
    devTool.Parent = player.Backpack
end,

["noarms"] = function()
    local character = game.Players.LocalPlayer.Character
    if character then
        local leftArm = character:FindFirstChild("Left Arm") or character:FindFirstChild("LeftHand")
        local rightArm = character:FindFirstChild("Right Arm") or character:FindFirstChild("RightHand")
        
        if leftArm then leftArm:Destroy() end
        if rightArm then rightArm:Destroy() end
    end
end,

["nolegs"] = function()
    local character = game.Players.LocalPlayer.Character
    if character then
        local leftLeg = character:FindFirstChild("Left Leg") or character:FindFirstChild("LeftFoot")
        local rightLeg = character:FindFirstChild("Right Leg") or character:FindFirstChild("RightFoot")
        
        if leftLeg then leftLeg:Destroy() end
        if rightLeg then rightLeg:Destroy() end
    end
end,

["fullbright"] = function()
    game.Lighting.Brightness = 2
    game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    game.Lighting.FogEnd = 1e9
end,

["fb"] = function()
    game.Lighting.Brightness = 2
    game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    game.Lighting.FogEnd = 1e9
end,

["serverhop"] = function()
    local TeleportService = game:GetService("TeleportService")
    local placeId = game.PlaceId
    TeleportService:Teleport(placeId, game.Players.LocalPlayer)
end,

["shop"] = function()
    local TeleportService = game:GetService("TeleportService")
    local placeId = game.PlaceId
    TeleportService:Teleport(placeId, game.Players.LocalPlayer)
end,

["rejoin"] = function()
    local TeleportService = game:GetService("TeleportService")
    local placeId = game.PlaceId
    local jobId = game.JobId
    TeleportService:TeleportToPlaceInstance(placeId, jobId, game.Players.LocalPlayer)
end,

["rj"] = function()
    local TeleportService = game:GetService("TeleportService")
    local placeId = game.PlaceId
    local jobId = game.JobId
    TeleportService:TeleportToPlaceInstance(placeId, jobId, game.Players.LocalPlayer)
end,

["gravity"] = function(value)
    workspace.Gravity = tonumber(value) or 196.2 -- Default gravity in Roblox
end,

["grav"] = function(value)
    workspace.Gravity = tonumber(value) or 196.2
end,

["kick"] = function(reason)
    local player = game.Players.LocalPlayer
    if player then
        player:Kick(reason or "No reason provided.")
    end
end,

["voidreset"] = function()
    local player = game.Players.LocalPlayer
    local character = player.Character

    if character then
        character:SetPrimaryPartCFrame(CFrame.new(0, -200, 0))
        wait(0.1)
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = 0
        end
    end
end,

["noroot"] = function()
    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character:FindFirstChild("HumanoidRootPart"):Destroy()
    end
end,

["deleteplayers"] = function()
    local playerFolder = game.Players.LocalPlayer
    if playerFolder then
        playerFolder:Destroy()
    end
end,

["antilag"] = function()
    local settings = game:GetService("Lighting")
    settings.GlobalShadows = false
    settings.FogEnd = 9e9
    settings.Brightness = 0

    for _, effect in pairs(settings:GetChildren()) do
        if effect:IsA("PostEffect") then
            effect.Enabled = false
        end
    end

    for _, object in pairs(workspace:GetDescendants()) do
        if object:IsA("Part") or object:IsA("MeshPart") or object:IsA("UnionOperation") then
            object.Material = Enum.Material.SmoothPlastic
            object.Reflectance = 0
        end
    end

    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Script") or v:IsA("LocalScript") then
            v.Disabled = true
        end
    end

    local player = game.Players.LocalPlayer
    if player and player:FindFirstChild("PlayerScripts") then
        local playerScripts = player:FindFirstChild("PlayerScripts")
        playerScripts.CameraMaxZoomDistance = 50 -- Điều chỉnh khoảng cách render
    end

    print("Lag reduction mode is not good, you can ask me questions through the forum!.")
end,

["nohead"] = function()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("Head") then
        player.Character.Head:Destroy()
    end
end,

["teleportalltome"] = function()
    local player = game.Players.LocalPlayer
    local myPosition = player.Character and player.Character.PrimaryPart and player.Character.PrimaryPart.Position
    if myPosition then
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character.PrimaryPart then
                otherPlayer.Character:SetPrimaryPartCFrame(CFrame.new(myPosition))
            end
        end
    end
end,

["fog"] = function(value)
    local lighting = game:GetService("Lighting")
    local newFogEnd = tonumber(value) or 1000
    lighting.FogEnd = newFogEnd
end,

["freecam"] = function()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character and character:FindFirstChildOfClass("Humanoid") then
        local camera = workspace.CurrentCamera
        if not camera:FindFirstChild("Freecam") then
            local freecam = Instance.new("Model")
            freecam.Name = "Freecam"
            freecam.Parent = camera
            
            local camPart = Instance.new("Part")
            camPart.Name = "CameraPart"
            camPart.Anchored = true
            camPart.CanCollide = false
            camPart.Size = Vector3.new(1,1,1)
            camPart.Position = camera.CFrame.Position
            camPart.Parent = freecam
            
            camera.CameraSubject = camPart
            camera.CameraType = Enum.CameraType.Scriptable
        end
    end
end,

["unfreecam"] = function()
    local player = game.Players.LocalPlayer
    local camera = workspace.CurrentCamera
    local freecam = camera:FindFirstChild("Freecam")
    if freecam then
        camera.CameraSubject = player.Character:FindFirstChildOfClass("Humanoid")
        camera.CameraType = Enum.CameraType.Custom
        freecam:Destroy()
    end
end,

["noanimation"] = function()
    local character = game.Players.LocalPlayer.Character
    if character then
        for _,anim in pairs(character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks()) do
            anim:Stop()
        end
    end
end,

["info"] = function()
local SG = Instance.new("ScreenGui")
SG.Name = "MyGUI"
SG.Parent = game.Players.LocalPlayer.PlayerGui

local F = Instance.new("Frame")
F.Name = "MainFrame"
F.Parent = SG
F.Size = UDim2.new(0.5, 0, 0.5, 0)
F.Position = UDim2.new(0.25, 0, 0.25, 0)
F.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
F.BorderSizePixel = 0
F.ClipsDescendants = true

local UIC = Instance.new("UICorner")
UIC.CornerRadius = UDim.new(0, 10)
UIC.Parent = F

local T = Instance.new("TextLabel")
T.Name = "Title"
T.Parent = F
T.Size = UDim2.new(1, 0, 0.1, 0)
T.Position = UDim2.new(0, 0, 0, 0)
T.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
T.Text = "Info"
T.TextColor3 = Color3.fromRGB(255, 255, 255)
T.TextScaled = true
T.TextStrokeTransparency = 0.8

local CB = Instance.new("TextButton")
CB.Name = "CloseButton"
CB.Parent = F
CB.Size = UDim2.new(0.1, 0, 0.1, 0)
CB.Position = UDim2.new(0.9, 0, 0, 0)
CB.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CB.Text = "❌"
CB.TextColor3 = Color3.fromRGB(255, 255, 255)
CB.TextScaled = true

local UICB = Instance.new("UICorner")
UICB.CornerRadius = UDim.new(0, 10)
UICB.Parent = CB

local IL = Instance.new("TextLabel")
IL.Name = "InfoLabel"
IL.Parent = F
IL.Size = UDim2.new(1, 0, 0.6, 0)
IL.Position = UDim2.new(0, 0, 0.1, 0)
IL.BackgroundTransparency = 1
IL.TextColor3 = Color3.fromRGB(255, 255, 255)
IL.TextScaled = true

local CA = Instance.new("TextButton")
CA.Name = "CopyAllButton"
CA.Parent = F
CA.Size = UDim2.new(0.2, 0, 0.1, 0)
CA.Position = UDim2.new(0.05, 0, 0.8, 0)
CA.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CA.Text = "Copy All"
CA.TextColor3 = Color3.fromRGB(255, 255, 255)
CA.TextScaled = true

local CG = Instance.new("TextButton")
CG.Name = "CopyGameButton"
CG.Parent = F
CG.Size = UDim2.new(0.2, 0, 0.1, 0)
CG.Position = UDim2.new(0.25, 0, 0.8, 0)
CG.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CG.Text = "Copy Game"
CG.TextColor3 = Color3.fromRGB(255, 255, 255)
CG.TextScaled = true

local CS = Instance.new("TextButton")
CS.Name = "CopyServerButton"
CS.Parent = F
CS.Size = UDim2.new(0.2, 0, 0.1, 0)
CS.Position = UDim2.new(0.45, 0, 0.8, 0)
CS.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CS.Text = "Copy Server"
CS.TextColor3 = Color3.fromRGB(255, 255, 255)
CS.TextScaled = true

local CY = Instance.new("TextButton")
CY.Name = "CopyYouButton"
CY.Parent = F
CY.Size = UDim2.new(0.2, 0, 0.1, 0)
CY.Position = UDim2.new(0.65, 0, 0.8, 0)
CY.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CY.Text = "Copy 'You'"
CY.TextColor3 = Color3.fromRGB(255, 255, 255)
CY.TextScaled = true

local UICC = Instance.new("UICorner")
UICC.CornerRadius = UDim.new(0, 10)
UICC.Parent = CA
UICC:Clone().Parent = CG
UICC:Clone().Parent = CS
UICC:Clone().Parent = CY

F.Position = UDim2.new(0.25, 0, 1, 0)
F:TweenPosition(UDim2.new(0.25, 0, 0.25, 0), "Out", "Quad", 0.5)

local Camera = workspace.CurrentCamera
local BE = Instance.new("BlurEffect")
BE.Name = "BlurEffect"
BE.Size = 50
BE.Parent = Camera

CB.MouseButton1Click:Connect(function()
    F:TweenPosition(UDim2.new(0.25, 0, 1, 0), "Out", "Quad", 0.5)
    for i = 50, 0, -10 do
        BE.Size = i
        wait(0)
    end
    BE:Destroy()
    wait(0.5)
    SG:Destroy()
end)

F.AncestryChanged:Connect(function()
    if not F:IsDescendantOf(SG) then
        BE:Destroy()
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    local ST = os.date("!*t", tick())
    local formattedST = string.format("%02d:%02d:%02d", ST.hour, ST.min, ST.sec)

    local PID = game.PlaceId
    local gameInfo = game:GetService("MarketplaceService"):GetProductInfo(PID)

    local P = game.Players.LocalPlayer
    local H = P.Character and P.Character:FindFirstChildOfClass("Humanoid")
    local WS = H and H.WalkSpeed or 16
    local JP = H and H.JumpPower or 50
    local FOV = workspace.CurrentCamera.FieldOfView or 70
    local health = H and H.Health or 0
    local maxHealth = H and H.MaxHealth or 0
    local sitting = H and H:GetState() == Enum.HumanoidStateType.Seated

    local playerCount = #game.Players:GetPlayers()

    IL.Text = string.format("🎮Game\nName: %s\nPlaceID: %d\n💾Server\nPlayer Count: %d\nServer Time: %s\n👤You\nWalkspeed: %d\nJumppower: %d\nFOV: %d\nHealth: %d/%d\nSitting: %s",
        gameInfo.Name or "Unknown Game",
        PID,
        playerCount,
        formattedST,
        WS,
        JP,
        FOV,
        health,
        maxHealth,
        sitting and "Yes" or "No")
end)

CA.MouseButton1Click:Connect(function()
    local allInfo = IL.Text
    setclipboard(allInfo)
end)

CG.MouseButton1Click:Connect(function()
    local gameInfoText = string.format("🎮Game\nName: %s\nPlaceID: %d", game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, game.PlaceId)
    setclipboard(gameInfoText)
end)

CS.MouseButton1Click:Connect(function()
    local playerCount = #game.Players:GetPlayers()
    local ST = os.date("!*t", tick())
    local formattedST = string.format("%02d:%02d:%02d", ST.hour, ST.min, ST.sec)
    local serverInfo = string.format("💾Server\nPlayer Count: %d\nServer Time: %s", playerCount, formattedST)
    setclipboard(serverInfo)
end)

CY.MouseButton1Click:Connect(function()
    local P = game.Players.LocalPlayer
    local H = P.Character and P.Character:FindFirstChildOfClass("Humanoid")
    local WS = H and H.WalkSpeed or 16
    local JP = H and H.JumpPower or 50
    local FOV = workspace.CurrentCamera.FieldOfView or 70
    local health = H and H.Health or 0
    local maxHealth = H and H.MaxHealth or 0
    local youInfo = string.format("👤You\nWalkspeed: %d\nJumppower: %d\nFOV: %d\nHealth: %d/%d", WS, JP, FOV, health, maxHealth)
    setclipboard(youInfo)
end)
end,

["invisible"] = function()
    local character = game.Players.LocalPlayer.Character
    if character then
        for _, part in ipairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
                part.CanCollide = false
            end
        end
    end
end,

["deletehycmds"] = function()
    local playerGui = game.Players.LocalPlayer:FindFirstChildOfClass("CoreGui")
    if playerGui then
        for _, gui in ipairs(playerGui:GetChildren()) do
            if gui.Name == "HyCMDs" then
                gui:Destroy()
            end
        end
    end
end,

["btools"] = function()
    local success, result = pcall(function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-BTools-12430"))()
    end)
    
    if not success then
        warn("Download failed!: " .. result)
    end
end,

["time"] = function(timeString)
    local hours, minutes, seconds = timeString:match("^(%d+):(%d+):(%d+)$")
    if hours and minutes and seconds then
        game.Lighting.TimeOfDay = string.format("%02d:%02d:%02d", hours, minutes, seconds)
        print("Thời gian trong game đã được đặt thành: " .. game.Lighting.TimeOfDay)
    else
        warn("00:00:00 is true!")
    end
end,

["hatsize"] = function(size)
    local player = game.Players.LocalPlayer
    local character = player.Character

    if not character then
        warn("...")
        return
    end

    local targetSize = tonumber(size)

    if not targetSize then
        warn("Please enter right value!.")
        return
    end

    local hat = character:FindFirstChildOfClass("Accessory")
    if hat then
        local handle = hat:FindFirstChild("Handle")
        if handle then
            handle.Size = Vector3.new(targetSize, targetSize, targetSize)
            local head = character:FindFirstChild("Head")
            if head then
                -- Cập nhật CFrame của mũ để giữ nó ngay tại cổ
                handle.CFrame = head.CFrame * CFrame.new(0, -head.Size.Y / 2 - handle.Size.Y / 2, 0)
            end
        end
    else
        warn("I cant find hat.")
    end

    print("Size: " .. tostring(targetSize))
end,

["headsize"] = function(size)
    local player = game.Players.LocalPlayer
    local character = player.Character
    
    if not character then
        warn("...")
        return
    end
    
    local targetSize = tonumber(size)
    
    if not targetSize then
        warn("Please enter right value.")
        return
    end

    local head = character:FindFirstChild("Head")
    if head then
        head.Size = Vector3.new(targetSize, targetSize, targetSize)
    end

    -- Thay đổi kích thước mũ nếu có
    local hat = character:FindFirstChildOfClass("Accessory")
    if hat then
        local handle = hat:FindFirstChild("Handle")
        if handle then
            handle.Size = Vector3.new(targetSize, targetSize, targetSize)
        end
    end
    
    print("Kích thước đầu của bạn đã được thay đổi thành: " .. tostring(targetSize))
end,

["allpartinuncollide"] = function()
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and not part.CanCollide then
            part.CanCollide = true
        end
    end
    print("...")
end,

["apiuc"] = function()
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and not part.CanCollide then
            part.CanCollide = true
        end
    end
    print("...")
end,

["uninvisiblepart"] = function()
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = 0
        end
    end
    print("Restored.")
end,

["uninvpart"] = function()
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = 0
        end
    end
    print("Restored.")
end,

["invisiblepart"] = function()
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = 1
        end
    end
    print("All part is invisiblr.")
end,

["invpart"] = function()
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = 1
        end
    end
    print("All part is invisible!.")
end,

["addtools"] = function(name_carryable_display_color)
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local backpack = localPlayer:FindFirstChildOfClass("Backpack")

    if backpack then
        -- Parse the input parameters
        local split = string.split(name_carryable_display_color, "_")
        local toolName = split[1]:gsub("#2d", " ")  -- Replace #2d with actual space
        local carryable = split[2] == "True"
        local displayPart = split[3] == "True"
        local color = split[4]

        local tool = Instance.new("Tool")
        tool.Name = toolName
        tool.RequiresHandle = carryable
        tool.CanBeDropped = carryable
        tool.Parent = backpack

        if displayPart then
            local handle = Instance.new("Part")
            handle.Size = Vector3.new(1, 1, 1)
            handle.Color = BrickColor.new(color).Color
            handle.Name = "Handle"
            handle.Parent = tool
            tool.GripPos = Vector3.new(0, -0.5, 0)
        end

        print("Created tool: " .. toolName)
    else
        print("Can't find inventory.")
    end
end,

["copytools"] = function(target)
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local targetPlayer = nil

    if target:lower() == "me" then
        targetPlayer = localPlayer
    else
        for _, player in ipairs(players:GetPlayers()) do
            if player.Name:lower():find(target:lower()) or player.DisplayName:lower():find(target:lower()) then
                targetPlayer = player
                break
            end
        end
    end

    if targetPlayer then
        local backpack = localPlayer:FindFirstChildOfClass("Backpack")
        local targetBackpack = targetPlayer:FindFirstChildOfClass("Backpack")
        
        if backpack and targetBackpack then
            for _, tool in ipairs(targetBackpack:GetChildren()) do
                if tool:IsA("Tool") then
                    tool:Clone().Parent = backpack
                end
            end
            print("Copy " .. targetPlayer.Name .. ".")
        end
    else
        print("Can't find '" .. target .. "'.")
    end
end,

["goto"] = function(targetPlayer)
    local localPlayer = game.Players.LocalPlayer
    local target = getPlayer(targetPlayer)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        localPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
    end
end,

["automissed"] = function()
    local localPlayer = game.Players.LocalPlayer
    if not _G.autoMissedConnection then
        _G.autoMissedConnection = game:GetService("RunService").Heartbeat:Connect(function()
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local distance = (player.Character.HumanoidRootPart.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if distance < 10 and distance > 5 then
                        local newPosition = localPlayer.Character.HumanoidRootPart.Position + Vector3.new(math.random(-10,10), 0, math.random(-10,10))
                        localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(newPosition)
                    end
                end
            end
        end)
    end
end,

["unautomissed"] = function()
    if _G.autoMissedConnection then
        _G.autoMissedConnection:Disconnect()
        _G.autoMissedConnection = nil
    end
end,

["unfreecam2"] = function()
    local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera

function deleteCamera()
    camera:Destroy()
end

function restoreCamera()
    camera = Instance.new("Camera")
    camera.Parent = game.Workspace
    game.Workspace.CurrentCamera = camera
    camera.CameraType = Enum.CameraType.Custom
    camera.CameraSubject = player.Character.Humanoid
end

deleteCamera()
restoreCamera()

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

for _, part in pairs(character:GetChildren()) do
    if part:IsA("BasePart") and part.Anchored then
        part.Anchored = false
    end
end
end,

["freecam2"] = function()
local cam = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local onMobile = not UIS.KeyboardEnabled
local keysDown = {}
local rotating = false

if not game:IsLoaded() then game.Loaded:Wait() end

cam.CameraType = Enum.CameraType.Scriptable

local speed = 5
local sens = .3

speed /= 10
if onMobile then sens*=2 end

local function renderStepped()
    if rotating then
        local delta = UIS:GetMouseDelta()
        local cf = cam.CFrame
        local yAngle = cf:ToEulerAngles(Enum.RotationOrder.YZX)
        local newAmount = math.deg(yAngle)+delta.Y
        if newAmount > 65 or newAmount < -65 then
            if not (yAngle<0 and delta.Y<0) and not (yAngle>0 and delta.Y>0) then
                delta = Vector2.new(delta.X,0)
            end 
        end
        cf *= CFrame.Angles(-math.rad(delta.Y),0,0)
        cf = CFrame.Angles(0,-math.rad(delta.X),0) * (cf - cf.Position) + cf.Position
        cf = CFrame.lookAt(cf.Position, cf.Position + cf.LookVector)
        if delta ~= Vector2.new(0,0) then cam.CFrame = cam.CFrame:Lerp(cf,sens) end
        UIS.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
    else
        UIS.MouseBehavior = Enum.MouseBehavior.Default
    end

    if keysDown["Enum.KeyCode.W"] then
        cam.CFrame *= CFrame.new(Vector3.new(0,0,-speed))
    end
    if keysDown["Enum.KeyCode.A"] then
        cam.CFrame *= CFrame.new(Vector3.new(-speed,0,0))
    end
    if keysDown["Enum.KeyCode.S"] then
        cam.CFrame *= CFrame.new(Vector3.new(0,0,speed))
    end
    if keysDown["Enum.KeyCode.D"] then
        cam.CFrame *= CFrame.new(Vector3.new(speed,0,0))
    end
end

RS.RenderStepped:Connect(renderStepped)

local validKeys = {"Enum.KeyCode.W","Enum.KeyCode.A","Enum.KeyCode.S","Enum.KeyCode.D"}

UIS.InputBegan:Connect(function(Input)
    for i, key in pairs(validKeys) do
        if key == tostring(Input.KeyCode) then
            keysDown[key] = true
        end
    end
    if Input.UserInputType == Enum.UserInputType.MouseButton2 or (Input.UserInputType == Enum.UserInputType.Touch and UIS:GetMouseLocation().X>(cam.ViewportSize.X/2)) then
        rotating = true
    end
    if Input.UserInputType == Enum.UserInputType.Touch then
        if Input.Position.X < cam.ViewportSize.X/2 then
            touchPos = Input.Position
        end
    end
end)

UIS.InputEnded:Connect(function(Input)
    for key, v in pairs(keysDown) do
        if key == tostring(Input.KeyCode) then
            keysDown[key] = false
        end
    end
    if Input.UserInputType == Enum.UserInputType.MouseButton2 or (Input.UserInputType == Enum.UserInputType.Touch and UIS:GetMouseLocation().X>(cam.ViewportSize.X/2)) then
        rotating = false
    end
    if Input.UserInputType == Enum.UserInputType.Touch and touchPos then
        if Input.Position.X < cam.ViewportSize.X/2 then
            touchPos = nil
            keysDown["Enum.KeyCode.W"] = false
            keysDown["Enum.KeyCode.A"] = false
            keysDown["Enum.KeyCode.S"] = false
            keysDown["Enum.KeyCode.D"] = false
        end
    end
end)

UIS.TouchMoved:Connect(function(input)
    if touchPos then
        if input.Position.X < cam.ViewportSize.X/2 then
            if input.Position.Y < touchPos.Y then
                keysDown["Enum.KeyCode.W"] = true
                keysDown["Enum.KeyCode.S"] = false
            else
                keysDown["Enum.KeyCode.W"] = false
                keysDown["Enum.KeyCode.S"] = true
            end
            if input.Position.X < (touchPos.X-15) then
                keysDown["Enum.KeyCode.A"] = true
                keysDown["Enum.KeyCode.D"] = false
            elseif input.Position.X > (touchPos.X+15) then
                keysDown["Enum.KeyCode.A"] = false
                keysDown["Enum.KeyCode.D"] = true
            else
                keysDown["Enum.KeyCode.A"] = false
                keysDown["Enum.KeyCode.D"] = false
            end
        end
    end
end)

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

for _, part in pairs(character:GetChildren()) do
    if part:IsA("BasePart") and not part.Anchored then
        part.Anchored = true
    end
end
end,

["fixcam"] = function()
    local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera

function deleteCamera()
    camera:Destroy()
end

function restoreCamera()
    camera = Instance.new("Camera")
    camera.Parent = game.Workspace
    game.Workspace.CurrentCamera = camera
    camera.CameraType = Enum.CameraType.Custom
    camera.CameraSubject = player.Character.Humanoid
end

deleteCamera()
restoreCamera()
end,

["tptool"] = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Teleport-tool-7095"))()
end,

["smoothcamera"] = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Smooth-3rd-Person-Camera-7413"))()
end,

["antishakecamera"] = function()
    local cam = workspace.CurrentCamera
    if not cam:FindFirstChild("AntiShake") then
        local antiShake = Instance.new("BodyGyro")
        antiShake.Name = "AntiShake"
        antiShake.Parent = cam
        antiShake.MaxTorque = Vector3.new(4000, 4000, 4000)
        antiShake.CFrame = cam.CFrame
        antiShake.P = 10000
        antiShake.D = 5000
        antiShake.CFrame = cam.CFrame
    end
end,

["antishcam"] = function()
    local cam = workspace.CurrentCamera
    if not cam:FindFirstChild("AntiShake") then
        local antiShake = Instance.new("BodyGyro")
        antiShake.Name = "AntiShake"
        antiShake.Parent = cam
        antiShake.MaxTorque = Vector3.new(4000, 4000, 4000)
        antiShake.CFrame = cam.CFrame
        antiShake.P = 10000
        antiShake.D = 5000
        antiShake.CFrame = cam.CFrame
    end
end,

["disable"] = function(feature)
    local coreGui = game:GetService("StarterGui")

    if feature == "health" then
        coreGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
    elseif feature == "inventory" then
        coreGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
    elseif feature == "emote" then
        coreGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false)
    elseif feature == "reset" then
        coreGui:SetCore("ResetButtonCallback", false)
    elseif feature == "playerlist" then
        coreGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
    elseif feature == "chat" then
        coreGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
    else
        warn("Invalid feature specified.")
    end

    print(feature .. " disabled.")
end,

["enable"] = function(feature)
    local coreGui = game:GetService("StarterGui")

    if feature == "health" then
        coreGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, true)
    elseif feature == "inventory" then
        coreGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
    elseif feature == "emote" then
        coreGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, true)
    elseif feature == "reset" then
        coreGui:SetCore("ResetButtonCallback", true)
    elseif feature == "playerlist" then
        coreGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
    elseif feature == "chat" then
        coreGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
    else
        warn("Invalid feature specified.")
    end

    print(feature .. " enabled.")
end,

["help"] = function()
    -- Lưu cụm từ "Please wait!" vào bộ nhớ tạm
    setclipboard("Please wait!")
    print("Help text copied to clipboard: Please wait!")
end,

["copyname"] = function(targetName)
    local players = game:GetService("Players")
    local player = players.LocalPlayer
    
    -- Tìm kiếm người chơi dựa trên tên hoặc các tiêu chí U2 khác
    local target = nil
    for _, plr in pairs(players:GetPlayers()) do
        if string.lower(plr.Name):find(string.lower(targetName)) or 
           string.lower(plr.DisplayName):find(string.lower(targetName)) or
           targetName == "all" or
           (targetName == "me" and plr == player) or
           (targetName == "team" and plr.Team == player.Team) or
           (targetName == "friend" and plr:IsFriendsWith(player.UserId)) then
            target = plr
            break
        end
    end

    -- Nếu tìm thấy người chơi, sao chép tên vào bộ nhớ tạm
    if target then
        -- Sử dụng API của hệ thống để sao chép vào bộ nhớ tạm
        setclipboard("@" .. target.Name)
        print("Copied name: @" .. target.Name)
    else
        print("Player not found!")
    end
end,

["textsize"] = function(size)
    -- Chuyển size sang dạng số
    local newSize = tonumber(size)
    if not newSize then
        print("Invalid size input. Please enter a number.")
        return
    end
    
    -- Hàm để thay đổi kích cỡ chữ cho tất cả các TextObject trong một GUI
    local function changeTextSizeInGui(gui)
        for _, obj in pairs(gui:GetDescendants()) do
            if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
                obj.TextSize = newSize
            end
        end
    end
    
    -- Thay đổi kích cỡ chữ trong PlayerGui của LocalPlayer
    local playerGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    if playerGui then
        changeTextSizeInGui(playerGui)
    end

    local coreGui = game:GetService("CoreGui")
    changeTextSizeInGui(coreGui)
    
    -- In thông báo thành công
    print("Text size changed to " .. newSize)
end,

["command"] = function()
    -- Create the ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "command2"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Create the main Frame for the GUI
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0.5, 0, 0.6, 0)
    mainFrame.Position = UDim2.new(0.25, 0, 0.2, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    mainFrame.BorderSizePixel = 2
    mainFrame.BorderColor3 = Color3.fromRGB(80, 80, 80)
    mainFrame.Parent = screenGui

    local searchBox = Instance.new("TextBox")
    searchBox.Size = UDim2.new(1, -140, 0, 40)
    searchBox.Position = UDim2.new(0, 10, 0, 10)
    searchBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    searchBox.PlaceholderText = "Search commands..."
    searchBox.ClearTextOnFocus = false
    searchBox.Text = ""
    searchBox.BorderSizePixel = 2
    searchBox.BorderColor3 = Color3.fromRGB(80, 80, 80)
    searchBox.Font = Enum.Font.SourceSans
    searchBox.TextSize = 14
    searchBox.Parent = mainFrame

    -- Create the Search Button
    local searchButton = Instance.new("TextButton")
    searchButton.Size = UDim2.new(0, 100, 0, 40)
    searchButton.Position = UDim2.new(1, -120, 0, 10)
    searchButton.Text = "Search"
    searchButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    searchButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    searchButton.BorderSizePixel = 2
    searchButton.BorderColor3 = Color3.fromRGB(80, 80, 80)
    searchButton.Font = Enum.Font.SourceSans
    searchButton.TextSize = 14
    searchButton.Parent = mainFrame

    -- Create the Scroll Frame for the buttons
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, 0, 1, -130)
    scrollFrame.Position = UDim2.new(0, 0, 0, 60)
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 250)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.Parent = mainFrame

    -- Create a Frame for buttons
    local buttonFrame = Instance.new("Frame")
    buttonFrame.Size = UDim2.new(1, 0, 0, 250)
    buttonFrame.Position = UDim2.new(0, 0, 0, 0)
    buttonFrame.BackgroundTransparency = 1
    buttonFrame.Parent = scrollFrame

    -- Create a TextLabel to show command details
    local detailLabel = Instance.new("TextLabel")
    detailLabel.Size = UDim2.new(1, 0, 0, 80)
    detailLabel.Position = UDim2.new(0, 0, 1, -80)
    detailLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    detailLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    detailLabel.TextSize = 14
    detailLabel.Text = ""
    detailLabel.TextWrapped = true
    detailLabel.Font = Enum.Font.SourceSans
    detailLabel.Parent = mainFrame

    -- Create the Close button for the detailLabel
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 100, 0, 50)
    closeButton.Position = UDim2.new(1, -110, 1, -60)
    closeButton.Text = "Close"
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.BorderSizePixel = 2
    closeButton.BorderColor3 = Color3.fromRGB(80, 80, 80)
    closeButton.Font = Enum.Font.SourceSans
    closeButton.TextSize = 14
    closeButton.Parent = detailLabel

    -- Create the Sound instance
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://6655851046" -- Replace with your sound ID
    sound.Parent = mainFrame

    -- List of commands with their corresponding button text and description
    local commands = {
        {text = "FullBright/FB", description = "Light it all up!", command = "FullBright"},
        {text = "Speed [Value]", description = "Speed up!\nExample: Speed 50", command = "Speed 50"},
        {text = "Jumppower [Value]", description = "Makes you jump higher!\nExample: Jumppower 50", command = "Jumppower 75"},
        {text = "Freeze [Name]", description = "Freeze someone for guilt\nExample: Freeze {Me/Name}", command = "Freeze Me"},
    }

    -- Function to create a button
    local function createButton(text, description, command)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -10, 0, 40)
        button.Position = UDim2.new(0, 5, 0, 5 + (40 * (#buttonFrame:GetChildren())))
        button.Text = text
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.BorderSizePixel = 2
        button.BorderColor3 = Color3.fromRGB(80, 80, 80)
        button.Font = Enum.Font.SourceSans
        button.TextSize = 14
        button.Parent = buttonFrame

        button.MouseButton1Click:Connect(function()
            sound:Play() -- Play sound when button is clicked
            detailLabel.Text = description
            local hyCmdsGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("HyCMDs")
            if hyCmdsGui then
                local textBox = hyCmdsGui:FindFirstChild("TextBox")
                if textBox then
                    textBox.Text = command
                end
            end
        end)
    end

    -- Function to update the command list based on the search box input
    local function updateCommandList(query)
        -- Clear existing buttons
        for _, child in ipairs(buttonFrame:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end

        -- Filter and display buttons based on the query
        local yPos = 5
        for _, cmd in ipairs(commands) do
            if cmd.text:lower():find(query:lower()) then
                local button = Instance.new("TextButton")
                button.Size = UDim2.new(1, -10, 0, 40)
                button.Position = UDim2.new(0, 5, 0, yPos)
                button.Text = cmd.text
                button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                button.TextColor3 = Color3.fromRGB(255, 255, 255)
                button.BorderSizePixel = 2
                button.BorderColor3 = Color3.fromRGB(80, 80, 80)
                button.Font = Enum.Font.SourceSans
                button.TextSize = 14
                button.Parent = buttonFrame

                button.MouseButton1Click:Connect(function()
                    sound:Play()
                    detailLabel.Text = cmd.description
                    local hyCmdsGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("HyCMDs")
                    if hyCmdsGui then
                        local textBox = hyCmdsGui:FindFirstChild("TextBox")
                        if textBox then
                            textBox.Text = cmd.command
                        end
                    end
                end)

                yPos = yPos + 45
            end
        end
    end

    -- Connect the search box to update the command list on text change
    searchBox:GetPropertyChangedSignal("Text"):Connect(function()
        updateCommandList(searchBox.Text)
    end)

    -- Initial population of command buttons
    updateCommandList("")

    -- Close button functionality
    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
end,

["paper"] = function()
local function makeFlattened()
    local character = game.Players.LocalPlayer.Character
    if not character then return end

    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.Size = Vector3.new(part.Size.X, part.Size.Y, 0.1) 
        end
    end
end

makeFlattened()
end,

["fat"] = function()
local function makeFat()
    local character = game.Players.LocalPlayer.Character
    if not character then return end

    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") and part.Name ~= "Head" and part.Name ~= "Hat" then
            part.Size = part.Size * Vector3.new(2, 2, 2) 
        end
    end
end

makeFat()
end,

["loopbring"] = function()
local player = game.Players.LocalPlayer
local runService = game:GetService("RunService")

local teleportConnection

local function addESP(character)
    local highlight = Instance.new("Highlight")
    highlight.Adornee = character
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.FillTransparency = 0.5
    highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineTransparency = 0.5
    highlight.Parent = character
end

local character = player.Character or player.CharacterAdded:Wait()
addESP(character)

teleportConnection = runService.RenderStepped:Connect(function()
    local position = character.HumanoidRootPart.Position

    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player then
            local otherCharacter = otherPlayer.Character
            if otherCharacter then
                for _, part in pairs(otherCharacter:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
                otherCharacter:SetPrimaryPartCFrame(CFrame.new(position))
            end
        end
    end
end)

_G.teleportConnection = teleportConnection
end,

["unloopbring"] = function()
-- Script 2: Hủy bỏ việc dịch chuyển và xóa ESP
if _G.teleportConnection then
    _G.teleportConnection:Disconnect()
    _G.teleportConnection = nil
end

local player = game.Players.LocalPlayer
for _, otherPlayer in pairs(game.Players:GetPlayers()) do
    if otherPlayer ~= player then
        local otherCharacter = otherPlayer.Character
        if otherCharacter then
            for _, part in pairs(otherCharacter:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
end

local highlight = player.Character:FindFirstChildOfClass("Highlight")
if highlight then
    highlight:Destroy()
end
end,

["restoreroot"] = function()
local function restoreRootPart(character)
    if not character then return end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    
    if not rootPart then
        rootPart = Instance.new("Part")
        rootPart.Name = "HumanoidRootPart"
        rootPart.Size = Vector3.new(2, 2, 1)
        rootPart.Anchored = false
        rootPart.CanCollide = false
        rootPart.Transparency = 1
        rootPart.Parent = character
        
        local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
        
        if torso then
            rootPart.CFrame = torso.CFrame -- Đặt RootPart ở vị trí của Torso
        else
            rootPart.CFrame = CFrame.new(0, 50, 0) -- Đặt RootPart ở vị trí cao (tránh xuyên qua Void)
        end

        local weld = Instance.new("WeldConstraint")
        weld.Part0 = torso
        weld.Part1 = rootPart
        weld.Parent = rootPart
    end
end

game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        restoreRootPart(character)
    end)
end)

if game.Players.LocalPlayer.Character then
    restoreRootPart(game.Players.LocalPlayer.Character)
end
end,

["button#freeze"] = function()
local ScreenGui = Instance.new("ScreenGui")
local DraggableButton = Instance.new("TextButton")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local freezeEnabled = false
local frozenParts = {}

ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

DraggableButton.Parent = ScreenGui
DraggableButton.BackgroundColor3 = Color3.new(0, 0, 0)
DraggableButton.Size = UDim2.new(0, 100, 0, 50)
DraggableButton.Position = UDim2.new(0.5, -50, 0.5, -25)
DraggableButton.Text = "Freeze All"
DraggableButton.TextColor3 = Color3.new(1, 1, 1)
DraggableButton.BorderSizePixel = 0
DraggableButton.Font = Enum.Font.SourceSans
DraggableButton.TextSize = 24
DraggableButton.AutoButtonColor = false

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = DraggableButton

local dragging = false
local dragInput
local dragStart
local startPos
local holdStart = 0

local function update(input)
    local delta = input.Position - dragStart
    DraggableButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

DraggableButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = DraggableButton.Position
        holdStart = tick()

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

DraggableButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)

local function toggleFreeze()
    if freezeEnabled then
        for _, part in pairs(frozenParts) do
            part.Anchored = false
        end
        DraggableButton.Text = "Freeze all"
        frozenParts = {}
    else
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and not part.Anchored then
                part.Anchored = true
                table.insert(frozenParts, part)
            end
        end
        DraggableButton.Text = "Unfreeze all"
    end
    freezeEnabled = not freezeEnabled
end

DraggableButton.MouseButton1Click:Connect(toggleFreeze)

game:GetService("RunService").RenderStepped:Connect(function()
    if dragging and (tick() - holdStart) >= 5 then
        DraggableButton.Visible = false
    end
end)

local ScreenGui = Instance.new("ScreenGui")
local DraggableButton = Instance.new("TextButton")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local freezeEnabled = false
local frozenParts = {}

ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

DraggableButton.Parent = ScreenGui
DraggableButton.BackgroundColor3 = Color3.new(0, 0, 0)
DraggableButton.Size = UDim2.new(0, 100, 0, 50)
DraggableButton.Position = UDim2.new(0.5, -50, 0.5, -25)
DraggableButton.Text = "Freeze"
DraggableButton.TextColor3 = Color3.new(1, 1, 1)
DraggableButton.BorderSizePixel = 0
DraggableButton.Font = Enum.Font.SourceSans
DraggableButton.TextSize = 24
DraggableButton.AutoButtonColor = false

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = DraggableButton

local dragging = false
local dragInput
local dragStart
local startPos
local holdStart = 0

local function update(input)
    local delta = input.Position - dragStart
    DraggableButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

DraggableButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = DraggableButton.Position
        holdStart = tick()

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

DraggableButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)

local function onCharacterAdded(newCharacter)
    character = newCharacter
end

player.CharacterAdded:Connect(onCharacterAdded)

local function toggleFreeze()
    if freezeEnabled then
        for _, part in pairs(frozenParts) do
            part.Anchored = false
        end
        DraggableButton.Text = "Freeze"
        frozenParts = {}
    else
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") and not part.Anchored then
                part.Anchored = true
                table.insert(frozenParts, part)
            end
        end
        DraggableButton.Text = "Unfreeze"
    end
    freezeEnabled = not freezeEnabled
end

DraggableButton.MouseButton1Click:Connect(toggleFreeze)

game:GetService("RunService").RenderStepped:Connect(function()
    if dragging and (tick() - holdStart) >= 5 then
        DraggableButton.Visible = false
    end
end)
end,

["button#lay"] = function()
-- Wait To Update
local ScreenGui = Instance.new("ScreenGui")
local DraggableButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

DraggableButton.Parent = ScreenGui
DraggableButton.BackgroundColor3 = Color3.new(0, 0, 0) -- Màu đen
DraggableButton.Size = UDim2.new(0, 100, 0, 50)
DraggableButton.Position = UDim2.new(0.5, -50, 0.5, -25)
DraggableButton.Text = "Lay"
DraggableButton.TextColor3 = Color3.new(1, 1, 1) -- Màu trắng cho chữ

local character = game.Players.LocalPlayer.Character
local humanoid = character:FindFirstChild("Humanoid")
local isLaying = false
local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    DraggableButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

DraggableButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = DraggableButton.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

DraggableButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)

-- Hàm để giữ trạng thái lay
local function toggleLay()
    if isLaying then
        humanoid.PlatformStand = false -- Cho phép nhân vật đứng dậy
        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) -- Unlay
        DraggableButton.Text = "Lay"
    else
        humanoid.PlatformStand = true -- Vô hiệu hóa chuyển động đứng dậy
        humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll) -- Lay
        DraggableButton.Text = "Unlay"
    end
    isLaying = not isLaying
end

-- Khi bấm nút thì lay/unlay
DraggableButton.MouseButton1Click:Connect(toggleLay)
end,

["button#sit"] = function()
local ScreenGui = Instance.new("ScreenGui")
local DraggableButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

DraggableButton.Parent = ScreenGui
DraggableButton.BackgroundColor3 = Color3.new(0, 0, 0) -- Màu đen
DraggableButton.Size = UDim2.new(0, 100, 0, 50)
DraggableButton.Position = UDim2.new(0.5, -50, 0.5, -25)
DraggableButton.Text = "Sit"
DraggableButton.TextColor3 = Color3.new(1, 1, 1) -- Màu trắng cho chữ

local character = game.Players.LocalPlayer.Character
local humanoid = character:FindFirstChild("Humanoid")
local isSitting = false
local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    DraggableButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

DraggableButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = DraggableButton.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

DraggableButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)

local function toggleSit()
    if isSitting then
        humanoid.Sit = false -- Unsit
        DraggableButton.Text = "Sit"
    else
        humanoid.Sit = true -- Sit
        DraggableButton.Text = "Unsit"
    end
    isSitting = not isSitting
end

-- Khi bấm nút thì sit/unsit
DraggableButton.MouseButton1Click:Connect(toggleSit)
end,

["button#time"] = function()
local ScreenGui = Instance.new("ScreenGui")
local DayNightButton = Instance.new("TextButton")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer
local timeRunning = false

ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

DayNightButton.Parent = ScreenGui
DayNightButton.BackgroundColor3 = Color3.new(0, 0, 0)
DayNightButton.Size = UDim2.new(0, 100, 0, 50)
DayNightButton.Position = UDim2.new(0.5, -50, 0.5, -25)
DayNightButton.Text = "Set Night"
DayNightButton.TextColor3 = Color3.new(1, 1, 1)
DayNightButton.BorderSizePixel = 0
DayNightButton.Font = Enum.Font.SourceSans
DayNightButton.TextSize = 24
DayNightButton.AutoButtonColor = false

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = DayNightButton

local dragging = false
local dragInput
local dragStart
local startPos
local holdStart = 0

local function update(input)
    local delta = input.Position - dragStart
    DayNightButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

DayNightButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = DayNightButton.Position
        holdStart = tick()

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

DayNightButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)

local function toggleDayNight()
    if timeRunning then
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and not part.Anchored then
                part.Anchored = false
            end
        end
        DayNightButton.Text = "Set Day"
        Lighting.TimeOfDay = "00:00:00" -- Đặt thời gian là giữa đêm
        timeRunning = false
    else
        Lighting.TimeOfDay = "14:00:00" -- Đặt thời gian là giữa ngày
        DayNightButton.Text = "Set Night"
        timeRunning = true
    end
end

DayNightButton.MouseButton1Click:Connect(toggleDayNight)

game:GetService("RunService").RenderStepped:Connect(function()
    if dragging and (tick() - holdStart) >= 5 then
        DayNightButton.Visible = false
    end
end)
end,

["button#freecam"] = function()
local ScreenGui = Instance.new("ScreenGui")
local DraggableButton = Instance.new("TextButton")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Camera = game.Workspace.CurrentCamera
local originalCamera = Camera.CFrame
local freecamEnabled = false

ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

DraggableButton.Parent = ScreenGui
DraggableButton.BackgroundColor3 = Color3.new(0, 0, 0)
DraggableButton.Size = UDim2.new(0, 100, 0, 50)
DraggableButton.Position = UDim2.new(0.5, -50, 0.5, -25)
DraggableButton.Text = "Freecam"
DraggableButton.TextColor3 = Color3.new(1, 1, 1)
DraggableButton.BorderSizePixel = 0
DraggableButton.Font = Enum.Font.SourceSans
DraggableButton.TextSize = 24
DraggableButton.AutoButtonColor = false

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = DraggableButton

local dragging = false
local dragInput
local dragStart
local startPos
local holdStart = 0

local function update(input)
    local delta = input.Position - dragStart
    DraggableButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

DraggableButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = DraggableButton.Position
        holdStart = tick()

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

DraggableButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)

local function toggleFreecam()
    if freecamEnabled then
        Camera.CameraType = Enum.CameraType.Custom
        Camera.CFrame = originalCamera
        DraggableButton.Text = "Freecam"
    else
        Camera.CameraType = Enum.CameraType.Scriptable
        DraggableButton.Text = "UnFreecam"
    end
    freecamEnabled = not freecamEnabled
end

DraggableButton.MouseButton1Click:Connect(toggleFreecam)

player.CharacterAdded:Connect(function(character)
    if freecamEnabled then
        Camera.CameraType = Enum.CameraType.Custom
        Camera.CFrame = originalCamera
        freecamEnabled = false
        DraggableButton.Text = "Freecam"
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if dragging and (tick() - holdStart) >= 5 then
        DraggableButton.Visible = false
    end
end)
end,

["oldshoolanimation"] = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local animateScript = character:WaitForChild("Animate")
animateScript.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=5319828216"
animateScript.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=5319828216"
animateScript.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=5319844329"
animateScript.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=5319844329"
animateScript.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=5319841935"
animateScript.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=5319816685"
animateScript.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=5319839762"
end,

["vampireanimation"] = function()
local plr = game.Players.LocalPlayer
local character = plr.Character or plr.CharacterAdded:Wait()
local animate = character:WaitForChild("Animate")
animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930"
animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"
animate.Disabled = false
end,

["heroanimation"] = function()
local plr = game.Players.LocalPlayer
local character = plr.Character or plr.CharacterAdded:Wait()
local animate = character:WaitForChild("Animate")
animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295"
animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536"
animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076"
animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"
animate.Disabled = false
end,

["zombieclassicanimation"] = function()
local plr = game.Players.LocalPlayer
local character = plr.Character or plr.CharacterAdded:Wait()
local animate = character:WaitForChild("Animate")
animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
animate.Disabled = false
end,

["mageanimation"] = function()
local plr = game.Players.LocalPlayer
local character = plr.Character or plr.CharacterAdded:Wait()
local animate = character:WaitForChild("Animate")
animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
animate.Disabled = false
end,

["ghostanimation"] = function()
local plr = game.Players.LocalPlayer
local character = plr.Character or plr.CharacterAdded:Wait()
local animate = character:WaitForChild("Animate")
animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
animate.Disabled = false
end,

["checkupdate"] = function()
local player = game.Players.LocalPlayer
local hyCmds = player:WaitForChild("PlayerGui"):FindFirstChild("HyCMDs")

if hyCmds then
    hyCmds:Destroy()
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/Biem6ondo/Admin/main/HyCMDs"))()
end,

["executor"] = function()
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TB = Instance.new("TextBox")
local IYCommandButton = Instance.new("TextButton")
local ExecuteButton = Instance.new("TextButton")
local CopyScriptButton = Instance.new("TextButton")
local DeleteScriptButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local ToggleButton = Instance.new("TextButton")
local SizeGuisButton = Instance.new("TextButton")
local UICornerFrame = Instance.new("UICorner")
local UICornerButton = Instance.new("UICorner")
local UICornerToggle = Instance.new("UICorner")
local UICornerSizeButton = Instance.new("UICorner")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

Frame.Size = UDim2.new(0, 400, 0, 330)
Frame.Position = UDim2.new(0.5, -200, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.Visible = false
Frame.Parent = ScreenGui

UICornerFrame.CornerRadius = UDim.new(0, 10)
UICornerFrame.Parent = Frame

TB.Size = UDim2.new(0, 380, 0, 150)
TB.Position = UDim2.new(0, 10, 0, 40)
TB.Text = ""
TB.TextColor3 = Color3.fromRGB(255, 255, 255)
TB.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TB.ClearTextOnFocus = false
TB.TextWrapped = true
TB.TextXAlignment = Enum.TextXAlignment.Left
TB.Parent = Frame

IYCommandButton.Size = UDim2.new(0, 180, 0, 30)
IYCommandButton.Position = UDim2.new(0, 10, 0, 200)
IYCommandButton.Text = "IY Command"
IYCommandButton.TextColor3 = Color3.fromRGB(255, 255, 255)
IYCommandButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
IYCommandButton.Parent = Frame

ExecuteButton.Size = UDim2.new(0, 180, 0, 30)
ExecuteButton.Position = UDim2.new(0, 200, 0, 200)
ExecuteButton.Text = "Execute"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ExecuteButton.Parent = Frame

CopyScriptButton.Size = UDim2.new(0, 180, 0, 30)
CopyScriptButton.Position = UDim2.new(0, 10, 0, 240)
CopyScriptButton.Text = "Copy script"
CopyScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyScriptButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CopyScriptButton.Parent = Frame

DeleteScriptButton.Size = UDim2.new(0, 180, 0, 30)
DeleteScriptButton.Position = UDim2.new(0, 200, 0, 240)
DeleteScriptButton.Text = "Delete Script"
DeleteScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DeleteScriptButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DeleteScriptButton.Parent = Frame

CloseButton.Size = UDim2.new(0, 380, 0, 30)
CloseButton.Position = UDim2.new(0, 10, 0, 280)
CloseButton.Text = "[X] CLOSE"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CloseButton.Parent = Frame

ToggleButton.Size = UDim2.new(0, 150, 0, 30)
ToggleButton.Position = UDim2.new(0.5, -75, 0.1, 0)
ToggleButton.Text = "Toggle Executor"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.Parent = ScreenGui

UICornerToggle.CornerRadius = UDim.new(0, 10)
UICornerToggle.Parent = ToggleButton

UICornerSizeButton.CornerRadius = UDim.new(0, 10)
UICornerSizeButton.Parent = SizeGuisButton

for _, button in pairs({IYCommandButton, ExecuteButton, CopyScriptButton, DeleteScriptButton, CloseButton, ToggleButton}) do
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = button
end

local function changeButtonColor(button, color)
    button.BackgroundColor3 = color
    wait(0.5)
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
end

IYCommandButton.MouseButton1Click:Connect(function()
    changeButtonColor(IYCommandButton, Color3.fromRGB(255, 165, 0))
    local success, err = pcall(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)
    if not success then
        warn("Error: " .. err)
    end
end)

ExecuteButton.MouseButton1Click:Connect(function()
    changeButtonColor(ExecuteButton, Color3.fromRGB(0, 255, 0))
    local scriptToRun = TB.Text
    local success, err = pcall(function()
        loadstring(scriptToRun)()
    end)
    if not success then
        warn("Error: " .. err)
    end
end)

CopyScriptButton.MouseButton1Click:Connect(function()
    changeButtonColor(CopyScriptButton, Color3.fromRGB(0, 0, 255))
    setclipboard(TB.Text)
end)

DeleteScriptButton.MouseButton1Click:Connect(function()
    changeButtonColor(DeleteScriptButton, Color3.fromRGB(255, 0, 0))
    TB.Text = ""
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

ToggleButton.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)
end,

["emote"] = function()
local ContextActionService = game:GetService("ContextActionService")
local HttpService = game:GetService("HttpService")
local GuiService = game:GetService("GuiService")
local CoreGui = game:GetService("CoreGui")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")

local Emotes = {}
local LoadedEmotes = {}
local function AddEmote(name: string, id: IntValue, price: IntValue?)
	LoadedEmotes[id] = false
	task.spawn(function()
		if not (name and id) then
			return
		end
		local success, date = pcall(function()
			local info = MarketplaceService:GetProductInfo(id)
			local updated = info.Updated
			return DateTime.fromIsoDate(updated):ToUniversalTime()
		end)
		if not success then
			task.wait(10)
			AddEmote(name, id, price)
			return
		end
		local unix = os.time({
			year = date.Year,
			month = date.Month,
			day = date.Day,
			hour = date.Hour,
			min = date.Minute,
			sec = date.Second
		})
		LoadedEmotes[id] = true
		table.insert(Emotes, {
			["name"] = name,
			["id"] = id,
			["icon"] = "rbxthumb://type=Asset&id=".. id .."&w=150&h=150",
			["price"] = price or 0,
			["lastupdated"] = unix,
			["sort"] = {}
		})
	end)
end
local CurrentSort = "recentfirst"

local FavoriteOff = "rbxassetid://10651060677"
local FavoriteOn = "rbxassetid://10651061109"
local FavoritedEmotes = {}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Emotes"
ScreenGui.DisplayOrder = 2
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Enabled = true

local BackFrame = Instance.new("Frame")
BackFrame.Size = UDim2.new(0.9, 0, 0.5, 0)
BackFrame.AnchorPoint = Vector2.new(0.5, 0.5)
BackFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
BackFrame.SizeConstraint = Enum.SizeConstraint.RelativeYY
BackFrame.BackgroundTransparency = 1
BackFrame.BorderSizePixel = 0
BackFrame.Parent = ScreenGui

local EmoteName = Instance.new("TextLabel")
EmoteName.Name = "EmoteName"
EmoteName.TextScaled = true
EmoteName.AnchorPoint = Vector2.new(0.5, 0.5)
EmoteName.Position = UDim2.new(-0.1, 0, 0.5, 0)
EmoteName.Size = UDim2.new(0.2, 0, 0.2, 0)
EmoteName.SizeConstraint = Enum.SizeConstraint.RelativeYY
EmoteName.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
EmoteName.TextColor3 = Color3.new(1, 1, 1)
EmoteName.BorderSizePixel = 0
EmoteName.Parent = BackFrame

local Corner = Instance.new("UICorner")
Corner.Parent = EmoteName

local Loading = Instance.new("TextLabel", BackFrame)
Loading.AnchorPoint = Vector2.new(0.5, 0.5)
Loading.Text = "Loading...\nIf it takes more than 10 seconds, roblox is having issues\n(En) Emote will comming...."
Loading.TextColor3 = Color3.new(1, 1, 1)
Loading.BackgroundColor3 = Color3.new(0, 0, 0)
Loading.TextScaled = true
Loading.BackgroundTransparency = 0.5
Loading.Size = UDim2.fromScale(0.4, 0.2)
Loading.Position = UDim2.fromScale(0.5, 0.2)
Corner:Clone().Parent = Loading

local Frame = Instance.new("ScrollingFrame")
Frame.Size = UDim2.new(1, 0, 1, 0)
Frame.CanvasSize = UDim2.new(0, 0, 0, 0)
Frame.AutomaticCanvasSize = Enum.AutomaticSize.Y
Frame.ScrollingDirection = Enum.ScrollingDirection.Y
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.BackgroundTransparency = 1
Frame.ScrollBarThickness = 5
Frame.BorderSizePixel = 0
Frame.MouseLeave:Connect(function()
	EmoteName.Text = "Select an Emote"
end)
Frame.Parent = BackFrame

local Grid = Instance.new("UIGridLayout")
Grid.CellSize = UDim2.new(0.105, 0, 0, 0)
Grid.CellPadding = UDim2.new(0.006, 0, 0.006, 0)
Grid.SortOrder = Enum.SortOrder.LayoutOrder
Grid.Parent = Frame

local SortFrame = Instance.new("Frame")
SortFrame.Visible = false
SortFrame.BorderSizePixel = 0
SortFrame.Position = UDim2.new(1, 5, -0.125, 0)
SortFrame.Size = UDim2.new(0.2, 0, 0, 0)
SortFrame.AutomaticSize = Enum.AutomaticSize.Y
SortFrame.BackgroundTransparency = 1
Corner:Clone().Parent = SortFrame
SortFrame.Parent = BackFrame

local SortList = Instance.new("UIListLayout")
SortList.Padding = UDim.new(0.02, 0)
SortList.HorizontalAlignment = Enum.HorizontalAlignment.Center
SortList.VerticalAlignment = Enum.VerticalAlignment.Top
SortList.SortOrder = Enum.SortOrder.LayoutOrder
SortList.Parent = SortFrame

local function SortEmotes()
	for i,Emote in pairs(Emotes) do
		local EmoteButton = Frame:FindFirstChild(Emote.id)
		if not EmoteButton then
			continue
		end
		local IsFavorited = table.find(FavoritedEmotes, Emote.id)
		EmoteButton.LayoutOrder = Emote.sort[CurrentSort] + ((IsFavorited and 0) or #Emotes)
		EmoteButton.number.Text = Emote.sort[CurrentSort]
	end
end

local function createsort(order, text, sort)
	local CreatedSort = Instance.new("TextButton")
	CreatedSort.SizeConstraint = Enum.SizeConstraint.RelativeXX
	CreatedSort.Size = UDim2.new(1, 0, 0.2, 0)
	CreatedSort.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	CreatedSort.LayoutOrder = order
	CreatedSort.TextColor3 = Color3.new(1, 1, 1)
	CreatedSort.Text = text
	CreatedSort.TextScaled = true
	CreatedSort.BorderSizePixel = 0
	Corner:Clone().Parent = CreatedSort
	CreatedSort.Parent = SortFrame
	CreatedSort.MouseButton1Click:Connect(function()
		SortFrame.Visible = false
		CurrentSort = sort
		SortEmotes()
	end)
	return CreatedSort
end

createsort(1, "Recently Updated First", "recentfirst")
createsort(2, "Recently Updated Last", "recentlast")
createsort(3, "Alphabetically First", "alphabeticfirst")
createsort(4, "Alphabetically Last", "alphabeticlast")
createsort(5, "Highest Price", "highestprice")
createsort(6, "Lowest Price", "lowestprice")

local SortButton = Instance.new("TextButton")
SortButton.BorderSizePixel = 0
SortButton.AnchorPoint = Vector2.new(0.5, 0.5)
SortButton.Position = UDim2.new(0.925, -5, -0.075, 0)
SortButton.Size = UDim2.new(0.15, 0, 0.1, 0)
SortButton.TextScaled = true
SortButton.TextColor3 = Color3.new(1, 1, 1)
SortButton.BackgroundColor3 = Color3.new(0, 0, 0)
SortButton.BackgroundTransparency = 0.3
SortButton.Text = "Sort"
SortButton.MouseButton1Click:Connect(function()
	SortFrame.Visible = not SortFrame.Visible
end)
Corner:Clone().Parent = SortButton
SortButton.Parent = BackFrame

local CloseButton = Instance.new("TextButton")
CloseButton.BorderSizePixel = 0
CloseButton.AnchorPoint = Vector2.new(0.5, 0.5)
CloseButton.Position = UDim2.new(0.075, 0, -0.075, 0)
CloseButton.Size = UDim2.new(0.15, 0, 0.1, 0)
CloseButton.TextScaled = true
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.BackgroundColor3 = Color3.new(0, 0, 0)
CloseButton.BackgroundTransparency = 0.3
CloseButton.Text = "❌"
CloseButton.MouseButton1Click:Connect(function()
	ScreenGui.Frame.Visible = false
end)
Corner:Clone().Parent = CloseButton
CloseButton.Parent = BackFrame

local SearchBar = Instance.new("TextBox")
SearchBar.BorderSizePixel = 0
SearchBar.AnchorPoint = Vector2.new(0.5, 0.5)
SearchBar.Position = UDim2.new(0.5, 0, -0.075, 0)
SearchBar.Size = UDim2.new(0.55, 0, 0.1, 0)
SearchBar.TextScaled = true
SearchBar.PlaceholderText = "Search"
SearchBar.TextColor3 = Color3.new(1, 1, 1)
SearchBar.BackgroundColor3 = Color3.new(0, 0, 0)
SearchBar.BackgroundTransparency = 0.3
SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
	local text = SearchBar.Text:lower()
	local buttons = Frame:GetChildren()
	if text ~= text:sub(1,50) then
		SearchBar.Text = SearchBar.Text:sub(1,50)
		text = SearchBar.Text:lower()
	end
	if text ~= ""  then
		for i,button in pairs(buttons) do
			if button:IsA("GuiButton") then
				local name = button:GetAttribute("name"):lower()
				if name:match(text) then
					button.Visible = true
				else
					button.Visible = false
				end
			end
		end
	else
		for i,button in pairs(buttons) do
			if button:IsA("GuiButton") then
				button.Visible = true
			end
		end
	end
end)
Corner:Clone().Parent = SearchBar
SearchBar.Parent = BackFrame

local OpenEmotesButton = Instance.new("ImageButton")
OpenEmotesButton.Name = "OpenEmotesButton"
OpenEmotesButton.Parent = ScreenGui
OpenEmotesButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OpenEmotesButton.BackgroundTransparency = 0.5
OpenEmotesButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
OpenEmotesButton.BorderSizePixel = 0
OpenEmotesButton.Position = UDim2.new(0, 0, 0.5, -30)
OpenEmotesButton.Size = UDim2.new(0, 60, 0, 60)
OpenEmotesButton.Image = "rbxthumb://type=Asset&id=2736760466&w=420&h=420"

OpenEmotesButton.MouseButton1Click:Connect(function()
	ScreenGui.Frame.Visible = not ScreenGui.Frame.Visible
end)

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(1, 0)
ButtonCorner.Parent = OpenEmotesButton

local function openemotes(name, state, input)
	if state == Enum.UserInputState.Begin then
		ScreenGui.Frame.Visible = not ScreenGui.Frame.Visible
	end
end

ContextActionService:BindCoreActionAtPriority(
	"Emote Menu",
	openemotes,
	true,
	2001,
	Enum.KeyCode.Comma
)

local inputconnect
ScreenGui:GetPropertyChangedSignal("Enabled"):Connect(function()
	if ScreenGui.Frame.Visible == true then
		EmoteName.Text = "Select an Emote"
		SearchBar.Text = ""
		SortFrame.Visible = false
		GuiService:SetEmotesMenuOpen(false)
		inputconnect = UserInputService.InputBegan:Connect(function(input, processed)
			if not processed then
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					ScreenGui.Frame.Visible = false
				end
			end
		end)
	else
		inputconnect:Disconnect()
	end
end)

GuiService.EmotesMenuOpenChanged:Connect(function(isopen)
	if isopen then
		ScreenGui.Frame.Visible = false
	end
end)

GuiService.MenuOpened:Connect(function()
	ScreenGui.Frame.Visible = false
end)

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local SynV3 = syn and DrawingImmediate
if (not is_sirhurt_closure) and (not SynV3) and (syn and syn.protect_gui) then
	syn.protect_gui(ScreenGui)
	ScreenGui.Parent = CoreGui
elseif get_hidden_gui or gethui then
	local hiddenUI = get_hidden_gui or gethui
	ScreenGui.Parent = hiddenUI()
else
	ScreenGui.Parent = CoreGui
end

local function SendNotification(title, text)
	if syn and syn.toast_notification then
		syn.toast_notification({
			Type = ToastType.Error,
			Title = title,
			Content = text
		})
	else
		StarterGui:SetCore("SendNotification", {
			Title = title,
			Text = text
		})
	end
end

local LocalPlayer = Players.LocalPlayer

local function PlayEmote(name: string, id: IntValue)
	ScreenGui.Frame.Visible = false
	SearchBar.Text = ""
	local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	local Description = Humanoid and Humanoid:FindFirstChildOfClass("HumanoidDescription")
	if not Description then
		return
	end
	if LocalPlayer.Character.Humanoid.RigType ~= Enum.HumanoidRigType.R6 then
		local succ, err = pcall(function()
			Humanoid:PlayEmoteAndGetAnimTrackById(id)
		end)
		if not succ then
			Description:AddEmote(name, id)
			Humanoid:PlayEmoteAndGetAnimTrackById(id)
		end
	else
		SendNotification(
			"Need R15",
			"..."
		)
	end
end

local function WaitForChildOfClass(parent, class)
	local child = parent:FindFirstChildOfClass(class)
	while not child or child.ClassName ~= class do
		child = parent.ChildAdded:Wait()
	end
	return child
end

local Cursor = ""
while true do
	local function Request()
		local success, Response = pcall(function()
			return game:HttpGetAsync("https://catalog.roblox.com/v1/search/items/details?Category=12&Subcategory=39&SortType=1&SortAggregation=&limit=30&IncludeNotForSale=true&cursor=".. Cursor)
		end)
		if not success then
			task.wait(10)
			return Request()
		end
		return Response
	end
	local Response = Request()
	local Body = HttpService:JSONDecode(Response)
	for i,v in pairs(Body.data) do
		AddEmote(v.name, v.id, v.price)
	end
	if Body.nextPageCursor ~= nil then
		Cursor = Body.nextPageCursor
	else
		break
	end
end

--unreleased emotes
AddEmote("Arm Wave", 5915773155)
AddEmote("Head Banging", 5915779725)
AddEmote("Face Calisthenics", 9830731012)

--wait for emotes to finish loading

local function EmotesLoaded()
	for i, loaded in pairs(LoadedEmotes) do
		if not loaded then
			return false
		end
	end
	return true
end
while not EmotesLoaded() do
	task.wait()
end
Loading:Destroy()

table.sort(Emotes, function(a, b)
	return a.lastupdated > b.lastupdated
end)
for i,v in pairs(Emotes) do
	v.sort.recentfirst = i
end

table.sort(Emotes, function(a, b)
	return a.lastupdated < b.lastupdated
end)
for i,v in pairs(Emotes) do
	v.sort.recentlast = i
end

table.sort(Emotes, function(a, b)
	return a.name:lower() < b.name:lower()
end)
for i,v in pairs(Emotes) do
	v.sort.alphabeticfirst = i
end

table.sort(Emotes, function(a, b)
	return a.name:lower() > b.name:lower()
end)
for i,v in pairs(Emotes) do
	v.sort.alphabeticlast = i
end

table.sort(Emotes, function(a, b)
	return a.price < b.price
end)
for i,v in pairs(Emotes) do
	v.sort.lowestprice = i
end

table.sort(Emotes, function(a, b)
	return a.price > b.price
end)
for i,v in pairs(Emotes) do
	v.sort.highestprice = i
end

if isfile("FavoritedEmotes.txt") then
	if not pcall(function()
		FavoritedEmotes = HttpService:JSONDecode(readfile("FavoritedEmotes.txt"))
	end) then
		FavoritedEmotes = {}
	end
else
	writefile("FavoritedEmotes.txt", HttpService:JSONEncode(FavoritedEmotes))
end

local UpdatedFavorites = {}
for i,name in pairs(FavoritedEmotes) do
	if typeof(name) == "string" then
		for i,emote in pairs(Emotes) do
			if emote.name == name then
				table.insert(UpdatedFavorites, emote.id)
				break
			end
		end
	end
end
if #UpdatedFavorites ~= 0 then
	FavoritedEmotes = UpdatedFavorites
	writefile("FavoritedEmotes.txt", HttpService:JSONEncode(FavoritedEmotes))
end

local function CharacterAdded(Character)
	for i,v in pairs(Frame:GetChildren()) do
		if not v:IsA("UIGridLayout") then
			v:Destroy()
		end
	end
	local Humanoid = WaitForChildOfClass(Character, "Humanoid")
	local Description = Humanoid:WaitForChild("HumanoidDescription", 5) or Instance.new("HumanoidDescription", Humanoid)
	local random = Instance.new("TextButton")
	local Ratio = Instance.new("UIAspectRatioConstraint")
	Ratio.AspectType = Enum.AspectType.ScaleWithParentSize
	Ratio.Parent = random
	random.LayoutOrder = 0
	random.TextColor3 = Color3.new(1, 1, 1)
	random.BorderSizePixel = 0
	random.BackgroundTransparency = 0.5
	random.BackgroundColor3 = Color3.new(0, 0, 0)
	random.TextScaled = true
	random.Text = "Random"
	random:SetAttribute("name", "")
	Corner:Clone().Parent = random
	random.MouseButton1Click:Connect(function()
		local randomemote = Emotes[math.random(1, #Emotes)]
		PlayEmote(randomemote.name, randomemote.id)
	end)
	random.MouseEnter:Connect(function()
		EmoteName.Text = "Random"
	end)
	random.Parent = Frame
	for i,Emote in pairs(Emotes) do
		Description:AddEmote(Emote.name, Emote.id)
		local EmoteButton = Instance.new("ImageButton")
		local IsFavorited = table.find(FavoritedEmotes, Emote.id)
		EmoteButton.LayoutOrder = Emote.sort[CurrentSort] + ((IsFavorited and 0) or #Emotes)
		EmoteButton.Name = Emote.id
		EmoteButton:SetAttribute("name", Emote.name)
		Corner:Clone().Parent = EmoteButton
		EmoteButton.Image = Emote.icon
		EmoteButton.BackgroundTransparency = 0.5
		EmoteButton.BackgroundColor3 = Color3.new(0, 0, 0)
		EmoteButton.BorderSizePixel = 0
		Ratio:Clone().Parent = EmoteButton
		local EmoteNumber = Instance.new("TextLabel")
		EmoteNumber.Name = "number"
		EmoteNumber.TextScaled = true
		EmoteNumber.BackgroundTransparency = 1
		EmoteNumber.TextColor3 = Color3.new(1, 1, 1)
		EmoteNumber.BorderSizePixel = 0
		EmoteNumber.AnchorPoint = Vector2.new(0.5, 0.5)
		EmoteNumber.Size = UDim2.new(0.2, 0, 0.2, 0)
		EmoteNumber.Position = UDim2.new(0.1, 0, 0.9, 0)
		EmoteNumber.Text = Emote.sort[CurrentSort]
		EmoteNumber.TextXAlignment = Enum.TextXAlignment.Center
		EmoteNumber.TextYAlignment = Enum.TextYAlignment.Center
		local UIStroke = Instance.new("UIStroke")
		UIStroke.Transparency = 0.5
		UIStroke.Parent = EmoteNumber
		EmoteNumber.Parent = EmoteButton
		EmoteButton.Parent = Frame
		EmoteButton.MouseButton1Click:Connect(function()
			PlayEmote(Emote.name, Emote.id)
		end)
		EmoteButton.MouseEnter:Connect(function()
			EmoteName.Text = Emote.name
		end)
		local Favorite = Instance.new("ImageButton")
		Favorite.Name = "favorite"
		if table.find(FavoritedEmotes, Emote.id) then
			Favorite.Image = FavoriteOn
		else
			Favorite.Image = FavoriteOff
		end
		Favorite.AnchorPoint = Vector2.new(0.5, 0.5)
		Favorite.Size = UDim2.new(0.2, 0, 0.2, 0)
		Favorite.Position = UDim2.new(0.9, 0, 0.9, 0)
		Favorite.BorderSizePixel = 0
		Favorite.BackgroundTransparency = 1
		Favorite.Parent = EmoteButton
		Favorite.MouseButton1Click:Connect(function()
			local index = table.find(FavoritedEmotes, Emote.id)
			if index then
				table.remove(FavoritedEmotes, index)
				Favorite.Image = FavoriteOff
				EmoteButton.LayoutOrder = Emote.sort[CurrentSort] + #Emotes
			else
				table.insert(FavoritedEmotes, Emote.id)
				Favorite.Image = FavoriteOn
				EmoteButton.LayoutOrder = Emote.sort[CurrentSort]
			end
			writefile("FavoritedEmotes.txt", HttpService:JSONEncode(FavoritedEmotes))
		end)
	end
	for i=1,9 do
		local EmoteButton = Instance.new("Frame")
		EmoteButton.LayoutOrder = 2147483647
		EmoteButton.Name = "filler"
		EmoteButton.BackgroundTransparency = 1
		EmoteButton.BorderSizePixel = 0
		Ratio:Clone().Parent = EmoteButton
		EmoteButton.Visible = true
		EmoteButton.Parent = Frame
		EmoteButton.MouseEnter:Connect(function()
			EmoteName.Text = "Select an Emote"
		end)
	end
end

if LocalPlayer.Character then
	CharacterAdded(LocalPlayer.Character)
end
LocalPlayer.CharacterAdded:Connect(CharacterAdded)
end,

["noclip"] = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local noclipEnabled = true

local function setNoclip(enabled)
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not enabled
        end
    end
end

setNoclip(noclipEnabled)

character.Humanoid.Died:Connect(function()
    noclipEnabled = false
    setNoclip(false)
end)

game:GetService("RunService").Stepped:Connect(function()
    if noclipEnabled then
        setNoclip(true)
    end
end)
end,

["clip"] = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local function setClip()
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = true
        end
    end
end

setClip()
end,

["walkonwall"] = function()
loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end,

["keyboard"] = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end,

["calculator"] = function()
local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 500)
Frame.Position = UDim2.new(0.5, 0, 1.5, 0) -- Bắt đầu ở ngoài màn hình (phía dưới)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = Frame

local CloseButton = Instance.new("TextButton")
CloseButton.Text = "Close"
CloseButton.Size = UDim2.new(0, 50, 0, 50)
CloseButton.Position = UDim2.new(1, -60, 0, 10)
CloseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Parent = Frame

local UICornerCloseButton = Instance.new("UICorner")
UICornerCloseButton.CornerRadius = UDim.new(0, 10)
UICornerCloseButton.Parent = CloseButton

local Title = Instance.new("TextLabel")
Title.Text = "CASIO"
Title.Size = UDim2.new(0, 100, 0, 50)
Title.Position = UDim2.new(0.5, -150, 0, 10)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 24
Title.Parent = Frame

local EqualsButton = Instance.new("TextButton")
EqualsButton.Text = "="
EqualsButton.Size = UDim2.new(0, 50, 0, 50)
EqualsButton.Position = UDim2.new(0.5, -25, 0.9, -25)
EqualsButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
EqualsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EqualsButton.Parent = Frame

local UICornerEqualsButton = Instance.new("UICorner")
UICornerEqualsButton.CornerRadius = UDim.new(0, 10)
UICornerEqualsButton.Parent = EqualsButton

local TB = Instance.new("TextBox")
TB.Size = UDim2.new(0, 280, 0, 50)
TB.Position = UDim2.new(0.5, -140, 0.125, 0.5)
TB.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TB.TextColor3 = Color3.fromRGB(255, 255, 255)
TB.Text = ""
TB.Parent = Frame

local UICornerTB = Instance.new("UICorner")
UICornerTB.CornerRadius = UDim.new(0, 10)
UICornerTB.Parent = TB

local buttons = {
    {"1", "2", "3", "+"},
    {"4", "5", "6", "-"},
    {"7", "8", "9", "*"},
    {"0", "/", "Del", "AC"},
    {"^", "π", "!", "%"}
}

for i, row in ipairs(buttons) do
    for j, char in ipairs(row) do
        local button = Instance.new("TextButton")
        button.Text = char
        button.Size = UDim2.new(0, 50, 0, 50)
        button.Position = UDim2.new(0, (j-0.5) * 60, 0, 100 + (i-0.75) * 60)
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Parent = Frame

        local UICornerButton = Instance.new("UICorner")
        UICornerButton.CornerRadius = UDim.new(0, 10)
        UICornerButton.Parent = button

        button.MouseButton1Click:Connect(function()
            if char == "Del" then
                TB.Text = TB.Text:sub(1, -2)
            elseif char == "AC" then
                TB.Text = ""
            elseif char == "^" then
                TB.Text = TB.Text .. "^"
            elseif char == "π" then
                TB.Text = TB.Text .. tostring(math.pi)
            elseif char == "!" then
                local num = tonumber(TB.Text)
                if num then
                    local fact = 1
                    for k = 2, num do fact = fact * k end
                    TB.Text = tostring(fact)
                else
                    TB.Text = "Error"
                end
            elseif char == "%" then
                TB.Text = TB.Text .. "/100"
            else
                TB.Text = TB.Text .. char
            end
        end)
    end
end

local function flyIn()
    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local goal = {Position = UDim2.new(0.5, 0, 0.5, 0)} -- Bay lên vị trí giữa màn hình
    local tween = TweenService:Create(Frame, tweenInfo, goal)
    tween:Play()
end

local function fallOut()
    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
    local goal = {Position = UDim2.new(0.5, 0, 1.5, 0)} -- Rơi xuống dưới màn hình
    local tween = TweenService:Create(Frame, tweenInfo, goal)
    tween:Play()
    tween.Completed:Connect(function()
        ScreenGui:Destroy()
    end)
end

CloseButton.MouseButton1Click:Connect(function()
    fallOut() -- Gọi hiệu ứng rơi xuống khi bấm Close
end)

EqualsButton.MouseButton1Click:Connect(function()
    local expression = TB.Text:gsub("%^", "**")
    local success, result = pcall(loadstring("return " .. expression))
    if success then
        TB.Text = tostring(result)
    else
        TB.Text = "Error"
    end
end)

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
flyIn() -- Gọi hiệu ứng bay lên khi script được thực thi
end,
["minicalculator"] = function()
local TweenService = game:GetService("TweenService")
local SG = Instance.new("ScreenGui")
SG.ResetOnSpawn = false
local F = Instance.new("Frame")
F.Size = UDim2.new(0, 200, 0, 300)
F.Position = UDim2.new(0.5, 0, 1.5, 0)
F.AnchorPoint = Vector2.new(0.5, 0.5)
F.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
F.Parent = SG
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = F
local CB = Instance.new("TextButton")
CB.Text = "Close"
CB.Size = UDim2.new(0, 40, 0, 40)
CB.Position = UDim2.new(1, -50, 0, 5)
CB.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CB.TextColor3 = Color3.fromRGB(255, 255, 255)
CB.Parent = F
local UICornerCB = Instance.new("UICorner")
UICornerCB.CornerRadius = UDim.new(0, 8)
UICornerCB.Parent = CB
local Title = Instance.new("TextLabel")
Title.Text = "CASIO"
Title.Size = UDim2.new(0, 80, 0, 30)
Title.Position = UDim2.new(0.5, -40, 0, 5)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
Title.Parent = F
local EB = Instance.new("TextButton")
EB.Text = "="
EB.Size = UDim2.new(0, 40, 0, 40)
EB.Position = UDim2.new(0.5, -20, 0.85, -20)
EB.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
EB.TextColor3 = Color3.fromRGB(255, 255, 255)
EB.Parent = F
local UICornerEB = Instance.new("UICorner")
UICornerEB.CornerRadius = UDim.new(0, 8)
UICornerEB.Parent = EB
local TB = Instance.new("TextBox")
TB.Size = UDim2.new(0, 180, 0, 30)
TB.Position = UDim2.new(0.5, -90, 0.125, 0.5)
TB.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TB.TextColor3 = Color3.fromRGB(255, 255, 255)
TB.Text = ""
TB.Parent = F
local UICornerTB = Instance.new("UICorner")
UICornerTB.CornerRadius = UDim.new(0, 8)
UICornerTB.Parent = TB
local buttons = {
    {"1", "2", "3", "+"},
    {"4", "5", "6", "-"},
    {"7", "8", "9", "*"},
    {"0", "/", "Del", "AC"}
}
for i, row in ipairs(buttons) do
    for j, char in ipairs(row) do
        local button = Instance.new("TextButton")
        button.Text = char
        button.Size = UDim2.new(0, 40, 0, 40)
        button.Position = UDim2.new(0, (j-1) * 50, 0, 60 + (i-1) * 50)
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Parent = F
        local UICornerButton = Instance.new("UICorner")
        UICornerButton.CornerRadius = UDim.new(0, 8)
        UICornerButton.Parent = button
        button.MouseButton1Click:Connect(function()
            if char == "Del" then
                TB.Text = TB.Text:sub(1, -2)
            elseif char == "AC" then
                TB.Text = ""
            else
                TB.Text = TB.Text .. char
            end
        end)
    end
end
local function flyIn()
    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local goal = {Position = UDim2.new(0.5, 0, 0.5, 0)}
    local tween = TweenService:Create(F, tweenInfo, goal)
    tween:Play()
end
local function fallOut()
    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
    local goal = {Position = UDim2.new(0.5, 0, 1.5, 0)}
    local tween = TweenService:Create(F, tweenInfo, goal)
    tween:Play()
    tween.Completed:Connect(function()
        SG:Destroy()
    end)
end
CB.MouseButton1Click:Connect(function()
    fallOut()
end)
EB.MouseButton1Click:Connect(function()
    local expression = TB.Text:gsub("%^", "**")
    local success, result = pcall(loadstring("return " .. expression))
    if success then
        TB.Text = tostring(result)
    else
        TB.Text = "Error"
    end
end)
SG.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
flyIn()
end,

["animationlist"] = function()
local SG = Instance.new("ScreenGui")
SG.Name = "MyGUI"
SG.Parent = game.Players.LocalPlayer.PlayerGui

local F = Instance.new("Frame")
F.Name = "MainFrame"
F.Parent = SG
F.Size = UDim2.new(0.5, 0, 0.5, 0)
F.Position = UDim2.new(0.25, 0, 0.25, 0)
F.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
F.BorderSizePixel = 0
F.ClipsDescendants = true
F.BackgroundTransparency = 0.4

local T = Instance.new("TextLabel")
T.Name = "Title"
T.Parent = F
T.Size = UDim2.new(1, 0, 0.1, 0)
T.Position = UDim2.new(0, 0, 0, 0)
T.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
T.Text = "Animation List"
T.TextColor3 = Color3.fromRGB(255, 255, 255)
T.TextScaled = true
T.TextStrokeTransparency = 0.8

local UICB = Instance.new("UICorner")
UICB.CornerRadius = UDim.new(0, 10)
UICB.Parent = CB

local SF = Instance.new("ScrollingFrame")
SF.Name = "ScrollingFrame"
SF.Parent = F
SF.Size = UDim2.new(1, 0, 0.85, 0)
SF.Position = UDim2.new(0, 0, 0.1, 0)
SF.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
SF.ScrollBarThickness = 0
SF.ClipsDescendants = false
SF.CanvasSize = UDim2.new(0, 0, 100000, 0)

local UIL = Instance.new("UIListLayout")
UIL.Parent = SF
UIL.FillDirection = Enum.FillDirection.Vertical
UIL.SortOrder = Enum.SortOrder.LayoutOrder
UIL.Padding = UDim.new(0, 5)

local function createButton(name, animations)
    local B = Instance.new("TextButton")
    B.Name = name
    B.Parent = SF
    B.Size = UDim2.new(1, 0, 0, 50)
    B.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    B.Text = name
    B.TextColor3 = Color3.fromRGB(255, 255, 255)
    B.TextScaled = true
    B.BackgroundTransparency = 0.4

    B.MouseButton1Click:Connect(function()
        local Player = game.Players.LocalPlayer
        local Animate = Player.Character:FindFirstChild("Animate")
        if Animate then
            Animate.idle.Animation1.AnimationId = animations.idle1
            Animate.idle.Animation2.AnimationId = animations.idle2
            Animate.walk.WalkAnim.AnimationId = animations.walk
            Animate.run.RunAnim.AnimationId = animations.run
            Animate.jump.JumpAnim.AnimationId = animations.jump
            Animate.climb.ClimbAnim.AnimationId = animations.climb
            Animate.fall.FallAnim.AnimationId = animations.fall
        end
    end)

    return B
end

createButton("Vamp", {
    idle1 = "http://www.roblox.com/asset/?id=1083445855",
    idle2 = "http://www.roblox.com/asset/?id=1083450166",
    walk = "http://www.roblox.com/asset/?id=1083473930",
    run = "http://www.roblox.com/asset/?id=1083462077",
    jump = "http://www.roblox.com/asset/?id=1083455352",
    climb = "http://www.roblox.com/asset/?id=1083439238",
    fall = "http://www.roblox.com/asset/?id=1083443587",
})

createButton("Hero", {
    idle1 = "http://www.roblox.com/asset/?id=616111295",
    idle2 = "http://www.roblox.com/asset/?id=616113536",
    walk = "http://www.roblox.com/asset/?id=616122287",
    run = "http://www.roblox.com/asset/?id=616117076",
    jump = "http://www.roblox.com/asset/?id=616115533",
    climb = "http://www.roblox.com/asset/?id=616104706",
    fall = "http://www.roblox.com/asset/?id=616108001",
})

createButton("Zombie Classic", {
    idle1 = "http://www.roblox.com/asset/?id=616158929",
    idle2 = "http://www.roblox.com/asset/?id=616160636",
    walk = "http://www.roblox.com/asset/?id=616168032",
    run = "http://www.roblox.com/asset/?id=616163682",
    jump = "http://www.roblox.com/asset/?id=616161997",
    climb = "http://www.roblox.com/asset/?id=616156119",
    fall = "http://www.roblox.com/asset/?id=616157476",
})

createButton("Ghost", {
    idle1 = "http://www.roblox.com/asset/?id=616006778",
    idle2 = "http://www.roblox.com/asset/?id=616008087",
    walk = "http://www.roblox.com/asset/?id=616010382",
    run = "http://www.roblox.com/asset/?id=616013216",
    jump = "http://www.roblox.com/asset/?id=616008936",
    climb = "http://www.roblox.com/asset/?id=616003713",
    fall = "http://www.roblox.com/asset/?id=616005863",
})

createButton("Elder", {
    idle1 = "http://www.roblox.com/asset/?id=845397899",
    idle2 = "http://www.roblox.com/asset/?id=845400520",
    walk = "http://www.roblox.com/asset/?id=845403856",
    run = "http://www.roblox.com/asset/?id=845386501",
    jump = "http://www.roblox.com/asset/?id=845398858",
    climb = "http://www.roblox.com/asset/?id=845392038",
    fall = "http://www.roblox.com/asset/?id=845396048",
})

createButton("Levitation", {
    idle1 = "http://www.roblox.com/asset/?id=616006778",
    idle2 = "http://www.roblox.com/asset/?id=616008087",
    walk = "http://www.roblox.com/asset/?id=616013216",
    run = "http://www.roblox.com/asset/?id=616010382",
    jump = "http://www.roblox.com/asset/?id=616008936",
    climb = "http://www.roblox.com/asset/?id=616003713",
    fall = "http://www.roblox.com/asset/?id=616005863",
})

createButton("Astronaut", {
    idle1 = "http://www.roblox.com/asset/?id=891621366",
    idle2 = "http://www.roblox.com/asset/?id=891633237",
    walk = "http://www.roblox.com/asset/?id=891667138",
    run = "http://www.roblox.com/asset/?id=891636393",
    jump = "http://www.roblox.com/asset/?id=891627522",
    climb = "http://www.roblox.com/asset/?id=891609353",
    fall = "http://www.roblox.com/asset/?id=891617961",
})

createButton("Ninja", {
    idle1 = "http://www.roblox.com/asset/?id=656117400",
    idle2 = "http://www.roblox.com/asset/?id=656118341",
    walk = "http://www.roblox.com/asset/?id=656121766",
    run = "http://www.roblox.com/asset/?id=656118852",
    jump = "http://www.roblox.com/asset/?id=656117878",
    climb = "http://www.roblox.com/asset/?id=656114359",
    fall = "http://www.roblox.com/asset/?id=656115606",
})

createButton("Mage", {
    idle1 = "http://www.roblox.com/asset/?id=707742142",
    idle2 = "http://www.roblox.com/asset/?id=707855907",
    walk = "http://www.roblox.com/asset/?id=707897309",
    run = "http://www.roblox.com/asset/?id=707861613",
    jump = "http://www.roblox.com/asset/?id=707853694",
    climb = "http://www.roblox.com/asset/?id=707826056",
    fall = "http://www.roblox.com/asset/?id=707829716",
})

createButton("Werewolf", {
    idle1 = "http://www.roblox.com/asset/?id=1083195517",
    idle2 = "http://www.roblox.com/asset/?id=1083214717",
    walk = "http://www.roblox.com/asset/?id=1083178339",
    run = "http://www.roblox.com/asset/?id=1083216690",
    jump = "http://www.roblox.com/asset/?id=1083218792",
    climb = "http://www.roblox.com/asset/?id=1083182000",
    fall = "http://www.roblox.com/asset/?id=1083189019",
})

createButton("Cartoon", {
    idle1 = "http://www.roblox.com/asset/?id=742637544",
    idle2 = "http://www.roblox.com/asset/?id=742638445",
    walk = "http://www.roblox.com/asset/?id=742640026",
    run = "http://www.roblox.com/asset/?id=742638842",
    jump = "http://www.roblox.com/asset/?id=742637942",
    climb = "http://www.roblox.com/asset/?id=742636889",
    fall = "http://www.roblox.com/asset/?id=742637151",
})

createButton("Pirate", {
    idle1 = "http://www.roblox.com/asset/?id=750781874",
    idle2 = "http://www.roblox.com/asset/?id=750782770",
    walk = "http://www.roblox.com/asset/?id=750785693",
    run = "http://www.roblox.com/asset/?id=750783738",
    jump = "http://www.roblox.com/asset/?id=750782230",
    climb = "http://www.roblox.com/asset/?id=750779899",
    fall = "http://www.roblox.com/asset/?id=750780242",
})

createButton("Sneaky", {
    idle1 = "http://www.roblox.com/asset/?id=1132473842",
    idle2 = "http://www.roblox.com/asset/?id=1132477671",
    walk = "http://www.roblox.com/asset/?id=1132510133",
    run = "http://www.roblox.com/asset/?id=1132494274",
    jump = "http://www.roblox.com/asset/?id=1132489853",
    climb = "http://www.roblox.com/asset/?id=1132461372",
    fall = "http://www.roblox.com/asset/?id=1132469004",
})

createButton("Toy", {
    idle1 = "http://www.roblox.com/asset/?id=782841498",
    idle2 = "http://www.roblox.com/asset/?id=782845736",
    walk = "http://www.roblox.com/asset/?id=782843345",
    run = "http://www.roblox.com/asset/?id=782842708",
    jump = "http://www.roblox.com/asset/?id=782847020",
    climb = "http://www.roblox.com/asset/?id=782843869",
    fall = "http://www.roblox.com/asset/?id=782846423",
})

createButton("Knight", {
    idle1 = "http://www.roblox.com/asset/?id=657595757",
    idle2 = "http://www.roblox.com/asset/?id=657568135",
    walk = "http://www.roblox.com/asset/?id=657552124",
    run = "http://www.roblox.com/asset/?id=657564596",
    jump = "http://www.roblox.com/asset/?id=658409194",
    climb = "http://www.roblox.com/asset/?id=658360781",
    fall = "http://www.roblox.com/asset/?id=657600338",
})

createButton("Confident", {
    idle1 = "http://www.roblox.com/asset/?id=1069977950",
    idle2 = "http://www.roblox.com/asset/?id=1069987858",
    walk = "http://www.roblox.com/asset/?id=1070017263",
    run = "http://www.roblox.com/asset/?id=1070001516",
    jump = "http://www.roblox.com/asset/?id=1069984524",
    climb = "http://www.roblox.com/asset/?id=1069946257",
    fall = "http://www.roblox.com/asset/?id=1069973677",
})

createButton("Popstar", {
    idle1 = "http://www.roblox.com/asset/?id=1212900985",
    idle2 = "http://www.roblox.com/asset/?id=1212900985",
    walk = "http://www.roblox.com/asset/?id=1212980338",
    run = "http://www.roblox.com/asset/?id=1212980348",
    jump = "http://www.roblox.com/asset/?id=1212954642",
    climb = "http://www.roblox.com/asset/?id=1213044953",
    fall = "http://www.roblox.com/asset/?id=1212900995",
})

createButton("Princess", {
    idle1 = "http://www.roblox.com/asset/?id=941003647",
    idle2 = "http://www.roblox.com/asset/?id=941013098",
    walk = "http://www.roblox.com/asset/?id=941028902",
    run = "http://www.roblox.com/asset/?id=941015281",
    jump = "http://www.roblox.com/asset/?id=941008832",
    climb = "http://www.roblox.com/asset/?id=940996062",
    fall = "http://www.roblox.com/asset/?id=941000007",
})

createButton("Cowboy", {
    idle1 = "http://www.roblox.com/asset/?id=1014390418",
    idle2 = "http://www.roblox.com/asset/?id=1014398616",
    walk = "http://www.roblox.com/asset/?id=1014421541",
    run = "http://www.roblox.com/asset/?id=1014401683",
    jump = "http://www.roblox.com/asset/?id=1014394726",
    climb = "http://www.roblox.com/asset/?id=1014380606",
})

createButton("Patrol", {
    idle1 = "http://www.roblox.com/asset/?id=1149612882",
    idle2 = "http://www.roblox.com/asset/?id=1150842221",
    walk = "http://www.roblox.com/asset/?id=1151231493",
    run = "http://www.roblox.com/asset/?id=1150967949",
    jump = "http://www.roblox.com/asset/?id=1150944216",
    climb = "http://www.roblox.com/asset/?id=1148811837",
    fall = "http://www.roblox.com/asset/?id=1148863382",
})

local CB = Instance.new("TextButton")
CB.Name = "CloseButton"
CB.Parent = F
CB.Size = UDim2.new(0.1, 0, 0.1, 0)
CB.Position = UDim2.new(0.9, 0, 0, 0)
CB.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CB.Text = "❌"
CB.TextColor3 = Color3.fromRGB(255, 255, 255)
CB.TextScaled = true
CB.BackgroundTransparency = 0.4

local UIC = Instance.new("UICorner")
UIC.CornerRadius = UDim.new(0, 10)
UIC.Parent = F

F.Position = UDim2.new(0.25, 0, 1, 0)
F:TweenPosition(UDim2.new(0.25, 0, 0.25, 0), "Out", "Quad", 0.5)

CB.MouseButton1Click:Connect(function()
    F:TweenPosition(UDim2.new(0.25, 0, 1, 0), "Out", "Quad", 0.5)
    wait(0.5)
    SG:Destroy()
end)

F.AncestryChanged:Connect(function()
    if not F:IsDescendantOf(SG) then
        SG:Destroy()
    end
end)

-- Gui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MyGUI"
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0.5, 0, 0.5, 0)
Frame.Position = UDim2.new(0.25, 0, 0.25, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0.1, 0)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.Text = "Title"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextStrokeTransparency = 0.8

-- Rounded corners for the title
local TopCornersFrame = Instance.new("Frame")
TopCornersFrame.Name = "TopCornersFrame"
TopCornersFrame.Parent = Title
TopCornersFrame.Size = UDim2.new(1, 0, 1, 0)
TopCornersFrame.BackgroundColor3 = Title.BackgroundColor3
TopCornersFrame.BorderSizePixel = 0
TopCornersFrame.BackgroundTransparency = 1

local UICornerTop = Instance.new("UICorner")
UICornerTop.CornerRadius = UDim.new(0, 10)
UICornerTop.Parent = TopCornersFrame

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = Frame
CloseButton.Size = UDim2.new(0.1, 0, 0.1, 0)
CloseButton.Position = UDim2.new(0.9, 0, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CloseButton.Text = "❌"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextScaled = true

local UICornerButton = Instance.new("UICorner")
UICornerButton.CornerRadius = UDim.new(0, 10)
UICornerButton.Parent = CloseButton

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Name = "InfoLabel"
InfoLabel.Parent = Frame
InfoLabel.Size = UDim2.new(1, 0, 0.9, 0)
InfoLabel.Position = UDim2.new(0, 0, 0.1, 0)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Text = "Currently, it doesn't have a swim animation, I don't have any assets yet\n The same goes for anim commands, please wait for us to fix the error\n Please report, it still doesn't have full animation :("
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.TextScaled = true
InfoLabel.TextSize = 5

-- "Dont show again" buttons
local DontShowAgainFrame = Instance.new("Frame")
DontShowAgainFrame.Name = "DontShowAgainFrame"
DontShowAgainFrame.Parent = Frame
DontShowAgainFrame.Size = UDim2.new(1, 0, 0.1, 0)
DontShowAgainFrame.Position = UDim2.new(0, 0, 0.9, 0)
DontShowAgainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

local UICornerDontShowAgain = Instance.new("UICorner")
UICornerDontShowAgain.CornerRadius = UDim.new(0, 10)
UICornerDontShowAgain.Parent = DontShowAgainFrame

local YesButton = Instance.new("TextButton")
YesButton.Name = "YesButton"
YesButton.Parent = DontShowAgainFrame
YesButton.Size = UDim2.new(0.5, 0, 1, 0)
YesButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
YesButton.Text = "Dont Show Again (One tap)"
YesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
YesButton.TextScaled = true

local UICornerYes = Instance.new("UICorner")
UICornerYes.CornerRadius = UDim.new(0, 10)
UICornerYes.Parent = YesButton

local UICornerNo = Instance.new("UICorner")
UICornerNo.CornerRadius = UDim.new(0, 10)
UICornerNo.Parent = NoButton

Frame.Position = UDim2.new(0.25, 0, 1, 0)
Frame:TweenPosition(UDim2.new(0.25, 0, 0.25, 0), "Out", "Quad", 0.5)

local Camera = workspace.CurrentCamera
local BlurEffect = Instance.new("BlurEffect")
BlurEffect.Name = "BlurEffect"
BlurEffect.Size = 50
BlurEffect.Parent = Camera

CloseButton.MouseButton1Click:Connect(function()
    Frame:TweenPosition(UDim2.new(0.25, 0, 1, 0), "Out", "Quad", 0.5)
    for i = 50, 0, -10 do
        BlurEffect.Size = i
        wait(0)
    end
    BlurEffect:Destroy()
    wait(0.5)
    ScreenGui:Destroy()
end)

YesButton.MouseButton1Click:Connect(function()
    writefile("animationlist.txt", "1")
    CloseButton:MouseButton1Click()
end)


Frame.AncestryChanged:Connect(function()
    if not Frame:IsDescendantOf(ScreenGui) then
        BlurEffect:Destroy()
    end
end)

-- Kiểm tra nếu không hiện lại
if isfile("animationlist.txt") then
    local value = readfile("animationlist.txt")
    if value == "1" then
        ScreenGui:Destroy()
    end
end
end,

["fly"] = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
-- Gui no dont show again
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MyGUI"
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0.5, 0, 0.5, 0)
Frame.Position = UDim2.new(0.25, 0, 0.25, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0.1, 0)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.Text = "Fly v3 (For temporary use)"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextStrokeTransparency = 0.8

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = Frame
CloseButton.Size = UDim2.new(0.1, 0, 0.1, 0)
CloseButton.Position = UDim2.new(0.9, 0, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CloseButton.Text = "❌"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextScaled = true

local UICornerButton = Instance.new("UICorner")
UICornerButton.CornerRadius = UDim.new(0, 10)
UICornerButton.Parent = CloseButton

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Name = "InfoLabel"
InfoLabel.Parent = Frame
InfoLabel.Size = UDim2.new(1, 0, 0.9, 0)
InfoLabel.Position = UDim2.new(0, 0, 0.1, 0)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Text = "Sorry, you can use this temporarily."
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.TextScaled = true

Frame.Position = UDim2.new(0.25, 0, 1, 0)
Frame:TweenPosition(UDim2.new(0.25, 0, 0.25, 0), "Out", "Quad", 0.5)

local Camera = workspace.CurrentCamera
local BlurEffect = Instance.new("BlurEffect")
BlurEffect.Name = "BlurEffect"
BlurEffect.Size = 50
BlurEffect.Parent = Camera

CloseButton.MouseButton1Click:Connect(function()
    Frame:TweenPosition(UDim2.new(0.25, 0, 1, 0), "Out", "Quad", 0.5)
    for i = 50, 0, -10 do
        BlurEffect.Size = i
        wait(0)
    end
    BlurEffect:Destroy()
    wait(0.5)
    ScreenGui:Destroy()
end)

Frame.AncestryChanged:Connect(function()
    if not Frame:IsDescendantOf(ScreenGui) then
        BlurEffect:Destroy()
    end
end)
end,

["runemote"] = function(id)
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    
    if humanoid then
        humanoid:LoadAnimation(Instance.new("Animation", {
            AnimationId = "rbxassetid://"..id
        })):Play()
    end
end,

["guisize"] = function(size)
    local function scaleGuiElements(gui)
        for _, element in pairs(gui:GetDescendants()) do
            if element:IsA("GuiObject") then
                element.Size = UDim2.new(element.Size.X.Scale, element.Size.X.Offset + size, element.Size.Y.Scale, element.Size.Y.Offset + size)
            end
        end
    end

    local CoreGui = game:GetService("CoreGui")
    scaleGuiElements(CoreGui)

    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local PlayerGui = player:WaitForChild("PlayerGui")
    scaleGuiElements(PlayerGui)

    local StarterGui = game:GetService("StarterGui")
    scaleGuiElements(StarterGui)
end,

["fpscap"] = function(value)
    setfpscap(tonumber(value))
end,

["guicolor"] = function(colorname)
    local colors = {
        red = Color3.fromRGB(255, 0, 0),
        green = Color3.fromRGB(0, 255, 0),
        blue = Color3.fromRGB(0, 0, 255),
        yellow = Color3.fromRGB(255, 255, 0),
        cyan = Color3.fromRGB(0, 255, 255),
        magenta = Color3.fromRGB(255, 0, 255),
        black = Color3.fromRGB(0, 0, 0),
        white = Color3.fromRGB(255, 255, 255),
        orange = Color3.fromRGB(255, 165, 0),
        purple = Color3.fromRGB(128, 0, 128),
        pink = Color3.fromRGB(255, 192, 203),
        brown = Color3.fromRGB(165, 42, 42),
        gray = Color3.fromRGB(128, 128, 128),
        lightgray = Color3.fromRGB(211, 211, 211),
        darkgray = Color3.fromRGB(169, 169, 169),
        lightblue = Color3.fromRGB(173, 216, 230),
        darkblue = Color3.fromRGB(0, 0, 139),
        lightgreen = Color3.fromRGB(144, 238, 144),
        darkgreen = Color3.fromRGB(0, 100, 0),
        gold = Color3.fromRGB(255, 215, 0),
    }

    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local PlayerGui = player:WaitForChild("PlayerGui")
    local CoreGui = game:GetService("CoreGui")

    local color = colors[colorname]

    if color then
        for _, gui in pairs(CoreGui:GetDescendants()) do
            if gui:IsA("GuiObject") then
                gui.BackgroundColor3 = color
            end
        end

        for _, gui in pairs(PlayerGui:GetDescendants()) do
            if gui:IsA("GuiObject") and gui.Name ~= "HyCMDs" then
                gui.BackgroundColor3 = color
            end
        end
    end
end,

["textcolor"] = function(colorname)
    local colors = {
        red = Color3.fromRGB(255, 0, 0),
        green = Color3.fromRGB(0, 255, 0),
        blue = Color3.fromRGB(0, 0, 255),
        yellow = Color3.fromRGB(255, 255, 0),
        cyan = Color3.fromRGB(0, 255, 255),
        magenta = Color3.fromRGB(255, 0, 255),
        black = Color3.fromRGB(0, 0, 0),
        white = Color3.fromRGB(255, 255, 255),
        orange = Color3.fromRGB(255, 165, 0),
        purple = Color3.fromRGB(128, 0, 128),
        pink = Color3.fromRGB(255, 192, 203),
        brown = Color3.fromRGB(165, 42, 42),
        gray = Color3.fromRGB(128, 128, 128),
        lightgray = Color3.fromRGB(211, 211, 211),
        darkgray = Color3.fromRGB(169, 169, 169),
        lightblue = Color3.fromRGB(173, 216, 230),
        darkblue = Color3.fromRGB(0, 0, 139),
        lightgreen = Color3.fromRGB(144, 238, 144),
        darkgreen = Color3.fromRGB(0, 100, 0),
        gold = Color3.fromRGB(255, 215, 0),
    }

    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local PlayerGui = player:WaitForChild("PlayerGui")
    local CoreGui = game:GetService("CoreGui")

    local color = colors[colorname]

    if color then
        for _, gui in pairs(CoreGui:GetDescendants()) do
            if gui:IsA("TextLabel") or gui:IsA("TextButton") then
                gui.TextColor3 = color
            end
        end

        for _, gui in pairs(PlayerGui:GetDescendants()) do
            if gui:IsA("TextLabel") or gui:IsA("TextButton") and gui.Name ~= "HyCMDs" then
                gui.TextColor3 = color
            end
        end
    end
end,
}

-- End Command!
local function processCommand(commandText)
    local parts = split(commandText:lower():match("^%s*(.-)%s*$"), " ")
    local command = parts[1]
    local targetName = table.concat(parts, " ", 2)

    if command ~= "" and commands[command] then
        local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
        local goal = { Size = UDim2.new(1, 0, 1, 0) }
        local tween = TweenService:Create(loadingBar, tweenInfo, goal)
        tween:Play()

        tween.Completed:Connect(function()
            loadingLabel.Text = ""
            commands[command](targetName)
            textBox.Text = ""
            loadingBar.Size = UDim2.new(0, 0, 1, 0)
        end)
    else
        loadingLabel.Text = "Invalid Command! Enter 'command' to learn the commands!"
        loadingLabel.TextColor3 = Color3.fromRGB(255,0,0)
        loadingLabel.Position = UDim2.new(0, 10, 0, 106)
        loadingLabel.Size = UDim2.new(0, 310, 0, 20)
    end
end

executeButton.MouseButton1Click:Connect(function()
    processCommand(textBox.Text)
end)

textBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        processCommand(textBox.Text)
    end
end)

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

for _, gui in pairs(playerGui:GetChildren()) do
    if gui:IsA("ScreenGui") and gui.Name:find("HyCMDs") then
        gui.ResetOnSpawn = false
    end
end

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

while true do
    local hyCMDsGuis = {}

    for _, gui in pairs(playerGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui.Name:find("HyCMDs") then
            table.insert(hyCMDsGuis, gui)
        end
    end

    if #hyCMDsGuis > 1 then
        for i = 2, #hyCMDsGuis do
            hyCMDsGuis[i]:Destroy()
        end
    end

    wait(0)  
end