-- [[ 🌚刘某某脚本🌝 | 按钮更名与字体修复版 | Core.lua ]]

local LMM_V4 = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UIStroke = Instance.new("UIStroke")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

-- 基础 UI 设置
LMM_V4.Name = "LMM_Core_UI"
LMM_V4.Parent = game:GetService("CoreGui")
LMM_V4.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = LMM_V4
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, -165, 0.5, -175)
MainFrame.Size = UDim2.new(0, 330, 0, 350)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.Parent = MainFrame
UIStroke.Parent = MainFrame
UIStroke.Thickness = 2
UIStroke.Color = Color3.new(1, 1, 1)

-- 标题栏
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Size = UDim2.new(0, 200, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "🌚刘某某脚本🌝"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left

-- 🛠️ 顶部控制 (保持不变)
local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.Size = UDim2.new(0, 30, 0, 30); CloseBtn.Position = UDim2.new(1, -35, 0, 5); CloseBtn.BackgroundTransparency = 1; CloseBtn.Text = "×"; CloseBtn.TextColor3 = Color3.fromRGB(255, 50, 50); CloseBtn.TextSize = 25; CloseBtn.MouseButton1Click:Connect(function() LMM_V4:Destroy() end)

local MinBtn = Instance.new("TextButton", MainFrame)
MinBtn.Size = UDim2.new(0, 30, 0, 30); MinBtn.Position = UDim2.new(1, -70, 0, 5); MinBtn.BackgroundTransparency = 1; MinBtn.Text = "-"; MinBtn.TextColor3 = Color3.new(1, 1, 1); MinBtn.TextSize = 25
local min = false
MinBtn.MouseButton1Click:Connect(function()
    min = not min
    ScrollingFrame.Visible = not min
    MainFrame:TweenSize(min and UDim2.new(0, 330, 0, 40) or UDim2.new(0, 330, 0, 350), "Out", "Quad", 0.3, true)
end)

-- 滚动区
ScrollingFrame.Parent = MainFrame
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Position = UDim2.new(0, 10, 0, 50)
ScrollingFrame.Size = UDim2.new(1, -20, 1, -60)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.ScrollBarThickness = 0

UIListLayout.Parent = ScrollingFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0, 10)

-- [[ 确认弹窗函数 - 修复字体大小 ]]
local function ShowConfirm(name, callback)
    local cf = Instance.new("Frame", LMM_V4)
    cf.Size = UDim2.new(0, 280, 0, 140); cf.Position = UDim2.new(0.5, -140, 0.5, -70); cf.BackgroundColor3 = Color3.new(0, 0, 0); cf.ZIndex = 2000
    Instance.new("UIStroke", cf).Color = Color3.new(1,1,1); Instance.new("UICorner", cf)
    
    local t = Instance.new("TextLabel", cf)
    t.Size = UDim2.new(1, 0, 0.5, 0); t.BackgroundTransparency = 1; t.Text = "确定要运行\n["..name.."] 吗？"; t.TextColor3 = Color3.new(1,1,1)
    t.TextSize = 18; t.Font = "GothamBold"; t.ZIndex = 2001 -- 调大提示字
    
    local yes = Instance.new("TextButton", cf)
    yes.Size = UDim2.new(0.4, 0, 0.3, 0); yes.Position = UDim2.new(0.05, 0, 0.6, 0); yes.BackgroundColor3 = Color3.fromRGB(0, 150, 0); yes.Text = "确定执行"; yes.TextColor3 = Color3.new(1,1,1)
    yes.TextSize = 16; yes.Font = "GothamBold"; yes.ZIndex = 2001; Instance.new("UICorner", yes)
    
    local no = Instance.new("TextButton", cf)
    no.Size = UDim2.new(0.4, 0, 0.3, 0); no.Position = UDim2.new(0.55, 0, 0.6, 0); no.BackgroundColor3 = Color3.fromRGB(150, 0, 0); no.Text = "取消"; no.TextColor3 = Color3.new(1,1,1)
    no.TextSize = 16; no.Font = "GothamBold"; no.ZIndex = 2001; Instance.new("UICorner", no)
    
    yes.MouseButton1Click:Connect(function() cf:Destroy(); callback() end)
    no.MouseButton1Click:Connect(function() cf:Destroy() end)
end

-- 1. 搜索框 (保持不变)
local SearchBox = Instance.new("TextBox", ScrollingFrame)
SearchBox.Size = UDim2.new(0.9, 0, 0, 45); SearchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30); SearchBox.Text = "🔍 搜索脚本..."; SearchBox.TextColor3 = Color3.new(0.6, 0.6, 0.6); SearchBox.TextSize = 14; Instance.new("UICorner", SearchBox)

-- 2. Discord (保持不变)
local DiscordBtn = Instance.new("TextButton", ScrollingFrame)
DiscordBtn.Size = UDim2.new(0.9, 0, 0, 50); DiscordBtn.BackgroundColor3 = Color3.fromRGB(60, 80, 200); DiscordBtn.Text = "JOIN DISCORD"; DiscordBtn.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", DiscordBtn)
DiscordBtn.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/cjpezEZub") end)

-- 3. 刘某某基本功能 (更名)
local FuncBtn = Instance.new("TextButton", ScrollingFrame)
FuncBtn.Size = UDim2.new(0.9, 0, 0, 50); FuncBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35); FuncBtn.Text = "🌚 刘某某基本功能 🌚"; FuncBtn.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", FuncBtn)

-- 执行逻辑注入点
FuncBtn.MouseButton1Click:Connect(function()
    ShowConfirm("刘某某基本功能", function()
        -- 填入脚本逻辑
        print("执行中...")
    end)
end)
