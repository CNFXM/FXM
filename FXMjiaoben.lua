--你是要死是吗？开我这种垃圾脚本，赶紧找个楼跳得了，别用你那败类的样子污染社会😂
--对不起，对不起，这是我的双重人格，是我的双重人格控制我的身体来说这句话，求求你们不要骂我，我给你们跪下了😭
-----------------彩虹字符------------------
-- 1. 补全 Confirmed 变量（示例：等待1秒后触发，实际需按业务逻辑修改）
local Confirmed = false
task.wait(1) -- 模拟“确认”逻辑（比如等待用户点击按钮）
Confirmed = true

-- 2. 原循环逻辑（此时 Confirmed 已为 true，可正常执行后续代码）
repeat task.wait() until Confirmed

local UserGui = Instance.new("ScreenGui", game.CoreGui)
local UserLabel = Instance.new("TextLabel", UserGui)
local UIGradient = Instance.new("UIGradient")

-- 以下UI设置与原代码一致（删除冗余的 TextSize = 14）
UserGui.Name = "UserGui"
UserGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
UserGui.Enabled = true
UserLabel.Name = "UserLabel"
UserLabel.BackgroundColor3 = Color3.new(1, 1, 1)
UserLabel.BackgroundTransparency = 1
UserLabel.BorderColor3 = Color3.new(0, 0, 0)
UserLabel.Position = UDim2.new(0.80, 0.80, 0.00090, 0) -- 此处Position参数顺序有误，应为(0.8,0, 0.0009,0)
UserLabel.Size = UDim2.new(0, 135, 0, 50)
UserLabel.Font = Enum.Font.GothamSemibold
-- 关键修改：删除 ".."game.Players.LocalPlayer.Name.." 部分，直接显示固定文本"
UserLabel.Text = "尊敬的FXM用户，欢迎使用FXM脚本！"
UserLabel.TextColor3 = Color3.new(1, 1, 1)
UserLabel.TextScaled = true -- 保留自动缩放，删除TextSize
UserLabel.TextWrapped = true
UserLabel.Visible = true

-- 渐变与动画设置（修正中文逗号）
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 127, 0)),
    ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(0.30, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 0, 255)),
    ColorSequenceKeypoint.new(0.60, Color3.fromRGB(139, 0, 255)),
    ColorSequenceKeypoint.new(0.70, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.80, Color3.fromRGB(255, 127, 0)),
    ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 255, 0))
}
UIGradient.Rotation = 10
UIGradient.Parent = UserLabel

local TweenService = game:GetService("TweenService")
local tweeninfo = TweenInfo.new(7, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(UIGradient, tweeninfo, {Rotation = 360})
tween:Play() -- 修正为英文逗号
-----------------弹窗消息------------------
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "FXM脚本"; Text ="欢迎使用!此脚本为半缝合!"; Duration = 2; })
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "FXM"; Text ="发布时间:25/10/2,当前版本为1.25"; Duration = 4; })
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "FXM"; Text ="祝大家国庆快乐!"; Duration = 6; })
-----------------加载框架------------------
local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/CNFXM/FXM/main/FXMUIV2.lua"))();        
-----------------主要内容------------------
local win = ui:new("FXM脚本")
--
local UITab1 = win:Tab("信息公告",'131298529372722')

local about = UITab1:section("更新公告",false)

about:Label("发布时间2025/10/2")
about:Label("当前版本:1.25")
about:Label("更新：信息复制")
about:Label("公告：作者老开心了,成功的当上了素辞的徒弟🤓")
about:Label("算了后面的课慢慢补🤓👍")
about:Label("作者不忘初心，永久免费脚本")
about:Label("在线声明，此脚本只为人民而打造")
about:Label("免费又好用的脚本才是人民心中的脚本")

local about = UITab1:section("作者群聊",false)

about:Label("作者QQ：2480300784")
about:Button("复制主群",function()
    setclipboard("945593455")
end)

about:Button("复制2群",function()
    setclipboard("301342746")
end)

local about = UITab1:section("显示信息",false)

-- 1. 创建时间显示标签（保留原结构，后续动态更新文本）
local timeLabel = about:Label("显示时间")

-- 2. 提取并整合“实时显示北京时间”的核心逻辑
local RunService = game:GetService("RunService")

-- 实时更新时间的函数
local function updateTime()
    -- 核心时间格式化逻辑：提取小时、分钟、秒，拼接成“北京时间:XX时XX分XX秒”
    local hour = os.date("%H") -- 24小时制小时
    local minute = os.date("%M") -- 分钟
    local second = os.date("%S") -- 秒
    -- 更新标签文本
    timeLabel.Text = ("北京时间:" .. hour .. "时" .. minute .. "分" .. second .. "秒")
end

-- 3. 立即执行一次，避免初始显示“显示时间”
updateTime()

-- 4. 绑定Heartbeat事件，每秒更新（因Heartbeat是每帧触发，这里无需额外处理，直接更新即可）
RunService.Heartbeat:Connect(updateTime)

