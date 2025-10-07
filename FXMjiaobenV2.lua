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
-----------------UI区域------------------
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
        Title = "FXM<font color='#00FF00'>脚本</font>",
        Icon = "rbxassetid://81944629903864",
        IconTransparency = 0.5,
        IconThemed = true,
        Author = "作者:飞熊猫",
        Folder = "CloudHub",
        Size = UDim2.fromOffset(400, 300),
        Transparent = true,
        Theme = "Light",
        User = {
            Enabled = true,
            Callback = function() print("clicked") end,
            Anonymous = false
        },
        SideBarWidth = 200,
        ScrollBarEnabled = true,
        Background = "rbxassetid://81507229860504"
    })
    

Window:EditOpenButton({
    Title = "FXM脚本",
    Icon = "monitor",
    CornerRadius = UDim.new(0, 16),
    StrokeThickness = 2,
    Color = openButtonColor,
    Draggable = true,
})

Window:Tag({
    Title = "重置版V2",
    Color = Color3.fromHex("#30ff6a")
})

Window:Tag({
        Title = "免费公益", -- 标签汉化
        Color = Color3.fromHex("#315dff")
    })
    local TimeTag = Window:Tag({
        Title = "支持云更",
        Color = Color3.fromHex("#000000")
    })

-----------------分类区域------------------
local Tabs = {
    GGXX = Window:Section({ Title = "公告信息", Opened = true }),
    UI = Window:Section({ Title = "UI设置", Opened = true }),
    JBGJHZ = Window:Section({ Title = "混杂工具", Opened = true }),
    GDJB = Window:Section({ Title = "更多脚本", Opened = true }),
    JBTY = Window:Section({ Title = "混杂通用", Opened = true }),
    RZCQ = Window:Section({ Title = "忍者传奇", Opened = true }),    
    gn = Window:Section({ Title = "缝合脚本", Opened = true }),    
}

local TabHandles = {
    GGXX1 = Tabs.GGXX:Tab({ Title = "公告区域", Icon = "layout-grid" }),
    GGXX2 = Tabs.GGXX:Tab({ Title = "更新区域", Icon = "layout-grid" }),
    GGXX3 = Tabs.GGXX:Tab({ Title = "信息区域", Icon = "layout-grid" }),
    UI = Tabs.UI:Tab({ Title = "UI区域", Icon = "layout-grid" }),
    JBGJHZ = Tabs.JBGJHZ:Tab({ Title = "工具区域", Icon = "layout-grid" }),
    GDJB1 = Tabs.GDJB:Tab({ Title = "汉化区域", Icon = "layout-grid" }),
    GDJB2 = Tabs.GDJB:Tab({ Title = "更多区域", Icon = "layout-grid" }),
    JBTY1 = Tabs.JBTY:Tab({ Title = "调节区域", Icon = "layout-grid" }),
    JBTY2 = Tabs.JBTY:Tab({ Title = "点击区域", Icon = "layout-grid" }),
    JBTY3 = Tabs.JBTY:Tab({ Title = "绘制区域", Icon = "layout-grid" }),    
    JBTY4 = Tabs.JBTY:Tab({ Title = "玩家区域", Icon = "layout-grid" }),
    RZCQ1 = Tabs.RZCQ:Tab({ Title = "基础区域", Icon = "layout-grid" }),
    RZCQ2 = Tabs.RZCQ:Tab({ Title = "辅助区域", Icon = "layout-grid" }),
    RZCQ3 = Tabs.RZCQ:Tab({ Title = "购买区域", Icon = "layout-grid" }),
    RZCQ4 = Tabs.RZCQ:Tab({ Title = "收集区域", Icon = "layout-grid" }),
    RZCQ5 = Tabs.RZCQ:Tab({ Title = "击杀区域", Icon = "layout-grid" }),
    RZCQ6 = Tabs.RZCQ:Tab({ Title = "传送区域", Icon = "layout-grid" }),
    RZCQ7 = Tabs.RZCQ:Tab({ Title = "刷物区域", Icon = "layout-grid" }),
    ESPgn = Tabs.gn:Tab({ Title = "自然灾害", Icon = "layout-grid" }),
    pbgn = Tabs.gn:Tab({ Title = "被遗弃", Icon = "layout-grid" }),
    tzgn = Tabs.gn:Tab({ Title = "最坚强战场", Icon = "layout-grid" }),
    fzgn = Tabs.gn:Tab({ Title = "死铁轨", Icon = "layout-grid" }),
    A = Tabs.gn:Tab({ Title = "森林99夜", Icon = "layout-grid" }),
    B = Tabs.gn:Tab({ Title = "刀刃球", Icon = "layout-grid" }),
    C = Tabs.gn:Tab({ Title = "偷走脑红", Icon = "layout-grid" }),
    D = Tabs.gn:Tab({ Title = "火箭发射模拟器", Icon = "layout-grid" }),
    E = Tabs.gn:Tab({ Title = "力量传奇", Icon = "layout-grid" }),
    F = Tabs.gn:Tab({ Title = "代木大享", Icon = "layout-grid" }),
    G = Tabs.gn:Tab({ Title = "巴掌模拟器（正在更新）", Icon = "layout-grid" }),
    H = Tabs.gn:Tab({ Title = "墨水游戏", Icon = "layout-grid" }),
           
}


-----------------公告区域------------------
local Paragraph = TabHandles.GGXX1:Paragraph({
    Title = "欢迎使用FXM脚本",
    Desc = "FXM脚本最始源于2021年",
    Image = "rbxassetid://81944629903864",
    ImageSize = 42,
    Thumbnail = "rbxassetid://106059549481927",
    ThumbnailSize = 120,
})

local Paragraph = TabHandles.GGXX1:Paragraph({
    Title = "当你执行了主脚本",
    Desc = "那么你已经同意了玩家封号我们概不负责!",
    ImageSize = 42,  -- 若不需要小图标，这行也可一并删除
    ThumbnailSize = 120,  -- 若不需要缩略图，这行也可一并删除
})

local Paragraph = TabHandles.GGXX1:Paragraph({
    Title = "师傅:",
    Desc = "素辞",
    ImageSize = 42,  -- 若不需要小图标，这行也可一并删除
    ThumbnailSize = 120,  -- 若不需要缩略图，这行也可一并删除
})

local Paragraph = TabHandles.GGXX1:Paragraph({
    Title = "合作人:",
    Desc = "越 HB",
    ImageSize = 42,  -- 若不需要小图标，这行也可一并删除
    ThumbnailSize = 120,  -- 若不需要缩略图，这行也可一并删除
})

local Paragraph = TabHandles.GGXX1:Paragraph({
    Title = "资助人:",
    Desc = "越 HB",
    ImageSize = 42,  -- 若不需要小图标，这行也可一并删除
    ThumbnailSize = 120,  -- 若不需要缩略图，这行也可一并删除
})

