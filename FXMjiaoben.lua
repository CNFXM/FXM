local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
    LastIteration = tick()
    for Index = #FrameUpdateTable, 1, -1 do
        FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
    end
    FrameUpdateTable[1] = LastIteration
    local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
    CurrentFPS = CurrentFPS - CurrentFPS % 1
    FpsLabel.Text = ("时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "FXM脚本"; Text ="欢迎使用，此脚本永久免费!"; Duration = 2; })
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "FXM"; Text ="发布时间:25/8/16,当前版本测试版"; Duration = 4; })

local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/CNFXM/FXM/main/FXMUI.lua"))();        
local win = ui:new("FXM脚本")
--
local UITab1 = win:Tab("信息公告",'117404188324801')

local about = UITab1:section("更新公告",false)

about:Label("发布时间2025/8/20")
about:Label("当前版本:1.0")
about:Label("更新：回归、发布")
about:Label("公告：刚回归发现库存没了😭")
about:Label("算了后面的课慢慢补🤓👍")
about:Label("作者不忘初心，永久免费缝合脚本")

local about = UITab1:section("作者群聊",false)

about:Label("作者QQ：2480300784")
about:Button("复制主群",function()
    setclipboard("945593455")
end)

about:Button("复制2群",function()
    setclipboard("301342746")
end)

local about = UITab1:section("玩家信息",false)

about:Label("你的账号年龄:"..player.AccountAge.."天")
about:Label("你的注入器:"..identifyexecutor())
about:Label("你的用户名:"..game.Players.LocalPlayer.Character.Name)
about:Label("你现在的服务器名称:"..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
about:Label("你现在的服务器id:"..game.GameId)
about:Label("你的用户ID:"..game.Players.LocalPlayer.UserId)
about:Label("获取客户端ID:"..game:GetService("RbxAnalyticsService"):GetClientId())


local UITab2 = win:Tab("作者常用",'117404188324801')

local about = UITab2:section("通用区域",true)

about:Slider("修改速度", "WalkSpeed", game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, 0, 1000, false, function(Speed)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed end end)
end)

about:Slider('视角上限', 'Sliderflag', 128, 0, 1000,false, function(Value)
        game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = Value
end)

about:Toggle("夜视","Toggle",false,function(Value)
if Value then

		    game.Lighting.Ambient = Color3.new(1, 1, 1)

		else

		    game.Lighting.Ambient = Color3.new(0, 0, 0)

		end
end)

about:Button("FXM飞行",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CNFXM/FXM/main/FXMFLYV3.lua'))()
end)

about:Button("FXM传送",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CNFXM/FXM/main/FXMdeliver.lua'))()
end)

about:Button("触碰范围[小]",function()
_G.HeadSize = 6
_G.Disabled = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)
end)

about:Button("触碰范围[中]",function()
_G.HeadSize = 10
_G.Disabled = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)
end)

about:Button("透视",function()  
    _G.FriendColor = Color3.fromRGB(0, 0, 255)
        local function ApplyESP(v)
       if v.Character and v.Character:FindFirstChildOfClass'Humanoid' then
           v.Character.Humanoid.NameDisplayDistance = 9e9
           v.Character.Humanoid.NameOcclusion = "NoOcclusion"
           v.Character.Humanoid.HealthDisplayDistance = 9e9
           v.Character.Humanoid.HealthDisplayType = "AlwaysOn"
           v.Character.Humanoid.Health = v.Character.Humanoid.Health -- triggers changed
       end
    end
    for i,v in pairs(game.Players:GetPlayers()) do
       ApplyESP(v)
       v.CharacterAdded:Connect(function()
           task.wait(0.33)
           ApplyESP(v)
       end)
    end
    
    game.Players.PlayerAdded:Connect(function(v)
       ApplyESP(v)
       v.CharacterAdded:Connect(function()
           task.wait(0.33)
           ApplyESP(v)
       end)
    end)
    
        local Players = game:GetService("Players"):GetChildren()
    local RunService = game:GetService("RunService")
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    
    for i, v in pairs(Players) do
        repeat wait() until v.Character
        if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = v.Character
            highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
            highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlightClone.Name = "Highlight"
        end
    end
    
    game.Players.PlayerAdded:Connect(function(player)
        repeat wait() until player.Character
        if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = player.Character
            highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
            highlightClone.Name = "Highlight"
        end
    end)
    
    game.Players.PlayerRemoving:Connect(function(playerRemoved)
        playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy()
    end)
    
    RunService.Heartbeat:Connect(function()
        for i, v in pairs(Players) do
            repeat wait() until v.Character
            if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                local highlightClone = highlight:Clone()
                highlightClone.Adornee = v.Character
                highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
                highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlightClone.Name = "Highlight"
                task.wait()
            end
    end
    end)
    end)

local UITab3 = win:Tab("通用区域",'117404188324801')

local about = UITab3:section("调节区域",true)

about:Slider("修改速度", "WalkSpeed", game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, 0, 1000, false, function(Speed)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed end end)
end)

about:Slider("修改跳高", "JumpPower", game.Players.LocalPlayer.Character.Humanoid.JumpPower, 0, 1000, false, function(Jump)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.JumpPower = Jump end end)
end)