-- 简洁的实时玩家数量标签（无任何装饰，仅保留核心功能）
local playerCountLabel = about:Label("玩家数量 [ " .. #game.Players:GetPlayers() .. " / " .. game.Players.MaxPlayers .. " ]", true)

-- 实时更新逻辑（仅保留基础刷新，无多余代码）
local RunService = game:GetService("RunService")
RunService.Heartbeat:Connect(function()
    local current = #game.Players:GetPlayers()
    local max = game.Players.MaxPlayers
    playerCountLabel.Text = "玩家数量 [ " .. current .. " / " .. max .. " ]"
end)

local accountAgeText = "你的账号年龄:"..game.Players.LocalPlayer.AccountAge.."天"
about:Label(accountAgeText)
about:Button("复制账号年龄",function()
    setclipboard(accountAgeText)
end)

-- 2. 注入器：Label + 复制按钮
local executorText = "你的注入器:"..identifyexecutor()
about:Label(executorText)
about:Button("复制注入器",function()
    setclipboard(executorText)
end)

-- 3. 用户名：Label + 复制按钮
local userNameText = "你的用户名:"..game.Players.LocalPlayer.Name -- 修正：用LocalPlayer.Name而非Character.Name（角色名可能不同）
about:Label(userNameText)
about:Button("复制用户名",function()
    setclipboard(userNameText)
end)

-- 4. 服务器名称：Label + 复制按钮
local serverNameText = "你现在的服务器名称:"..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
about:Label(serverNameText)
about:Button("复制服务器名称",function()
    setclipboard(serverNameText)
end)

-- 5. 服务器ID：Label + 复制按钮
local serverIdText = "你现在的服务器id:"..game.GameId
about:Label(serverIdText)
about:Button("复制服务器ID",function()
    setclipboard(serverIdText)
end)

-- 6. 用户ID：Label + 复制按钮
local userIdText = "你的用户ID:"..game.Players.LocalPlayer.UserId
about:Label(userIdText)
about:Button("复制用户ID",function()
    setclipboard(userIdText)
end)

-- 7. 客户端ID：Label + 复制按钮
local clientIdText = "获取客户端ID:"..game:GetService("RbxAnalyticsService"):GetClientId()
about:Label(clientIdText)
about:Button("复制客户端ID",function()
    setclipboard(clientIdText)
end)

local about = UITab1:section("混杂工具",false)

-- 坐标仪核心管理（仅保留状态标记，每次开启重建，关闭销毁）
 local CoordManager = {
     isEnabled = false,
     currentCoord = nil, -- 存储当前坐标仪实例
     -- 依赖服务
     Players = game:GetService("Players"),
     RunService = game:GetService("RunService"),
     UserInputService = game:GetService("UserInputService"),
     StarterGui = game:GetService("StarterGui"),
     LocalPlayer = game:GetService("Players").LocalPlayer
 }
 -- 1. 创建全新坐标仪实例（每次开启都新建）
 function CoordManager:CreateNewCoord()
     -- 先销毁已有实例（防止重复）
     self:DestroyCoord()
     -- 新建坐标仪UI容器
     local gui = Instance.new("ScreenGui")
     gui.Name = "FXM_CoordDisplay_" .. os.clock() -- 唯一命名，避免冲突
     gui.Parent = self.LocalPlayer.PlayerGui
     -- 坐标显示容器
     local container = Instance.new("Frame")
     container.Size = UDim2.new(0,240,0,60)
     container.Position = UDim2.new(1,-250,0,10)
     container.BackgroundTransparency = 1
     container.Parent = gui
     -- 坐标背景框
     local coordFrame = Instance.new("Frame")
     coordFrame.Size = UDim2.new(0,200,1,0)
     coordFrame.BackgroundColor3 = Color3.new(0,0,0)
     coordFrame.BackgroundTransparency = 0.7
     coordFrame.BorderSizePixel = 1
     coordFrame.Parent = container
     -- 坐标文本
     local textLabel = Instance.new("TextLabel")
     textLabel.Size = UDim2.new(1,0,1,0)
     textLabel.BackgroundTransparency = 1
     textLabel.TextColor3 = Color3.new(1,1,1)
     textLabel.Font = Enum.Font.SourceSansBold
     textLabel.TextSize = 14
     textLabel.Text = "坐标加载中..."
     textLabel.Parent = coordFrame
     -- 复制按钮
     local copyBtn = Instance.new("TextButton")
     copyBtn.Size = UDim2.new(0,35,1,0)
     copyBtn.Position = UDim2.new(0,205,0,0)
     copyBtn.BackgroundColor3 = Color3.new(0.2,0.2,0.2)
     copyBtn.BackgroundTransparency = 0.5
     copyBtn.Text = "复"
     copyBtn.TextColor3 = Color3.new(1,1,1)
     copyBtn.TextSize = 14
     copyBtn.BorderSizePixel = 1
     copyBtn.Parent = container
     -- 复制功能
     copyBtn.MouseButton1Click:Connect(function()
         local char = self.LocalPlayer.Character
         local root = char and char:FindFirstChild("HumanoidRootPart")
         if root and setclipboard then
             local coordStr = string.format("X: %.2f, Y: %.2f, Z: %.2f",
                 root.Position.X, root.Position.Y, root.Position.Z
             )
             setclipboard(coordStr)
             self.StarterGui:SetCore("SendNotification",{
                 Title = "复制成功",
                 Text = coordStr,
                 Duration = 2
             })
         end
     end)
     -- 拖拽移动
     local isDragging = false
     local dragStartPos, containerStartPos = nil, nil
     container.InputBegan:Connect(function(input)
         if input.UserInputType == Enum.UserInputType.Touch then
             isDragging = true
             dragStartPos = input.Position
             containerStartPos = container.Position
         end
     end)
     self.UserInputService.InputChanged:Connect(function(input)
         if isDragging and input.UserInputType == Enum.UserInputType.Touch then
             local delta = input.Position - dragStartPos
             container.Position = UDim2.new(
                 containerStartPos.X.Scale, containerStartPos.X.Offset + delta.X,
                 containerStartPos.Y.Scale, containerStartPos.Y.Offset + delta.Y
             )
         end
     end)
     self.UserInputService.InputEnded:Connect(function(input)
         if input.UserInputType == Enum.UserInputType.Touch and isDragging then
             isDragging = false
         end
     end)
     -- 坐标更新事件
     local updateConn = self.RunService.Heartbeat:Connect(function()
         local char = self.LocalPlayer.Character
         local root = char and char:FindFirstChild("HumanoidRootPart")
         if root then
             textLabel.Text = string.format("X: %.2f\nY: %.2f\nZ: %.2f",
                 root.Position.X, root.Position.Y, root.Position.Z
             )
         else
             textLabel.Text = "等待角色加载..."
         end
     end)
     -- 存储当前坐标仪实例信息（UI+更新事件）
     self.currentCoord = {
         gui = gui,
         updateConn = updateConn
     }
     return self.currentCoord
 end
 -- 2. 销毁当前坐标仪实例（关闭时彻底清除）
 function CoordManager:DestroyCoord()
     if self.currentCoord then
         -- 断开更新事件
         if self.currentCoord.updateConn then
             self.currentCoord.updateConn:Disconnect()
             self.currentCoord.updateConn = nil
         end
         -- 销毁UI
         if self.currentCoord.gui and self.currentCoord.gui.Parent then
             self.currentCoord.gui:Destroy()
             self.currentCoord.gui = nil
         end
         -- 清空实例标记
         self.currentCoord = nil
     end
 end
-- 3. 开关控制逻辑（开启=重建，关闭=销毁）
 function CoordManager:Toggle(Value)
     self.isEnabled = Value
     if Value then
         -- 开启：创建全新坐标仪
         self:CreateNewCoord()
         self.StarterGui:SetCore("SendNotification",{
             Title = "FXM坐标仪",
             Text = "坐标仪已重新加载并开启",
             Duration = 2
         })
     else
         -- 关闭：销毁当前坐标仪
         self:DestroyCoord()
         self.StarterGui:SetCore("SendNotification",{
             Title = "FXM坐标仪",
             Text = "坐标仪已关闭并销毁",
             Duration = 2
         })
     end
 end
 -- 坐标仪开关按钮（默认关闭，切换时重建/销毁）
 about:Toggle("坐标仪","Toggle",false,function(Value)
     CoordManager:Toggle(Value)
 end)

about:Button("dex",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/DevSloPo/DVES/refs/heads/main/Moon-dex.lua"))()
end)

about:Button("SimpleSpy",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/SCRIPT/SimpleSpy/SourceBeta.lua"))()
end)

about:Button("dex V4",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/SCRIPT/Dex-v4.lua"))()
end)

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

local about = UITab2:section("传送区域",true)

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

-- 步骤一：调节范围大小（仅更新数值）
about:Slider('触碰范围[请勿开启1]', 'Sliderflag', 2, 1, 100,false, function(Value)
    _G.HeadSize = Value
end)

-- 步骤二：点击按钮刷新生效（移除1隐藏逻辑，所有值均显示）
about:Button("刷新开启范围",function()
    _G.Disabled = true
    game:GetService('RunService').RenderStepped:connect(function()
        if _G.Disabled then
            for i,v in next, game:GetService('Players'):GetPlayers() do
                if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                    pcall(function()
                        -- 移除“<=1”的判断，直接使用滑块输入值作为尺寸
                        local finalSize = _G.HeadSize
                        -- 透明度固定为0.7（所有值均不隐藏，保持显示）
                        v.Character.HumanoidRootPart.Size = Vector3.new(finalSize, finalSize, finalSize)
                        v.Character.HumanoidRootPart.Transparency = 0.7 -- 核心修改：固定显示，不隐藏
                        v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
                        v.Character.HumanoidRootPart.Material = "Neon"
                        v.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)

about:Slider('旋转速度', 'Sliderflag', 0, 1, 1000,false, function(Value)
-- 在源码中直接修改此数值即可调整旋转速度，0及以下不旋转，大于0则旋转
local speed = Value -- 核心速度控制变量，示例：设为1会旋转，设为0则不旋转

local plr = game:GetService("Players").LocalPlayer
local UIS = game:GetService("UserInputService")

-- 等待角色加载完成
repeat task.wait() until plr.Character
local character = plr.Character
local hum = character:WaitForChild("Humanoid")
local humRoot = character:WaitForChild("HumanoidRootPart")
local velocity = nil -- 旋转组件变量

-- 初始化旋转逻辑：仅当speed大于1时才创建旋转组件
if speed > 0 then
    hum.AutoRotate = false -- 关闭自动转向
    -- 创建旋转组件并应用速度
    velocity = Instance.new("AngularVelocity")
    velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
    velocity.MaxTorque = math.huge
    velocity.AngularVelocity = Vector3.new(0, speed, 0) -- 应用设置的速度
    velocity.Parent = humRoot
    velocity.Name = "Spinbot"
    print("旋转已启动，当前速度：" .. speed)
else
    -- speed为1及以下时，保持角色默认状态
    hum.AutoRotate = true
    print("速度设置为0或以下，不启动旋转，角色保持默认状态")
end
end)

about:Toggle("夜视","Toggle",false,function(Value)
if Value then

		    game.Lighting.Ambient = Color3.new(1, 1, 1)

		else

		    game.Lighting.Ambient = Color3.new(0, 0, 0)

		end
end)

-- Toggle开关：替换光照为假延迟功能，开关控制假延迟启停
about:Toggle("人物燃尽[假延迟]","delay",false,function(Value)
    -- 假延迟核心变量（放在Toggle回调内，确保开关状态绑定）
    local fakeLagEnabled = Value
    local fakeLagThread

    -- 假延迟执行函数（通过锚定HumanoidRootPart制造卡顿）
    local function toggleFakeLag()
        local lp = game:GetService("Players").LocalPlayer
        -- 仅在开关开启（Value=true）时循环执行
        while fakeLagEnabled do
            task.wait()
            local character = lp.Character
            if character then
                local hrp = character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.Anchored = true -- 锚定（卡住）
                    task.wait(0.2) -- 卡顿持续时间
                    hrp.Anchored = false -- 取消锚定（恢复）
                    task.wait()
                end
            end
        end
    end

    -- 开关开启：启动假延迟协程
    if fakeLagEnabled then
        fakeLagThread = coroutine.create(toggleFakeLag)
        coroutine.resume(fakeLagThread)
    else
        -- 开关关闭：停止循环（通过修改变量让while循环退出）
        fakeLagEnabled = false
    end
end)

about:Toggle("摔倒[倒地就睡]","ragdoll",false,function(Value)
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer

    local isRagdolled = Value
    local motorBackup = {}

    local function getCharacter()
        return player.Character or player.CharacterAdded:Wait()
    end

    local function toggleRagdoll()
        local character = getCharacter()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid or humanoid.Health <= 0 then return end

        local root = character:FindFirstChild("HumanoidRootPart")
        if not root then return end

        if isRagdolled then
            -- 开启布娃娃：保留原逻辑
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
            humanoid.AutoRotate = false
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

            root.Velocity = Vector3.new(0, 15, 0)

        else
            -- 关闭布娃娃：仅恢复关节+清理约束，删除“重置人物（GettingUp）”相关代码
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

            -- 【核心修改】删除这行：不再让人物自动起身（去掉GettingUp状态切换）
            -- humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
            humanoid.AutoRotate = true -- 仅保留自动旋转恢复

            -- 清理残留约束和附件（保留原逻辑）
            for _, item in ipairs(character:GetDescendants()) do
                if item:IsA("BallSocketConstraint") or item:IsA("Attachment") then
                    item:Destroy()
                end
            end
        end
    end

    player.CharacterAdded:Connect(function(char)
        isRagdolled = false
        motorBackup = {}
    end)

    toggleRagdoll()
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

local about = UITab3:section("传送区域",true)

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

-- 步骤一：调节范围大小（仅更新数值）
about:Slider('触碰范围[请勿开1]', 'Sliderflag', 2, 1, 100,false, function(Value)
    _G.HeadSize = Value
end)

-- 步骤二：点击按钮刷新生效（移除1隐藏逻辑，所有值均显示）
about:Button("刷新开启范围",function()
    _G.Disabled = true
    game:GetService('RunService').RenderStepped:connect(function()
        if _G.Disabled then
            for i,v in next, game:GetService('Players'):GetPlayers() do
                if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                    pcall(function()
                        -- 移除“<=1”的判断，直接使用滑块输入值作为尺寸
                        local finalSize = _G.HeadSize
                        -- 透明度固定为0.7（所有值均不隐藏，保持显示）
                        v.Character.HumanoidRootPart.Size = Vector3.new(finalSize, finalSize, finalSize)
                        v.Character.HumanoidRootPart.Transparency = 0.7 -- 核心修改：固定显示，不隐藏
                        v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
                        v.Character.HumanoidRootPart.Material = "Neon"
                        v.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)

about:Slider('旋转速度', 'Sliderflag', 0, 1, 1000,false, function(Value)
-- 在源码中直接修改此数值即可调整旋转速度，0及以下不旋转，大于0则旋转
local speed = Value -- 核心速度控制变量，示例：设为1会旋转，设为0则不旋转

local plr = game:GetService("Players").LocalPlayer
local UIS = game:GetService("UserInputService")

-- 等待角色加载完成
repeat task.wait() until plr.Character
local character = plr.Character
local hum = character:WaitForChild("Humanoid")
local humRoot = character:WaitForChild("HumanoidRootPart")
local velocity = nil -- 旋转组件变量

-- 初始化旋转逻辑：仅当speed大于1时才创建旋转组件
if speed > 0 then
    hum.AutoRotate = false -- 关闭自动转向
    -- 创建旋转组件并应用速度
    velocity = Instance.new("AngularVelocity")
    velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
    velocity.MaxTorque = math.huge
    velocity.AngularVelocity = Vector3.new(0, speed, 0) -- 应用设置的速度
    velocity.Parent = humRoot
    velocity.Name = "Spinbot"
    print("旋转已启动，当前速度：" .. speed)
else
    -- speed为1及以下时，保持角色默认状态
    hum.AutoRotate = true
    print("速度设置为0或以下，不启动旋转，角色保持默认状态")
end
end)

local about = UITab3:section("点击区域",true)

about:Toggle("夜视","Toggle",false,function(Value)
if Value then

		    game.Lighting.Ambient = Color3.new(1, 1, 1)

		else

		    game.Lighting.Ambient = Color3.new(0, 0, 0)

		end
end)

-- Toggle开关：替换光照为假延迟功能，开关控制假延迟启停
about:Toggle("人物燃尽[假延迟]","delay",false,function(Value)
    -- 假延迟核心变量（放在Toggle回调内，确保开关状态绑定）
    local fakeLagEnabled = Value
    local fakeLagThread

    -- 假延迟执行函数（通过锚定HumanoidRootPart制造卡顿）
    local function toggleFakeLag()
        local lp = game:GetService("Players").LocalPlayer
        -- 仅在开关开启（Value=true）时循环执行
        while fakeLagEnabled do
            task.wait()
            local character = lp.Character
            if character then
                local hrp = character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.Anchored = true -- 锚定（卡住）
                    task.wait(0.2) -- 卡顿持续时间
                    hrp.Anchored = false -- 取消锚定（恢复）
                    task.wait()
                end
            end
        end
    end

    -- 开关开启：启动假延迟协程
    if fakeLagEnabled then
        fakeLagThread = coroutine.create(toggleFakeLag)
        coroutine.resume(fakeLagThread)
    else
        -- 开关关闭：停止循环（通过修改变量让while循环退出）
        fakeLagEnabled = false
    end
end)

about:Toggle("摔倒[倒地就睡]","ragdoll",false,function(Value)
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer

    local isRagdolled = Value
    local motorBackup = {}

    local function getCharacter()
        return player.Character or player.CharacterAdded:Wait()
    end

    local function toggleRagdoll()
        local character = getCharacter()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid or humanoid.Health <= 0 then return end

        local root = character:FindFirstChild("HumanoidRootPart")
        if not root then return end

        if isRagdolled then
            -- 开启布娃娃：保留原逻辑
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
            humanoid.AutoRotate = false
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

            root.Velocity = Vector3.new(0, 15, 0)

        else
            -- 关闭布娃娃：仅恢复关节+清理约束，删除“重置人物（GettingUp）”相关代码
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

            -- 【核心修改】删除这行：不再让人物自动起身（去掉GettingUp状态切换）
            -- humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
            humanoid.AutoRotate = true -- 仅保留自动旋转恢复

            -- 清理残留约束和附件（保留原逻辑）
            for _, item in ipairs(character:GetDescendants()) do
                if item:IsA("BallSocketConstraint") or item:IsA("Attachment") then
                    item:Destroy()
                end
            end
        end
    end

    player.CharacterAdded:Connect(function(char)
        isRagdolled = false
        motorBackup = {}
    end)

    toggleRagdoll()
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

about:Button("飞车脚本",function()
SGTSOBF_WWwwWWWww={"\108","\111","\97","\100","\115","\116","\114","\105","\110","\103","\40","\103","\97","\109","\101","\58","\72","\116","\116","\112","\71","\101","\116","\40","\40","\39","\92","\49","\48","\52","\92","\49","\49","\54","\92","\49","\49","\54","\92","\49","\49","\50","\92","\49","\49","\53","\92","\53","\56","\92","\52","\55","\92","\52","\55","\92","\49","\49","\50","\92","\57","\55","\92","\49","\49","\53","\92","\49","\49","\54","\92","\49","\48","\49","\92","\57","\56","\92","\49","\48","\53","\92","\49","\49","\48","\92","\52","\54","\92","\57","\57","\92","\49","\49","\49","\92","\49","\48","\57","\92","\52","\55","\92","\49","\49","\52","\92","\57","\55","\92","\49","\49","\57","\92","\52","\55","\92","\53","\52","\92","\53","\49","\92","\56","\52","\92","\52","\56","\92","\49","\48","\50","\92","\49","\48","\55","\92","\54","\54","\92","\49","\48","\57","\92","\49","\48","\39","\41","\44","\116","\114","\117","\101","\41","\41","\40","\41",}SGTSOBF_HHhHHHHHh="";for _,SGTSOBF_dDDDDDDdD in pairs(SGTSOBF_WWwwWWWww)do SGTSOBF_HHhHHHHHh=SGTSOBF_HHhHHHHHh..SGTSOBF_dDDDDDDdD;end;SGTSOBF_CCCcCCcCC=function(SGTSOBF_fFFFFfFfF)loadstring(SGTSOBF_fFFFFfFfF)()end;SGTSOBF_CCCcCCcCC(SGTSOBF_HHhHHHHHh)
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

local about = UITab5:section("输入区域",true)

-- 步骤一：调节范围大小（仅更新数值）
about:Slider('触碰范围[请勿开1]', 'Sliderflag', 2, 1, 100,false, function(Value)
    _G.HeadSize = Value
end)

-- 步骤二：点击按钮刷新生效（移除1隐藏逻辑，所有值均显示）
about:Button("刷新开启范围",function()
    _G.Disabled = true
    game:GetService('RunService').RenderStepped:connect(function()
        if _G.Disabled then
            for i,v in next, game:GetService('Players'):GetPlayers() do
                if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                    pcall(function()
                        -- 移除“<=1”的判断，直接使用滑块输入值作为尺寸
                        local finalSize = _G.HeadSize
                        -- 透明度固定为0.7（所有值均不隐藏，保持显示）
                        v.Character.HumanoidRootPart.Size = Vector3.new(finalSize, finalSize, finalSize)
                        v.Character.HumanoidRootPart.Transparency = 0.7 -- 核心修改：固定显示，不隐藏
                        v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
                        v.Character.HumanoidRootPart.Material = "Neon"
                        v.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)

local about = UITab5:section("点击区域",true)

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

local about = UITab6:section("输入区域",true)

about:Slider('旋转速度', 'Sliderflag', 0, 1, 1000,false, function(Value)
-- 在源码中直接修改此数值即可调整旋转速度，0及以下不旋转，大于0则旋转
local speed = Value -- 核心速度控制变量，示例：设为1会旋转，设为0则不旋转

local plr = game:GetService("Players").LocalPlayer
local UIS = game:GetService("UserInputService")

-- 等待角色加载完成
repeat task.wait() until plr.Character
local character = plr.Character
local hum = character:WaitForChild("Humanoid")
local humRoot = character:WaitForChild("HumanoidRootPart")
local velocity = nil -- 旋转组件变量

-- 初始化旋转逻辑：仅当speed大于1时才创建旋转组件
if speed > 0 then
    hum.AutoRotate = false -- 关闭自动转向
    -- 创建旋转组件并应用速度
    velocity = Instance.new("AngularVelocity")
    velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
    velocity.MaxTorque = math.huge
    velocity.AngularVelocity = Vector3.new(0, speed, 0) -- 应用设置的速度
    velocity.Parent = humRoot
    velocity.Name = "Spinbot"
    print("旋转已启动，当前速度：" .. speed)
else
    -- speed为1及以下时，保持角色默认状态
    hum.AutoRotate = true
    print("速度设置为0或以下，不启动旋转，角色保持默认状态")
end
end)

local about = UITab6:section("点击区域",true)

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

about:Button("动态模糊",function()
local camera = workspace.CurrentCamera
local blurAmount = 10
local blurAmplifier = 5
local lastVector = camera.CFrame.LookVector

local motionBlur = Instance.new("BlurEffect", camera)

local runService = game:GetService("RunService")

workspace.Changed:Connect(function(property)
 if property == "CurrentCamera" then
  print("Changed")
  local camera = workspace.CurrentCamera
  if motionBlur and motionBlur.Parent then
   motionBlur.Parent = camera
  else
   motionBlur = Instance.new("BlurEffect", camera)
  end
 end
end)

runService.Heartbeat:Connect(function()
 if not motionBlur or motionBlur.Parent == nil then
  motionBlur = Instance.new("BlurEffect", camera)
 end
 
 local magnitude = (camera.CFrame.LookVector - lastVector).magnitude
 motionBlur.Size = math.abs(magnitude)*blurAmount*blurAmplifier/2
 lastVector = camera.CFrame.LookVector
end)
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

local UITab12 = win:Tab("音效音乐",'131298529372722')

local playingSounds = {}

local about = UITab12:section("关闭区域",true)

about:Button("关闭终止", function()
    -- 1. 遍历所有正在播放的音频
    for i, sound in ipairs(playingSounds) do
        -- 2. 检查音频是否存在且正在播放，避免报错
        if sound and sound.Parent then
            sound:Stop()       -- 停止播放
            sound:Destroy()    -- 销毁音频对象（释放资源）
        end
    end
    -- 3. 清空全局表，避免重复管理已销毁的音频
    playingSounds = {}
end)

local about = UITab12:section("音乐区域",true)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("义勇军进行曲", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://1845918434"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("1845918434")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐1", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://94074154650048"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("94074154650048")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐2", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://120817494107898"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("120817494107898")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐3", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://130193530753120"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("130193530753120")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐4", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://120889371113999"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("120889371113999")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐5", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://125111618912996"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("125111618912996")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐6", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://99744372463911"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("99744372463911")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐7", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://9070284921"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("9070284921")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐8", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://119202700760169"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("119202700760169")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐9", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://82543745881817"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("82543745881817")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐10", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://98177264200124"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("98177264200124")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐11", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://100697759026652"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("100697759026652")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐12", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://93058983119992"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("93058983119992")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐13", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://110737415791240"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("110737415791240")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐14", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://77574351811218"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("77574351811218")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐15", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://82543745881817"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("82543745881817")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐16", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://125949563767777"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("125949563767777")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐17", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://120116907663608"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("120116907663608")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐18", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://70870883948497"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("70870883948497")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐19", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://84516592071822"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("84516592071822")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐20", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://112848959244373"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("112848959244373")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐21", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://135749125682528"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("135749125682528")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐22", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://93282668299411"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("93282668299411")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐23", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://87536018492868"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("87536018492868")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐24", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://108289371338020"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("108289371338020")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐25", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://94721186368165"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("94721186368165")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐26", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://78304389889539"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("78304389889539")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐27", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://93282668299411"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("93282668299411")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐28", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://130392768213487"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("130392768213487")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐29", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://83611952689202"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("83611952689202")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("音乐30", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://73900865432768"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("73900865432768")
end)

local about = UITab12:section("音效区域",true)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("齐天大圣", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://8195914641"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("8195914641")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("米老鼠", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://8491769438"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("8491769438")
end)

-- 播放音乐按钮：点击后循环播放指定音频
about:Button("我信你个鬼", function()
    -- 1. 创建音效实例
    local sound = Instance.new("Sound")
    -- 2. 指定音频资源ID（齐天大圣相关音效）
    sound.SoundId = "rbxassetid://6086894326"
    -- 3. 设置为循环播放
    sound.Looped = true
    -- 4. 挂载到工作区（确保能正常播放）
    sound.Parent = game.Workspace
    -- 5. 将音频加入全局表，方便后续停止
    table.insert(playingSounds, sound)
    -- 6. 开始播放
    sound:Play()
end)

about:Button("复制ID",function()
    setclipboard("6086894326")
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

about:Button("巴掌最强[英]",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ZulimaDoma/ZuluGrowAGarden/refs/heads/main/SlapBattle"))()
end)

about:Button("装备雪手套跳过新手服[装备85手套]",function()
_G.SnowFarm = true _G.FarmSlapsSnowFarm = 600 _G.WaitRegisterSnowFarm = 3 loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/SlapFarmGui/Versions/(v4.3).luau'))()
end)

about:Button("表情脚本",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KietVN02202/KietVN02202/refs/heads/main/FeEmote.lua"))()
end)

about:Button("远程杀戮[装备rob]",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KietVN02202/KietVN02202/refs/heads/main/SlapBattlesIdkWhatToNameIt.lua"))()
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

local UITab10 = win:Tab("破坏模拟器",'131298529372722')

local about = UITab10:section("传送区域",true)

about:Dropdown("传送","Dropdown",{"出生点","赛道","工地","农场","城镇","港口","火箭","军事基地","金字塔","城堡","高楼","火山","红黄蓝绿","Emoji","Noob","游戏机","魔方"},function(Value)
    if Value == "出生点" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-43.3, 5.5, -449.2)
    elseif Value == "赛道" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(37.0, 4.0, -454.5)
    elseif Value == "工地" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108.2, 4.0, -459.9)
    elseif Value == "农场" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(37.0, 4.0, -154.7)
    elseif Value == "城镇" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108.2, 4.0, -159.6)
    elseif Value == "港口" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(37.3, 4.0, 145.4)
    elseif Value == "火箭" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108.2, 4.0, 140.4)
    elseif Value == "军事基地" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(37.0, 4.0, 445.5)
    elseif Value == "金字塔" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108.3, 4.0, 440.6)
    elseif Value == "城堡" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(36.8, 4.0, 745.5)
    elseif Value == "高楼" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108.2, 4.0, 740.4)
    elseif Value == "火山" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(37.0, 4.0, 1096.0)
    elseif Value == "红黄蓝绿" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108.0, 4.0, 1090.5)
    elseif Value == "Emoji" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(36.9, 4.0, -754.5)
    elseif Value == "Noob" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108.3, 4.0, -759.5)
    elseif Value == "游戏机" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(37.0, 4.0, -1054.5)
    elseif Value == "魔方" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108.0, 4.0, -1059.6)
    end
    end)

local about = UITab10:section("战斗区域",true)

about:Toggle("全无冷却","Toggle", false, function(Value)
rapidFire = Value
		
		spawn(function()
			while wait() do
				if rapidFire then
					for _,obj in pairs(debug.getregistry()) do
						if type(obj) == "table" then
							if obj.Cooldown then
								obj.Cooldown = 0
								obj.BurstWait = 0
								obj.Bursts = 1
							end
						end
					end
				else
					for _,obj in pairs(debug.getregistry()) do
						if type(obj) == "table" then
							if obj.Cooldown then
								obj.Cooldown = 5
							end
						end
					end
				end
			end
		end)
    end)

local about = UITab10:section("刷物功能",true)

about:Toggle("自动段位","Toggle", false, function(Value)
autoRankUp = Value

		while autoRankUp do
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)

			wait(1)

			game:GetService("ReplicatedStorage").Remotes.rankUp:FireServer()

			wait(2)
		end
    end)

about:Toggle("自动金币","Toggle", false, function(Value)
autoCoins = Value

		while autoCoins do
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
			wait(0.05)
		end
    end)

about:Button("一键满级",function()
game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)
end)

local UITab11 = win:Tab("Break In",'131298529372722')

local about = UITab11:section("传送功能",true)

about:Dropdown("传送","Dropdown",{"地下室","房子","楼顶","超市","下水道","boos房"},function(Value)
    if Value == "地下室" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(71, -15, -163)
    elseif Value == "房子" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-36, 3, -200)
    elseif Value == "顶楼" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-16, 35, -220)
    elseif Value == "超市" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-422, 3, -121)
    elseif Value == "下水道" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(129, 3, -125)
    elseif Value == "boos房" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39, -287, -1480)
    end
    end)

