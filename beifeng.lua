local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

OrionLib:MakeNotification({
	Name = "北风中心",
	Content = "正在加载 北风中心",
	Image = "rbxthumb://type=Asset&id=5107182114&w=150&h=150",
	Time = 2
})

local Window = OrionLib:MakeWindow({Name = "北风中心 | 您使用的注入器：" ..(identifyexecutor and identifyexecutor() or syn and "Synapse X" or "Unknown"), HidePremium = false, SaveConfig = true, IntroText = "北风中心", ConfigFolder = "BeiFengCenter"})

local statement = Window:MakeTab({
	Name = "关于",
	Icon = "rbxassetid://14359155637",
	PremiumOnly = false
})

statement:AddParagraph("警告", "脚本不在指定游戏执行，会发生无法使用的情况，请明细")
statement:AddLabel("北风中心作者ROBLOX用户名：CN_MIXUE")
statement:AddLabel("联系方式 - 微信：XeroxA1000")
statement:AddLabel("联系方式 - QQ：3585842738")

local Currency = Window:MakeTab({
	Name = "通用功能",
	Icon = "rbxassetid://14481493145",
	PremiumOnly = false
})

Currency:AddButton({
	Name = "Infinite Yield",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"), true))()
	end
})

Currency:AddButton({
	Name = "光影V4",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml", true))()
	end
})

Currency:AddButton({
	Name = "光影BrickoIcko版",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/Qunce5TP", true))()
	end
})

Currency:AddButton({
	Name = "飞行GUI-V3",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/UWUBeiFeng/Scripts/main/FlyGUIV3.lua"), true))()
	end
})

Currency:AddButton({
	Name = "飞车",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()
	end
})

Currency:AddButton({
	Name = "踏空行走",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float"))()
	end
})

Currency:AddButton({
	Name = "爬墙",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
	end
})

Currency:AddButton({
	Name = "跟踪玩家",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/UWUBeiFeng/Scripts/main/Follow.lua"), true))()
	end
})

Currency:AddButton({
	Name = "黑客脚本",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/BirthScripts/Scripts/main/c00l.lua"), true))()
	end
})

Currency:AddToggle({
	Name = "夜视",
	Default = false,
	Callback = function(Value)
		if Value then
			game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
			game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
	end
})

Currency:AddButton({
	Name = "建筑工具",
	Callback = function()
		Hammer = Instance.new("HopperBin")
		Hammer.Name = "锤子"
		Hammer.BinType = 4
		Hammer.Parent = game.Players.LocalPlayer.Backpack
		Clone = Instance.new("HopperBin")
		Clone.Name = "克隆"
		Clone.BinType = 3
		Clone.Parent = game.Players.LocalPlayer.Backpack
		Grab = Instance.new("HopperBin")
		Grab.Name = "抓取"
		Grab.BinType = 2
	end
})

Currency:AddToggle({
	Name = "锁头（有队伍检测）",
	Default = false,
	Callback = function(Value)
		_G.AimbotEnabled = Value

		local Camera = workspace.CurrentCamera
		local Players = game:GetService("Players")
		local RunService = game:GetService("RunService")
		local UserInputService = game:GetService("UserInputService")
		local TweenService = game:GetService("TweenService")
		local LocalPlayer = Players.LocalPlayer
		local Holding = false

		_G.TeamCheck = true
		_G.AimPart = "Head"
		_G.Sensitivity = 0

		_G.CircleSides = 64
		_G.CircleColor = Color3.fromRGB(255, 255, 255)
		_G.CircleTransparency = 0.7
		_G.CircleRadius = 80
		_G.CircleFilled = false
		_G.CircleVisible = false
		_G.CircleThickness = 0

		local FOVCircle = Drawing.new("Circle")
		FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
		FOVCircle.Radius = _G.CircleRadius
		FOVCircle.Filled = _G.CircleFilled
		FOVCircle.Color = _G.CircleColor
		FOVCircle.Visible = _G.CircleVisible
		FOVCircle.Radius = _G.CircleRadius
		FOVCircle.Transparency = _G.CircleTransparency
		FOVCircle.NumSides = _G.CircleSides
		FOVCircle.Thickness = _G.CircleThickness

		local function GetClosestPlayer()
			local MaximumDistance = _G.CircleRadius
			local Target = nil

			for _, v in next, Players:GetPlayers() do
				if v.Name ~= LocalPlayer.Name then
					if _G.TeamCheck == true then
						if v.Team ~= LocalPlayer.Team then
							if v.Character ~= nil then
								if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
									if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
										local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
										local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

										if VectorDistance < MaximumDistance then
											Target = v
										end
									end
								end
							end
						end
					else
						if v.Character ~= nil then
							if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
								if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
									local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
									local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

									if VectorDistance < MaximumDistance then
										Target = v
									end
								end
							end
						end
					end
				end
			end

			return Target
		end

		UserInputService.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton2 then
				Holding = true
			end
		end)

		UserInputService.InputEnded:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton2 then
				Holding = false
			end
		end)

		RunService.RenderStepped:Connect(function()
			FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
			FOVCircle.Radius = _G.CircleRadius
			FOVCircle.Filled = _G.CircleFilled
			FOVCircle.Color = _G.CircleColor
			FOVCircle.Visible = _G.CircleVisible
			FOVCircle.Radius = _G.CircleRadius
			FOVCircle.Transparency = _G.CircleTransparency
			FOVCircle.NumSides = _G.CircleSides
			FOVCircle.Thickness = _G.CircleThickness

			if Holding == true and _G.AimbotEnabled == true then
				TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
			end
		end)
	end    
})