about:Slider('修改重力', 'Sliderflag', 196.2, 0, 1000,false, function(Value)
        game.Workspace.Gravity = Value
end)

about:Slider('镜头焦距', 'Sliderflag', 70, 0, 1000,false, function(v)
        game.Workspace.CurrentCamera.FieldOfView = v
end)

about:Slider('视角上限', 'Sliderflag', 128, 0, 1000,false, function(Value)
        game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = Value
end)

about:Slider('当前血量', 'Sliderflag', 100, 1, 100,false, function(Value)
        game.Players.LocalPlayer.Character.Humanoid.Health = Value
end)

about:Slider('最大血量', 'Sliderflag', 100, 1, 100,false, function(Value)
        game.Players.LocalPlayer.Character.Humanoid.MaxHealth = Value
end)

local about = UITab3:section("点击区域",true)

about:Toggle("夜视","Toggle",false,function(Value)
if Value then

		    game.Lighting.Ambient = Color3.new(1, 1, 1)

		else

		    game.Lighting.Ambient = Color3.new(0, 0, 0)

		end
end)

about:Toggle("无限跳","Toggle",false,function(Value)
        Jump = Value
        game.UserInputService.JumpRequest:Connect(function()
            if Jump then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
            end
        end)
    end)

about:Toggle("自动互动", "Auto Interact", false, function(state)
        if state then
            autoInteract = true
            while autoInteract do
                for _, descendant in pairs(workspace:GetDescendants()) do
                    if descendant:IsA("ProximityPrompt") then
                        fireproximityprompt(descendant)
                    end
                end
                task.wait(0.25) -- Adjust the wait time as needed
            end
        else
            autoInteract = false
        end
    end)

about:Button("FXM传送",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CNFXM/FXM/main/FXMdeliver.lua'))()
end)

about:Button("FXM飞行",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CNFXM/FXM/main/FXMFLYV3.lua'))()
end)

about:Button("玩家加入游戏提示",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
end)

about:Button("反挂机",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/9fFu43FF"))()
end)

about:Button("人物开艹",function()
local SimpleSexGUI = Instance.new("ScreenGui")
 
local FGUI = Instance.new("Frame")
 
local btnNaked = Instance.new("TextButton")
 
local btnSex = Instance.new("TextButton")
 
local tbxVictim = Instance.new("TextBox")
 
local lblFUCKEMALL = Instance.new("TextLabel")
 
local ImageLabel = Instance.new("ImageLabel")
 
local lbltitle = Instance.new("TextLabel")
 
local TextLabel = Instance.new("TextLabel")
 
 
 
 
 
 
 
 
--Properties
 
SimpleSexGUI.Name = "SimpleSexGUI"
SimpleSexGUI.Parent = game.CoreGui
 
 
FGUI.Name = "FGUI"
FGUI.Parent = SimpleSexGUI
FGUI.BackgroundColor3 = Color3.new(255,255,255)
FGUI.BorderSizePixel = 1
FGUI.Position = UDim2.new(0,0, 0.667, 0)
FGUI.Size = UDim2.new(0,317, 0,271)
FGUI.Draggable = true
 
 
 
lbltitle.Name = "Title"
lbltitle.Parent = FGUI
lbltitle.BackgroundColor3 = Color3.new(255,255,255)
lbltitle.BorderSizePixel = 1
lbltitle.Position = UDim2.new (0, 0,-0.122, 0)
lbltitle.Size = UDim2.new (0, 317,0, 33)
lbltitle.Visible = true
lbltitle.Active = true
lbltitle.Draggable = false
lbltitle.Selectable = true
lbltitle.Font = Enum.Font.SourceSansBold
lbltitle.Text = "超人脚本,锻炼你的肌肉😋😋😋"
lbltitle.TextColor3 = Color3.new(0, 0, 0)
lbltitle.TextSize = 20
 
 
 
 
 
btnSex.Name = "Sex"
btnSex.Parent = FGUI
btnSex.BackgroundColor3 = Color3.new(255,255,255)
btnSex.BorderSizePixel = 1
btnSex.Position = UDim2.new (0.044, 0,0.229, 0)
btnSex.Size = UDim2.new (0, 99,0, 31)
btnSex.Visible = true
btnSex.Active = true
btnSex.Draggable = false
btnSex.Selectable = true
btnSex.Font = Enum.Font.SourceSansBold
btnSex.Text = "开始锻炼😋😋😋"
btnSex.TextColor3 = Color3.new(0, 0, 0)
btnSex.TextSize = 20
 
 
 
 
tbxVictim.Name = "VictimTEXT"
tbxVictim.Parent = FGUI
tbxVictim.BackgroundColor3 = Color3.new(255,255,255)
tbxVictim.BorderSizePixel = 1
tbxVictim.Position = UDim2.new (0.533, 0,0.229, 0)
tbxVictim.Size = UDim2.new (0, 133,0, 27)
tbxVictim.Visible = true
tbxVictim.Active = true
tbxVictim.Draggable = false
tbxVictim.Selectable = true
tbxVictim.Font = Enum.Font.SourceSansBold
tbxVictim.Text = "输入名字和他一起锻炼😋😋😋"
tbxVictim.TextColor3 = Color3.new(0, 0, 0)
tbxVictim.TextSize = 20
 
lblFUCKEMALL.Name = "FUCKEMALL"
lblFUCKEMALL.Parent = FGUI
lblFUCKEMALL.BackgroundColor3 = Color3.new(255,255,255)
lblFUCKEMALL.BorderSizePixel = 1
lblFUCKEMALL.Position = UDim2.new (0.025, 0,0.856, 0)
lblFUCKEMALL.Size = UDim2.new (0, 301,0, 27)
lblFUCKEMALL.Visible = true
lblFUCKEMALL.Font = Enum.Font.SourceSansBold
lblFUCKEMALL.Text = "一起锻炼😋😋😋"
lblFUCKEMALL.TextColor3 = Color3.new(0, 0, 0)
lblFUCKEMALL.TextSize = 20
 
ImageLabel.Name = "ImageLabel"
ImageLabel.Parent = FGUI
ImageLabel.Image = "http://www.roblox.com/asset/?id=42837..."
ImageLabel.BorderSizePixel = 1
ImageLabel.Position = UDim2.new (0.274, 0,0.358, 0)
ImageLabel.Size = UDim2.new (0, 106,0, 121)
 
 
 
 
--Scripts
 
 
btnSex.MouseButton1Click:Connect(function()
 
local player = tbxVictim.Text
local stupid = Instance.new('Animation')
stupid.AnimationId = 'rbxassetid://148840371'
hummy = game:GetService("Players").LocalPlayer.Character.Humanoid
pcall(function()
    hummy.Parent.Pants:Destroy()
end)
pcall(function()
    hummy.Parent.Shirt:Destroy()
end)
local notfunny = hummy:LoadAnimation(stupid)
notfunny:Play()
notfunny:AdjustSpeed(10)
while hummy.Parent.Parent ~= nil do
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[tbxVictim.Text].Character.HumanoidRootPart.CFrame
end
end)
end)