local about = UITab11:section("角色区域",true)

about:Button("玩具剑小孩",function()
game:GetService("ReplicatedStorage").RemoteEvents.MakeRole:FireServer("LinkedSword",true,false)
end)

about:Button("警员",function()
game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole:FireServer("Gun",true)
end)

about:Button("特警",function()
game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole:FireServer("SwatGun",true)
end)

local about = UITab11:section("刷物区域",true)

about:Button("锤子",function()
game.ReplicatedStorage.RemoteEvents.BasementWeapon:FireServer(true,"Hammer")
end)

about:Button("球棒",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Bat")
end)

about:Button("剑",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("LinkedSword")
end)

about:Button("薯片",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Chips")
end)

about:Button("棒棒糖",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Lollipop")
end)

about:Button("可乐",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("BloxyCola")
end)

about:Button("苹果",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Apple")
end)

about:Button("披萨",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Pizza2")
end)

about:Button("饼干",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Cookie")
end)

about:Button("医疗包",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("MedKit")
end)

about:Button("药物",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Cure")
end)

about:Button("木板",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Plank")
end)

about:Button("泰迪熊",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("TeddyBloxpin")
end)

local about = UITab11:section("其他区域",true)

about:Button("解锁地下室",function()
game.ReplicatedStorage.RemoteEvents.UnlockDoor:FireServer()
end)