Currency:AddToggle({
	Name = "锁头（无队伍检测）",
	Default = false,
	Callback = function(Value)
		_G.AimbotEnabled = Value

		local Camera = workspace.CurrentCamera
		local Players = game:GetService("Players")
		local RunService = game:GetService("RunService")
		local UserInputService = game:GetService("UserInputService")
		local TweenService = game:GetService("TweenService")
		local LocalPlayer = Players.LocalPlayer
		local Holding = false

		_G.TeamCheck = false
		_G.AimPart = "Head"
		_G.Sensitivity = 0

		_G.CircleSides = 64
		_G.CircleColor = Color3.fromRGB(255, 255, 255)
		_G.CircleTransparency = 0.7
		_G.CircleRadius = 80
		_G.CircleFilled = false
		_G.CircleVisible = false
		_G.CircleThickness = 0

		local FOVCircle = Drawing.new("Circle")
		FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
		FOVCircle.Radius = _G.CircleRadius
		FOVCircle.Filled = _G.CircleFilled
		FOVCircle.Color = _G.CircleColor
		FOVCircle.Visible = _G.CircleVisible
		FOVCircle.Radius = _G.CircleRadius
		FOVCircle.Transparency = _G.CircleTransparency
		FOVCircle.NumSides = _G.CircleSides
		FOVCircle.Thickness = _G.CircleThickness

		local function GetClosestPlayer()
			local MaximumDistance = _G.CircleRadius
			local Target = nil

			for _, v in next, Players:GetPlayers() do
				if v.Name ~= LocalPlayer.Name then
					if _G.TeamCheck == true then
						if v.Team ~= LocalPlayer.Team then
							if v.Character ~= nil then
								if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
									if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
										local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
										local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

										if VectorDistance < MaximumDistance then
											Target = v
										end
									end
								end
							end
						end
					else
						if v.Character ~= nil then
							if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
								if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
									local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
									local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

									if VectorDistance < MaximumDistance then
										Target = v
									end
								end
							end
						end
					end
				end
			end

			return Target
		end

		UserInputService.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton2 then
				Holding = true
			end
		end)

		UserInputService.InputEnded:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton2 then
				Holding = false
			end
		end)

		RunService.RenderStepped:Connect(function()
			FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
			FOVCircle.Radius = _G.CircleRadius
			FOVCircle.Filled = _G.CircleFilled
			FOVCircle.Color = _G.CircleColor
			FOVCircle.Visible = _G.CircleVisible
			FOVCircle.Radius = _G.CircleRadius
			FOVCircle.Transparency = _G.CircleTransparency
			FOVCircle.NumSides = _G.CircleSides
			FOVCircle.Thickness = _G.CircleThickness

			if Holding == true and _G.AimbotEnabled == true then
				TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
			end
		end)
	end    
})

Currency:AddToggle({
	Name = "穿墙",
	Default = false,
	Callback = function(Value)
		if Value then
			Noclip = true
			Stepped = game.RunService.Stepped:Connect(function()
				if Noclip == true then
					for a, b in pairs(game.Workspace:GetChildren()) do
						if b.Name == game.Players.LocalPlayer.Name then
							for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
								if v:IsA("BasePart") then
									v.CanCollide = false
								end
							end
						end
					end
				else
					Stepped:Disconnect()
				end
			end)
		else
			Noclip = false
		end
	end
})

local Muscle = Window:MakeTab({
	Name = "力量传奇",
	Icon = "rbxassetid://14370573606",
	PremiumOnly = false
})