about:Button("人物入关r6",function()
    loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
end)

about:Button("人物入关r15",function()
    loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
end)

about:Button("建筑道具",function()
Hammer = Instance.new("HopperBin")
		Hammer.Name = "锤子[FXM]"
		Hammer.BinType = 4
		Hammer.Parent = game.Players.LocalPlayer.Backpack
		Clone = Instance.new("HopperBin")
		Clone.Name = "克隆[FXM]"
		Clone.BinType = 3
		Clone.Parent = game.Players.LocalPlayer.Backpack
		Grab = Instance.new("HopperBin")
		Grab.Name = "抓取[FXM]"
		Grab.BinType = 2
end)

about:Button("传送道具",function()
mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "传送道具[FXM]" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack
end)

about:Button("隐身道具",function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)",true))()
end)

about:Button("人物动画",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Zj4NnKs6"))()
end)

about:Button("人物动作",function()
    loadstring(game:HttpGet("https://yarhm.goteamst.com/scr?channel=afem"))()
end)

about:Button("iw指令", function()
  loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end)

about:Button("人物旋转[慢]",function()
    local speed = 10

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
end)

about:Button("人物旋转[中]",function()
    local speed = 50

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
end)

about:Button("人物旋转[快]",function()
    local speed = 100

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
end)

about:Button("触碰范围[小]",function()
_G.HeadSize = 6
_G.Disabled = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)
end)

about:Button("触碰范围[中]",function()
_G.HeadSize = 10
_G.Disabled = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)
end)

about:Button("触碰范围[大]",function()
_G.HeadSize = 15
_G.Disabled = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)
end)

about:Button("屏幕准星",function()
local fov = 0 local RunService = game:GetService("RunService") local UserInputService = game:GetService("UserInputService") local Players = game:GetService("Players") local Cam = game.Workspace.CurrentCamera local FOVring = Drawing.new("Circle") FOVring.Visible = true FOVring.Thickness = 2 FOVring.Color = Color3.fromRGB(231, 231, 236) FOVring.Filled = false FOVring.Radius = fov FOVring.Position = Cam.ViewportSize / 2 local function updateDrawings() local camViewportSize = Cam.ViewportSize FOVring.Position = camViewportSize / 2 end local function onKeyDown(input) if input.KeyCode == Enum.KeyCode.Delete then RunService:UnbindFromRenderStep("FOVUpdate") FOVring:Remove() end end UserInputService.InputBegan:Connect(onKeyDown) local function lookAt(target) local lookVector = (target - Cam.CFrame.Position).unit local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector) Cam.CFrame = newCFrame end local function getClosestPlayerInFOV(trg_part) local nearest = nil local last = math.huge local playerMousePos = Cam.ViewportSize / 2 for _, player in ipairs(Players:GetPlayers()) do if player ~= Players.LocalPlayer then local part = player.Character and player.Character:FindFirstChild(trg_part) if part then local ePos, isVisible = Cam:WorldToViewportPoint(part.Position) local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude if distance < last and isVisible and distance < fov then last = distance nearest = player end end end end return nearest end RunService.RenderStepped:Connect(function() updateDrawings() local closest = getClosestPlayerInFOV("Head") if closest and closest.Character:FindFirstChild("Head") then lookAt(closest.Character.Head.Position) end end)
end)