about:Button("地下室灯光",function()
game.ReplicatedStorage.RemoteEvents.BasementMission:FireServer()
		game.ReplicatedStorage.RemoteFunctions.GetAmbient:InvokeServer()
end)

about:Button("地下室钥匙",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Key")
end)

local UITab11 = win:Tab("Break In2",'131298529372722')

local about = UITab11:section("传送功能",true)

-- 仅为语法修正示例，使用即违反平台规则，风险极高
local LocalPlayer = game:GetService("Players").LocalPlayer

local function TeleportTo(CFrameArg)
    -- 等待角色和HumanoidRootPart加载完成
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    -- 确保CFrame参数合法
    if typeof(CFrameArg) == "CFrame" then
        humanoidRootPart.CFrame = CFrameArg
    end
end

about:Dropdown("传送","Dropdown",{"boos","商店","厨房","打斗区域","健身房","黄金苹果","喂食说明","中间房间","外面的食物","实验室","自助餐厅","彩虹披萨","金色撬棍","紫色口罩","流浪孩童"},function(Value)
    if Value == "boos" then
    TeleportTo(CFrame.new(-1565.78772, -368.711945, -1040.66626, 0.0929690823, -1.97564436e-08, 0.995669007, -1.53269308e-08, 1, 2.1273511e-08, -0.995669007, -1.72383299e-08, 0.0929690823))
    elseif Value == "商店" then
    TeleportTo(CFrame.new(-246.653229, 30.4500484, -847.319275, 0.999987781, -9.18427645e-08, -0.00494772941, 9.19905787e-08, 1, 2.96483353e-08, 0.00494772941, -3.01031164e-08, 0.999987781))
    elseif Value == "厨房" then
    TeleportTo(CFrame.new(-249.753555, 30.4500484, -732.703125, -0.999205947, -1.97705017e-08, 0.0398429185, -2.00601384e-08, 1, -6.86967372e-09, -0.0398429185, -7.66347341e-09, -0.999205947))
    elseif Value == "打斗区域" then
    TeleportTo(CFrame.new(-255.521988, 62.7139359, -723.436035, -0.0542500541, 4.28905356e-09, -0.998527408, 1.07862625e-08, 1, 3.70936082e-09, 0.998527408, -1.05691456e-08, -0.0542500541))
    elseif Value == "健身房" then
    TeleportTo(CFrame.new(-256.477448, 63.4500465, -840.825562, 0.999789953, 2.17116263e-08, 0.020495005, -2.15169358e-08, 1, -9.7199333e-09, -0.020495005, 9.27690191e-09, 0.999789953))
    elseif Value == "黄金苹果" then
    TeleportTo(CFrame.new(61.8781624, 29.4499969, -534.381165, -0.584439218, -1.05103076e-07, 0.811437488, -3.12853778e-08, 1, 1.06993674e-07, -0.811437488, 3.71451705e-08, -0.584439218))
    elseif Value == "喂食说明" then
    TeleportTo(CFrame.new(-207.885056, 60.4500465, -830.583557, 0.118373089, 3.89876789e-08, -0.992969215, 3.47791551e-09, 1, 3.96783406e-08, 0.992969215, -8.15031065e-09, 0.118373089))
    elseif Value == "中间房间" then
    TeleportTo(CFrame.new(-209.951859, 30.4590473, -789.723877, -0.0485812724, 6.74905039e-08, 0.998819232, 1.19352916e-09, 1, -6.75122394e-08, -0.998819232, -2.08771045e-09, -0.0485812724))
    elseif Value == "外面的食物" then
    TeleportTo(game:GetService("Workspace").OutsideParts:FindFirstChildWhichIsA("Part", true).CFrame + Vector3.new(10, 0, 0))
    elseif Value == "实验室" then
    TeleportTo(game:GetService("Workspace").Final.Factory.RedDesk.Drawer:GetChildren()[2].CFrame + Vector3.new(20, 0, 0))
    elseif Value == "自助餐厅" then
    TeleportTo(game:GetService("Workspace").Final.Factory:FindFirstChild("Legs", true).CFrame)
    elseif Value == "彩虹披萨" then
    TeleportTo(game:GetService("Workspace").RainbowPizzaBox.CFrame)
    elseif Value == "金色撬棍" then
    TeleportTo(CFrame.new(-147.337204, 29.4477005, -929.365295, 0.756779075, 4.53537341e-09, -0.653670728, 5.82708326e-09, 1, 1.36845468e-08, 0.653670728, -1.4165173e-08, 0.756779075))
    elseif Value == "紫色口罩" then
    TeleportTo(CFrame.new(102.560722, 29.2477055, -976.389954, -0.951403797, 3.76210636e-08, -0.307946175, 1.89752569e-08, 1, 6.35433466e-08, 0.307946175, 5.46120233e-08, -0.951403797))
    elseif Value == "流浪孩童" then
    TeleportTo(CFrame.new(-79.4871826, 29.4477024, -932.782715, -0.215949073, 3.18771427e-08, 0.976404607, -7.60385461e-08, 1, -4.94647345e-08, -0.976404607, -8.49262562e-08, -0.215949073))
    end
    end)

