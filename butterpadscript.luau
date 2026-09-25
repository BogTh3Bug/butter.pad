local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Remote Events
local butterRemotes = ReplicatedStorage:WaitForChild("ButterRemotes")
local boostEvent = butterRemotes:WaitForChild("BuyUpgrade")
local rebirthEvent = butterRemotes:WaitForChild("Rebirth")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutoFarmGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Main Container Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 220, 0, 260)
mainFrame.Position = UDim2.new(0.05, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true -- Allows the GUI to be dragged around
mainFrame.Parent = screenGui

-- Rounded corners for Main Frame
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = mainFrame

-- Title
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Auto Panel"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 18
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Parent = mainFrame

-- UI List Layout to align buttons automatically
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = mainFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Helper function to create styled buttons
local function createButton(name, text, layoutOrder)
	local button = Instance.new("TextButton")
	button.Name = name
	button.Size = UDim2.new(0.85, 0, 0, 40)
	button.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Text = text
	button.Font = Enum.Font.SourceSansSemibold
	button.TextSize = 16
	button.LayoutOrder = layoutOrder
	button.AutoButtonColor = true
	button.Parent = mainFrame
	
	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0, 6)
	btnCorner.Parent = button
	
	return button
end

-- Create the 4 Buttons
local boostButton = createButton("BoostButton", "Boost", 1)
local rebirthButton = createButton("RebirthButton", "Rebirth", 2)
local autoBoostButton = createButton("AutoBoostButton", "Auto Boost: OFF", 3)
local autoRebirthButton = createButton("AutoRebirthButton", "Auto Rebirth: OFF", 4)

-- Toggle States
local autoBoostEnabled = false
local autoRebirthEnabled = false

----------------------------------------------------
-- Button Actions
----------------------------------------------------

-- Single Boost
boostButton.MouseButton1Click:Connect(function()
	boostEvent:FireServer("PointsMultiplier")
end)

-- Single Rebirth
rebirthButton.MouseButton1Click:Connect(function()
	rebirthEvent:FireServer()
end)

-- Auto Boost Toggle
autoBoostButton.MouseButton1Click:Connect(function()
	autoBoostEnabled = not autoBoostEnabled
	
	if autoBoostEnabled then
		autoBoostButton.Text = "Auto Boost: ON"
		autoBoostButton.BackgroundColor3 = Color3.fromRGB(46, 139, 87)
	else
		autoBoostButton.Text = "Auto Boost: OFF"
		autoBoostButton.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
	end
end)

-- Auto Rebirth Toggle
autoRebirthButton.MouseButton1Click:Connect(function()
	autoRebirthEnabled = not autoRebirthEnabled
	
	if autoRebirthEnabled then
		autoRebirthButton.Text = "Auto Rebirth: ON"
		autoRebirthButton.BackgroundColor3 = Color3.fromRGB(46, 139, 87)
	else
		autoRebirthButton.Text = "Auto Rebirth: OFF"
		autoRebirthButton.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
	end
end)

----------------------------------------------------
-- Loops (Runs every second)
----------------------------------------------------

task.spawn(function()
	while true do
		if autoBoostEnabled then
			boostEvent:FireServer("PointsMultiplier")
		end
		task.wait(1)
	end
end)

task.spawn(function()
	while true do
		if autoRebirthEnabled then
			rebirthEvent:FireServer()
		end
		task.wait(1)
	end
end)

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local PathfindingService = game:GetService("PathfindingService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- State Variables
local recordedPoints = {}
local isRecording = false
local isWalking = false

--------------------------------------------------------------------------------
-- 1. CREATE GUI ELEMENTS PROGRAMMATICALLY
--------------------------------------------------------------------------------
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "WaypointGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 220, 0, 190)
mainFrame.Position = UDim2.new(0, 20, 0.5, -95)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 8)
uiCorner.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Waypoint Navigator"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 14
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Parent = mainFrame

local recordBtn = Instance.new("TextButton")
recordBtn.Name = "RecordBtn"
recordBtn.Size = UDim2.new(0.9, 0, 0, 30)
recordBtn.Position = UDim2.new(0.05, 0, 0, 35)
recordBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 250)
recordBtn.Text = "Record Points: OFF"
recordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
recordBtn.Font = Enum.Font.SourceSans
recordBtn.TextSize = 13
recordBtn.Parent = mainFrame
Instance.new("UICorner", recordBtn).CornerRadius = UDim.new(0, 5)