about:Button("情云同款自瞄可调", function()
  local fov = 100 local smoothness = 10 local crosshairDistance = 5 local RunService = game:GetService("RunService") local UserInputService = game:GetService("UserInputService") local Players = game:GetService("Players") local Cam = game.Workspace.CurrentCamera local FOVring = Drawing.new("Circle") FOVring.Visible = true FOVring.Thickness = 2 FOVring.Color = Color3.fromRGB(0, 255, 0) FOVring.Filled = false FOVring.Radius = fov FOVring.Position = Cam.ViewportSize / 2 local Player = Players.LocalPlayer local PlayerGui = Player:WaitForChild("PlayerGui") local ScreenGui = Instance.new("ScreenGui") ScreenGui.Name = "FovAdjustGui" ScreenGui.Parent = PlayerGui local Frame = Instance.new("Frame") Frame.Name = "MainFrame" Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) Frame.BorderColor3 = Color3.fromRGB(128, 0, 128) Frame.BorderSizePixel = 2 Frame.Position = UDim2.new(0.3, 0, 0.3, 0) Frame.Size = UDim2.new(0.4, 0, 0.4, 0) Frame.Active = true Frame.Draggable = true Frame.Parent = ScreenGui local MinimizeButton = Instance.new("TextButton") MinimizeButton.Name = "MinimizeButton" MinimizeButton.Text = "-" MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255) MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) MinimizeButton.Position = UDim2.new(0.9, 0, 0, 0) MinimizeButton.Size = UDim2.new(0.1, 0, 0.1, 0) MinimizeButton.Parent = Frame local isMinimized = false MinimizeButton.MouseButton1Click:Connect(function() isMinimized = not isMinimized if isMinimized then Frame:TweenSize(UDim2.new(0.1, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) MinimizeButton.Text = "+" else Frame:TweenSize(UDim2.new(0.4, 0, 0.4, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) MinimizeButton.Text = "-" end end) local FovLabel = Instance.new("TextLabel") FovLabel.Name = "FovLabel" FovLabel.Text = "自瞄范围" FovLabel.TextColor3 = Color3.fromRGB(255, 255, 255) FovLabel.BackgroundTransparency = 1 FovLabel.Position = UDim2.new(0.1, 0, 0.1, 0) FovLabel.Size = UDim2.new(0.8, 0, 0.2, 0) FovLabel.Parent = Frame local FovSlider = Instance.new("TextBox") FovSlider.Name = "FovSlider" FovSlider.Text = tostring(fov) FovSlider.TextColor3 = Color3.fromRGB(255, 255, 255) FovSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) FovSlider.Position = UDim2.new(0.1, 0, 0.3, 0) FovSlider.Size = UDim2.new(0.8, 0, 0.2, 0) FovSlider.Parent = Frame local SmoothnessLabel = Instance.new("TextLabel") SmoothnessLabel.Name = "SmoothnessLabel" SmoothnessLabel.Text = "自瞄平滑度" SmoothnessLabel.TextColor3 = Color3.fromRGB(255, 255, 255) SmoothnessLabel.BackgroundTransparency = 1 SmoothnessLabel.Position = UDim2.new(0.1, 0, 0.5, 0) SmoothnessLabel.Size = UDim2.new(0.8, 0, 0.2, 0) SmoothnessLabel.Parent = Frame local SmoothnessSlider = Instance.new("TextBox") SmoothnessSlider.Name = "SmoothnessSlider" SmoothnessSlider.Text = tostring(smoothness) SmoothnessSlider.TextColor3 = Color3.fromRGB(255, 255, 255) SmoothnessSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) SmoothnessSlider.Position = UDim2.new(0.1, 0, 0.7, 0) SmoothnessSlider.Size = UDim2.new(0.8, 0, 0.2, 0) SmoothnessSlider.Parent = Frame local CrosshairDistanceLabel = Instance.new("TextLabel") CrosshairDistanceLabel.Name = "CrosshairDistanceLabel" CrosshairDistanceLabel.Text = "自瞄预判距离" CrosshairDistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255) CrosshairDistanceLabel.BackgroundTransparency = 1 CrosshairDistanceLabel.Position = UDim2.new(0.1, 0, 0.9, 0) CrosshairDistanceLabel.Size = UDim2.new(0.8, 0, 0.2, 0) CrosshairDistanceLabel.Parent = Frame local CrosshairDistanceSlider = Instance.new("TextBox") CrosshairDistanceSlider.Name = "CrosshairDistanceSlider" CrosshairDistanceSlider.Text = tostring(crosshairDistance) CrosshairDistanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255) CrosshairDistanceSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) CrosshairDistanceSlider.Position = UDim2.new(0.1, 0, 1.1, 0) CrosshairDistanceSlider.Size = UDim2.new(0.8, 0, 0.2, 0) CrosshairDistanceSlider.Parent = Frame local targetCFrame = Cam.CFrame local function updateDrawings() local camViewportSize = Cam.ViewportSize FOVring.Position = camViewportSize / 2 FOVring.Radius = fov end local function onKeyDown(input) if input.KeyCode == Enum.KeyCode.Delete then RunService:UnbindFromRenderStep("FOVUpdate") FOVring:Remove() end end UserInputService.InputBegan:Connect(onKeyDown) local function getClosestPlayerInFOV(trg_part) local nearest = nil local last = math.huge local playerMousePos = Cam.ViewportSize / 2 for _, player in ipairs(Players:GetPlayers()) do if player ~= Players.LocalPlayer then local part = player.Character and player.Character:FindFirstChild(trg_part) if part then local ePos, isVisible = Cam:WorldToViewportPoint(part.Position) local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude if distance < last and isVisible and distance < fov then last = distance nearest = player end end end end return nearest end RunService.RenderStepped:Connect(function() updateDrawings() local closest = getClosestPlayerInFOV("Head") if closest and closest.Character:FindFirstChild("Head") then local targetCharacter = closest.Character local targetHead = targetCharacter.Head local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart") local isMoving = targetRootPart.Velocity.Magnitude > 0.1 local targetPosition if isMoving then targetPosition = targetHead.Position + (targetHead.CFrame.LookVector * crosshairDistance) else targetPosition = targetHead.Position end targetCFrame = CFrame.new(Cam.CFrame.Position, targetPosition) else targetCFrame = Cam.CFrame end Cam.CFrame = Cam.CFrame:Lerp(targetCFrame, 1 / smoothness) end) FovSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newFov = tonumber(FovSlider.Text) if newFov then fov = newFov else FovSlider.Text = tostring(fov) end end end) SmoothnessSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newSmoothness = tonumber(SmoothnessSlider.Text) if newSmoothness then smoothness = newSmoothness else SmoothnessSlider.Text = tostring(smoothness) end end end) CrosshairDistanceSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newCrosshairDistance = tonumber(CrosshairDistanceSlider.Text) if newCrosshairDistance then crosshairDistance = newCrosshairDistance else CrosshairDistanceSlider.Text = tostring(crosshairDistance) end end end)
end)