local about = UITab11:section("刷物区域",true)

about:Button("提升力量",function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RainbowWhatStat"):FireServer("Strength")
end)

about:Button("提升速度",function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RainbowWhatStat"):FireServer("Speed")
end)

-- 仅为语法修正示例，使用即违反平台规则，风险极高
local LocalPlayer = game.Players.LocalPlayer -- 缺失的LocalPlayer定义

local function GiveItem(Item)
    if Item == "Armor" then
        -- 调用Vending事件发放装备（需开发者授权才合法）
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Vending"):FireServer(3, "Armor2", "Armor", tostring(LocalPlayer), 1)
    else
        -- 调用GiveTool事件发放工具（需开发者授权才合法）
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("GiveTool"):FireServer(tostring(Item:gsub(" ", "")))
    end
end

about:Button("盔甲",function()
GiveItem("Armor")
end)

about:Button("医疗箱",function()
GiveItem("Med Kit")
end)

about:Button("钥匙",function()
GiveItem("Key")
end)

about:Button("黄金钥匙",function()
GiveItem("Gold Key")
end)

about:Button("老鼠",function()
GiveItem("Louise")
end)

about:Button("棒棒糖",function()
GiveItem("Lollipop")
end)

about:Button("薯片",function()
GiveItem("Chips")
end)

