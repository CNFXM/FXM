--你是要死是吗？开我这种垃圾脚本，赶紧找个楼跳得了，别用你那败类的样子污染社会😂
--对不起，对不起，这是我的双重人格，是我的双重人格控制我的身体来说这句话，求求你们不要骂我，我给你们跪下了😭
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
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "FXM脚本"; Text ="欢迎使用!此脚本为半缝合!"; Duration = 2; })
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "FXM"; Text ="发布时间:25/9/07,当前版本为1.2"; Duration = 4; })

local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/CNFXM/FXM/main/FXMUIV2.lua"))();        
local win = ui:new("FXM脚本")
--
local UITab1 = win:Tab("信息公告",'131298529372722')

local about = UITab1:section("更新公告",false)

about:Label("发布时间2025/8/20")
about:Label("当前版本:1.2")
about:Label("更新：巴掌，指令，入侵功能")
about:Label("公告：作者老开心了,成功的当上了素辞的徒弟🤓")
about:Label("算了后面的课慢慢补🤓👍")
about:Label("作者不忘初心，永久免费脚本")
about:Label("在线声明，此脚本只为方便而打造")
about:Label("意思是开一个脚本就等于开多个脚本")

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

local about = UITab1:section("脚本设置",false)

about:Toggle("脚本框架变小一点", "", false, function(state)
        if state then
        game:GetService("CoreGui")["frosty"].Main.Style = "DropShadow"
        else
            game:GetService("CoreGui")["frosty"].Main.Style = "Custom"
        end
    end)

about:Button("玩家加入游戏提示",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
end)

about:Button("退出游戏",function()
game.Players.LocalPlayer:Kick("你已被FXM脚本退出服务器，这不是封号!")
end)

about:Button("关闭脚本",function()
        game:GetService("CoreGui")["frosty"]:Destroy()
    end)

local UITab2 = win:Tab("作者常用",'131298529372722')

local about = UITab2:section("传送区域",false)

-- 初始化变量
local dropdown = {} -- 存储玩家数据
local Players -- 下拉菜单对象
local playernamedied -- 存储选中的玩家名称

-- 1. 创建玩家选择下拉菜单
Players = about:Dropdown("选择玩家", "Dropdown", dropdown, function(v)
    playernamedied = v -- 选中玩家时更新变量
end)

-- 2. 初始化并监听玩家加入/离开，同步下拉菜单
-- 添体现有玩家
for _, player in ipairs(game.Players:GetPlayers()) do
    dropdown[player.UserId] = player.Name
    Players:AddOption(player.Name)
end

-- 新玩家加入时添加到下拉菜单
game.Players.ChildAdded:Connect(function(player)
    dropdown[player.UserId] = player.Name
    Players:AddOption(player.Name)
end)

-- 玩家离开时从下拉菜单移除
game.Players.ChildRemoved:Connect(function(player)
    Players:RemoveOption(player.Name)
    for k, v in pairs(dropdown) do
        if v == player.Name then
            dropdown[k] = nil
        end
    end
end)

-- 3. 传送相关按钮（使用 playernamedied 作为目标玩家）
about:Button("传送到玩家旁边", function()
    local localPlayer = game.Players.LocalPlayer
    local HumRoot = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
    local tp_player = game.Players:FindFirstChild(playernamedied)
    
    if HumRoot and tp_player and tp_player.Character and tp_player.Character:FindFirstChild("HumanoidRootPart") then
        HumRoot.CFrame = tp_player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        Notify("FXM脚本", "已经传送到玩家身边", "rbxassetid://", 5)
    else
        Notify("FXM脚本", "无法传送 玩家已消失或角色未加载", "rbxassetid://", 5)
    end
end)

-- 4. 查看玩家视角开关
about:Toggle("查看玩家", 'Toggleflag', false, function(state)
    local tp_player = game.Players:FindFirstChild(playernamedied)
    local camera = game:GetService('Workspace').CurrentCamera
    
    if state then
        if tp_player and tp_player.Character and tp_player.Character:FindFirstChild("Humanoid") then
            camera.CameraSubject = tp_player.Character.Humanoid
            Notify("FXM", "已开启", "rbxassetid://", 5)
        else
            Notify("FXM", "无法切换视角 玩家不存在或角色未加载", "rbxassetid://", 5)
        end
    else
        local lp = game.Players.LocalPlayer
        if lp.Character and lp.Character:FindFirstChild("Humanoid") then
            camera.CameraSubject = lp.Character.Humanoid
            Notify("FXM", "已关闭", "rbxassetid://", 5)
        end
    end
end)

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

local UITab3 = win:Tab("通用区域",'131298529372722')