about:Button("汉化阿尔宙斯自瞄",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/sgbs/main/%E4%B8%81%E4%B8%81%20%E6%B1%89%E5%8C%96%E8%87%AA%E7%9E%84.txt"))()
end)

about:Button("铁拳",function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'))()
end)

about:Button("透视",function()  
    _G.FriendColor = Color3.fromRGB(0, 0, 255)
        local function ApplyESP(v)
       if v.Character and v.Character:FindFirstChildOfClass'Humanoid' then
           v.Character.Humanoid.NameDisplayDistance = 9e9
           v.Character.Humanoid.NameOcclusion = "NoOcclusion"
           v.Character.Humanoid.HealthDisplayDistance = 9e9
           v.Character.Humanoid.HealthDisplayType = "AlwaysOn"
           v.Character.Humanoid.Health = v.Character.Humanoid.Health -- triggers changed
       end
    end
    for i,v in pairs(game.Players:GetPlayers()) do
       ApplyESP(v)
       v.CharacterAdded:Connect(function()
           task.wait(0.33)
           ApplyESP(v)
       end)
    end
    
    game.Players.PlayerAdded:Connect(function(v)
       ApplyESP(v)
       v.CharacterAdded:Connect(function()
           task.wait(0.33)
           ApplyESP(v)
       end)
    end)
    
        local Players = game:GetService("Players"):GetChildren()
    local RunService = game:GetService("RunService")
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    
    for i, v in pairs(Players) do
        repeat wait() until v.Character
        if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = v.Character
            highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
            highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlightClone.Name = "Highlight"
        end
    end
    
    game.Players.PlayerAdded:Connect(function(player)
        repeat wait() until player.Character
        if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = player.Character
            highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
            highlightClone.Name = "Highlight"
        end
    end)
    
    game.Players.PlayerRemoving:Connect(function(playerRemoved)
        playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy()
    end)
    
    RunService.Heartbeat:Connect(function()
        for i, v in pairs(Players) do
            repeat wait() until v.Character
            if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                local highlightClone = highlight:Clone()
                highlightClone.Adornee = v.Character
                highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
                highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlightClone.Name = "Highlight"
                task.wait()
            end
    end
    end)
    end)

about:Toggle("ESP 显示名字", "AMG", ENABLED, function(enabled)
    if enabled then ENABLED = true for _, player in ipairs(Players:GetPlayers()) do onPlayerAdded(player) end Players.PlayerAdded:Connect(onPlayerAdded) Players.PlayerRemoving:Connect(onPlayerRemoving) local localPlayer = Players.LocalPlayer if localPlayer and localPlayer.Character then for _, player in ipairs(Players:GetPlayers()) do if player.Character then createNameLabel(player) end end end RunService.Heartbeat:Connect(function() if ENABLED then for _, player in ipairs(Players:GetPlayers()) do if player.Character then createNameLabel(player) end end end end) else ENABLED = false for _, player in ipairs(Players:GetPlayers()) do onPlayerRemoving(player) end RunService:UnbindFromRenderStep("move") end
end)