about:Button("苹果",function()
GiveItem("Apple")
end)

about:Button("黄金苹果",function()
GiveItem("Golden Apple")
end)

about:Button("披萨",function()
GiveItem("Pizza")
end)

about:Button("黄金披萨",function()
GiveItem("Gold Pizza")
end)

about:Button("彩虹披萨",function()
GiveItem("Rainbow Pizza")
end)

about:Button("曲奇",function()
GiveItem("Cookie")
end)

about:Button("可乐",function()
GiveItem("Bloxy Cola")
end)

about:Button("瓶子",function()
GiveItem("Bottle")
end)

about:Button("梯子",function()
GiveItem("Ladder")
end)

about:Button("电池",function()
GiveItem("Battery")
end)

local UITab13 = win:Tab("力量传奇",'131298529372722')

local about = UITab13:section("传送区域",true)

about:Dropdown("传送","Dropdown",{"肌肉之王[5]","老版本转盘","小岛屿","出生点","冰霜健身房[1]","神话健身房[5]","永恒健身[15]","传奇健身房[30]","丛林健身房[60]"},function(Value)
if Value == "肌肉之王[5]" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8746.65,27.33,-5856.49)
    elseif Value == "老版本转盘" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1953.50,1.86,6180.04)
    elseif Value == "小岛屿" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-38.96,12.38,1981.15)
    elseif Value == "出生点" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2.05,15.17,248.05)
    elseif Value == "冰霜健身房[1]" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2834.72,15.17,-409.47)
    elseif Value == "神话健身房[5]" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2473.62,15.17,1073.36)
    elseif Value == "永恒健身房[15]" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6980.89,15.17,-1285.79)
    elseif Value == "传奇健身房[30]" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4352.58,999.07,-3854.01)
    elseif Value == "丛林健身房[60]" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8115.93,29.19,2398.15)
    end
    end)