local about = UITab3:section("传送区域",false)

-- 初始化变量
local dropdown = {} -- 存储玩家数据
local Players -- 下拉菜单对象
local playernamedied -- 存储选中的玩家名称

-- 1. 创建玩家选择下拉菜单
Players = about:Dropdown("选择玩家", "Dropdown", dropdown, function(v)
    playernamedied = v -- 选中玩家时更新变量
end)

-- 2. 初始化并监听玩家加入/离开，同步下拉菜单
-- 添体现有玩家
for _, player in ipairs(game.Players:GetPlayers()) do
    dropdown[player.UserId] = player.Name
    Players:AddOption(player.Name)
end

-- 新玩家加入时添加到下拉菜单
game.Players.ChildAdded:Connect(function(player)
    dropdown[player.UserId] = player.Name
    Players:AddOption(player.Name)
end)

-- 玩家离开时从下拉菜单移除
game.Players.ChildRemoved:Connect(function(player)
    Players:RemoveOption(player.Name)
    for k, v in pairs(dropdown) do
        if v == player.Name then
            dropdown[k] = nil
        end
    end
end)

-- 3. 传送相关按钮（使用 playernamedied 作为目标玩家）
about:Button("传送到玩家旁边", function()
    local localPlayer = game.Players.LocalPlayer
    local HumRoot = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
    local tp_player = game.Players:FindFirstChild(playernamedied)
    
    if HumRoot and tp_player and tp_player.Character and tp_player.Character:FindFirstChild("HumanoidRootPart") then
        HumRoot.CFrame = tp_player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        Notify("FXM脚本", "已经传送到玩家身边", "rbxassetid://", 5)
    else
        Notify("FXM脚本", "无法传送 玩家已消失或角色未加载", "rbxassetid://", 5)
    end
end)

-- 4. 查看玩家视角开关
about:Toggle("查看玩家", 'Toggleflag', false, function(state)
    local tp_player = game.Players:FindFirstChild(playernamedied)
    local camera = game:GetService('Workspace').CurrentCamera
    
    if state then
        if tp_player and tp_player.Character and tp_player.Character:FindFirstChild("Humanoid") then
            camera.CameraSubject = tp_player.Character.Humanoid
            Notify("FXM", "已开启", "rbxassetid://", 5)
        else
            Notify("FXM", "无法切换视角 玩家不存在或角色未加载", "rbxassetid://", 5)
        end
    else
        local lp = game.Players.LocalPlayer
        if lp.Character and lp.Character:FindFirstChild("Humanoid") then
            camera.CameraSubject = lp.Character.Humanoid
            Notify("FXM", "已关闭", "rbxassetid://", 5)
        end
    end
end)

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

about:Button("FXM黑洞",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CNFXM/FXM/main/FXMheidong.lua'))()
end)