about:Toggle("Circle ESP", "ESP", false, function(state)
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                if state then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = player.Character
                    highlight.Adornee = player.Character

                    local billboard = Instance.new("BillboardGui")
                    billboard.Parent = player.Character
                    billboard.Adornee = player.Character
                    billboard.Size = UDim2.new(0, 100, 0, 100)
                    billboard.StudsOffset = Vector3.new(0, 3, 0)
                    billboard.AlwaysOnTop = true

                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.Parent = billboard
                    nameLabel.Size = UDim2.new(1, 0, 1, 0)
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.Text = player.Name
                    nameLabel.TextColor3 = Color3.new(1, 1, 1)
                    nameLabel.TextStrokeTransparency = 0.5
                    nameLabel.TextScaled = true

                    local circle = Instance.new("ImageLabel")
                    circle.Parent = billboard
                    circle.Size = UDim2.new(0, 50, 0, 50)
                    circle.Position = UDim2.new(0.5, 0, 0.5, 0) -- Center the circle
                    circle.AnchorPoint = Vector2.new(0.5, 0.5) -- Set the anchor point to the center
                    circle.BackgroundTransparency = 1
                    circle.Image = "rbxassetid://2200552246" -- Replace with your circle image asset ID
                else
                    if player.Character:FindFirstChildOfClass("Highlight") then
                        player.Character:FindFirstChildOfClass("Highlight"):Destroy()
                    end
                    if player.Character:FindFirstChildOfClass("BillboardGui") then
                        player.Character:FindFirstChildOfClass("BillboardGui"):Destroy()
                    end
                end
            end
        end
    end)

about:Button("透视1",function()
loadstring(game:HttpGet('https://pastebin.com/raw/MA8jhPWT'))()
end)

about:Button("透视2",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
end)

about:Button("电脑键盘",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)

about:Button("飞车",function()
loadstring(game:HttpGet("https://pastebin.com/raw/G3GnBCyC", true))()
end)

about:Button("踏空行走",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
end)

about:Button("飞车2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/vb/main/%E9%A3%9E%E8%BD%A6.lua"))()
end)

about:Button("紫莎",function()
game.Players.LocalPlayer.Character.Humanoid.Health=0
end)

local UITab4 = win:Tab("巴掌大战",'117404188324801')

local about = UITab4:section("传送区域",true)

about:Dropdown("传送","Dropdown",{"死亡方块","果实岛","石像岛","城堡岛","盘子","彩虹云"},function(Value)
    if Value == "死亡方块" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-262.47, -5.28, 1.45)
    elseif Value == "果实岛" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-384.81, 50.76, -15.61)
    elseif Value == "石像岛" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(241.59, -16.09, -4.45)
    elseif Value == "城堡岛" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(261.69, 33.68, 196.76)
    elseif Value == "盘子" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.Plate.CFrame * CFrame.new(0,2,0)
    elseif Value == "彩虹云" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-125.29, -5.22, 121.69)
    end
    end)

local about = UITab4:section("防护区域",true)

about:Toggle("防击飞","Toggle", false, function(Value)
    AntiRagdoll = Value
    if AntiRagdoll then
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    game.Players.LocalPlayer.CharacterAdded:Connect(function()
    game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Changed:Connect(function()
    if game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true and AntiRagdoll then
    repeat task.wait() game.Players.LocalPlayer.Character.Torso.Anchored = true
    until game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
    game.Players.LocalPlayer.Character.Torso.Anchored = false
    end
    end)
    end)
    end
    end)

about:Toggle("反虚空","Toggle", false, function(Value)
    game.Workspace.dedBarrier.CanCollide = Value
    game.Workspace.TAntiVoid.CanCollide = Value
    end)

about:Toggle("防死亡屏障","Toggle", false, function(Value)
    if Value == true then
    for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
                        if v.ClassName == "Part" and v.Name == "BLOCK" then
                            v.CanTouch = false
                        end
                    end
    workspace.DEATHBARRIER.CanTouch = false
    workspace.DEATHBARRIER2.CanTouch = false
    workspace.dedBarrier.CanTouch = false
    workspace.ArenaBarrier.CanTouch = false
    workspace.AntiDefaultArena.CanTouch = false
    else
    for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
                        if v.ClassName == "Part" and v.Name == "BLOCK" then
                            v.CanTouch = true
                        end
                    end
    workspace.DEATHBARRIER.CanTouch = true
    workspace.DEATHBARRIER2.CanTouch = true
    workspace.dedBarrier.CanTouch = true
    workspace.ArenaBarrier.CanTouch = true
    workspace.AntiDefaultArena.CanTouch = true
    end
    end)

about:Toggle("反巴西","Toggle", false, function(Value)
    if Value == true then
    for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do
                            v.CanTouch = false
                    end
    else
    for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do
                            v.CanTouch = true
                    end
    end
    end)

about:Toggle("反死亡方块","Toggle", false, function(Value)
    if Value == true then
            workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
            else
                    workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true
            end
    end)