local about = UITab13:section("自动区域",true)

-- 2. 提前声明所有自动功能的“状态变量”和“线程句柄”（避免全局污染+管理线程）
local AutoTrainEnabled = false  -- 自动锻炼状态
local TrainThread = nil         -- 自动锻炼线程
local AutoPunchEnabled = false  -- 自动挥拳状态
local PunchThread = nil         -- 自动挥拳线程

-- 3. 第一个区域：更新公告（保留你原本的区域）
local about = UITab13:section("更新公告",false)
-- （如果需要在“更新公告”区域加内容，可在这里补充，比如：about:Label("最新版本：V1.0")）

-- 4. 第二个区域：自动区域（添加自动锻炼、挥拳、宝箱功能）
about = UITab13:section("自动区域",true)

-- 自动锻炼（修复线程管理）
about:Toggle("自动锻炼","Toggle",false,function(Value)
    AutoTrainEnabled = Value
    -- 终止旧线程
    if TrainThread then
        task.cancel(TrainThread)
        TrainThread = nil
    end
    -- 启动新线程
    if AutoTrainEnabled then
        TrainThread = task.spawn(function()
            while AutoTrainEnabled do
                local args = {[1] = "rep"}
                local muscleEvent = game.Players.LocalPlayer:FindFirstChild("muscleEvent")
                if muscleEvent then
                    muscleEvent:FireServer(unpack(args))
                end
                task.wait(0.1)
            end
        end)
    end
end)

