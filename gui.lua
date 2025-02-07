-- Gui to Lua
-- Version: 3.2

-- Instances:

local AdminGui = Instance.new("ScreenGui")
local fly = Instance.new("Frame")
local MoonJump = Instance.new("TextButton")
local Health = Instance.new("TextButton")

--Properties:

AdminGui.Name = "Admin Gui"
AdminGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
AdminGui.ResetOnSpawn = false

fly.Name = "fly"
fly.Parent = AdminGui
fly.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
fly.Position = UDim2.new(0.394108295, 0, 0.325104296, 0)
fly.Size = UDim2.new(0.21098727, 0, 0.345966607, 0)

MoonJump.Name = "Moon Jump"
MoonJump.Parent = fly
MoonJump.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MoonJump.BorderColor3 = Color3.fromRGB(0, 0, 0)
MoonJump.BorderSizePixel = 0
MoonJump.Position = UDim2.new(0.330503762, 0, 0.748743713, 0)
MoonJump.Size = UDim2.new(0.332287133, 0, 0.251256287, 0)
MoonJump.Font = Enum.Font.LuckiestGuy
MoonJump.Text = "Moon Jump"
MoonJump.TextColor3 = Color3.fromRGB(0, 0, 0)
MoonJump.TextSize = 12.000

Health.Name = "Health"
Health.Parent = fly
Health.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Health.BorderColor3 = Color3.fromRGB(0, 0, 0)
Health.BorderSizePixel = 0
Health.Position = UDim2.new(0.330503762, 0, 0, 0)
Health.Size = UDim2.new(0.332287133, 0, 0.251256287, 0)
Health.Font = Enum.Font.LuckiestGuy
Health.Text = "Health"
Health.TextColor3 = Color3.fromRGB(0, 0, 0)
Health.TextSize = 12.000

-- Scripts:

local function YDPA_fake_script() -- MoonJump.FlyOnButtonClick 
	local script = Instance.new('LocalScript', MoonJump)

	local button = script.Parent
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	button.MouseButton1Click:Connect(function()
	    local character = player.Character or player.CharacterAdded:Wait()
	    local humanoid = character:FindFirstChildOfClass("Humanoid")
	    
	    if humanoid then
	        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
	        local bodyVelocity = Instance.new("BodyVelocity")
	        bodyVelocity.Velocity = Vector3.new(0, 50, 0) -- Adjust the Y value for flying height
	        bodyVelocity.MaxForce = Vector3.new(0, 4000, 0)
	        bodyVelocity.Parent = character.PrimaryPart
	        wait(2) -- Duration of the flight
	        bodyVelocity:Destroy()
	        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
	    end
	end)
	
	
end
coroutine.wrap(YDPA_fake_script)()
local function IUWDVG_fake_script() -- fly.Drag 
	local script = Instance.new('LocalScript', fly)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(IUWDVG_fake_script)()
local function GCSAUNK_fake_script() -- Health.Max Health 
	local script = Instance.new('LocalScript', Health)

	local Players = game:GetService("Players")
	
	local function setHealth(character)
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid.MaxHealth = 1000
			humanoid.Health = 1000
		end
	end
	
	Players.PlayerAdded:Connect(function(player)
		player.CharacterAdded:Connect(setHealth)
	end)
	
	for _, player in Players:GetPlayers() do
		if player.Character then
			setHealth(player.Character)
		end
	end
	
	
end
coroutine.wrap(GCSAUNK_fake_script)()