about:Toggle("反上帝技能","Toggle", false, function(Value)
    AntiTimestop = Value
    while AntiTimestop do
                    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if v.ClassName == "Part" then
                            v.Anchored = false
                        end
                    end
    task.wait()
    end
    end)

about:Toggle("反鱿鱼","Toggle", false, function(Value)
    AntiSquid = Value
    if AntiSquid == false then
            game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = true
            end
    while AntiSquid do
    if game.Players.LocalPlayer.PlayerGui:FindFirstChild("SquidInk") then
            game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = false
    end
    task.wait()
    end
    end)

about:Toggle("反神圣杰克","Toggle", false, function(Value)
    game.Players.LocalPlayer.PlayerScripts.HallowJackAbilities.Disabled = Value
    end)

about:Toggle("反传送带","Toggle", false, function(Value)
    game.Players.LocalPlayer.PlayerScripts.ConveyorVictimized.Disabled = Value
    end)

about:Toggle("反板砖","Toggle", false, function(Value)
    AntiBrick = Value
    while AntiBrick do
    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "Union" then
                            v.CanTouch = false
                        end
                    end
    task.wait()
    end
    end)

about:Toggle("反Null","Toggle", false, function(Value)
    AntiNull = Value
    while AntiNull do
    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "Imp" and v:FindFirstChild("Body") then
    shared.gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v.Body,true)
    end
    end
    task.wait()
    end
    end)

local about = UITab4:section("基础区域",true)

about:Toggle("无CD","Toggle" ,false, function(Value)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local tool = character:FindFirstChildOfClass("Tool") or player.Backpack:FindFirstChildOfClass("Tool")
    
    bazhangmnq = Value
    
    while bazhangmnq do
    local localscript = tool:FindFirstChildOfClass("LocalScript")
    local localscriptclone = localscript:Clone()
    localscriptclone = localscript:Clone()
    localscriptclone:Clone()
    localscript:Destroy()
    localscriptclone.Parent = tool
    wait(0.1)
    end
    end)

about:Toggle("无限反转","Toggle", false, function(Value)
    _G.InfReverse = Value
    while _G.InfReverse do
    game:GetService("ReplicatedStorage").ReverseAbility:FireServer()
    wait(6)
    end
    end)

about:Toggle("自动加入竞技场","Toggle", false, function(Value)
    AutoEnterArena = Value
    while AutoEnterArena do
    if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 0)
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 1)
        end
    task.wait()
    end
    end)

about:Toggle("彩虹角色(装备黄金手套)","Toggle", false, function(Value)
    _G.Rainbow = Value
    while _G.Rainbow do
    for i = 0,1,0.001*25 do
    game:GetService("ReplicatedStorage").Goldify:FireServer(false, BrickColor.new(Color3.fromHSV(i,1,1)))
    task.wait()
    end
    end
    end)

local about = UITab4:section("自动区域",true)

about:Toggle("获取炼金术师材料","Toggle", false, function(Value)
    AlchemistIngredients = Value
    if game.Players.LocalPlayer.leaderstats.Glove.Value == "Alchemist" then
    while AlchemistIngredients do
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Mushroom")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Glowing Mushroom")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Fire Flower")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Winter Rose")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Dark Root")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Dire Flower")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Autumn Sprout")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Elder Wood")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Hazel Lily")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Wild Vine")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Jade Stone")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Lamp Grass")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Plane Flower")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Blood Rose")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Red Crystal")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Blue Crystal")
    task.wait()
    end
    end
    end)

about:Toggle("自动光波球","Toggle", false, function(Value)
    if Person == nil then
    Person = game.Players.LocalPlayer.Name
    end
    _G.RojoSpam = Value
    while _G.RojoSpam do
    game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players[Person].Character.HumanoidRootPart.CFrame})
    task.wait()
    end
    end)

about:Toggle("自动拾取黄金果实","Toggle", false, function(Value)
    SlappleFarm = Value
    while SlappleFarm do
    for i, v in ipairs(workspace.Arena.island5.Slapples:GetDescendants()) do
                    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") and v.Name == "Glove" and v:FindFirstChildWhichIsA("TouchTransmitter") then
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
                    end
                end
    task.wait()
    end
    end)

about:Toggle("自动捡飞行宝珠","Toggle", false, function(Value)
    Jetfarm = Value
    while Jetfarm do
    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "JetOrb" and v:FindFirstChild("TouchInterest") then
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 0)
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 1)
                        end
                    end
    task.wait()
    end
    end)

about:Toggle("自动捡相位球","Toggle", false, function(Value)
    Phasefarm = Value
    while Phasefarm do
    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "PhaseOrb" and v:FindFirstChild("TouchInterest") then
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 0)
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 1)
                        end
                    end
    task.wait()
    end
    end)

about:Toggle("自动刷bob","Toggle", false, function(Value)
    ReplicaFarm = Value
    while ReplicaFarm do
    for i, v in pairs(workspace:GetChildren()) do
                    if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("HumanoidRootPart") then
    game.ReplicatedStorage.b:FireServer(v:WaitForChild("HumanoidRootPart"))
                    end
                end
    task.wait()
    game:GetService("ReplicatedStorage").Duplicate:FireServer()
    task.wait(7)
    end
    end)

