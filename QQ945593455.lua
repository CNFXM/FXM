game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "『禁漫中心』"; Text ="核对用户ID中♧"; Duration = 2; })
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "『禁漫中心』"; Text ="用户ID核对完毕♣"; Duration = 4; })

local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/CNFXM/FXM/main/FXMUI.lua"))();        
local win = ui:new("FXM宣告")
--
local UITab1 = win:Tab("",'117404188324801')

local about = UITab1:section("点击图片",false)

about:Label("玩家封号概不负责!请谨慎开启!")

about:Button("确定并开启FXM脚本",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/CNFXM/FXM/main/FXMjiaoben.lua'))()
end)

local about = UITab1:section("作者群聊",false)

about:Label("作者QQ：2480300784")
about:Label("主群：1001390385")
about:Label("2群： 950954309")

local about = UITab1:section("玩家信息",false)

about:Label("你的账号年龄:"..player.AccountAge.."天")
about:Label("你的注入器:"..identifyexecutor())
about:Label("你的用户名:"..game.Players.LocalPlayer.Character.Name)
about:Label("你现在的服务器名称:"..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
about:Label("你现在的服务器id:"..game.GameId)
about:Label("你的用户ID:"..game.Players.LocalPlayer.UserId)
about:Label("获取客户端ID:"..game:GetService("RbxAnalyticsService"):GetClientId())