-- [[ 🌚刘某某脚本🌝 | 1.白边框 2.DC动画 3.纯净滑动区 | Core.lua ]]

local LMM_V4 = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UIStroke = Instance.new("UIStroke")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local TweenService = game:GetService("TweenService")

-- 1. 基础 UI 容器
LMM_V4.Name = "LMM_Core_UI"
LMM_V4.Parent = game:GetService("CoreGui")
LMM_V4.ResetOnSpawn = false

-- 2. 主体大黑盒 (可拖动)
MainFrame.Name = "MainFrame"
MainFrame.Parent = LMM_V4
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, -165, 0.5, -175)
MainFrame.Size = UDim2.new(0, 330, 0, 350)
MainFrame.Active = true
MainFrame.Draggable = true -- 开启拖动

UICorner.Parent = MainFrame
UIStroke.Parent = MainFrame
UIStroke.Thickness = 2
-- 🛠️ 修复点：边框改为纯白色
UIStroke.Color = Color3.fromRGB(255, 255, 255)

-- 3. 标题栏
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Size = UDim2.new(0, 200, 0, 45)
Title.Font = Enum.Font.GothamBold
Title.Text = "🌚 刘某某脚本 🌝"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left

-- 4. 标题栏控制按钮 (X 和 -)
local function CreateHeaderBtn(name, text, pos, color, callback)
    local btn = Instance.new("TextButton", MainFrame)
    btn.Name = name
    btn.Size = UDim2.new(0, 30, 0, 30)
    btn.Position = pos
    btn.BackgroundTransparency = 1
    btn.Text = text
    btn.TextColor3 = color
    btn.TextSize = 25
    btn.Font = "GothamBold"
    btn.MouseButton1Click:Connect(callback)
end
-- 🛠️ 恢复点：红色的 X，白色的 -
CreateHeaderBtn("CloseBtn", "×", UDim2.new(1, -35, 0, 5), Color3.fromRGB(255, 50, 50), function() LMM_V4:Destroy() end)
CreateHeaderBtn("MinBtn", "-", UDim2.new(1, -70, 0, 5), Color3.new(1, 1, 1), function()
    ScrollingFrame.Visible = not ScrollingFrame.Visible
    MainFrame:TweenSize(ScrollingFrame.Visible and UDim2.new(0, 330, 0, 350) or UDim2.new(0, 330, 0, 45), "Out", "Quad", 0.3, true)
end)

-- 5. 核心可滑动区 (清空多余按钮)
ScrollingFrame.Parent = MainFrame
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Position = UDim2.new(0, 10, 0, 50)
ScrollingFrame.Size = UDim2.new(1, -20, 1, -60)
-- 🛠️ 修复点：CanvasSize 设大，保证能滑动
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 1000)
ScrollingFrame.ScrollBarThickness = 2
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255) -- 白边框配白滚动条

UIListLayout.Parent = ScrollingFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- 6. 创建唯一的 DC 按钮并添加动画
local DiscordBtn = Instance.new("TextButton", ScrollingFrame)
DiscordBtn.Name = "JOIN DISCORD"
DiscordBtn.LayoutOrder = 2 -- 锁死在第二位
DiscordBtn.BackgroundColor3 = Color3.fromRGB(60, 80, 200)
DiscordBtn.Size = UDim2.new(0.9, 0, 0, 50)
DiscordBtn.Font = Enum.Font.GothamBold
DiscordBtn.Text = "JOIN DISCORD"
DiscordBtn.TextColor3 = Color3.new(1, 1, 1)
DiscordBtn.TextSize = 18
DiscordBtn.Active = true
Instance.new("UICorner", DiscordBtn)

-- 🛠️ 恢复点：点击动画 (缩小 -> 放大 -> 还原)
local originalSize = UDim2.new(0.9, 0, 0, 50)
local minimizedSize = UDim2.new(0.85, 0, 0, 45) -- 缩小
local maximizedSize = UDim2.new(0.95, 0, 0, 55) -- 放大

DiscordBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/yourlink") -- 加入群组逻辑
    
    -- 运行动画
    task.spawn(function()
        -- 缩小
        TweenService:Create(DiscordBtn, TweenInfo.new(0.15), {Size = minimizedSize}):Play()
        task.wait(0.15)
        -- 放大
        TweenService:Create(DiscordBtn, TweenInfo.new(0.15), {Size = maximizedSize}):Play()
        task.wait(0.15)
        -- 还原
        TweenService:Create(DiscordBtn, TweenInfo.new(0.15), {Size = originalSize}):Play()
    end)
end)