local about = UITab4:section("脚本区域",true)

about:Button("表情脚本",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KietVN02202/KietVN02202/refs/heads/main/FeEmote.lua"))()
end)

about:Button("解锁全成就手套[背包点击使用]",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/CelerityRBLX/Roblox/refs/heads/main/Slap%20Battles/Obtain%20All%20Badge%20Gloves.lua"))()
end)

about:Button("全手套脚本[背包查看]",function()
NotWorkingGlove = { -- these glove can't be used with this script 
	"Error",
	"CUSTOM"
}
-- All glove except titan will be save in ur inventory, equip in ur inventory 

GetAllGlove = true --[[ executing this will erase your hiteffect have same name as a glove like: Hunter, Relude, fish, ðŸ—¿, ....  BECAREFUL!, Or you can just add hit effect you need to hold/keep in the list on top]]-- 
GetGamepassGlove = false
GloveWanted = "Titan" --[[ if u set this to value same as a hit effect then it will erase your hit effect have the same name as the value u put. ]]-- 
GetWantedGlove = true


if GetAllGlove == true and NotWorkingGlove then
    for i, glove in pairs(game.Workspace.Lobby:GetChildren()) do
        if not table.find(NotWorkingGlove, glove.Name) then
            for i, v in pairs(game:GetService("ReplicatedStorage")._NETWORK:GetChildren()) do
                if v.Name:find("{") then
                    local args = {
                        [1] = glove.Name
                    }
                    
                    if v:IsA("RemoteEvent") then
                        v:FireServer(unpack(args))
                    elseif v:IsA("RemoteFunction") then
                        local result = v:InvokeServer(unpack(args))
                        print("Result from InvokeServer:", result)
                    else
                        print("v is neither a RemoteEvent nor a RemoteFunction.")
                    end
                end
            end
        end
    end
end

if GetGamepassGlove == true then
local GamepassGlove = {"OVERKILL", "Acrobat", "Spectator", "Titan", "Ultra Instinct"}
	for i = 1,#GamepassGlove do
		for i, v in pairs(game:GetService("ReplicatedStorage")._NETWORK:GetChildren()) do
		    -- Check if the name contains the character '{'
		    if v.Name:find("{") then
		        local args = {
		            [1] = GamepassGlove[i]
		        }
		
		        -- Check if v is a RemoteEvent and can FireServer
		        if v:IsA("RemoteEvent") then
		            v:FireServer(unpack(args))
		        elseif v:IsA("RemoteFunction") then
		            -- If it's a RemoteFunction, use InvokeServer
		            local result = v:InvokeServer(unpack(args))
		            print("Result from InvokeServer:", result)  -- Optional: Print the result
		        else
		            print("v is neither a RemoteEvent nor a RemoteFunction.")
		        end
		    end
		end
	end
end
if GloveWanted and GetWantedGlove == true then
	for i, v in pairs(game:GetService("ReplicatedStorage")._NETWORK:GetChildren()) do
	    -- Check if the name contains the character '{'
	    if v.Name:find("{") then
	        local args = {
	            [1] = GloveWanted
	        }
	
	        -- Check if v is a RemoteEvent and can FireServer
	        if v:IsA("RemoteEvent") then
	            v:FireServer(unpack(args))
	        elseif v:IsA("RemoteFunction") then
	            -- If it's a RemoteFunction, use InvokeServer
	            local result = v:InvokeServer(unpack(args))
	            print("Result from InvokeServer:", result)  -- Optional: Print the result
	        else
	            print("v is neither a RemoteEvent nor a RemoteFunction.")
	        end
	    end
	end
end
end)

about:Button("炸服手套",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Umbrella-Scripter/Slap-Battles/refs/heads/main/F.L.O.W.E.R.lua'))()
end)

about:Button("sans手套",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/IncognitoScripts/SlapBattles/main/SansComeback", true))()
end)

about:Button("监督者手套",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KietVN02202/KietVN02202/refs/heads/main/OVERSEERGlove.txt"))()
end)

about:Button("边缘领主",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KietVN02202/KietVN02202/refs/heads/main/FeEdgelord2.0.lua"))()
end)

about:Button("超级人类",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/IncognitoScripts/SlapBattles/main/GodHuman", true))()
end)

about:Button("冰霜神",function()
loadstring(game:HttpGet("https://pastefy.app/LYJzX6un/raw"))()
end)

about:Button("查拉技能组",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/CelerityRBLX/Roblox/refs/heads/main/Slap%20Battles/Chara.lua"))()
end)

about:Button("装备雪手套炸服[装备85手套]",function()
_G.SnowFarm = true _G.FarmSlapsSnowFarm = 600 _G.WaitRegisterSnowFarm = 3 loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/SlapFarmGui/Versions/(v4.3).luau'))()
end)

local UITab999 = win:Tab("制作中....",'117404188324801')

local about = UITab999:section("制作中.....",true)

about:Label("当前版本处于测试阶段，还未来得及制作其他功能")
about:Label("此脚本支持云更新")