local toggleWalkBtn = Instance.new("TextButton")
toggleWalkBtn.Name = "ToggleWalkBtn"
toggleWalkBtn.Size = UDim2.new(0.9, 0, 0, 30)
toggleWalkBtn.Position = UDim2.new(0.05, 0, 0, 70)
toggleWalkBtn.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
toggleWalkBtn.Text = "Start Walking"
toggleWalkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleWalkBtn.Font = Enum.Font.SourceSans
toggleWalkBtn.TextSize = 13
toggleWalkBtn.Parent = mainFrame
Instance.new("UICorner", toggleWalkBtn).CornerRadius = UDim.new(0, 5)

local clearBtn = Instance.new("TextButton")
clearBtn.Name = "ClearBtn"
clearBtn.Size = UDim2.new(0.9, 0, 0, 25)
clearBtn.Position = UDim2.new(0.05, 0, 0, 105)
clearBtn.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
clearBtn.Text = "Clear Points (0)"
clearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clearBtn.Font = Enum.Font.SourceSans
clearBtn.TextSize = 12
clearBtn.Parent = mainFrame
Instance.new("UICorner", clearBtn).CornerRadius = UDim.new(0, 5)

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0.9, 0, 0, 40)
statusLabel.Position = UDim2.new(0.05, 0, 0, 140)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Idle"
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.TextSize = 12
statusLabel.Font = Enum.Font.SourceSansItalic
statusLabel.TextWrapped = true
statusLabel.Parent = mainFrame

--------------------------------------------------------------------------------
-- 2. HELPER & NAVIGATION LOGIC
--------------------------------------------------------------------------------
local function updateUI()
	clearBtn.Text = "Clear Points (" .. #recordedPoints .. ")"
end

local function walkToPoint(character, targetPosition)
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	local rootPart = character:FindFirstChild("HumanoidRootPart")
	if not humanoid or not rootPart then return false end

	local path = PathfindingService:CreatePath({
		AgentRadius = 2,
		AgentHeight = 5,
		AgentCanJump = true
	})

	local success, _ = pcall(function()
		path:ComputeAsync(rootPart.Position, targetPosition)
	end)

	if success and path.Status == Enum.PathStatus.Success then
		local waypoints = path:GetWaypoints()
		for _, waypoint in ipairs(waypoints) do
			if not isWalking then return false end

			if waypoint.Action == Enum.PathWaypointAction.Jump then
				humanoid.Jump = true
			end

			humanoid:MoveTo(waypoint.Position)
			
			-- Wait for movement completion or timeout
			local reached = humanoid.MoveToFinished:Wait()
			if not reached then break end
		end
		return true
	end
	return false
end

--------------------------------------------------------------------------------
-- 3. EVENT HANDLERS
--------------------------------------------------------------------------------

-- Toggle Recording Mode
recordBtn.MouseButton1Click:Connect(function()
	isRecording = not isRecording
	if isRecording then
		recordBtn.Text = "Record Points: ON"
		recordBtn.BackgroundColor3 = Color3.fromRGB(230, 126, 34)
	else
		recordBtn.Text = "Record Points: OFF"
		recordBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 250)
	end
end)

-- Click in game world to save Vector3 coordinates
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed or not isRecording then return end

	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		if mouse.Target then
			local hitPosition = mouse.Hit.Position
			table.insert(recordedPoints, hitPosition)
			statusLabel.Text = "Added Point: " .. string.format("%.1f, %.1f, %.1f", hitPosition.X, hitPosition.Y, hitPosition.Z)
			updateUI()
		end
	end
end)

-- Clear Saved Waypoints
clearBtn.MouseButton1Click:Connect(function()
	recordedPoints = {}
	updateUI()
	statusLabel.Text = "Status: Waypoints Cleared"
end)

-- Toggle Navigation Loop
toggleWalkBtn.MouseButton1Click:Connect(function()
	if isWalking then
		isWalking = false
		toggleWalkBtn.Text = "Start Walking"
		toggleWalkBtn.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
		statusLabel.Text = "Status: Stopped"
	else
		if #recordedPoints == 0 then
			statusLabel.Text = "Status: No points recorded!"
			return
		end

		isWalking = true
		toggleWalkBtn.Text = "Stop Walking"
		toggleWalkBtn.BackgroundColor3 = Color3.fromRGB(231, 76, 60)

		task.spawn(function()
			while isWalking do
				local character = player.Character
				if not character then break end

				for index, point in ipairs(recordedPoints) do
					if not isWalking then break end
					statusLabel.Text = "Walking to Point " .. index .. "/" .. #recordedPoints
					walkToPoint(character, point)
					task.wait(0.2)
				end
			end
		end)
	end
end)