Muscle:AddButton({
	Name = "北风中心-力量传奇",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/UWUBeiFeng/Scripts/main/MuscleLegends.lua"),true))()
	end    
})

local Fast = Window:MakeTab({
	Name = "极速传奇",
	Icon = "rbxassetid://14371887076",
	PremiumOnly = false
})

Fast:AddButton({
	Name = "北风中心-极速传奇",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/UWUBeiFeng/Scripts/main/LegendsOfSpeed.lua"),true))()
	end    
})

local Ninja = Window:MakeTab({
	Name = "忍者传奇",
	Icon = "rbxassetid://14380632889",
	PremiumOnly = false
})

Ninja:AddButton({
	Name = "北风中心-忍者传奇",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/UWUBeiFeng/Scripts/main/NinjaLegends.lua"),true))()
	end    
})

local BuildBoat = Window:MakeTab({
	Name = "造船寻宝",
	Icon = "rbxassetid://14384320611",
	PremiumOnly = false
})

BuildBoat:AddButton({
	Name = "北风中心-造船寻宝",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/UWUBeiFeng/Scripts/main/BuildABoatForTreasure.lua"),true))()
	end    
})

local WestBound = Window:MakeTab({
	Name = "一路向西",
	Icon = "rbxassetid://14392664960",
	PremiumOnly = false
})

WestBound:AddButton({
	Name = "北风中心-一路向西",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/UWUBeiFeng/Scripts/main/WestBound.lua"),true))()
	end    
})

local BreakIn = Window:MakeTab({
	Name = "Break In",
	Icon = "rbxassetid://14912178781",
	PremiumOnly = false
})

BreakIn:AddButton({
	Name = "北风中心-Break In",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/UWUBeiFeng/Scripts/main/BreakIn.lua"),true))()
	end    
})

local BreakIn2 = Window:MakeTab({
	Name = "Break In 2",
	Icon = "rbxassetid://14912202216",
	PremiumOnly = false
})

BreakIn2:AddButton({
	Name = "北风中心-Break In 2",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/UWUBeiFeng/Scripts/main/BreakIn2.lua"),true))()
	end    
})

local NextCrucifix = Window:MakeTab({
	Name = "Nextbot 十字架测试",
	Icon = "rbxassetid://14393620127",
	PremiumOnly = false
})

NextCrucifix:AddButton({
	Name = "北风中心-Nextbot 十字架测试",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/UWUBeiFeng/Scripts/main/NextbotCrucifixTesting.lua"),true))()
	end    
})

local Destruction = Window:MakeTab({
	Name = "破坏模拟器",
	Icon = "rbxassetid://14408449679",
	PremiumOnly = false
})

Destruction:AddButton({
	Name = "北风中心-破坏模拟器",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/UWUBeiFeng/Scripts/main/DestructionSimulator.lua"),true))()
	end    
})

local Murder = Window:MakeTab({
	Name = "破坏者谜团2",
	Icon = "rbxassetid://14481307173",
	PremiumOnly = false
})

Murder:AddButton({
	Name = "北风中心-破坏者谜团2",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/UWUBeiFeng/Scripts/main/MurderMystery2.lua"),true))()
	end    
})

local Edward = Window:MakeTab({
	Name = "吃人的火车爱德华",
	Icon = "rbxassetid://14669931287",
	PremiumOnly = false
})

Edward:AddButton({
	Name = "北风中心-吃人的火车爱德华",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/UWUBeiFeng/Scripts/main/EdwardTheMan-EatingTrain.lua"),true))()
	end    
})

local Residence = Window:MakeTab({
	Name = "住宅大屠杀",
	Icon = "rbxassetid://14778598120",
	PremiumOnly = false
})

Residence:AddButton({
	Name = "北风中心-住宅大屠杀",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/UWUBeiFeng/Scripts/main/ResidenceMassacre.lua"),true))()
	end    
})

local Disaster = Window:MakeTab({
	Name = "自然灾害生存游戏",
	Icon = "rbxassetid://14779442795",
	PremiumOnly = false
})

Disaster:AddButton({
	Name = "北风中心-自然灾害生存游戏",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/UWUBeiFeng/Scripts/main/NaturalDisasterSurvival.lua"),true))()
	end    
})

local Slap = Window:MakeTab({
	Name = "掌掴战斗",
	Icon = "rbxassetid://14924151668",
	PremiumOnly = false
})

Slap:AddButton({
	Name = "北风中心-掌掴战斗",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/UWUBeiFeng/Scripts/main/SlapBattles.lua"),true))()
	end    
})

OrionLib:Init()