about:Button("FXM飞行",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CNFXM/FXM/main/FXMFLYV3.lua'))()
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

about:Button("自瞄可调", function()
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

local about = UITab3:section("FE区域",true)

about:Button("火车头跑步效果",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E8%B6%8A%E8%B7%91%E8%B6%8A%E5%BF%AB.txt"))()
end)

about:Button("车",function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-SILLY-CAR-V1-48227"))()
end)

about:Button("蜘蛛侠",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E8%9C%98%E8%9B%9B%E4%BE%A0.txt"))()
end)

about:Button("杰森",function()
loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/6203b323781cfb0a7ad35e4e9f60e026/raw/222815c2a4f6ffe38f8ae3965f6b3640c180ab4c/Jason.lua"))()
end)

about:Button("900个表情",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Rootleak/roblox/refs/heads/main/main.lua"))()
end)

about:Button("格斗动作",function()
loadstring(game:HttpGet("https://github.com/Sinister-Scripts/Roblox-Exploits/raw/refs/heads/main/FE-Fighter-Cracked"))()
end)

about:Button("闪回",function()
loadstring(game:HttpGet("https://mscripts.vercel.app/scfiles/reverse-script.lua"))()
end)

about:Button("酷小孩",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/qwertys/refs/heads/main/qwerty2.lua"))()
end)

about:Button("动画表情",function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-AFEM-14048"))()
end)

about:Button("无敌少侠飞行[步骤1]",function()
loadstring(game:HttpGet("https://gist.githubusercontent.com/JungleScripts/775c6366d91d39fe2633c5805a1d0c23/raw/c8de949402393510a27bcf4482c957b6c3bed2c2/gistfile1.txt"))()
end)

about:Button("无敌少侠飞行[步骤2]",function()
loadstring(game:HttpGet("https://gist.githubusercontent.com/JungleScripts/8dc95c7ce10e86d353d606334a77de88/raw/08f3e2967701463da36f2fc28e9943e63799dd3f/gistfile1.txt"))()
end)

about:Button("自动跳墙",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20WallHop%20V4%20script"))()
end)

about:Button("隐身",function()
loadstring(game:HttpGet("https://pastebin.com/raw/vP6CrQJj"))()
end)

about:Button("摔倒",function()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

-- GUI Setup
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RagdollGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 140, 0, 40)
button.Position = UDim2.new(0, 20, 0, 20)
button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
button.TextColor3 = Color3.new(1, 1, 1)
button.Text = "Toggle Ragdoll"
button.Font = Enum.Font.SourceSansBold
button.TextSize = 18
button.Parent = screenGui

-- State
local isRagdolled = false
local motorBackup = {}

local function getCharacter()
	return player.Character or player.CharacterAdded:Wait()
end

-- Ragdoll function
local function toggleRagdoll()
	local character = getCharacter()
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid or humanoid.Health <= 0 then return end

	local root = character:FindFirstChild("HumanoidRootPart")
	if not root then return end

	if not isRagdolled then
		-- Disable humanoid states to allow physics to take over
		humanoid:ChangeState(Enum.HumanoidStateType.Physics)
		humanoid.AutoRotate = false

		-- Store original joints
		motorBackup = {}

		for _, joint in ipairs(character:GetDescendants()) do
			if joint:IsA("Motor6D") then
				local socket = Instance.new("BallSocketConstraint")
				local a1 = Instance.new("Attachment")
				local a2 = Instance.new("Attachment")

				a1.CFrame = joint.C0
				a2.CFrame = joint.C1
				a1.Parent = joint.Part0
				a2.Parent = joint.Part1

				socket.Attachment0 = a1
				socket.Attachment1 = a2
				socket.Parent = joint.Parent
				socket.LimitsEnabled = true
				socket.TwistLimitsEnabled = true

				motorBackup[joint.Name .. "_" .. joint:GetFullName()] = {
					Part0 = joint.Part0,
					Part1 = joint.Part1,
					C0 = joint.C0,
					C1 = joint.C1,
					Parent = joint.Parent,
				}

				joint:Destroy()
			end
		end

		-- Make them fall by applying a slight upward velocity first
		root.Velocity = Vector3.new(0, 15, 0)

		isRagdolled = true
		button.Text = "Unragdoll"

	else
		-- Restore motors
		for _, data in pairs(motorBackup) do
			local motor = Instance.new("Motor6D")
			motor.Name = "RestoredMotor"
			motor.Part0 = data.Part0
			motor.Part1 = data.Part1
			motor.C0 = data.C0
			motor.C1 = data.C1
			motor.Parent = data.Parent
		end
		motorBackup = {}

		humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
		humanoid.AutoRotate = true

		-- Remove leftover attachments/sockets
		for _, item in ipairs(character:GetDescendants()) do
			if item:IsA("BallSocketConstraint") or item:IsA("Attachment") then
				item:Destroy()
			end
		end

		isRagdolled = false
		button.Text = "Toggle Ragdoll"
	end
end

-- Revert on respawn
player.CharacterAdded:Connect(function(char)
	isRagdolled = false
	motorBackup = {}
	button.Text = "Toggle Ragdoll"
end)

button.MouseButton1Click:Connect(toggleRagdoll)
end)

about:Button("燃尽脚本",function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fake-lag-41217"))()
end)

about:Button("机枪手[可甩飞]",function()
loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/e7b408abcb813525d37e9b7a6bf301c9/raw/6421f9000e90e8a4c2ed57052208acbd6f9648dd/Minigun.txt"))()
end)

about:Button("聊天查询",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/v-oidd/chat-tracker/main/chat-tracker.lua"))()
end)

about:Button("聊天过滤",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/2EzMyBoi/Roblox-Script/refs/heads/main/UselessBypasser",true))()
end)

local UITab5 = win:Tab("触碰范围",'131298529372722')

local about = UITab5:section("触碰范围",true)

about:Button("范围5",function()
_G.HeadSize = 5
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

about:Button("范围10",function()
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

about:Button("范围15",function()
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

about:Button("范围20",function()
_G.HeadSize = 20
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

about:Button("范围25",function()
_G.HeadSize = 25
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

about:Button("范围30",function()
_G.HeadSize = 30
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

about:Button("范围35",function()
_G.HeadSize = 35
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

about:Button("范围40",function()
_G.HeadSize = 40
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

about:Button("范围50",function()
_G.HeadSize = 50
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

about:Button("范围60",function()
_G.HeadSize = 60
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

about:Button("范围70",function()
_G.HeadSize = 70
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

about:Button("范围80",function()
_G.HeadSize = 80
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

about:Button("范围90",function()
_G.HeadSize = 90
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

about:Button("范围100",function()
_G.HeadSize = 100
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

local UITab6 = win:Tab("人物旋转",'131298529372722')

local about = UITab6:section("速度区域",true)

about:Button("速度5",function()
    local speed = 5

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

about:Button("速度10",function()
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

about:Button("速度20",function()
    local speed = 20

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

about:Button("速度30",function()
    local speed = 30

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

about:Button("速度40",function()
    local speed = 40

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

about:Button("速度50",function()
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

about:Button("速度60",function()
    local speed = 60

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

about:Button("速度70",function()
    local speed = 70

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

about:Button("速度80",function()
    local speed = 80

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

about:Button("速度90",function()
    local speed = 90

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

about:Button("速度100",function()
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

about:Button("速度10000",function()
    local speed = 10000

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

local UITab7 = win:Tab("入侵功能",'131298529372722')

local about = UITab7:section("客户端区",true)

about:Label("全服务器通用")

about:Label("别人看不到")

about:Button("脚本1",function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-1x1x1x1-26187"))()
end)

about:Button("脚本2",function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-1x1x1x1-blue-gui-21876"))()
end)

about:Button("脚本3",function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-1x1x1x1-blue-gui-ANOTHER-VERSION-OF-1X1X1X1-GUI-PLS-NO-HATE-14099"))()
end)

about:Button("脚本4",function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Flat-1x1x1x1-kurd-version-13502"))()
end)

about:Button("脚本5",function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-1X1X1X1-GUI-PLS-LIKE-11504"))()
end)

about:Button("脚本6",function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-1X1X1X1-GUI-MODDED-changed-the-names-and-messages-10246"))()
end)

local UITab8 = win:Tab("指令功能",'131298529372722')

local about = UITab8:section("指令区域",true)

about:Button("开启指令",function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"), true))()
end)

about:Label("以下是指令区")

about:Label("god")
about:Button("复制主群",function()
    setclipboard("god")
end)

about:Label("解释:半无敌")

about:Label("fly")
about:Button("复制",function()
    setclipboard("fly 2")
end)

about:Label("解释:飞行,2可以改其他数字")

about:Label("nufly")
about:Button("复制",function()
    setclipboard("nufly")
end)

about:Label("解释:关闭飞行")

about:Label("noclip")
about:Button("复制",function()
    setclipboard("noclip")
end)

about:Label("解释:穿墙")

about:Label("nunoclip")
about:Button("复制",function()
    setclipboard("nunoclip")
end)

about:Label("解释:关闭穿墙")

about:Label("goto")
about:Button("复制",function()
    setclipboard("goto 名字")
end)

about:Label("解释:传送指定玩家,名字改成玩家用户名")

about:Label("fling")
about:Button("复制",function()
    setclipboard("fling")
end)

about:Label("解释:甩飞")

about:Label("nufling")
about:Button("复制",function()
    setclipboard("nuling")
end)

about:Label("解释:停止甩飞")

about:Label("headsit")
about:Button("复制",function()
    setclipboard("headsit 名字")
end)

about:Label("解释:坐到玩家头上,名字改成玩家用户名")

about:Label("xray")
about:Button("复制",function()
    setclipboard("xray")
end)

about:Label("解释:建筑透视")

about:Label("nuxray")
about:Button("复制",function()
    setclipboard("nuxray")
end)

about:Label("解释:关闭建筑透视")

about:Label("rspy")
about:Button("复制",function()
    setclipboard("rspy")
end)

about:Label("解释:抓包工具")

about:Label("dex")
about:Button("复制",function()
    setclipboard("dex")
end)

about:Label("解释:跟上面一样也可以做功能")

local UITab9 = win:Tab("光影功能",'131298529372722')

local about = UITab9:section("光影区域",true)

about:Button("光影V4",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml", true))()
end)

about:Button("光影BrickoIcko版",function()
loadstring(game:HttpGet("https://pastebin.com/raw/Qunce5TP", true))()
end)

about:Button("光影(深)",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)

about:Button("光影(浅)",function()
loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end)

about:Button("超高画质",function()
loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end)

about:Button("RTX高仿",function()
loadstring(game:HttpGet('https://pastebin.com/raw/Bkf0BJb3'))()
end)

about:Button("优质画质",function()
loadstring(game:HttpGet(('https://pastefy.ga/xXkUxA0P/raw'),true))()
end)

local UITab4 = win:Tab("巴掌大战",'131298529372722')

local about = UITab4:section("传送区域",true)

about:Dropdown("传送","Dropdown",{"死亡方块","果实岛","石像岛","城堡岛","盘子","彩虹云","巴西","巴西-塔1","巴西-塔2","巴西-拳击房","调试手套密码房"},function(Value)
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
    elseif Value == "巴西" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-920.22,313.26,4.49)
    elseif Value == "巴西-塔1" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(249.79,94.00,-453.33)
    elseif Value == "巴西-塔2" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(249.85,94.00,-62843.95)
    elseif Value == "巴西-拳击房" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4022.06,3503.50,249.67)
    elseif Value == "调试手套密码房" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-17921.86,59.97,3561.91)
    end
    end)

local about = UITab4:section("防护区域",true)

about:Toggle("防击飞1","Toggle", false, function(Value)
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

about:Toggle("防击飞2","Toggle", false, function(Value)
    _G.AntiRagdoll = Value
            while _G.AntiRagdoll do
                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Torso") and game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled") then
                    if game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled") and game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true then
                        repeat
                            task.wait()
                            if game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
                                game.Players.LocalPlayer.Character.Torso.Anchored = true
                            end
                        until game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled") and game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
                        if game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
                            game.Players.LocalPlayer.Character.Torso.Anchored = false
                        end
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防虚空","Toggle", false, function(Value)
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

about:Toggle("防巴西","Toggle", false, function(Value)
    if_G.AntiBrazil = Value
            while _G.AntiBrazil do
                for i, v in pairs(game.workspace.Lobby.brazil:GetChildren()) do
                    if v.CanTouch == true then
                        v.CanTouch = false
                    end
                end
                task.wait()
            end
            if _G.AntiBrazil == false then
                for i, v in pairs(game.workspace.Lobby.brazil:GetChildren()) do
                    if v.CanTouch == false then
                        v.CanTouch = true
                    end
                end
            end
    end)

about:Toggle("防死亡方块","Toggle", false, function(Value)
    if Value == true then
                if game.Workspace:FindFirstChild("the cube of death(i heard it kills)", 1) and game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"]:FindFirstChild("Part") then
                    game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
                    game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].Part.CanTouch = false
                end
            else
                if game.Workspace:FindFirstChild("the cube of death(i heard it kills)", 1) and game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"]:FindFirstChild("Part") then
                    game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true
                    game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].Part.CanTouch = true
                end
            end
    end)

about:Toggle("防上帝技能","Toggle", false, function(Value)
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

about:Toggle("防眩晕","Toggle", false, function(Value)
    _G.AntiStun = Value
            while _G.AntiStun do
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Workspace:FindFirstChild("Shockwave") and game.Players.LocalPlayer.Character.Ragdolled.Value == false then
                    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                end
                task.wait()
            end
    end)

about:Toggle("防泡泡","Toggle", false, function(Value)
            _G.AntiBubble = Value
            while _G.AntiBubble do
                for i, v in pairs(workspace:GetChildren()) do
                    if v.Name == "BubbleObject" and v:FindFirstChild("Weld") then
                        v:FindFirstChild("Weld"):Destroy()
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防防御","Toggle", false, function(Value)
    _G.NoclipBarrier = Value
            if _G.NoclipBarrier == false then
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "ÃBarrier") then
                        if v.CanCollide == false then
                            v.CanCollide = true
                        end
                    end
                end
            end
            while _G.NoclipBarrier do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "ÃBarrier") then
                        if v.CanCollide == true then
                            v.CanCollide = false
                        end
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防推进器","Toggle", false, function(Value)
    _G.AntiPusher = Value
            while _G.AntiPusher do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "wall" then
                        v.CanCollide = false
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防堡垒","Toggle", false, function(Value)
    _G.AntiFort = Value
            while _G.AntiFort do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Part" then
                        v.CanCollide = false
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防鲍勃","Toggle", false, function(Value)
    _G.AntiBob = Value
            while _G.AntiBob do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "ÃBOB_") and v:FindFirstChild("Target") and v.Target.Value == game.Players.LocalPlayer.Name then
                        if v:FindFirstChild("HumanoidRootPart") then
                            v:FindFirstChild("HumanoidRootPart").CFrame = game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].Part.CFrame
                        end
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防轰炸","Toggle", false, function(Value)
    _G.AntiZaHando = Value
            while _G.AntiZaHando do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.ClassName == "Part" and v.Name == "Part" then
                        v:Destroy()
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防运行","Toggle", false, function(Value)
    _G.AutoExit = Value
            while _G.AutoExit do
                if game.Players.LocalPlayer.Character:FindFirstChild("InLabyrinth") then
                    for i, v in pairs(workspace:GetChildren()) do
                        if string.find(v.Name, "Labyrinth") and v:FindFirstChild("Doors") then
                            for i, y in ipairs(v.Doors:GetChildren()) do
                                if y:FindFirstChild("Hitbox") and y.Hitbox:FindFirstChild("TouchInterest") then
                                    y.Hitbox.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                end
                            end
                        end
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防停止","Toggle", false, function(Value)
    _G.AntiTimestop = Value
            while _G.AntiTimestop do
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.ClassName == "Part" then
                        v.Anchored = false
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防冰","Toggle", false, function(Value)
    _G.AntiIce = Value
            while _G.AntiIce do
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.Name == "Icecube" then
                        v:Destroy()
                        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                        game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防输送","Toggle", false, function(Value)
    game.Players.LocalPlayer.PlayerScripts.LegacyClient.ConveyorVictimized.Disabled = Value
    end)

about:Toggle("防pie","Toggle", false, function(Value)
    _G.AntiPie = Value
            while _G.AntiPie do
                if game.Players.LocalPlayer.PlayerGui:FindFirstChild("PieSplash") then
                    game.Players.LocalPlayer.PlayerGui:FindFirstChild("PieSplash"):Destroy()
                end
                task.wait()
            end
    end)

about:Toggle("防灯","Toggle", false, function(Value)
    _G.AntiLamp = Value
            while _G.AntiLamp do
                for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
                    if v.Name:find("whiteframe") and v.Enabled == true then
                        v.Enabled = false
                    end
                end
                for i, v in pairs(game.Lighting:GetChildren()) do
                    if v.Name:find("lampcc") and v.Enabled == true then
                        v.Enabled = false
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防助推器","Toggle", false, function(Value)
    _G.AntiBooster = Value
            while _G.AntiBooster do
                for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v.Name == "BoosterObject" then
                        v:Destroy()
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防遮挡视线","Toggle", false, function(Value)
    _G.AntiMittenBlind = Value
            while _G.AntiMittenBlind do
                if game.Players.LocalPlayer.PlayerGui:FindFirstChild("MittenBlind") then
                    game.Players.LocalPlayer.PlayerGui:FindFirstChild("MittenBlind"):Destroy()
                end
                task.wait()
            end
    end)

about:Toggle("防监狱管理员","Toggle", false, function(Value)
    _G.AntiJailAdmin = Value
            while _G.AntiJailAdmin do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "jail" then
                        for i, h in pairs(v:GetChildren()) do
                            h.CanCollide = false
                        end
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防水","Toggle", false, function(Value)
    _G.AntiWater = Value
            while _G.AntiWater do
                if game.Workspace:FindFirstChild("puddles") then
                    for i, v in pairs(game.Workspace.puddles:GetChildren()) do
                        if v.Name == "puddle" then
                            v.CanTouch = false
                        end
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防邮件","Toggle", false, function(Value)
    game.Players.LocalPlayer.Character.YouHaveGotMail.Disabled = Value
            _G.AntiMail = Value
            while _G.AntiMail do
                if game.Players.LocalPlayer.Character:FindFirstChild("YouHaveGotMail") then
                    game.Players.LocalPlayer.Character.YouHaveGotMail.Disabled = true
                end
                task.wait()
            end
    end)

about:Toggle("防诱饵","Toggle", false, function(Value)
    _G.AntiLure = Value
            while _G.AntiLure do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "_lure") and v:FindFirstChild("Root") and v:FindFirstChild("watercircle") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Root.CFrame
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防陷阱","Toggle", false, function(Value)
    _G.AntiTrap = Value
            while _G.AntiTrap do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "BearTrap" and v:FindFirstChild("HitBox") then
                        v.HitBox.CanTouch = false
                        v.HitBox.CanQuery = false
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防幽灵玩家","Toggle", false, function(Value)
    _G.AntiGhostPlayer = Value
            while _G.AntiGhostPlayer do
                for i, v in pairs(game.Players:GetChildren()) do
                    if v ~= game.Players.LocalPlayer.Name and game.Workspace:FindFirstChild(v.Name .. "_Body") and game.Workspace[v.Name .. "_Body"]:FindFirstChild("Part") then
                        gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(game.Workspace[v.Name .. "_Body"].Part)
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防感染","Toggle", false, function(Value)
    _G.AntiVenomInfected = Value
            while _G.AntiVenomInfected do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "is_ice" and v.Color == Color3.fromRGB(177, 229, 166) then
                        v.CanTouch = false
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防baller","Toggle", false, function(Value)
    _G.AntiBallBaller = Value
            while _G.AntiBallBaller do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "ClonedBall" then
                        v:Destroy()
                    end
                end
                task.wait()
            end
    end)


about:Toggle("防雪球","Toggle", false, function(Value)
    _G.AntiSnowball = Value
            while _G.AntiSnowball do
                for i, v in pairs(workspace:GetChildren()) do
                    if v.Name == "Snowball" then
                        v:Destroy()
                    end
                end
                task.wait()
            end
    end)


about:Toggle("防加入boos指南","Toggle", false, function(Value)
    _G.AntiJoinBossGuide = Value
            while _G.AntiJoinBossGuide do
                for i, v in pairs(workspace.BountyHunterRoom:GetChildren()) do
                    if v.Name == "Model" and v:FindFirstChild("Meshes/boxshadow_Cube.005") and v["Meshes/boxshadow_Cube.005"]:FindFirstChild("Hitbox") then
                        v["Meshes/boxshadow_Cube.005"].Hitbox.CanTouch = false
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防巨型岩石","Toggle", false, function(Value)
    _G.AntiRock = Value
            while _G.AntiRock do
                for _, v in pairs(game.Players:GetChildren()) do
                    if v.Character and v.Character:FindFirstChild("rock") then
                        v.Character.rock.CanTouch = false
                        v.Character.rock.CanQuery = false
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防奥比","Toggle", false, function(Value)
    _G.AntiObby = Value
            while _G.AntiObby do
                for _, v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "Lava") then
                        if v.CanTouch == true then
                            v.CanTouch = false
                        end
                    end
                end
                task.wait()
            end
            if _G.AntiObby == false then
                for _, v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "Lava") then
                        if v.CanTouch == false then
                            v.CanTouch = true
                        end
                    end
                end
            end
    end)

about:Toggle("防神圣杰克","Toggle", false, function(Value)
    game.Players.LocalPlayer.PlayerScripts.HallowJackAbilities.Disabled = Value
    end)

about:Toggle("防鱿鱼","Toggle", false, function(Value)
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

about:Toggle("防踢","Toggle", false, function(Value)
    _G.AntiKick = Value
            while _G.AntiKick do
                for i, v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetDescendants()) do
                    if v.Name == "ErrorPrompt" then
                        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防传送门","Toggle", false, function(Value)
    _G.AntiPortal = Value
            if _G.AntiPortal == true then
                workspace.Lobby.Teleport2.CanTouch = false
                workspace.Lobby.Teleport3.CanTouch = false
                workspace.Lobby.Teleport4.CanTouch = false
                workspace.Lobby.Teleport6.CanTouch = false
            else
                workspace.Lobby.Teleport2.CanTouch = true
                workspace.Lobby.Teleport3.CanTouch = true
                workspace.Lobby.Teleport4.CanTouch = true
                workspace.Lobby.Teleport6.CanTouch = true
            end
    end)

about:Toggle("防空洞","Toggle", false, function(Value)
    _G.AntiVoid = Value
            if _G.AntiVoidChoose == "Normal" then
                game.Workspace["VoidPart"].CanCollide = Value
                game.Workspace["VoidPart"]["TAntiVoid"].CanCollide = Value
                if Value == false then
                    game.Workspace["VoidPart"].Transparency = 1
                    game.Workspace["VoidPart"]["TAntiVoid"].Transparency = 1
                else
                    game.Workspace["VoidPart"].Transparency = _G.Transparency
                    game.Workspace["VoidPart"]["TAntiVoid"].Transparency = _G.Transparency
                end
            elseif _G.AntiVoidChoose == "Retro" then
                game.Workspace["Psycho"]["Retro1"].CanCollide = Value
                game.Workspace["Psycho"]["Retro1"]["Retro2"].CanCollide = Value
                game.Workspace["Psycho"]["Retro1"]["Retro3"].CanCollide = Value
                if Value == true then
                    game.Workspace["Psycho"]["Retro1"].Transparency = _G.Transparency
                    game.Workspace["Psycho"]["Retro1"]["Retro2"].Transparency = _G.Transparency
                    game.Workspace["Psycho"]["Retro1"]["Retro3"].Transparency = _G.Transparency
                else
                    game.Workspace["Psycho"]["Retro1"].Transparency = 1
                    game.Workspace["Psycho"]["Retro1"]["Retro2"].Transparency = 1
                    game.Workspace["Psycho"]["Retro1"]["Retro3"].Transparency = 1
                end
            elseif _G.AntiVoidChoose == "Water" then
                game.Workspace["Psycho"]["Kraken"].CanCollide = Value
                if Value == true then
                    game.Workspace["Psycho"]["Kraken"].Transparency = _G.Transparency
                else
                    game.Workspace["Psycho"]["Kraken"].Transparency = 1
                end
            elseif _G.AntiVoidChoose == "Psycho" then
                game.Workspace["Psycho"].CanCollide = Value
                if Value == true then
                    game.Workspace["Psycho"].Transparency = _G.Transparency
                else
                    game.Workspace["Psycho"].Transparency = 1
                end
            elseif _G.AntiVoidChoose == "Bob" then
                game.Workspace["VoidPart"]["TAntiVoid"].CanCollide = Value
                game.Workspace["BobWalk1"].CanCollide = Value
                for i, v in pairs(game.Workspace.BobWalk1:GetChildren()) do
                    v.CanCollide = Value
                end
                if Value == true then
                    game.Workspace["VoidPart"]["TAntiVoid"].Transparency = _G.Transparency
                    game.Workspace["BobWalk1"].Transparency = _G.Transparency
                    for i, v in pairs(game.Workspace.BobWalk1:GetChildren()) do
                        v.Transparency = _G.Transparency
                    end
                else
                    game.Workspace["VoidPart"]["TAntiVoid"].Transparency = 1
                    game.Workspace["BobWalk1"].Transparency = 1
                    for i, v in pairs(game.Workspace.BobWalk1:GetChildren()) do
                        v.Transparency = 1
                    end
                end
            elseif _G.AntiVoidChoose == "Fall" then
                while _G.AntiVoid do
                    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y < - 30 then
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(game.Workspace.Origo.CFrame * CFrame.new(0, - 5, 0))
                    end
                    task.wait()
                end
            end
    end)

about:Toggle("防管理员","Toggle", false, function(Value)
    _G.AntiMods = Value
            while _G.AntiMods do
                for i, v in pairs(game.Players:GetChildren()) do
                    if v:GetRankInGroup(9950771) >= 2 then
                        _G.AntiKick = false
                        game.Players.LocalPlayer:Kick("High Rank Player Detected." .. " [ " .. v.Name .. " ]")
                        break
                    end
                end
                task.wait()
            end
    end)

about:Toggle("防传送带","Toggle", false, function(Value)
    game.Players.LocalPlayer.PlayerScripts.ConveyorVictimized.Disabled = Value
    end)

about:Toggle("防板砖","Toggle", false, function(Value)
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

about:Toggle("防Null","Toggle", false, function(Value)
    _G.AntiNull = Value
            while _G.AntiNull do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Imp" and v:FindFirstChild("Body") then
                        if gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value] ~= nil then
                            gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v.Body, true)
                        else
                            game:GetService("ReplicatedStorage").GeneralHit:FireServer(v.Body, true)
                        end
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

about:Button("装备雪手套跳过新手服[装备85手套]",function()
_G.SnowFarm = true _G.FarmSlapsSnowFarm = 600 _G.WaitRegisterSnowFarm = 3 loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/SlapFarmGui/Versions/(v4.3).luau'))()
end)

about:Button("表情脚本",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KietVN02202/KietVN02202/refs/heads/main/FeEmote.lua"))()
end)

about:Button("解锁全成就手套[背包点击使用]",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/CelerityRBLX/Roblox/refs/heads/main/Slap%20Battles/Obtain%20All%20Badge%20Gloves.lua"))()
end)

about:Button("炸服手套[被修复了]",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Umbrella-Scripter/Slap-Battles/refs/heads/main/F.L.O.W.E.R.lua'))()
end)

about:Button("sans手套",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/IncognitoScripts/SlapBattles/main/SansComeback", true))()
end)

about:Button("监督者手套",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KietVN02202/KietVN02202/refs/heads/main/OVERSEERGlove.txt"))()
end)

about:Button("死神手套",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Yuna-ux/Slap-battles/refs/heads/main/Death_glove_V4.lua"))();
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

about:Button("猕诺斯",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Crossattic/SBS/refs/heads/main/Minos%20Prime%20v1%20BETA"))()
end)

about:Button("米诺斯",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KietVN02202/KietVN02202/refs/heads/main/MinosPrimeFanMade2.0.lua"))()
end)

about:Button("500击杀",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KietVN02202/KietVN02202/refs/heads/main/FEcustom500killstreak.lua"))()
end)

about:Button("刷巴掌",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/CelerityRBLX/Roblox/refs/heads/main/Slap%20Battles/Slap%20Farm%20Loader.lua"))()
end)

about:Button("脚本",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Umbrella-Scripter/Slap-Battles/refs/heads/main/MasteryFarmHub.lua'))()
end)

local UITab999 = win:Tab("制作中....",'131298529372722')

local about = UITab999:section("制作中.....",true)

about:Label("当前版本处于1.2版本，还在持续制作其他功能")
about:Label("此脚本支持云更新")