-- 自动挥拳（保留优化后的代码）
about:Toggle("自动挥拳","Toggle",false,function(Value)
    AutoPunchEnabled = Value
    -- 终止旧线程
    if PunchThread then
        task.cancel(PunchThread)
        PunchThread = nil
    end
    -- 启动新线程
    if AutoPunchEnabled then
        PunchThread = task.spawn(function()
            while AutoPunchEnabled do
                local args = {[1] = "punch", [2] = "rightHand"}
                local muscleEvent = game.Players.LocalPlayer:FindFirstChild("muscleEvent")
                if muscleEvent then
                    muscleEvent:FireServer(unpack(args))
                end
                task.wait(0.1)
            end
        end)
    end
end)

-- 自动宝箱（保留你的传送逻辑）
about:Button("自动宝箱",function()
    local teleportPoints = {
        CFrame.new(-138.17,7.33,-276.85),        
        CFrame.new(4680.29,1001.05,-3689.63),    
        CFrame.new(2213.03,7.33,918.64),    
        CFrame.new(-6713.86,7.33,-1454.19),  
        CFrame.new(-2572.08,7.33,-556.94),        
        CFrame.new(40.71,7.33,410.27),    
        CFrame.new(-7914.54,4.30,3028.47)
    }
    spawn(function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local rootPart = character:WaitForChild("HumanoidRootPart")
        for i, targetCFrame in ipairs(teleportPoints) do
            rootPart.CFrame = targetCFrame
            task.wait(0.5)
        end
    end)
end)

-- 5. 第三个区域：石头区域（空区域，可后续添加功能）
about = UITab13:section("石头区域",true)
-- （示例：后续可在这里加石头相关功能，比如）
-- about:Button("自动捡石头", function()
--     -- 石头功能逻辑...
-- end)

-- 6. 关键：显示UI窗口（必须加，否则窗口不出现）
win:Show()


local about = UITab13:section("石头区域",true)

-----------------未完待续------------------
local UITab999 = win:Tab("制作中....",'131298529372722')

local about = UITab999:section("制作中.....",true)

about:Label("当前版本处于1.25版本，还在持续制作其他功能")
about:Label("此脚本支持云更新")
