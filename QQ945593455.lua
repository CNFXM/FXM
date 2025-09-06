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
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "FXM脚本"; Text ="此脚本永久免费"; Duration = 2; })
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "FXM脚本"; Text ="脚本支持云更新"; Duration = 4; })

local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/CNFXM/FXM/main/FXMUIV2.lua"))();        
local win = ui:new("FXM启动区")

local UITab1 = win:Tab("启动FXM",'131298529372722')

local about = UITab1:section("点击我",false)

about:Label("你的用户名:"..game.Players.LocalPlayer.Character.Name)

about:Label("玩家封号我们概不负责!想好再开启")

about:Button("确定并开启FXM脚本",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/CNFXM/FXM/main/FXMjiaoben.lua'))()
end)

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


local UITab2 = win:Tab("快捷区域",'131298529372722')

local about = UITab2:section("快捷区域",true)

about:Label("玩家封号我们概不负责!想好再开启")

about:Button("确定并开启FXM脚本",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/CNFXM/FXM/main/FXMjiaoben.lua'))()
end)

about:Label("作者QQ：2480300784")

about:Button("复制主群",function()
    setclipboard("945593455")
end)

about:Button("复制2群",function()
    setclipboard("301342746")
end)