local Paragraph = TabHandles.GGXX1:Paragraph({
    Title = "复制主群",
    Desc = "QQ主群:945593455", -- 明确提示要复制的内容
    Buttons = {{
        Title = "复制",
        Icon = "copy", -- 恢复“复制”图标，更贴合功能
        Variant = "Primary",
        Callback = function()
            -- 核心修改：把复制的内容换成固定的"FXM"
            setclipboard("945593455")

            -- 以下提示音、通知逻辑保持不变，确保操作反馈正常
            local Sound = Instance.new("Sound", game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
            WindUI:Notify({
                Title = "FXM脚本：",
                Content = "已成功复制！", -- 通知内容也同步修改
                Icon = "bell",
                IconThemed = true,
                Duration = 5
            })
        end
    }}
})

local Paragraph = TabHandles.GGXX1:Paragraph({
    Title = "复制2群",
    Desc = "QQ2群:301342746", -- 明确提示要复制的内容
    Buttons = {{
        Title = "复制",
        Icon = "copy", -- 恢复“复制”图标，更贴合功能
        Variant = "Primary",
        Callback = function()
            -- 核心修改：把复制的内容换成固定的"FXM"
            setclipboard("301342746")

            -- 以下提示音、通知逻辑保持不变，确保操作反馈正常
            local Sound = Instance.new("Sound", game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
            WindUI:Notify({
                Title = "FXM脚本：",
                Content = "已成功复制！", -- 通知内容也同步修改
                Icon = "bell",
                IconThemed = true,
                Duration = 5
            })
        end
    }}
})
-----------------更新区域------------------
local Paragraph = TabHandles.GGXX2:Paragraph({
    Title = "FXM脚本重置版0.5:",
    Desc = "UI界面、部分移植",
    Image = "rbxassetid://81944629903864",
    ImageSize = 42,
    Thumbnail = "rbxassetid://128537295758977",
    ThumbnailSize = 120,
})
-----------------信息区域------------------
local Paragraph = TabHandles.GGXX3:Paragraph({
    Title = "您的用户名：",
    Desc = "" .. game.Players.LocalPlayer.Name .. "",
    Image = "rbxassetid://75035870595229",
    ImageSize = 42, -- default 30
    Thumbnail = "rbxassetid://73942828034736",
    ThumbnailSize = 120, -- Thumbnail height
    Buttons = {{
        Title = "复制用户名",
        Variant = "Primary",
        Callback = function()
            -- 复制用户名到剪贴板
            local userNameText = "" .. game.Players.LocalPlayer.Name
            setclipboard(userNameText)

            -- 播放操作成功音效
            local Sound = Instance.new("Sound", game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()

            -- 弹出复制成功通知
            WindUI:Notify({
                Title = "HB脚本中心---提示：",
                Content = "用户名已成功复制！",
                Icon = "bell",
                IconThemed = true, -- automatic color icon to theme 
                Duration = 5
            })

        end,
        Icon = "bird"
    }}
})

local Paragraph1 = TabHandles.GGXX3:Paragraph({
     Title = "您的注入器信息：",
     Desc = "你的注入器:" .. identifyexecutor(),
     Buttons = {{
         Title = "复制注入器信息",
         Icon = "copy",
         Variant = "Primary",
         Callback = function()
             local executorText = "" .. identifyexecutor()
             setclipboard(executorText)
             local Sound = Instance.new("Sound", game:GetService("SoundService"))
             Sound.SoundId = "rbxassetid://2865227271"
             Sound:Play()
             WindUI:Notify({
                 Title = "FXM脚本",
                 Content = "注入器信息已成功复制！",
                 Icon = "bell",
                 IconThemed = true,
                 Duration = 5
             })
         end
     }}
 })
 -- 2. 账号注册时间（修正挂载对象为TabHandles.GGXX3，变量名改为Paragraph2）
 local Paragraph2 = TabHandles.GGXX3:Paragraph({
     Title = "您的账号注册时间（天）：",
     Desc = "" .. game:GetService("Players").LocalPlayer.AccountAge .. "",
     Buttons = {{
         Title = "复制您的注册时间",
         Icon = "copy",
         Variant = "Primary",
         Callback = function()
             setclipboard(game:GetService("Players").LocalPlayer.AccountAge)
             local Sound = Instance.new("Sound", game:GetService("SoundService"))
             Sound.SoundId = "rbxassetid://2865227271"
             Sound:Play()
             WindUI:Notify({
                 Title = "FXM",
                 Content = "已成功复制注册时间！",
                 Icon = "bell",
                 IconThemed = true,
                 Duration = 5
             })
         end
     }}
 })
 -- 3. 服务器名称（变量名改为Paragraph3）
 local Paragraph3 = TabHandles.GGXX3:Paragraph({
     Title = "当前服务器信息：",
     Desc = "你现在的服务器名称:" .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
     Buttons = {{
         Title = "复制服务器名称",
         Icon = "copy",
         Variant = "Primary",
         Callback = function()
             local serverNameText = "你现在的服务器名称:" .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
             setclipboard(serverNameText)
             local Sound = Instance.new("Sound", game:GetService("SoundService"))
             Sound.SoundId = "rbxassetid://2865227271"
             Sound:Play()
             WindUI:Notify({
                 Title = "FXM脚本",
                 Content = "服务器名称已成功复制！",
                 Icon = "bell",
                 IconThemed = true,
                 Duration = 5
             })
         end
     }}
 })
 -- 4. 服务器ID（变量名改为Paragraph4）
 local Paragraph4 = TabHandles.GGXX3:Paragraph({
     Title = "当前服务器信息：",
     Desc = "你现在的服务器id:" .. game.GameId,
     Buttons = {{
         Title = "复制服务器ID",
         Icon = "copy",
         Variant = "Primary",
         Callback = function()
             local serverIdText = "" .. game.GameId
             setclipboard(serverIdText)
             local Sound = Instance.new("Sound", game:GetService("SoundService"))
             Sound.SoundId = "rbxassetid://2865227271"
             Sound:Play()
             WindUI:Notify({
                 Title = "FXM脚本",
                 Content = "服务器ID已成功复制！",
                 Icon = "bell",
                 IconThemed = true,
                 Duration = 5
             })
         end
     }}
 })
 -- 5. 用户ID（变量名改为Paragraph5）
 local Paragraph5 = TabHandles.GGXX3:Paragraph({
     Title = "您的用户信息：",
     Desc = "你的用户ID:" .. game.Players.LocalPlayer.UserId,
     Buttons = {{
         Title = "复制用户ID",
         Icon = "copy",
         Variant = "Primary",
         Callback = function()
             local userIdText = "" .. game.Players.LocalPlayer.UserId
             setclipboard(userIdText)
             local Sound = Instance.new("Sound", game:GetService("SoundService"))
             Sound.SoundId = "rbxassetid://2865227271"
             Sound:Play()
             WindUI:Notify({
                 Title = "FXM脚本",
                 Content = "用户ID已成功复制！",
                 Icon = "bell",
                 IconThemed = true,
                 Duration = 5
             })
         end
     }}
 })
 -- 6. 客户端ID（修正未闭合的代码块，变量名改为Paragraph6）
 local Paragraph6 = TabHandles.GGXX3:Paragraph({
     Title = "您的客户端信息：",
     Desc = "获取客户端ID:" .. game:GetService("RbxAnalyticsService"):GetClientId(),
     Buttons = {{
         Title = "复制客户端ID",
         Icon = "copy",
         Variant = "Primary",
         Callback = function()
             local clientIdText = "" .. game:GetService("RbxAnalyticsService"):GetClientId()
             setclipboard(clientIdText)
             local Sound = Instance.new("Sound", game:GetService("SoundService"))
             Sound.SoundId = "rbxassetid://2865227271"
             Sound:Play()
             WindUI:Notify({
                 Title = "FXM脚本",
                 Content = "客户端ID已成功复制！",
                 Icon = "bell",
                 IconThemed = true,
                 Duration = 5
             })
         end
     }}
 })
-----------------UI设置------------------
local Button = TabHandles.UI:Button({
    Title = "自定义界面",
    Desc = "个性化您的体验",
    Image = "palette",
    ImageSize = 20,
    Color = "White"
})

local themes = {}
for themeName, _ in pairs(WindUI:GetThemes()) do
    table.insert(themes, themeName)
end
table.sort(themes)

local themeDropdown = TabHandles.UI:Dropdown({
    Title = "主题选择",
    Values = themes,
    Value = "Dark",
    Callback = function(theme)
        WindUI:SetTheme(theme)
        WindUI:Notify({
            Title = "主题应用",
            Content = theme,
            Icon = "palette",
            Duration = 2
        })
    end
})

local transparencySlider = TabHandles.UI:Slider({
    Title = "透明度",
    Value = { 
        Min = 0,
        Max = 1,
        Default = 0.2,
    },
    Step = 0.1,
    Callback = function(value)
        Window:ToggleTransparency(tonumber(value) > 0)
        WindUI.TransparencyValue = tonumber(value)
    end
})

TabHandles.UI:Toggle({
    Title = "启用黑色主题",
    Desc = "使用黑色调主题方案",
    Value = true,
    Callback = function(state)
        WindUI:SetTheme(state and "Dark" or "Light")
        themeDropdown:Select(state and "Dark" or "Light")
    end
})


TabHandles.UI:Button({
    Title = "创建新主题",
    Icon = "plus",
    Callback = function()
        Window:Dialog({
            Title = "创建主题",
            Content = "此功能很快就会推出",
            Buttons = {
                {
                    Title = "确认",
                    Variant = "Primary"
                }
            }
        })
    end
})

TabHandles.UI:Paragraph({
    Title = "配置管理",
    Desc = "保存你的设置",
    Image = "save",
    ImageSize = 20,
    Color = "White"
})

local configName = "default"
local configFile = nil
local MyPlayerData = {
    name = "Player1",
    level = 1,
    inventory = { "sword", "shield", "potion" }
}

TabHandles.UI:Input({
    Title = "配置名称",
    Value = configName,
    Callback = function(value)
        configName = value
    end
})

local ConfigManager = Window.ConfigManager
if ConfigManager then
    ConfigManager:Init(Window)
    
TabHandles.UI:Button({
        Title = "保存配置",
        Icon = "save",
        Variant = "Primary",
        Callback = function()
            configFile = ConfigManager:CreateConfig(configName)
            
            configFile:Register("featureToggle", featureToggle)
            configFile:Register("intensitySlider", intensitySlider)
            configFile:Register("modeDropdown", modeDropdown)
            configFile:Register("themeDropdown", themeDropdown)
            configFile:Register("transparencySlider", transparencySlider)
            
            configFile:Set("playerData", MyPlayerData)
            configFile:Set("lastSave", os.date("%Y-%m-%d %H:%M:%S"))
            
            if configFile:Save() then
                WindUI:Notify({ 
                    Title = "保存配置", 
                    Content = "保存为："..configName,
                    Icon = "check",
                    Duration = 3
                })
            else
                WindUI:Notify({ 
                    Title = "错误", 
                    Content = "保存失败",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    TabHandles.UI:Button({
        Title = "加载配置",
        Icon = "folder",
        Callback = function()
            configFile = ConfigManager:CreateConfig(configName)
            local loadedData = configFile:Load()
            
            if loadedData then
                if loadedData.playerData then
                    MyPlayerData = loadedData.playerData
                end
                
                local lastSave = loadedData.lastSave or "Unknown"
                WindUI:Notify({ 
                    Title = "加载配置", 
                    Content = "正在加载："..configName.."\n上次保存："..lastSave,
                    Icon = "refresh-cw",
                    Duration = 5
                })
                
                Button = TabHandles.Elements:Button({
                    Title = "玩家数据",
                    Desc = string.format("名字: %s\n等级: %d\n库存: %s", 
                        MyPlayerData.name, 
                        MyPlayerData.level, 
                        table.concat(MyPlayerData.inventory, ", "))
                })
            else
                WindUI:Notify({ 
                    Title = "错误", 
                    Content = "加载失败",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })
else
    TabHandles.UI:Paragraph({
        Title = "配置管理不可用",
        Desc = "此功能需要配置管理",
        Image = "alert-triangle",
        ImageSize = 20,
        Color = "White"
    })
end
-----------------工具区域------------------
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
             -- 替换复制成功通知
             WindUI:Notify({
                 Title = "FXM脚本",
                 Content = "坐标复制成功：" .. coordStr,
                 Duration = 3,
                 Icon = "layout-grid",
             })
         else
             -- 新增复制失败通知（原逻辑无，补充完善）
             WindUI:Notify({
                 Title = "FXM脚本",
                 Content = "复制失败：角色或根部件未加载",
                 Duration = 3,
                 Icon = "layout-grid",
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
          -- 替换开启通知
          WindUI:Notify({
              Title = "FXM脚本",
              Content = "坐标仪加载成功",
              Duration = 3,
              Icon = "layout-grid",
          })
      else
          -- 关闭：销毁当前坐标仪
          self:DestroyCoord()
          -- 替换关闭通知
          WindUI:Notify({
              Title = "FXM脚本",
              Content = "坐标仪已关闭",
              Duration = 3,
              Icon = "layout-grid",
          })
      end
  end
-- 坐标仪开关按钮（默认关闭，切换时重建/销毁）
 Toggle = TabHandles.JBGJHZ:Toggle({
     Title = "坐标仪器", 
     Value = false, 
     Callback = function(Value)
         CoordManager:Toggle(Value)
     end
 })

Button = TabHandles.JBGJHZ:Button({
    Title = "dex",
    Desc = "文件查看工具",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/DevSloPo/DVES/refs/heads/main/Moon-dex.lua"))()
        
WindUI:Notify({
    Title = "FXM脚本",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

Button = TabHandles.JBGJHZ:Button({
    Title = "SimpleSpy",
    Desc = "行为抓包工具",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/SCRIPT/SimpleSpy/SourceBeta.lua"))()
        
WindUI:Notify({
    Title = "FXM脚本",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})
-----------------汉化区域------------------
local Paragraph = TabHandles.GDJB1:Paragraph({
    Title = "FXM汉化组",
    Desc = "我们会持续更新汉化的",
    Image = "rbxassetid://81944629903864",
    ImageSize = 42,
    Thumbnail = "rbxassetid://129520761931276",
    ThumbnailSize = 120,
})

Button = TabHandles.GDJB1:Button({
    Title = "汉化黑洞",
    Desc = "让掉落零件围绕人物旋转",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CNFXM/FXM/main/FXMheidong.lua'))()
        
WindUI:Notify({
    Title = "FXM脚本",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

Button = TabHandles.GDJB1:Button({
    Title = "汉化飞行V3",
    Desc = "人物飞行",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CNFXM/FXM/main/FXMFLYV3.lua'))()
        
WindUI:Notify({
    Title = "FXM脚本",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

Button = TabHandles.GDJB1:Button({
    Title = "汉化传送",
    Desc = "人物传送",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CNFXM/FXM/main/FXMdeliver.lua'))()
        
WindUI:Notify({
    Title = "FXM脚本",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})
-----------------更多区域------------------
local Paragraph = TabHandles.GDJB2:Paragraph({
    Title = "更多区域",
    Desc = "更快的切换别人的脚本",
    Image = "rbxassetid://81944629903864",
    ImageSize = 42,
    Thumbnail = "rbxassetid://140327980260811",
    ThumbnailSize = 120,
})

Button = TabHandles.GDJB2:Button({
    Title = "越脚本",
    Desc = "不必多言合作人",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/HB-ksdb/-4/main/obfuscated_script-1759031266212.lua.txt"))()
        
WindUI:Notify({
    Title = "FXM脚本",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

Button = TabHandles.GDJB2:Button({
    Title = "小月脚本",
    Desc = "不必多言师傅",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MIAN57/-/refs/heads/main/%E5%B0%8F%E6%9C%88%E8%84%9A%E6%9C%AC%E6%BA%90%E7%A0%81"))()
        
WindUI:Notify({
    Title = "FXM脚本",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

Button = TabHandles.GDJB2:Button({
    Title = "TX脚本",
    Desc = "不必多言",
    Locked = false,
    Callback = function()
TX = "脚本群:160369111"
Script = "Free永久免费"
loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/TX-Free-YYDS/refs/heads/main/FREE-TX-TEAM"))()
        
WindUI:Notify({
    Title = "FXM脚本",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

Button = TabHandles.GDJB2:Button({
    Title = "安脚本",
    Desc = "需要加入组群才可执行",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Anscripterato/QQ2134702438/refs/heads/main/byato/AnScript/atoscript"))()
        
WindUI:Notify({
    Title = "FXM脚本",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

Button = TabHandles.GDJB2:Button({
    Title = "BS脚本",
    Desc = "不必多言",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://gitlab.com/ajduoxcz/bs-center-of-the-black-hole/-/raw/main/BS%20Center%20of%20the%20black%20hole"))()
        
WindUI:Notify({
    Title = "FXM脚本",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

Button = TabHandles.GDJB2:Button({
    Title = "皮脚本",
    Desc = "不必多言",
    Locked = false,
    Callback = function()
getgenv().XiaoPi="皮脚本QQ群1002100032" loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
        
WindUI:Notify({
    Title = "FXM脚本",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

-----------------调节区域------------------
Slider = TabHandles.JBTY1:Slider({
    Title = "跳跃设置",
    Value = {
        Min = 0,
        Max = 1000,
        Default = 50,
    },
    Increment = 1,
    Callback = function(value)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = value
        end
    end
})

Slider = TabHandles.JBTY1:Slider({
    Title = "速度设置",
    Value = {
        Min = 0,
        Max = 1000,
        Default = 16,
    },
    Increment = 1,
    Callback = function(value)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = value
        end
    end
})
 
Slider = TabHandles.JBTY1:Slider({
    Title = "重力设置",
    Value = {
        Min = 0.0,
        Max = 1000.0,
        Default = 196.2,
    },
    Step = 0.1,
    Callback = function(value)
        game.Workspace.Gravity = value
    end
})

Slider = TabHandles.JBTY1:Slider({
    Title = "镜头焦距",
    Value = {
        Min = 0.0,
        Max = 1000.0,
        Default = 70,
    },
    Step = 1,
    Callback = function(value)
        game.Workspace.CurrentCamera.FieldOfView = value
    end
})

Slider = TabHandles.JBTY1:Slider({
    Title = "视角上限",
    Value = {
        Min = 0.0,
        Max = 1000.0,
        Default = 100,
    },
    Step = 1,
    Callback = function(value)
        game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = value
    end
})

Slider = TabHandles.JBTY1:Slider({
    Title = "当前血量",
    Value = {
        Min = 0,
        Max = 1000,
        Default = 100,
    },
    Step = 1,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.Health = value
    end
})

Slider = TabHandles.JBTY1:Slider({
    Title = "最大血量",
    Value = {
        Min = 0,
        Max = 1000,
        Default = 100,
    },
    Step = 1,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.MaxHealth = value
    end
})

Slider = TabHandles.JBTY1:Slider({
    Title = "旋转速度", 
    Value = {
        Min = 0,
        Max = 100,
        Default = 0,
    },
    Step = 1,
    Callback = function(Value)
        _G.SpinSpeed = Value
    end
})

Button = TabHandles.JBTY1:Button({
    Title = "确认开启",
    Desc = "开启旋转功能第2步",
    Locked = false,
    Callback = function()
        _G.SpinEnabled = true
        
        local plr = game:GetService("Players").LocalPlayer
        local UIS = game:GetService("UserInputService")
        
        -- 等待角色加载完成
        repeat task.wait() until plr.Character
        local character = plr.Character
        local hum = character:WaitForChild("Humanoid")
        local humRoot = character:WaitForChild("HumanoidRootPart")
        local velocity = nil -- 旋转组件变量
        
        -- 初始化旋转逻辑：仅当speed大于0时才创建旋转组件
        if _G.SpinSpeed > 0 then
            hum.AutoRotate = false -- 关闭自动转向
            -- 创建旋转组件并应用速度
            velocity = Instance.new("AngularVelocity")
            velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
            velocity.MaxTorque = math.huge
            velocity.AngularVelocity = Vector3.new(0, _G.SpinSpeed, 0) -- 应用设置的速度
            velocity.Parent = humRoot
            velocity.Name = "Spinbot"
            print("旋转已启动，当前速度：" .. _G.SpinSpeed)
        else
            -- speed为0及以下时，保持角色默认状态
            hum.AutoRotate = true
            -- 如果存在之前的旋转组件，则移除
            if humRoot:FindFirstChild("Spinbot") then
                humRoot.Spinbot:Destroy()
            end
            print("速度设置为0或以下，不启动旋转，角色保持默认状态")
        end
        
        WindUI:Notify({
            Title = "FXM",
            Content = "旋转设置成功!",
            Duration = 3, -- 3 seconds
            Icon = "layout-grid",
        })
    end
})

TabHandles.JBTY1:Divider()

Slider = TabHandles.JBTY1:Slider({
    Title = "触碰范围",
    Value = {
        Min = 2,
        Max = 1000,
        Default = 2,
    },
    Step = 1,
    Callback = function(Value)
    _G.HeadSize = Value
    end
})

Button = TabHandles.JBTY1:Button({
    Title = "确认开启",
    Desc = "开启触碰范围第2步",
    Locked = false,
    Callback = function()
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
        
WindUI:Notify({
    Title = "FXM",
    Content = "设置成功!",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

-- 平移加速距离滑块
Slider = TabHandles.JBTY1:Slider({
    Title = "平移速度",
    Value = {
        Min = 1,
        Max = 50,
        Default = 5,
    },
    Step = 1,
    Callback = function(Value)
        _G.TeleportDistance = Value
    end
})

-- 启用平移加速开关
Toggle = TabHandles.JBTY1:Toggle({
    Title = "启用加速",
    Default = false,
    Callback = function(Value)
        _G.TeleportSpeedEnabled = Value
        
        if Value then
            -- 启用平移加速
            local player = game:GetService("Players").LocalPlayer
            
            -- 等待角色加载
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")
            local rootPart = character:WaitForChild("HumanoidRootPart")
            
            -- 使用RenderStepped持续检测移动状态
            _G.TeleportConnection = game:GetService("RunService").RenderStepped:Connect(function()
                if _G.TeleportSpeedEnabled and character and humanoid and rootPart then
                    -- 检查是否在移动（MoveDirection的长度大于0表示在移动）
                    local moveDirection = humanoid.MoveDirection
                    if moveDirection.Magnitude > 0 then
                        -- 计算传送目标位置
                        local teleportDistance = _G.TeleportDistance or 5
                        local targetPosition = rootPart.Position + (moveDirection.Unit * teleportDistance)
                        
                        -- 根据选择的模式计算朝向
                        local lookAtPosition
                        local mode = _G.WalkDirectionMode or "常规模式"
                        
                        if mode == "常规模式" then
                            -- 正常模式：面向移动方向
                            lookAtPosition = targetPosition + moveDirection
                        else -- 相反模式
                            -- 相反模式：背对移动方向（有趣的bug效果）
                            lookAtPosition = targetPosition - moveDirection
                        end
                        
                        local newCFrame
                        if _G.SmoothRotation then
                            -- 平滑旋转
                            local currentCFrame = rootPart.CFrame
                            local goalCFrame = CFrame.new(targetPosition, lookAtPosition)
                            local smoothness = _G.RotationSmoothness or 5
                            newCFrame = currentCFrame:Lerp(goalCFrame, 1 / smoothness)
                        else
                            -- 直接旋转
                            newCFrame = CFrame.new(targetPosition, lookAtPosition)
                        end
                        
                        -- 执行传送
                        rootPart.CFrame = newCFrame
                    end
                end
            end)
            
            WindUI:Notify({
                Title = "FXM",
                Content = "平移加速已启用!",
                Duration = 3,
                Icon = "rocket",
            })
        else
            -- 禁用平移加速
            if _G.TeleportConnection then
                _G.TeleportConnection:Disconnect()
                _G.TeleportConnection = nil
            end
            
            WindUI:Notify({
                Title = "FXM",
                Content = "平移加速已关闭!",
                Duration = 3,
                Icon = "circle-stop",
            })
        end
    end
})

local OppositeWalkToggle = TabHandles.JBTY1:Toggle({
    Title = "反面移动姿势",
    Default = false,
    Callback = function(Value)
        if Value then
            -- 如果开启反面姿势，先关闭常规姿势
            if NormalWalkToggle then
                NormalWalkToggle:Set(false)
            end
            _G.WalkDirectionMode = "相反模式"
            WindUI:Notify({
                Title = "FXM",
                Content = "已启用反面移动姿势",
                Duration = 3,
                Icon = "user-x"
            })
        else
            _G.WalkDirectionMode = nil
        end
    end
})

-- 平滑旋转选项
Toggle = TabHandles.JBTY1:Toggle({
    Title = "平滑旋转",
    Default = true,
    Callback = function(Value)
        _G.SmoothRotation = Value
    end
})

-- 旋转平滑度滑块
Slider = TabHandles.JBTY1:Slider({
    Title = "旋转平滑度",
    Value = {
        Min = 1,
        Max = 10,
        Default = 5,
    },
    Step = 1,
    Callback = function(Value)
        _G.RotationSmoothness = Value
    end
})

TabHandles.JBTY1:Divider()
-----------------点击区域------------------

Toggle = TabHandles.JBTY2:Toggle({
    Title = "穿墙", 
    Value = false, 
    Callback = function(Value)
        local Workspace = game:GetService("Workspace")
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")

        local Plr = Players.LocalPlayer
        
        -- 使用全局变量保持状态
        if not _G.NoclipData then
            _G.NoclipData = {
                enabled = false,
                steppedConnection = nil,
                characterAddedConnection = nil
            }
        end
        
        local data = _G.NoclipData
        
        -- 先断开已有连接
        if data.steppedConnection then
            data.steppedConnection:Disconnect()
            data.steppedConnection = nil
        end
        
        if data.characterAddedConnection then
            data.characterAddedConnection:Disconnect()
            data.characterAddedConnection = nil
        end
        
        -- 更新状态
        data.enabled = Value
        
        -- 穿墙功能函数
        local function setupNoclip(character)
            -- 如果穿墙已关闭，恢复碰撞并返回
            if not data.enabled then
                for _, part in pairs(character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
                return
            end
            
            -- 如果穿墙已开启，设置循环
            data.steppedConnection = RunService.Stepped:Connect(function()
                -- 检查是否仍然启用穿墙
                if not data.enabled or not character or not character.Parent then
                    if data.steppedConnection then
                        data.steppedConnection:Disconnect()
                        data.steppedConnection = nil
                    end
                    return
                end
                
                -- 设置所有部件无碰撞
                for _, part in pairs(character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end)
        end
        
        -- 处理当前角色
        if Plr.Character then
            setupNoclip(Plr.Character)
        end
        
        -- 监听角色重生
        if Value then
            data.characterAddedConnection = Plr.CharacterAdded:Connect(function(character)
                task.wait(0.1) -- 等待角色完全加载
                if data.enabled then
                    setupNoclip(character)
                end
            end)
        else
            -- 关闭时恢复当前角色的碰撞
            if Plr.Character then
                for _, part in pairs(Plr.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end

        -- 状态切换通知
        WindUI:Notify({
            Title = "FXM脚本",
            Content = Value and "穿墙已开启" or "穿墙已关闭",
            Duration = 3,
            Icon = "layout-grid",
        })
    end
})

Toggle = TabHandles.JBTY2:Toggle({
    Title = "无限跳", 
    Value = false, 
    Callback = function(Value)
        local Players = game:GetService("Players")
        local UserInputService = game:GetService("UserInputService")
        
        local Plr = Players.LocalPlayer
        
        -- 使用全局变量保持状态
        if not _G.InfiniteJumpData then
            _G.InfiniteJumpData = {
                enabled = false,
                connection = nil,
                characterAddedConnection = nil
            }
        end
        
        local data = _G.InfiniteJumpData
        
        -- 先更新状态为当前值
        data.enabled = Value
        
        -- 立即断开之前的连接
        if data.connection then
            data.connection:Disconnect()
            data.connection = nil
        end
        
        -- 如果关闭功能，也断开角色监听
        if not Value and data.characterAddedConnection then
            data.characterAddedConnection:Disconnect()
            data.characterAddedConnection = nil
        end
        
        -- 如果开启功能，设置无限跳
        if Value then
            -- 无限跳功能函数
            local function setupInfiniteJump(character)
                -- 等待Humanoid加载
                local humanoid = character:WaitForChild("Humanoid")
                
                -- 再次检查是否仍然启用（防止角色加载期间状态改变）
                if data.enabled then
                    -- 创建新的连接
                    data.connection = UserInputService.JumpRequest:Connect(function()
                        -- 再次检查状态和角色
                        if data.enabled and character and character:FindFirstChildOfClass("Humanoid") then
                            character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        end
                    end)
                end
            end
            
            -- 处理当前角色
            if Plr.Character then
                setupInfiniteJump(Plr.Character)
            end
            
            -- 监听角色重生（仅在启用时）
            data.characterAddedConnection = Plr.CharacterAdded:Connect(function(character)
                -- 添加延迟，确保角色完全加载
                task.wait(0.1)
                if data.enabled then
                    setupInfiniteJump(character)
                end
            end)
        end
        
        -- 状态切换通知
        WindUI:Notify({
            Title = "FXM脚本",
            Content = Value and "无限跳已开启" or "无限跳已关闭",
            Duration = 3,
            Icon = "layout-grid",
        })
    end
})

Toggle = TabHandles.JBTY2:Toggle({
    Title = "夜视", 
    Value = false, 
    Callback = function(Value)
        -- 原环境光控制逻辑（未做任何修改）
        if Value then
            game.Lighting.Ambient = Color3.new(1, 1, 1)
        else
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end

        -- 新增：状态切换提示通知
        WindUI:Notify({
            Title = "FXM脚本",
            Content = Value and "已开启" or "已关闭",
            Duration = 3,
            Icon = "layout-grid",
        })
    end
})

Toggle = TabHandles.JBTY2:Toggle({
    Title = "人物燃尽[假延迟]", 
    Value = false, 
    Callback = function(Value)
        -- 使用全局变量保持状态
        if not _G.FakeLagData then
            _G.FakeLagData = {
                enabled = false,
                thread = nil
            }
        end
        
        local data = _G.FakeLagData
        
        -- 如果之前有线程在运行，先停止它
        if data.thread then
            data.enabled = false
            -- 确保立即取消锚定，防止角色卡住
            local character = game:GetService("Players").LocalPlayer.Character
            if character then
                local hrp = character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.Anchored = false
                end
            end
            -- 等待一小段时间确保循环退出
            task.wait(0.1)
        end
        
        if Value then
            data.enabled = true
            -- 启动假延迟循环
            data.thread = task.spawn(function()
                local lp = game:GetService("Players").LocalPlayer
                while data.enabled do
                    local character = lp.Character
                    if character then
                        local hrp = character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.Anchored = true -- 锚定（卡住）
                            -- 等待一小段时间，但检查是否应该退出
                            local waitTime = 0.2
                            local elapsed = 0
                            while elapsed < waitTime and data.enabled do
                                task.wait(0.05)
                                elapsed = elapsed + 0.05
                            end
                            hrp.Anchored = false -- 取消锚定（恢复）
                        end
                    end
                    -- 检查是否应该继续
                    if data.enabled then
                        task.wait()
                    end
                end
            end)
        else
            data.enabled = false
        end

        -- 状态切换提示通知
        WindUI:Notify({
            Title = "FXM脚本",
            Content = Value and "假延迟已开启" or "假延迟已关闭",
            Duration = 3,
            Icon = "layout-grid",
        })
    end
})

Toggle = TabHandles.JBTY2:Toggle({
    Title = "布娃娃模式", 
    Value = false, 
    Callback = function(Value)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local player = Players.LocalPlayer

        -- 使用模块级变量保持状态
        if not _G.RagdollData then
            _G.RagdollData = {
                enabled = false,
                motorBackup = {},
                connections = {}
            }
        end
        
        local data = _G.RagdollData
        data.enabled = Value

        local function getCharacter()
            return player.Character or player.CharacterAdded:Wait()
        end

        local function toggleRagdoll()
            local character = getCharacter()
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if not humanoid or humanoid.Health <= 0 then return end

            local root = character:FindFirstChild("HumanoidRootPart")
            if not root then return end

            if data.enabled then
                -- 开启布娃娃模式
                humanoid.PlatformStand = true
                humanoid.AutoRotate = false
                
                -- 备份并替换所有Motor6D关节
                data.motorBackup = {}
                
                for _, joint in ipairs(character:GetDescendants()) do
                    if joint:IsA("Motor6D") then
                        -- 备份关节数据
                        data.motorBackup[joint] = {
                            Part0 = joint.Part0,
                            Part1 = joint.Part1,
                            C0 = joint.C0,
                            C1 = joint.C1,
                            Parent = joint.Parent,
                            Name = joint.Name
                        }
                        
                        -- 创建物理约束替代关节
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
                        socket.Restitution = 0.1

                        -- 禁用原关节但不删除
                        joint.Enabled = false
                    end
                end

                -- 给一个向上的力
                root.Velocity = Vector3.new(0, 15, 0)
                
                -- 修复视角问题：确保摄像机跟随头部
                local head = character:FindFirstChild("Head")
                if head then
                    local cam = workspace.CurrentCamera
                    cam.CameraSubject = head
                end

            else
                -- 关闭布娃娃模式
                humanoid.PlatformStand = false
                humanoid.AutoRotate = true
                
                -- 恢复所有关节
                for joint, jointData in pairs(data.motorBackup) do
                    if joint and joint.Parent then
                        joint.Enabled = true
                        joint.Part0 = jointData.Part0
                        joint.Part1 = jointData.Part1
                        joint.C0 = jointData.C0
                        joint.C1 = jointData.C1
                    end
                end
                
                data.motorBackup = {}

                -- 清理创建的约束和附件
                for _, item in ipairs(character:GetDescendants()) do
                    if item:IsA("BallSocketConstraint") or 
                       (item:IsA("Attachment") and item.Name == "Attachment") then
                        item:Destroy()
                    end
                end
                
                -- 重置摄像机到Humanoid
                local cam = workspace.CurrentCamera
                cam.CameraSubject = humanoid
                
                -- 强制重置角色状态
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                
                -- 添加一个小延迟后再次尝试站立
                delay(0.5, function()
                    if humanoid and humanoid.Parent then
                        humanoid:ChangeState(Enum.HumanoidStateType.Running)
                    end
                end)
            end
        end

-- 处理角色重生
        if data.connections.characterAdded then
            data.connections.characterAdded:Disconnect()
        end
        
        data.connections.characterAdded = player.CharacterAdded:Connect(function(char)
            -- 等待角色完全加载
            char:WaitForChild("Humanoid")
            char:WaitForChild("HumanoidRootPart")
            
            -- 重置状态
            data.enabled = false
            data.motorBackup = {}
            
            -- 确保摄像机正确
            local cam = workspace.CurrentCamera
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                cam.CameraSubject = humanoid
            end
        end)

        -- 应用布娃娃状态
        toggleRagdoll()

        -- 状态切换提示通知
        WindUI:Notify({
            Title = "FXM脚本",
            Content = Value and "布娃娃模式已开启" or "布娃娃模式已关闭",
            Duration = 3,
            Icon = "layout-grid",
        })
    end
})
            


Toggle = TabHandles.JBTY2:Toggle({
    Title = "自动交互", 
    Value = false, 
    Callback = function(state)
        -- 将变量移到函数外部，使其在多次调用间保持状态
        if not _G.AutoInteractData then
            _G.AutoInteractData = {
                enabled = false,
                thread = nil
            }
        end
        
        local data = _G.AutoInteractData
        
        -- 如果之前有线程在运行，先停止它
        if data.thread then
            data.enabled = false
            task.cancel(data.thread)
            data.thread = nil
        end
        
        if state then
            data.enabled = true
            -- 启动自动交互循环
            data.thread = task.spawn(function()
                while data.enabled do
                    -- 遍历工作区所有子对象，触发所有ProximityPrompt
                    for _, descendant in pairs(workspace:GetDescendants()) do
                        if descendant:IsA("ProximityPrompt") then
                            fireproximityprompt(descendant)
                        end
                    end
                    task.wait(0.25) -- 交互间隔
                end
            end)
        else
            data.enabled = false
        end

        -- 状态切换提示通知
        WindUI:Notify({
            Title = "FXM脚本",
            Content = state and "自动交互已开启" or "自动交互已关闭",
            Duration = 3,
            Icon = "layout-grid",
        })
    end
})

Button = TabHandles.JBTY2:Button({
    Title = "汉化黑洞",
    Desc = "让掉落零件围绕人物旋转",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CNFXM/FXM/main/FXMheidong.lua'))()
        
WindUI:Notify({
    Title = "FXM脚本",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

Button = TabHandles.JBTY2:Button({
    Title = "汉化飞行V3",
    Desc = "人物飞行",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CNFXM/FXM/main/FXMFLYV3.lua'))()
        
WindUI:Notify({
    Title = "FXM脚本",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

Button = TabHandles.JBTY2:Button({
    Title = "汉化传送",
    Desc = "人物传送",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CNFXM/FXM/main/FXMdeliver.lua'))()
        
WindUI:Notify({
    Title = "FXM脚本",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

Button = TabHandles.JBTY2:Button({
    Title = "子追穿墙",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fcsdsss/games/refs/heads/main/Silent%20aim/1.1"))()
        
    WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})
    end
})

local Button = TabHandles.JBTY2:Button({
    Title = "隐身自己",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Yungengxin/roblox/main/yinshen"))()
            
    WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})
    end
})

Button = TabHandles.JBTY2:Button({
    Title = "防甩飞",
    Desc = "",
    Locked = false,
    Callback = function()
        local Services = setmetatable({}, {__index = function(Self, Index)
local NewService = game.GetService(game, Index)
if NewService then
Self[Index] = NewService
end
return NewService
end})

local LocalPlayer = Services.Players.LocalPlayer

local function PlayerAdded(Player)
   local Detected = false
   local Character;
   local PrimaryPart;

   local function CharacterAdded(NewCharacter)
       Character = NewCharacter
       repeat
           wait()
           PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart")
       until PrimaryPart
       Detected = false
   end

   CharacterAdded(Player.Character or Player.CharacterAdded:Wait())
   Player.CharacterAdded:Connect(CharacterAdded)
   Services.RunService.Heartbeat:Connect(function()
       if (Character and Character:IsDescendantOf(workspace)) and (PrimaryPart and PrimaryPart:IsDescendantOf(Character)) then
           if PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 or PrimaryPart.AssemblyLinearVelocity.Magnitude > 100 then
               if Detected == false then
                   game.StarterGui:SetCore("ChatMakeSystemMessage", {
                       Text = "Fling Exploit Detected Player : "..tostring(Player);
                       Color = Color3.fromRGB(255, 200, 0);
                   })
               end
               Detected = true
               for i,v in ipairs(Character:GetDescendants()) do
                   if v:IsA("BasePart") then
                       v.CanCollide = false
                       v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                       v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                       v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                   end
               end
               PrimaryPart.CanCollide = false
               PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
           end
       end
   end)
end

for i,v in ipairs(Services.Players:GetPlayers()) do
   if v ~= LocalPlayer then
       PlayerAdded(v)
   end
end
Services.Players.PlayerAdded:Connect(PlayerAdded)            

WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})
    end
})

Button = TabHandles.JBTY2:Button({
    Title = "撸关R15",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
        
    WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})
        
    end
})

Button = TabHandles.JBTY2:Button({
    Title = "撸关R6",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()

    WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})
        
    end
})

Button = TabHandles.JBTY2:Button({
    Title = "甩飞",
    Desc = "",
    Locked = false,
    Callback = function()
        local ultimateFling = Instance.new("ScreenGui")
local drag = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local windowNameFrame = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local windowNameLabel = Instance.new("TextLabel")
local closeButton = Instance.new("TextButton")
local mainFrame = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local buttonsFrame = Instance.new("Frame")
local toggleButton = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local rotSpeedLabel = Instance.new("TextLabel")
local UICorner_5 = Instance.new("UICorner")
local rotSpeedTextbox = Instance.new("TextBox")
local flySpeedLabel = Instance.new("TextLabel")
local UICorner_6 = Instance.new("UICorner")
local flySpeedTextbox = Instance.new("TextBox")
local UICorner_7 = Instance.new("UICorner")
local notificationsFrame = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local notificationTemplate = Instance.new("TextLabel")
local teleportersFrame = Instance.new("Frame")
local teleportingLabel = Instance.new("TextLabel")
local UICorner_8 = Instance.new("UICorner")
local tpingTextbox = Instance.new("TextBox")

ultimateFling.Name = "ultimateFling"
ultimateFling.Parent = game:GetService("CoreGui")
ultimateFling.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ultimateFling.ResetOnSpawn = false

drag.Name = "drag"
drag.Parent = ultimateFling
drag.Active = true
drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
drag.BackgroundTransparency = 1.000
drag.Draggable = true
drag.Position = UDim2.new(0.5, -150, 0.5, -67)
drag.Selectable = true
drag.Size = UDim2.new(0, 300, 0, 135)

UICorner.Parent = drag

windowNameFrame.Name = "windowNameFrame"
windowNameFrame.Parent = drag
windowNameFrame.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
windowNameFrame.Size = UDim2.new(1, 0, 0, 30)

UICorner_2.Parent = windowNameFrame

windowNameLabel.Name = "windowNameLabel"
windowNameLabel.Parent = windowNameFrame
windowNameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
windowNameLabel.BackgroundTransparency = 1.000
windowNameLabel.BorderSizePixel = 0
windowNameLabel.Size = UDim2.new(1, 0, 0, 20)
windowNameLabel.Font = Enum.Font.SourceSans
windowNameLabel.Text = "越 HB甩人脚本"
windowNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
windowNameLabel.TextSize = 20.000

closeButton.Name = "closeButton"
closeButton.Parent = windowNameLabel
closeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundTransparency = 1.000
closeButton.BorderSizePixel = 0
closeButton.Position = UDim2.new(1, -20, 0, 0)
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Font = Enum.Font.SourceSans
closeButton.Text = "×"
closeButton.TextColor3 = Color3.fromRGB(255, 0, 0)
closeButton.TextSize = 20.000

mainFrame.Name = "mainFrame"
mainFrame.Parent = drag
mainFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
mainFrame.Position = UDim2.new(0, 0, 0, 20)
mainFrame.Size = UDim2.new(1, 0, 1, -20)

UICorner_3.Parent = mainFrame

buttonsFrame.Name = "buttonsFrame"
buttonsFrame.Parent = mainFrame
buttonsFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
buttonsFrame.BackgroundTransparency = 0.500
buttonsFrame.Size = UDim2.new(0, 110, 1, 0)

toggleButton.Name = "toggleButton"
toggleButton.Parent = buttonsFrame
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.BackgroundTransparency = 0.800
toggleButton.BorderSizePixel = 0
toggleButton.Position = UDim2.new(0, 5, 0, 5)
toggleButton.Size = UDim2.new(0, 100, 0, 25)
toggleButton.Font = Enum.Font.SourceSans
toggleButton.Text = "开始甩人"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 20.000

UICorner_4.Parent = toggleButton

rotSpeedLabel.Name = "rotSpeedLabel"
rotSpeedLabel.Parent = buttonsFrame
rotSpeedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
rotSpeedLabel.BackgroundTransparency = 0.800
rotSpeedLabel.Position = UDim2.new(0, 5, 0, 35)
rotSpeedLabel.Size = UDim2.new(0, 100, 0, 35)
rotSpeedLabel.Font = Enum.Font.SourceSans
rotSpeedLabel.Text = "旋转速度"
rotSpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
rotSpeedLabel.TextSize = 14.000
rotSpeedLabel.TextYAlignment = Enum.TextYAlignment.Top

UICorner_5.Parent = rotSpeedLabel

rotSpeedTextbox.Name = "rotSpeedTextbox"
rotSpeedTextbox.Parent = rotSpeedLabel
rotSpeedTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
rotSpeedTextbox.BackgroundTransparency = 1.000
rotSpeedTextbox.Position = UDim2.new(0, 0, 0, 13)
rotSpeedTextbox.Size = UDim2.new(1, 0, 1, -13)
rotSpeedTextbox.ClearTextOnFocus = false
rotSpeedTextbox.Font = Enum.Font.SourceSans
rotSpeedTextbox.Text = "10000"
rotSpeedTextbox.TextColor3 = Color3.fromRGB(0, 255, 0)
rotSpeedTextbox.TextSize = 16.000

flySpeedLabel.Name = "flySpeedLabel"
flySpeedLabel.Parent = buttonsFrame
flySpeedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
flySpeedLabel.BackgroundTransparency = 0.800
flySpeedLabel.Position = UDim2.new(0, 5, 0, 75)
flySpeedLabel.Size = UDim2.new(0, 100, 0, 35)
flySpeedLabel.Font = Enum.Font.SourceSans
flySpeedLabel.Text = "飞行速度"
flySpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
flySpeedLabel.TextSize = 14.000
flySpeedLabel.TextYAlignment = Enum.TextYAlignment.Top

UICorner_6.Parent = flySpeedLabel

flySpeedTextbox.Name = "flySpeedTextbox"
flySpeedTextbox.Parent = flySpeedLabel
flySpeedTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
flySpeedTextbox.BackgroundTransparency = 1.000
flySpeedTextbox.Position = UDim2.new(0, 0, 0, 13)
flySpeedTextbox.Size = UDim2.new(1, 0, 1, -13)
flySpeedTextbox.ClearTextOnFocus = false
flySpeedTextbox.Font = Enum.Font.SourceSans
flySpeedTextbox.Text = "1"
flySpeedTextbox.TextColor3 = Color3.fromRGB(0, 255, 0)
flySpeedTextbox.TextSize = 16.000

UICorner_7.Parent = buttonsFrame

notificationsFrame.Name = "notificationsFrame"
notificationsFrame.Parent = mainFrame
notificationsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
notificationsFrame.BackgroundTransparency = 1.000
notificationsFrame.ClipsDescendants = true
notificationsFrame.Position = UDim2.new(0, 110, 0, 45)
notificationsFrame.Size = UDim2.new(1, -110, 1, -45)
UIListLayout.Parent = notificationsFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom

notificationTemplate.Name = "notificationTemplate"
notificationTemplate.Parent = notificationsFrame
notificationTemplate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
notificationTemplate.BackgroundTransparency = 1.000
notificationTemplate.ClipsDescendants = true
notificationTemplate.Size = UDim2.new(1, 0, 0, 20)
notificationTemplate.Visible = false
notificationTemplate.Font = Enum.Font.SourceSans
notificationTemplate.Text = ""
notificationTemplate.TextColor3 = Color3.fromRGB(255, 255, 255)
notificationTemplate.TextSize = 19.000
notificationTemplate.TextWrapped = true

teleportersFrame.Name = "teleportersFrame"
teleportersFrame.Parent = mainFrame
teleportersFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
teleportersFrame.BackgroundTransparency = 1.000
teleportersFrame.ClipsDescendants = true
teleportersFrame.Position = UDim2.new(0, 110, 0, 0)
teleportersFrame.Size = UDim2.new(1, -110, 0, 45)

teleportingLabel.Name = "teleportingLabel"
teleportingLabel.Parent = teleportersFrame
teleportingLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
teleportingLabel.BackgroundTransparency = 0.800
teleportingLabel.Position = UDim2.new(0, 5, 0, 5)
teleportingLabel.Size = UDim2.new(1, -10, 1, -10)
teleportingLabel.Font = Enum.Font.SourceSans
teleportingLabel.Text = "传送甩人延迟(0=禁用)"
teleportingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportingLabel.TextSize = 14.000
teleportingLabel.TextYAlignment = Enum.TextYAlignment.Top

UICorner_8.Parent = teleportingLabel

tpingTextbox.Name = "tpingTextbox"
tpingTextbox.Parent = teleportingLabel
tpingTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
tpingTextbox.BackgroundTransparency = 1.000
tpingTextbox.Position = UDim2.new(0, 0, 0, 13)
tpingTextbox.Size = UDim2.new(1, 0, 1, -13)
tpingTextbox.ClearTextOnFocus = false
tpingTextbox.Font = Enum.Font.SourceSans
tpingTextbox.Text = "0"
tpingTextbox.TextColor3 = Color3.fromRGB(0, 255, 0)
tpingTextbox.TextSize = 16.000

local function align(Part0, Part1)
	Part0.CustomPhysicalProperties = PhysicalProperties.new(0.001, 0.001, 0.001, 0.001, 0.001)
	local att1 = Instance.new("Attachment")
	att1.Orientation = Vector3.new(0, 0, 0)
	att1.Position = Vector3.new(0, 0, 0)
	att1.Archivable = true
	local att0 = att1:Clone()

	local ap = Instance.new("AlignPosition", att0)
	ap.ApplyAtCenterOfMass = true
	ap.MaxForce = 9e9
	ap.MaxVelocity = 9e9
	ap.ReactionForceEnabled = false
	ap.Responsiveness = 200
	ap.RigidityEnabled = false

	ap.Attachment1 = att1
	ap.Attachment0 = att0

	att1.Parent = Part1
	att0.Parent = Part0
end

local rs = game:GetService("RunService")

local function notify(msg)
	spawn(function()
		local label = notificationTemplate:Clone()
		label.Text = msg
		label.Parent = notificationsFrame
		label.Size = UDim2.new(1, 0, 0, 0)
		label.Visible = true
		local siz = 0
		while rs.Stepped:Wait() and label and label.Parent and (siz < 20) do
			siz += 1
			label.Size = UDim2.new(1, 0, 0, siz)
		end
		if label and label.Parent then
			wait(15)
			while rs.Stepped:Wait() and label and label.Parent and (label.TextTransparency < 1) do
				label.TextTransparency += 0.1
			end
			if label and label.Parent then
				label:Destroy()
			end
		end
	end)
end

local plrs = game:GetService("Players")
local lp = plrs.LocalPlayer
local mouse = lp:GetMouse()
local ws = game:GetService("Workspace")
local c = nil

local function resReq()
	local nm = Instance.new("Model")
	local nh = Instance.new("Humanoid", nm)
	nh.Health = 100
	lp.Character = nm
	nh.Health = 0
	nh:Destroy()
	nm:Destroy()
end

local parts = {}

ws.DescendantRemoving:Connect(function(des)
	if table.find(parts, des) then
		local desn = des.Name
		wait()
		if c and c.Parent then
			notify("丢失的部位: " .. desn)
		end
	end
end)

toggleButton.MouseButton1Click:Connect(function()
	if c and c.Parent then
		resReq()
		lp.Character = c
		notify("正在重生")
	else
		notify("加载中")
		c = lp.Character
		if not (c and c.Parent) then
			notify("错误：找不到角色")
			return nil
		end
		local hum = c:FindFirstChildOfClass("Humanoid")
		if not (hum and hum.Parent) then
			notify("错误：找不到人物")
			return nil
		end
		if hum.Health == 0 then
			notify("错误：人物血量为0")
			return nil
		end
		resReq()
		lp.Character = c
		wait(5.1)
		if not (c and c.Parent) then
			notify("错误：角色已重置")
			return nil
		end
		if not (hum and hum.Parent) then
			notify("错误：人物已重置")
			return nil
		end
		if hum.Health == 0 then
			notify("错误：人物已死亡")
			return nil
		end
		c:BreakJoints()
		hum.Health = 0
		wait()
		if not (c and c.Parent) then
			notify("错误：角色已重置")
			return nil
		end
		parts = {}
		for i, v in pairs(c:GetDescendants()) do
			if v and v.Parent and v:IsA("BasePart") then
				if v.CanCollide then
					table.insert(parts, v)
				else
					v.Velocity = Vector3.new(0, -1000, 0)
				end
			end
		end
		local hrp = Instance.new("Part", c)
		hrp.Name = "hrp"
		hrp.Anchored = true
		hrp.Transparency = 1
		pcall(function()
			hrp.CFrame = parts[1].CFrame
		end)
		ws.CurrentCamera.CameraSubject = hrp
		for i, v in pairs(parts) do
			if v and v.Parent then
				align(v, hrp)
			end
		end
		spawn(function()
			local currentp = nil
			spawn(function()
				while rs.Stepped:Wait() and c and c.Parent and hrp and hrp.Parent do
					if currentp and currentp.Parent then
						local c1 = currentp.Character
						if c1 and c1.Parent then
							local hed1 = c1:FindFirstChild("Head") or c1:FindFirstChild("Torso") or c1:FindFirstChild("HumanoidRootPart") or c1:FindFirstChildWhichIsA("BasePart")
							if hed1 then
								hrp.CFrame = hed1.CFrame
							end
						end
					end
				end
			end)
			while rs.Heartbeat:Wait() and c and c.Parent and hrp and hrp.Parent do
				local delay = tonumber(tpingTextbox.Text)
				if (not delay) or (delay < 0) then
					delay = 0
				end
				if delay == 0 then
					currentp = false
				else
					wait(delay)
					delay = tonumber(tpingTextbox.Text)
					if (not delay) or (delay < 0) then
						delay = 0
					end
					if c and c.Parent and hrp and hrp.Parent and (delay ~= 0) then
						local getp = plrs:GetPlayers()
						local i1 = false
						for i, v in pairs(getp) do
							if (v == currentp) and (v ~= lp) then
								i1 = i
							end
						end
						if (not i1) then
							i1 = 1
						end
						local function nextp()
							if i1 == #getp then
								i1 = 1
							else
								i1 += 1
							end
							currentp = getp[i1]
						end
						local c1 = nil
						while wait() and not (c1 and c1.Parent) do
							nextp()
							if currentp == lp then
								nextp()
							end
							c1 = currentp.Character
						end
					end
				end
			end
		end)

		spawn(function()
			while c and c.Parent and rs.Heartbeat:Wait() do
				for i, v in pairs(parts) do
					if v and v.Parent then
						v.Velocity = Vector3.new(0, -25.05, 0)
						local s = tonumber(rotSpeedTextbox.Text)
						v.RotVelocity = Vector3.new(s, s, s)
					end
				end
			end
		end)

		spawn(function()
			while rs.Stepped:Wait() and c and c.Parent do
				for i, v in pairs(parts) do
					if v and v.Parent then
						v.CanCollide = false
					end
				end
			end
		end)

		spawn(function()
			local ctrlf = {
				["w"] = false,
				["a"] = false,
				["s"] = false,
				["d"] = false
			}
			mouse.KeyDown:Connect(function(key)
				key = key:lower()
				if ctrlf[key] ~= nil then
					ctrlf[key] = true
				end
			end)
			mouse.KeyUp:Connect(function(key)
				key = key:lower()
				if ctrlf[key] ~= nil then
					ctrlf[key] = false
				end
			end)
			while rs.RenderStepped:Wait() and c and c.Parent do
				if hrp and hrp.Parent then
					local flyspeed = tonumber(flySpeedTextbox.Text)
					local fb = ((ctrlf["w"] and flyspeed) or 0) + ((ctrlf["s"] and -flyspeed) or 0)
					local lr = ((ctrlf["a"] and -flyspeed) or 0) + ((ctrlf["d"] and flyspeed) or 0)
					local camcf = ws.CurrentCamera.CFrame
					local caX, caY, caZ, ca1, ca2, ca3, ca4, ca5, ca6, ca7, ca8, ca9 = camcf:GetComponents()
					local flycf = hrp.CFrame
					flycf = CFrame.new(flycf.X, flycf.Y, flycf.Z, ca1, ca2, ca3, ca4, ca5, ca6, ca7, ca8, ca9)
					flycf += camcf.lookVector * fb
					flycf += camcf.rightVector * lr
					hrp.CFrame = flycf
				end
			end
			
			local c1 = lp.Character
			if c1 and c1.Parent then
				notify("完成")
			end
			
			if toggleButton and toggleButton.Parent then
				toggleButton.Text = "开始甩人"
			end
		end)
		
		if toggleButton and toggleButton.Parent then
			toggleButton.Text = "结束甩人"
		end
		
		notify("完成")
	end
end)

closeButton.MouseButton1Click:Connect(function()
	if c and c.Parent then
		resReq()
	end
	ultimateFling:Destroy()
end)

WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})

    end
})

Button = TabHandles.JBTY2:Button({
    Title = "踏空行走",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
        
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

Button = TabHandles.JBTY2:Button({
    Title = "飞车",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/G3GnBCyC", true))()
        
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

Button = TabHandles.JBTY2:Button({
    Title = "爬墙",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
        
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

Button = TabHandles.JBTY2:Button({
    Title = "动作",
    Desc = "",
    Locked = false,
    Callback = function()
       loadstring(game:HttpGet("https://pastebin.com/raw/Zj4NnKs6"))()

WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})       
       
    end
})
---------------------------------------------------------------------------------------------透视ESP
getgenv().ESPEnabled = false
getgenv().ShowBox = false
getgenv().ShowHealth = false
getgenv().ShowName = false
getgenv().ShowDistance = false
getgenv().ShowTracer = false
getgenv().TeamCheck = false
getgenv().ShowSkeleton = false
getgenv().ShowRadar = false
getgenv().ShowPlayerCount = false
getgenv().ShowWeapon = false
getgenv().ShowFOV = false
getgenv().OutOfViewArrows = false
getgenv().Chams = false

getgenv().TracerColor = Color3.new(1, 0, 0)
getgenv().SkeletonColor = Color3.new(0.2, 0.8, 1)
getgenv().BoxColor = Color3.new(1, 1, 1)
getgenv().HealthBarColor = Color3.new(0, 1, 0)
getgenv().HealthTextColor = Color3.new(1, 1, 1)
getgenv().NameColor = Color3.new(1, 1, 1)
getgenv().DistanceColor = Color3.new(1, 1, 0)
getgenv().WeaponColor = Color3.new(1, 0.5, 0)
getgenv().ArrowColor = Color3.new(1, 0, 0)
getgenv().FOVColor = Color3.new(1, 1, 1)
getgenv().ChamsColor = Color3.new(1, 0, 0)

getgenv().BoxThickness = 1
getgenv().TracerThickness = 1
getgenv().SkeletonThickness = 2
getgenv().FOVRadius = 100
getgenv().ArrowSize = 15

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local function getGradientColor(time)
    local r = math.sin(time * 2) * 0.5 + 0.5
    local g = math.sin(time * 3) * 0.5 + 0.5
    local b = math.sin(time * 4) * 0.5 + 0.5
    return Color3.new(r, g, b)
end

local playerCountText = Drawing.new("Text")
playerCountText.Visible = false
playerCountText.Color = Color3.new(1, 1, 1)
playerCountText.Size = 20
playerCountText.Font = Drawing.Fonts.Monospace
playerCountText.Outline = true
playerCountText.OutlineColor = Color3.new(0, 0, 0)
playerCountText.Position = Vector2.new(Camera.ViewportSize.X / 2, 10)

local fovCircle = Drawing.new("Circle")
fovCircle.Visible = false
fovCircle.Color = getgenv().FOVColor
fovCircle.Thickness = 1
fovCircle.Filled = false
fovCircle.Radius = getgenv().FOVRadius
fovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

local function updatePlayerCount()
    local playerCount = #Players:GetPlayers()
    playerCountText.Text = "在线玩家: " .. playerCount
    playerCountText.Visible = getgenv().ESPEnabled and getgenv().ShowPlayerCount

    local time = tick()
    playerCountText.Color = getGradientColor(time)
end

local function updateFOV()
    fovCircle.Visible = getgenv().ShowFOV
    fovCircle.Color = getgenv().FOVColor
    fovCircle.Radius = getgenv().FOVRadius
    fovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
end

local ESPComponents = {}

local function createESP(player)
    local box = Drawing.new("Square")
    box.Visible = false
    box.Color = getgenv().BoxColor
    box.Thickness = getgenv().BoxThickness
    box.Filled = false

    local healthBar = Drawing.new("Square")
    healthBar.Visible = false
    healthBar.Color = getgenv().HealthBarColor
    healthBar.Thickness = 1
    healthBar.Filled = true

    local healthBarBackground = Drawing.new("Square")
    healthBarBackground.Visible = false
    healthBarBackground.Color = Color3.new(0, 0, 0)
    healthBarBackground.Transparency = 0.5
    healthBarBackground.Thickness = 1
    healthBarBackground.Filled = true

    local healthBarBorder = Drawing.new("Square")
    healthBarBorder.Visible = false
    healthBarBorder.Color = Color3.new(1, 1, 1)
    healthBarBorder.Thickness = 1
    healthBarBorder.Filled = false

    local healthText = Drawing.new("Text")
    healthText.Visible = false
    healthText.Color = getgenv().HealthTextColor
    healthText.Size = 14
    healthText.Font = Drawing.Fonts.Monospace
    healthText.Outline = true
    healthText.OutlineColor = Color3.new(0, 0, 0)

    local nameText = Drawing.new("Text")
    nameText.Visible = false
    nameText.Color = getgenv().NameColor
    nameText.Size = 16
    nameText.Font = Drawing.Fonts.Monospace
    nameText.Outline = true
    nameText.OutlineColor = Color3.new(0, 0, 0)

    local distanceText = Drawing.new("Text")
    distanceText.Visible = false
    distanceText.Color = getgenv().DistanceColor
    distanceText.Size = 14
    distanceText.Font = Drawing.Fonts.Monospace
    distanceText.Outline = true
    distanceText.OutlineColor = Color3.new(0, 0, 0)

    local weaponText = Drawing.new("Text")
    weaponText.Visible = false
    weaponText.Color = getgenv().WeaponColor
    weaponText.Size = 14
    weaponText.Font = Drawing.Fonts.Monospace
    weaponText.Outline = true
    weaponText.OutlineColor = Color3.new(0, 0, 0)

    local tracer = Drawing.new("Line")
    tracer.Visible = false
    tracer.Color = getgenv().TracerColor
    tracer.Thickness = getgenv().TracerThickness

    local arrow = Drawing.new("Triangle")
    arrow.Visible = false
    arrow.Color = getgenv().ArrowColor
    arrow.Filled = true
    arrow.Thickness = 1

    local skeletonLines = {}
    local skeletonPoints = {}

    local function createSkeleton()
        for i = 1, 15 do
            skeletonLines[i] = Drawing.new("Line")
            skeletonLines[i].Visible = false
            skeletonLines[i].Color = getgenv().SkeletonColor
            skeletonLines[i].Thickness = getgenv().SkeletonThickness
        end

        skeletonPoints["Head"] = Drawing.new("Circle")
        skeletonPoints["Head"].Visible = false
        skeletonPoints["Head"].Color = Color3.new(1, 0.5, 0)
        skeletonPoints["Head"].Thickness = 2
        skeletonPoints["Head"].Filled = true
        skeletonPoints["Head"].Radius = 4
    end

    createSkeleton()

    local lastHealth = 100
    local healthChangeTime = 0
    local smoothHealth = 100

    ESPComponents[player] = {
        box = box,
        healthBar = healthBar,
        healthBarBackground = healthBarBackground,
        healthBarBorder = healthBarBorder,
        healthText = healthText,
        nameText = nameText,
        distanceText = distanceText,
        weaponText = weaponText,
        tracer = tracer,
        arrow = arrow,
        skeletonLines = skeletonLines,
        skeletonPoints = skeletonPoints
    }

    RunService.RenderStepped:Connect(function()
        if not getgenv().ESPEnabled or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") or not player.Character:FindFirstChild("Humanoid") or player == LocalPlayer then
            box.Visible = false
            healthBar.Visible = false
            healthBarBackground.Visible = false
            healthBarBorder.Visible = false
            healthText.Visible = false
            nameText.Visible = false
            distanceText.Visible = false
            weaponText.Visible = false
            tracer.Visible = false
            arrow.Visible = false
            for _, line in pairs(skeletonLines) do
                line.Visible = false
            end
            for _, point in pairs(skeletonPoints) do
                point.Visible = false
            end
            return
        end

        if getgenv().TeamCheck and player.Team == LocalPlayer.Team then
            box.Visible = false
            healthBar.Visible = false
            healthBarBackground.Visible = false
            healthBarBorder.Visible = false
            healthText.Visible = false
            nameText.Visible = false
            distanceText.Visible = false
            weaponText.Visible = false
            tracer.Visible = false
            arrow.Visible = false
            for _, line in pairs(skeletonLines) do
                line.Visible = false
            end
            for _, point in pairs(skeletonPoints) do
                point.Visible = false
            end
            return
        end

        local character = player.Character
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChild("Humanoid")

        if rootPart and humanoid and humanoid.Health > 0 then
            local rootPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
            local headPos, _ = Camera:WorldToViewportPoint(rootPart.Position + Vector3.new(0, 3, 0))
            local legPos, _ = Camera:WorldToViewportPoint(rootPart.Position - Vector3.new(0, 3, 0))

            local weaponName = "无武器"
            for _, tool in ipairs(character:GetChildren()) do
                if tool:IsA("Tool") then
                    weaponName = tool.Name
                    break
                end
            end

            if getgenv().ShowBox and onScreen then
                box.Size = Vector2.new(1000 / rootPos.Z, headPos.Y - legPos.Y)
                box.Position = Vector2.new(rootPos.X - box.Size.X / 2, rootPos.Y - box.Size.Y / 2)
                box.Visible = true
                box.Color = getgenv().BoxColor
                box.Thickness = getgenv().BoxThickness
            else
                box.Visible = false
            end

            if getgenv().ShowHealth and onScreen then
                local healthPercentage = humanoid.Health / humanoid.MaxHealth
                local barWidth = 50
                local barHeight = 5
                local barX = headPos.X - barWidth / 2
                local barY = headPos.Y - 20

                healthBarBackground.Size = Vector2.new(barWidth, barHeight)
                healthBarBackground.Position = Vector2.new(barX, barY)
                healthBarBackground.Visible = true

                healthBarBorder.Size = Vector2.new(barWidth, barHeight)
                healthBarBorder.Position = Vector2.new(barX, barY)
                healthBarBorder.Visible = true

                smoothHealth = smoothHealth + (humanoid.Health - smoothHealth) * 0.1
                local smoothHealthPercentage = smoothHealth / humanoid.MaxHealth

                healthBar.Size = Vector2.new(barWidth * smoothHealthPercentage, barHeight)
                healthBar.Position = Vector2.new(barX, barY)

                if smoothHealthPercentage >= 0.8 then
                    healthBar.Color = Color3.new(0, 1, 0)
                elseif smoothHealthPercentage >= 0.5 then
                    healthBar.Color = Color3.new(1, 1, 0)
                elseif smoothHealthPercentage >= 0.2 then
                    healthBar.Color = Color3.new(1, 0.5, 0)
                else
                    healthBar.Color = Color3.new(1, 0, 0)
                end

                healthBar.Visible = true

                if humanoid.Health ~= lastHealth then
                    healthChangeTime = tick()
                    lastHealth = humanoid.Health
                end

                if tick() - healthChangeTime < 0.5 then
                    healthBar.Color = Color3.new(1, 0, 0)
                end

                healthText.Position = Vector2.new(barX + barWidth + 5, barY - 5)
                healthText.Text = math.floor(humanoid.Health) .. "/" .. math.floor(humanoid.MaxHealth)
                healthText.Visible = true
            else
                healthBar.Visible = false
                healthBarBackground.Visible = false
                healthBarBorder.Visible = false
                healthText.Visible = false
            end

            if getgenv().ShowName and onScreen then
                nameText.Position = Vector2.new(headPos.X, headPos.Y - 35)
                nameText.Text = player.Name
                nameText.Visible = true

                if getgenv().ShowDistance then
                    local distance = (LocalPlayer.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
                    distanceText.Position = Vector2.new(headPos.X, headPos.Y + 10)
                    distanceText.Text = math.floor(distance) .. "m"
                    distanceText.Visible = true
                else
                    distanceText.Visible = false
                end
                
                if getgenv().ShowWeapon then
                    weaponText.Position = Vector2.new(headPos.X, headPos.Y - 50)
                    weaponText.Text = weaponName
                    weaponText.Visible = true
                else
                    weaponText.Visible = false
                end
            else
                nameText.Visible = false
                distanceText.Visible = false
                weaponText.Visible = false
            end

            if getgenv().ShowTracer then
                local head = character:FindFirstChild("Head")
                if head then
                    local headPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                    if onScreen then
                        tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                        tracer.To = Vector2.new(headPos.X, headPos.Y)
                        tracer.Visible = true
                        tracer.Color = getgenv().TracerColor
                        tracer.Thickness = getgenv().TracerThickness
                        
                        local distance = (LocalPlayer.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
                        if distance < 20 then
                            tracer.Color = Color3.new(0, 1, 0)
                        elseif distance < 50 then
                            tracer.Color = Color3.new(1, 1, 0) 
                        else
                            tracer.Color = getgenv().TracerColor 
                        end
                    else
                        tracer.Visible = false
                    end
                else
                    tracer.Visible = false
                end
            else
                tracer.Visible = false
            end

            if getgenv().OutOfViewArrows and not onScreen then
                local direction = (rootPart.Position - Camera.CFrame.Position).Unit
                local dotProduct = Camera.CFrame.RightVector:Dot(direction)
                local crossProduct = Camera.CFrame.RightVector:Cross(direction)
                
                local screenPosition = Vector2.new(
                    Camera.ViewportSize.X / 2 + dotProduct * Camera.ViewportSize.X / 3,
                    Camera.ViewportSize.Y / 2 - crossProduct.Y * Camera.ViewportSize.Y / 3
                )
                
                screenPosition = Vector2.new(
                    math.clamp(screenPosition.X, getgenv().ArrowSize, Camera.ViewportSize.X - getgenv().ArrowSize),
                    math.clamp(screenPosition.Y, getgenv().ArrowSize, Camera.ViewportSize.Y - getgenv().ArrowSize)
                )
                
                local angle = math.atan2(screenPosition.Y - Camera.ViewportSize.Y / 2, screenPosition.X - Camera.ViewportSize.X / 2)
                
                arrow.PointA = screenPosition
                arrow.PointB = Vector2.new(
                    screenPosition.X - getgenv().ArrowSize * math.cos(angle - 0.5),
                    screenPosition.Y - getgenv().ArrowSize * math.sin(angle - 0.5)
                )
                arrow.PointC = Vector2.new(
                    screenPosition.X - getgenv().ArrowSize * math.cos(angle + 0.5),
                    screenPosition.Y - getgenv().ArrowSize * math.sin(angle + 0.5)
                )
                
                arrow.Color = getgenv().ArrowColor
                arrow.Visible = true
            else
                arrow.Visible = false
            end

            if getgenv().ShowSkeleton and onScreen then
                local head = character:FindFirstChild("Head")
                local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
                local leftArm = character:FindFirstChild("Left Arm") or character:FindFirstChild("LeftUpperArm")
                local rightArm = character:FindFirstChild("Right Arm") or character:FindFirstChild("RightUpperArm")
                local leftLeg = character:FindFirstChild("Left Leg") or character:FindFirstChild("LeftUpperLeg")
                local rightLeg = character:FindFirstChild("Right Leg") or character:FindFirstChild("RightUpperLeg")
                
                if head and torso and leftArm and rightArm and leftLeg and rightLeg then
                    local headPos = Camera:WorldToViewportPoint(head.Position)
                    local torsoPos = Camera:WorldToViewportPoint(torso.Position)
                    local leftArmPos = Camera:WorldToViewportPoint(leftArm.Position)
                    local rightArmPos = Camera:WorldToViewportPoint(rightArm.Position)
                    local leftLegPos = Camera:WorldToViewportPoint(leftLeg.Position)
                    local rightLegPos = Camera:WorldToViewportPoint(rightLeg.Position)

                    skeletonPoints["Head"].Position = Vector2.new(headPos.X, headPos.Y)
                    skeletonPoints["Head"].Visible = true

                    skeletonLines[1].From = Vector2.new(headPos.X, headPos.Y)
                    skeletonLines[1].To = Vector2.new(torsoPos.X, torsoPos.Y) 
                    skeletonLines[1].Visible = true

                    skeletonLines[2].From = Vector2.new(torsoPos.X, torsoPos.Y)
                    skeletonLines[2].To = Vector2.new(leftArmPos.X, leftArmPos.Y)
                    skeletonLines[2].Visible = true

                    skeletonLines[3].From = Vector2.new(torsoPos.X, torsoPos.Y)
                    skeletonLines[3].To = Vector2.new(rightArmPos.X, rightArmPos.Y)
                    skeletonLines[3].Visible = true

                    skeletonLines[4].From = Vector2.new(torsoPos.X, torsoPos.Y)
                    skeletonLines[4].To = Vector2.new(leftLegPos.X, leftLegPos.Y)
                    skeletonLines[4].Visible = true

                    skeletonLines[5].From = Vector2.new(torsoPos.X, torsoPos.Y)
                    skeletonLines[5].To = Vector2.new(rightLegPos.X, rightLegPos.Y)
                    skeletonLines[5].Visible = true
                    
                    if character:FindFirstChild("LeftLowerArm") then
                        local leftLowerArmPos = Camera:WorldToViewportPoint(character.LeftLowerArm.Position)
                        skeletonLines[6].From = Vector2.new(leftArmPos.X, leftArmPos.Y)
                        skeletonLines[6].To = Vector2.new(leftLowerArmPos.X, leftLowerArmPos.Y)
                        skeletonLines[6].Visible = true
                    end

                    if character:FindFirstChild("RightLowerArm") then
                        local rightLowerArmPos = Camera:WorldToViewportPoint(character.RightLowerArm.Position)
                        skeletonLines[7].From = Vector2.new(rightArmPos.X, rightArmPos.Y)
                        skeletonLines[7].To = Vector2.new(rightLowerArmPos.X, rightLowerArmPos.Y)
                        skeletonLines[7].Visible = true
                    end

                    if character:FindFirstChild("LeftLowerLeg") then
                        local leftLowerLegPos = Camera:WorldToViewportPoint(character.LeftLowerLeg.Position)
                        skeletonLines[8].From = Vector2.new(leftLegPos.X, leftLegPos.Y)
                        skeletonLines[8].To = Vector2.new(leftLowerLegPos.X, leftLowerLegPos.Y)
                        skeletonLines[8].Visible = true
                    end

                    if character:FindFirstChild("RightLowerLeg") then
                        local rightLowerLegPos = Camera:WorldToViewportPoint(character.RightLowerLeg.Position)
                        skeletonLines[9].From = Vector2.new(rightLegPos.X, rightLegPos.Y)
                        skeletonLines[9].To = Vector2.new(rightLowerLegPos.X, rightLowerLegPos.Y)
                        skeletonLines[9].Visible = true
                    end
                else
                    for _, line in pairs(skeletonLines) do
                        line.Visible = false
                    end
                    for _, point in pairs(skeletonPoints) do
                        point.Visible = false
                    end
                end
            else
                for _, line in pairs(skeletonLines) do
                    line.Visible = false
                end
                for _, point in pairs(skeletonPoints) do
                    point.Visible = false
                end
            end
        else
            box.Visible = false
            healthBar.Visible = false
            healthBarBackground.Visible = false
            healthBarBorder.Visible = false
            healthText.Visible = false
            nameText.Visible = false
            distanceText.Visible = false
            weaponText.Visible = false
            tracer.Visible = false
            arrow.Visible = false
            for _, line in pairs(skeletonLines) do
                line.Visible = false
            end
            for _, point in pairs(skeletonPoints) do
                point.Visible = false
            end
        end
    end)
end

local radar = Drawing.new("Circle")
radar.Visible = false
radar.Color = Color3.new(1, 1, 1)
radar.Thickness = 2
radar.Filled = false
radar.Radius = 100
radar.Position = Vector2.new(Camera.ViewportSize.X - 120, 120)

local radarCenter = Drawing.new("Circle")
radarCenter.Visible = false
radarCenter.Color = Color3.new(1, 1, 1)
radarCenter.Thickness = 2
radarCenter.Filled = true
radarCenter.Radius = 3
radarCenter.Position = radar.Position

local radarDirection = Drawing.new("Line")
radarDirection.Visible = false
radarDirection.Color = Color3.new(1, 1, 1)
radarDirection.Thickness = 2

local radarGridLines = {}
for i = 1, 4 do
    radarGridLines[i] = Drawing.new("Line")
    radarGridLines[i].Visible = false
    radarGridLines[i].Color = Color3.new(0.5, 0.5, 0.5)
    radarGridLines[i].Thickness = 1
end

local radarRangeText = Drawing.new("Text")
radarRangeText.Visible = false
radarRangeText.Color = Color3.new(1, 1, 1)
radarRangeText.Size = 14
radarRangeText.Font = Drawing.Fonts.Monospace
radarRangeText.Outline = true
radarRangeText.OutlineColor = Color3.new(0, 0, 0)
radarRangeText.Text = "100m"

local radarPlayers = {}

local function updateRadar()
    if not getgenv().ShowRadar then
        radar.Visible = false
        radarCenter.Visible = false
        radarDirection.Visible = false
        radarRangeText.Visible = false
        
        for _, line in pairs(radarGridLines) do
            line.Visible = false
        end
        
        for _, player in pairs(radarPlayers) do
            if player.dot then player.dot.Visible = false end
            if player.direction then player.direction.Visible = false end
            if player.name then player.name.Visible = false end
        end
        return
    end

    radar.Visible = true
    radarCenter.Visible = true
    radarDirection.Visible = true
    radarRangeText.Visible = true
    
    radarRangeText.Position = Vector2.new(radar.Position.X, radar.Position.Y + radar.Radius + 5)
    
    for i = 1, 4 do
        local angle = (i-1) * math.pi / 2
        radarGridLines[i].From = radar.Position
        radarGridLines[i].To = Vector2.new(
            radar.Position.X + math.cos(angle) * radar.Radius,
            radar.Position.Y + math.sin(angle) * radar.Radius
        )
        radarGridLines[i].Visible = true
    end
    
    radarDirection.From = radar.Position
    radarDirection.To = Vector2.new(radar.Position.X, radar.Position.Y - radar.Radius)

    for _, player in pairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player ~= LocalPlayer then
            local rootPart = player.Character.HumanoidRootPart
            local relativePosition = rootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position
            
            local radarX = radar.Position.X + (relativePosition.X / 10)
            local radarY = radar.Position.Y + (relativePosition.Z / 10)
            
            local distanceFromCenter = math.sqrt((radarX - radar.Position.X)^2 + (radarY - radar.Position.Y)^2)
            
            if distanceFromCenter > radar.Radius then
                local angle = math.atan2(radarY - radar.Position.Y, radarX - radar.Position.X)
                radarX = radar.Position.X + math.cos(angle) * radar.Radius
                radarY = radar.Position.Y + math.sin(angle) * radar.Radius
            end
            
            if not radarPlayers[player] then
                radarPlayers[player] = {
                    dot = Drawing.new("Circle"),
                    direction = Drawing.new("Line"),
                    name = Drawing.new("Text")
                }
                
                radarPlayers[player].dot.Thickness = 1
                radarPlayers[player].dot.Filled = true
                radarPlayers[player].dot.Radius = 4
                
                radarPlayers[player].direction.Thickness = 2
                radarPlayers[player].direction.Visible = true
                
                radarPlayers[player].name.Size = 12
                radarPlayers[player].name.Font = Drawing.Fonts.Monospace
                radarPlayers[player].name.Outline = true
                radarPlayers[player].name.OutlineColor = Color3.new(0, 0, 0)
            end
            
            if player.Team == LocalPlayer.Team then
                radarPlayers[player].dot.Color = Color3.new(0, 1, 0)  
                radarPlayers[player].direction.Color = Color3.new(0, 0.8, 0)
                radarPlayers[player].name.Color = Color3.new(0, 1, 0)
            else
                radarPlayers[player].dot.Color = Color3.new(1, 0, 0) 
                radarPlayers[player].direction.Color = Color3.new(1, 0, 0)
                radarPlayers[player].name.Color = Color3.new(1, 0, 0)
            end
            
            radarPlayers[player].dot.Position = Vector2.new(radarX, radarY)
            radarPlayers[player].dot.Visible = true
            
            local lookVector = rootPart.CFrame.LookVector
            local directionLength = 10
            radarPlayers[player].direction.From = Vector2.new(radarX, radarY)
            radarPlayers[player].direction.To = Vector2.new(
                radarX + lookVector.X * directionLength,
                radarY + lookVector.Z * directionLength
            )
            
            radarPlayers[player].name.Position = Vector2.new(radarX, radarY - 15)
            radarPlayers[player].name.Text = player.Name
            radarPlayers[player].name.Visible = distanceFromCenter <= radar.Radius
        elseif radarPlayers[player] then
            radarPlayers[player].dot.Visible = false
            radarPlayers[player].direction.Visible = false
            radarPlayers[player].name.Visible = false
        end
    end
    
    for player, components in pairs(radarPlayers) do
        if not Players:FindFirstChild(player.Name) then
            components.dot.Visible = false
            components.direction.Visible = false
            components.name.Visible = false
            radarPlayers[player] = nil
        end
    end
end

RunService.RenderStepped:Connect(updateRadar)
RunService.RenderStepped:Connect(updatePlayerCount)
RunService.RenderStepped:Connect(updateFOV)

for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        createESP(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        createESP(player)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if ESPComponents[player] then
        for _, component in pairs(ESPComponents[player]) do
            if typeof(component) == "table" then
                for _, drawing in pairs(component) do
                    drawing:Remove()
                end
            else
                component:Remove()
            end
        end
        ESPComponents[player] = nil
    end
end)
---------------------------------------------------------------------------------------------透视功能
Toggle = TabHandles.JBTY3:Toggle({
    Title = "透视开启", 
    Value = false, 
    Callback = function(Value)
        getgenv().ESPEnabled = Value
    end
})

Toggle = TabHandles.JBTY3:Toggle({
    Title = "模型透视", 
    Value = false, 
    Callback = function(Value)
        getgenv().ShowSkeleton = Value
    end
})

Toggle = TabHandles.JBTY3:Toggle({
    Title = "方框透视", 
    Value = false, 
    Callback = function(Value)
        getgenv().ShowBox = Value
    end
})

Toggle = TabHandles.JBTY3:Toggle({
    Title = "射线透视", 
    Value = false, 
    Callback = function(Value)
        getgenv().ShowTracer = Value
    end
})

Toggle = TabHandles.JBTY3:Toggle({
    Title = "名字透视", 
    Value = false, 
    Callback = function(Value)
        getgenv().ShowName = Value
    end
})
-----------------玩家区域------------------
-- 玩家列表和状态变量
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TargetPlayer = nil
local TeleportLoop = false
local MonitorLoop = false
local BringLoop = false

-- 查找玩家函数
local function FindPlayerByName(playerName)
    for _, player in pairs(Players:GetPlayers()) do
        if string.lower(player.Name) == string.lower(playerName) or string.lower(player.DisplayName) == string.lower(playerName) then
            return player
        end
    end
    return nil
end

-- 全局玩家名字输入框
local GlobalPlayerInput = Tabs.JBTY4:Input({
    Title = "输入目标玩家名字",
    Placeholder = "输入玩家用户名或显示名",
    Callback = function(InputText)
        local player = FindPlayerByName(InputText)
        if player then
            TargetPlayer = player
            WindUI:Notify({
                Title = "FXM脚本",
                Content = "已选择玩家: " .. player.Name,
                Duration = 3,
            })
        else
            WindUI:Notify({
                Title = "FXM脚本",
                Content = "未找到玩家: " .. InputText,
                Duration = 3,
            })
            TargetPlayer = nil
        end
    end
})

-- 玩家状态显示
local PlayerStatusLabel = Tabs.JBTY4:Label({
    Title = "当前目标玩家",
    Content = "未选择玩家"
})

-- 更新玩家状态显示的函数
local function UpdatePlayerStatus()
    if TargetPlayer then
        PlayerStatusLabel:SetContent(TargetPlayer.Name .. " (" .. TargetPlayer.DisplayName .. ")")
    else
        PlayerStatusLabel:SetContent("未选择玩家")
    end
end

-- 定期更新状态显示
spawn(function()
    while true do
        UpdatePlayerStatus()
        wait(1)
    end
end)

-- 循环传送功能
local TeleportToggle = Tabs.JBTY4:Toggle({
    Title = "循环传送",
    Value = false, 
    Callback = function(Value)
        TeleportLoop = Value
        if Value then
            if not TargetPlayer then
                WindUI:Notify({
                    Title = "FXM脚本",
                    Content = "请先输入玩家名字",
                    Duration = 3,
                })
                TeleportToggle:SetValue(false)
                return
            end
            WindUI:Notify({
                Title = "FXM脚本",
                Content = "循环传送已开启 - 目标: " .. TargetPlayer.Name,
                Duration = 3,
            })
            -- 循环传送逻辑
            spawn(function()
                while TeleportLoop and TargetPlayer do
                    local targetChar = TargetPlayer.Character
                    local localChar = LocalPlayer.Character
                    if targetChar and localChar and targetChar:FindFirstChild("HumanoidRootPart") and localChar:FindFirstChild("HumanoidRootPart") then
                        localChar.HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame
                    end
                    wait(0.1)
                end
            end)
        else
            WindUI:Notify({
                Title = "FXM脚本",
                Content = "循环传送已关闭",
                Duration = 3,
            })
        end
    end
})

-- 监视玩家功能
local MonitorToggle = Tabs.JBTY4:Toggle({
    Title = "监视玩家",
    Value = false, 
    Callback = function(Value)
        MonitorLoop = Value
        if Value then
            if not TargetPlayer then
                WindUI:Notify({
                    Title = "FXM脚本",
                    Content = "请先输入玩家名字",
                    Duration = 3,
                })
                MonitorToggle:SetValue(false)
                return
            end
            
            local camera = workspace.CurrentCamera
            
            if TargetPlayer and TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("Humanoid") then
                camera.CameraSubject = TargetPlayer.Character.Humanoid
                WindUI:Notify({
                    Title = "FXM脚本",
                    Content = "监视玩家已开启 - 目标: " .. TargetPlayer.Name,
                    Duration = 3,
                })
            else
                WindUI:Notify({
                    Title = "FXM脚本",
                    Content = "无法切换视角，玩家不存在或角色未加载",
                    Duration = 3,
                })
                MonitorToggle:SetValue(false)
            end
            
        else
            local camera = workspace.CurrentCamera
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                camera.CameraSubject = LocalPlayer.Character.Humanoid
                WindUI:Notify({
                    Title = "FXM脚本",
                    Content = "监视玩家已关闭",
                    Duration = 3,
                })
            end
        end
    end
})

-- 循环把玩家传送过来功能
local BringToggle = Tabs.JBTY4:Toggle({
    Title = "循环把玩家传送过来",
    Value = false, 
    Callback = function(Value)
        BringLoop = Value
        if Value then
            if not TargetPlayer then
                WindUI:Notify({
                    Title = "FXM脚本",
                    Content = "请先输入玩家名字",
                    Duration = 3,
                })
                BringToggle:SetValue(false)
                return
            end
            WindUI:Notify({
                Title = "FXM脚本",
                Content = "循环拉玩家已开启 - 目标: " .. TargetPlayer.Name,
                Duration = 3,
            })
            -- 拉玩家逻辑：传送到前面并背对着本人
            spawn(function()
                while BringLoop and TargetPlayer do
                    local targetChar = TargetPlayer.Character
                    local localChar = LocalPlayer.Character
                    if targetChar and localChar and targetChar:FindFirstChild("HumanoidRootPart") and localChar:FindFirstChild("HumanoidRootPart") then
                        -- 计算玩家前方的位置
                        local lookVector = localChar.HumanoidRootPart.CFrame.LookVector
                        local frontPosition = localChar.HumanoidRootPart.Position + lookVector * 5
                        
                        -- 计算让目标玩家背对着我们的方向
                        local oppositeLookVector = -lookVector
                        
                        -- 将目标玩家传送到前方位置，并让他背对着我们
                        targetChar.HumanoidRootPart.CFrame = CFrame.new(frontPosition, frontPosition + oppositeLookVector)
                    end
                    wait(0.1)
                end
            end)
        else
            WindUI:Notify({
                Title = "FXM脚本",
                Content = "循环拉玩家已关闭",
                Duration = 3,
            })
        end
    end
})

-- 刷新玩家列表按钮
local RefreshButton = Tabs.JBTY4:Button({
    Title = "刷新玩家列表",
    Desc = "显示当前在线玩家",
    Locked = false,
    Callback = function()
        local playerList = "当前在线玩家:\n"
        local count = 0
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                playerList = playerList .. "• " .. player.Name .. " (" .. player.DisplayName .. ")\n"
                count = count + 1
            end
        end
        playerList = playerList .. "\n总计: " .. count .. " 名玩家"
        
        WindUI:Notify({
            Title = "玩家列表",
            Content = playerList,
            Duration = 5,
            Icon = "layout-grid",
        })
    end
})

-- 分隔线
Tabs.GGXX:SectionSeparator()
-----------------忍者传奇------------------
local player = game.Players.LocalPlayer
-- 初始化全局变量
getgenv().AutoSwing = false
getgenv().AutoSell = false
getgenv().AutoFullSell = false
getgenv().AutoPetLevel = false
getgenv().AutoRobotBoss = false
getgenv().AutoEternalBoss = false
getgenv().AutoAncientBoss = false
getgenv().AutoSantaBoss = false
getgenv().AutoAllBosses = false
getgenv().AutoRank = false
getgenv().AutoSword = false
getgenv().AutoBelt = false
getgenv().AutoSkill = false
getgenv().AutoShuriken = false
getgenv().AutoOpenEgg = false
getgenv().AutoBuyTwinBirdies = false
getgenv().FastShuriken = false
getgenv().SlowShuriken = false
getgenv().Invisible = false
getgenv().AntiAFK = true

-- 自动挥刀
spawn(function()
    while wait(0.1) do
        if getgenv().AutoSwing and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if player.Character:FindFirstChildOfClass("Tool") then
                player.ninjaEvent:FireServer("swingKatana")
            else
                for _, v in pairs(player.Backpack:GetChildren()) do
                    if v.ClassName == "Tool" and v:FindFirstChild("attackKatanaScript") then
                        player.Character.Humanoid:EquipTool(v)
                        break
                    end
                end
            end
        end
    end
end)

-- 自动出售
spawn(function()
    while wait(0.05) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if getgenv().AutoSell then
                game.Workspace.sellAreaCircles.sellAreaCircle7.circleInner.CFrame = player.Character.HumanoidRootPart.CFrame
                wait(0.1)
                game.Workspace.sellAreaCircles.sellAreaCircle7.circleInner.CFrame = game.Workspace.Part.CFrame
            end
            if getgenv().AutoFullSell and player.PlayerGui.gameGui.maxNinjitsuMenu.Visible then
                game.Workspace.sellAreaCircles.sellAreaCircle7.circleInner.CFrame = player.Character.HumanoidRootPart.CFrame
                wait(0.05)
                game.Workspace.sellAreaCircles.sellAreaCircle7.circleInner.CFrame = game.Workspace.Part.CFrame
            end
        end
    end
end)

-- 自动捡金币
spawn(function()
    while wait(0.05) do
        if getgenv().AutoPetLevel and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            for _, v in pairs(game.Workspace.Hoops:GetDescendants()) do
                if v.ClassName == "MeshPart" and v:FindFirstChild("touchPart") then
                    v.touchPart.CFrame = player.Character.HumanoidRootPart.CFrame
                end
            end
        end
    end
end)

-- Boss击杀函数
local function autoBoss(bossName, toggle)
    spawn(function()
        while wait(0.1) do
            if getgenv()[toggle] and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local boss = game.Workspace.bossFolder:FindFirstChild(bossName)
                if boss and boss:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame
                    if player.Character:FindFirstChildOfClass("Tool") then
                        player.Character:FindFirstChildOfClass("Tool"):Activate()
                    end
                end
            end
        end
    end)
end

autoBoss("RobotBoss", "AutoRobotBoss")
autoBoss("EternalBoss", "AutoEternalBoss")
autoBoss("AncientMagmaBoss", "AutoAncientBoss")
autoBoss("Samurai Santa", "AutoSantaBoss")

-- 自动杀全部Boss
spawn(function()
    while wait(0.1) do
        if getgenv().AutoAllBosses and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local bosses = {"Samurai Santa", "AncientMagmaBoss", "EternalBoss", "RobotBoss"}
            for _, bossName in pairs(bosses) do
                local boss = game.Workspace.bossFolder:FindFirstChild(bossName)
                if boss and boss:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame
                    if player.Character:FindFirstChildOfClass("Tool") then
                        player.Character:FindFirstChildOfClass("Tool"):Activate()
                    end
                    break
                end
            end
        end
    end
end)

-- 自动购买函数
local function autoBuy(event, arg, toggle)
    spawn(function()
        while wait(0.5) do
            if getgenv()[toggle] and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                if type(arg) == "table" then
                    for _, v in pairs(arg) do
                        player.ninjaEvent:FireServer(event, v)
                    end
                else
                    for _, v in pairs(arg:GetChildren()) do
                        player.ninjaEvent:FireServer(event, v.Name)
                    end
                end
            end
        end
    end)
end

autoBuy("buyAllSwords", {"Ground", "Astral Island", "Space Island", "Tundra Island", "Eternal Island", "Sandstorm", "Thunderstorm", "Ancient Inferno Island", "Midnight Shadow Island", "Mythical Souls Island", "Winter Wonder Island"}, "AutoSword")
autoBuy("buyAllBelts", {"Ground", "Astral Island", "Space Island", "Tundra Island", "Eternal Island", "Sandstorm", "Thunderstorm", "Ancient Inferno Island", "Midnight Shadow Island", "Mythical Souls Island", "Winter Wonder Island"}, "AutoBelt")
autoBuy("buyAllSkills", {"Ground", "Astral Island", "Space Island", "Tundra Island", "Eternal Island", "Sandstorm", "Thunderstorm", "Ancient Inferno Island", "Midnight Shadow Island", "Mythical Souls Island", "Winter Wonder Island"}, "AutoSkill")
autoBuy("buyRank", game:GetService("ReplicatedStorage").Ranks.Ground, "AutoRank")
autoBuy("buyAllShurikens", {"Ground", "Astral Island", "Space Island", "Tundra Island", "Eternal Island", "Sandstorm", "Thunderstorm", "Ancient Inferno Island", "Midnight Shadow Island", "Mythical Souls Island", "Winter Wonder Island"}, "AutoShuriken")

-- 自动开蛋
spawn(function()
    while wait(0.1) do
        if getgenv().AutoOpenEgg and getgenv().SelectedCrystal then
            game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer("openCrystal", getgenv().SelectedCrystal)
        end
    end
end)

-- 自动购买双元素小鸟
spawn(function()
    while wait(0.5) do
        if getgenv().AutoBuyTwinBirdies then
            game:GetService("ReplicatedStorage").cPetShopRemote:InvokeServer(game:GetService("ReplicatedStorage").cPetShopFolder:FindFirstChild("Twin Element Birdies"))
        end
    end
end)

-- 手里剑速度和隐身
spawn(function()
    while wait(0.1) do
        if getgenv().Invisible then
            player.ninjaEvent:FireServer("goInvisible")
        end
        if getgenv().FastShuriken and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            for _, p in pairs(game.Workspace.shurikensFolder:GetChildren()) do
                if p.Name == "Handle" and p:FindFirstChild("BodyVelocity") then
                    local bv = p:FindFirstChildOfClass("BodyVelocity")
                    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    bv.Velocity = Vector3.new(1000, 0, 1000)
                end
            end
        end
        if getgenv().SlowShuriken and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            for _, p in pairs(game.Workspace.shurikensFolder:GetChildren()) do
                if p.Name == "Handle" and p:FindFirstChild("BodyVelocity") then
                    local bv = p:FindFirstChildOfClass("BodyVelocity")
                    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    bv.Velocity = Vector3.new(35, 0, 35)
                end
            end
        end
    end
end)

-- 防AFK
local vu = game:GetService("VirtualUser")
spawn(function()
    while wait(1) do
        if getgenv().AntiAFK then
            vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end
    end
end)

-- 自动刷金币
spawn(function()
    while wait(0.1) do
        if isAutoCoin then
            local rEvents = game:GetService("ReplicatedStorage"):FindFirstChild("rEvents")
            local event = rEvents and rEvents:FindFirstChild("zenMasterEvent")
            if event then
                event:FireServer("convertGems", gemValue)
            end
        end
    end
end)
-----------------基础区域------------------
Toggle = TabHandles.RZCQ1:Toggle({
    Title = "自动挥剑", 
    Value = false, 
    Callback = function(Value)
getgenv().AutoSwing = Value
        WindUI:Notify({
            Title = "FXM脚本",
            Content = Value and "自动挥刀已开启" or "自动挥刀已关闭",
            Duration = 3,
        })
    end
})

Toggle = TabHandles.RZCQ1:Toggle({
    Title = "自动出售", 
    Value = false, 
    Callback = function(Value)
getgenv().AutoSell = Value
        WindUI:Notify({
            Title = "FXM脚本",
            Content = Value and "自动出售已开启" or "自动出售已关闭",
            Duration = 3,
        })
    end
})

Toggle = TabHandles.RZCQ1:Toggle({
    Title = "自动全部出售", 
    Value = false, 
    Callback = function(Value)
getgenv().AutoFullSell = Value
        WindUI:Notify({
            Title = "FXM脚本",
            Content = Value and "自动全部出售已开启" or "自动全部出售已关闭",
            Duration = 3,
        })
    end
})
-----------------辅助区域------------------
Toggle = TabHandles.RZCQ2:Toggle({
    Title = "快速手里剑", 
    Value = false, 
    Callback = function(Value)
getgenv().FastShuriken = Value
        WindUI:Notify({
            Title = "FXM脚本",
            Content = Value and "快速手里剑已开启" or "快速手里剑已关闭",
            Duration = 3,
        })
    end
})

Toggle = TabHandles.RZCQ2:Toggle({
    Title = "慢速手里剑", 
    Value = false, 
    Callback = function(Value)
getgenv().SlowShuriken = Value
        WindUI:Notify({
            Title = "FXM脚本",
            Content = Value and "慢速手里剑已开启" or "慢速手里剑已关闭",
            Duration = 3,
        })
    end
})

Toggle = TabHandles.RZCQ2:Toggle({
    Title = "隐身", 
    Value = false, 
    Callback = function(Value)
getgenv().Invisible = Value
        WindUI:Notify({
            Title = "FXM脚本",
            Content = Value and "隐身已开启" or "隐身已关闭",
            Duration = 3,
        })
    end
})

Button = TabHandles.RZCQ2:Button({
    Title = "自动宝箱",
    Desc = "",
    Locked = false,
    Callback = function()
if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local chests = {"mythicalChest", "goldenChest", "enchantedChest", "magmaChest", "legendsChest", "eternalChest", "saharaChest", "thunderChest", "ancientChest", "midnightShadowChest"}
            for _, chest in pairs(chests) do
                if game.Workspace:FindFirstChild(chest) then
                    game.Workspace[chest].circleInner.CFrame = player.Character.HumanoidRootPart.CFrame
                    wait(3.5)
                end
            end
            WindUI:Notify({
                Title = "FXM脚本",
                Content = "宝箱收集完成",
                Duration = 3,
            })
        end
    end
})
-----------------购买区域------------------
Toggle = TabHandles.RZCQ3:Toggle({
    Title = "自动购买等级", 
    Value = false, 
    Callback = function(Value)
getgenv().AutoRank = Value
        WindUI:Notify({
            Title = "FXM脚本",
            Content = Value and "自动买等级已开启" or "自动买等级已关闭",
            Duration = 3,
        })
    end
})

Toggle = TabHandles.RZCQ3:Toggle({
    Title = "自动购买剑", 
    Value = false, 
    Callback = function(Value)
getgenv().AutoSword = Value
        WindUI:Notify({
            Title = "FXM脚本",
            Content = Value and "自动买剑已开启" or "自动买剑已关闭",
            Duration = 3,
        })
    end
})

Toggle = TabHandles.RZCQ3:Toggle({
    Title = "自动购买腰带", 
    Value = false, 
    Callback = function(Value)
getgenv().AutoBelt = Value
        WindUI:Notify({
            Title = "FXM脚本",
            Content = Value and "自动买腰带已开启" or "自动买腰带已关闭",
            Duration = 3,
        })
    end
})

Toggle = TabHandles.RZCQ3:Toggle({
    Title = "自动购买技能", 
    Value = false, 
    Callback = function(Value)
getgenv().AutoSkill = Value
        WindUI:Notify({
            Title = "FXM脚本",
            Content = Value and "自动买技能已开启" or "自动买技能已关闭",
            Duration = 3,
        })
    end
})

Toggle = TabHandles.RZCQ3:Toggle({
    Title = "自动购买飞镖", 
    Value = false, 
    Callback = function(Value)
getgenv().AutoShuriken = Value
        WindUI:Notify({
            Title = "FXM脚本",
            Content = Value and "自动买飞镖已开启" or "自动买飞镖已关闭",
            Duration = 3,
        })
    end
})
-----------------收集区域------------------
Toggle = TabHandles.RZCQ4:Toggle({
    Title = "自动收集元气和金币", 
    Value = false, 
    Callback = function(Value)
getgenv().AutoPetLevel = Value
        WindUI:Notify({
            Title = "FXM脚本",
            Content = Value and "自动捡气和金币已开启" or "自动捡气和金币已关闭",
            Duration = 3,
        })
    end
})
-----------------击杀区域------------------





-----------------------------------------------------------------------------------------------自然灾害
Button = TabHandles.ESPgn:Button({
    Title = "黑洞",
    Desc = "点击加载",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Super-ring-Parts-V6-28581"))()
        
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

Button = TabHandles.ESPgn:Button({
    Title = "物理磁铁",
    Desc = "可以把下面的东西吸上来可以踩",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cytj777i/6669178/main/%E5%8D%95%E4%B8%80%E7%89%A9%E4%BD%93%E9%A3%9E%E8%A1%8C%E8%BD%BD%E8%87%AA%E5%B7%B1%E6%9C%80%E7%BB%88%E4%BC%98%E5%8C%96%E7%89%88"))()       
        
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})                                
    end
})

-----------------------------------------------------------------------------------------------被遗弃
Button = TabHandles.pbgn:Button({
    Title = "被遗弃XK",
    Desc = "无卡中文",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet(('https://github.com/devslopo/DVES/raw/main/XK%20Hub')))()

WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})
-----------------------------------------------------------------------------------------------最强战场
Button = TabHandles.tzgn:Button({
    Title = "最强战场无限侧闪",
    Desc = "无卡英文",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/10tempest01/tempest-hub/refs/heads/main/Launcher.lua"))()

WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
    end
})

Button = TabHandles.tzgn:Button({
    Title = "最强战场隐身道具",
    Desc = "无卡",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)",true))()

WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

Button = TabHandles.tzgn:Button({
    Title = "最强战场自动躲避平a",
    Desc = "无卡",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IdkRandomUsernameok/PublicAssets/refs/heads/main/Releases/MUI.lua"))()
                
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
                       
end
})

-----------------------------------------------------------------------------------------------死铁轨
Button = TabHandles.fzgn:Button({
    Title = "死铁轨",
    Desc = "无卡中文",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/iopjklbnmsss/SansHubScript/refs/heads/main/SansHub"))()
        
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})
-----------------------------------------------------------------------------------------------森林99夜
Button = TabHandles.A:Button({
    Title = "林森99夜",
    Desc = "无卡中文",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/HB-ksdb/-4/main/%E8%B6%8AHB%20FXM%2099%E5%A4%9C.lua"))()
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

Button = TabHandles.A:Button({
    Title = "林森99夜",
    Desc = "无卡中文 推荐",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NEHUB2/NE/refs/heads/main/855.lua"))()

WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})
-----------------------------------------------------------------------------------------------刀刃球
Button = TabHandles.B:Button({
    Title = "刀刃球",
    Desc = "无卡中文 推荐",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/rbxluau/script-hub/main/loader.lua"))()
        
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

Button = TabHandles.B:Button({
    Title = "刀刃球红⭕️",
    Desc = "无卡中文 推荐",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/autoparrybest"))()

WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})
-----------------------------------------------------------------------------------------------偷走脑红
Button = TabHandles.C:Button({
    Title = "偷走脑红",
    Desc = "无卡英文 推荐",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Brinxhub12/brinx-hub-comebac1/refs/heads/main/brinx%20come%20back"))()
        
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})
-----------------------------------------------------------------------------------------------火箭发射模拟器
Button = TabHandles.D:Button({
    Title = "火箭发射模拟器",
    Desc = "无卡中文",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/anlushanjinchangantangwanle/refs/heads/main/jmjmjmjmjmjm114514.txt"))()

WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})
-----------------------------------------------------------------------------------------------力量传奇
Button = TabHandles.E:Button({
    Title = "力量传奇吃蛋",
    Desc = "无卡中文",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.github.com/114514541883484/Zephyr-wave/main/agreement.lua"))()
        
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})
-----------------------------------------------------------------------------------------------伐木大享
Button = TabHandles.F:Button({
    Title = "伐木大享AXE",
    Desc = "无卡英文",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/NOOBARMYSCRIPTER/NOOBARMYSCRIPTER/main/AXE%20LOOP%20SCRIPT"), true))()
        
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})
-----------------------------------------------------------------------------------------------打巴掌
Button = TabHandles.G:Button({
    Title = "打巴掌光环",
    Desc = "",
    Locked = false,
    Callback = function()
        function isSpawned(player)
   if workspace:FindFirstChild(player.Name) and player.Character:FindFirstChild("HumanoidRootPart") then
       return true
   else
       return false
   end
end

while wait() do
   for i, v in pairs(game.Players:GetPlayers()) do
       if isSpawned(v) and v ~= game.Players.LocalPlayer and not v.Character.Head:FindFirstChild("UnoReverseCard") then
           if (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
               game:GetService("ReplicatedStorage").b:FireServer(v.Character["Right Arm"])
               wait(0.1)
           end
       end
   end
end
    end
})

WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})

---------------------------------------------------------------------------------------------墨水游戏
Button = TabHandles.H:Button({
    Title = "墨水单人服务器（可以赚金币）",
    Desc = "点击后就可以进入单人服务器",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/veil0x14/LocalScripts/refs/heads/main/pg.lua"))()
        
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})                
    end
})

---------------------------------------------------------------------------------------------UI自定义
