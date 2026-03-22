-- [[ 刘某某脚本库 | Core.lua ]]
-- UI 规格：400x520 | 黑色背景+白色边框

local LMM_V4 = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UIStroke = Instance.new("UIStroke")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

LMM_V4.Name = "LMM_Library_UI"
LMM_V4.Parent = game:GetService("CoreGui")
LMM_V4.ResetOnSpawn = false

-- 主面板
MainFrame.Name = "MainFrame"
MainFrame.Parent = LMM_V4
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -260)
MainFrame.Size = UDim2.new(0, 400, 0, 520)
MainFrame.Active = true
MainFrame.Draggable = true -- 支持拖动

UICorner.Parent = MainFrame
UIStroke.Parent = MainFrame
UIStroke.Thickness = 2
UIStroke.Color = Color3.new(1, 1, 1) -- 纯白边框

-- 标题
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

-- 按钮工厂（带动画）
local function CreateButton(text, color, order, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = ScrollingFrame
    btn.Size = UDim2.new(0.9, 0, 0, 45)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.LayoutOrder = order
    Instance.new("UICorner", btn)
    
    btn.MouseButton1Click:Connect(function()
        -- 按钮点击动画
        btn:TweenSize(UDim2.new(0.85, 0, 0, 40), "Out", "Quad", 0.1, true)
        task.wait(0.1)
        btn:TweenSize(UDim2.new(0.9, 0, 0, 45), "Out", "Quad", 0.1, true)
        callback()
    end)
    return btn
end

-- 滚动区域
ScrollingFrame.Parent = MainFrame
ScrollingFrame.Size = UDim2.new(1, 0, 1, -50)
ScrollingFrame.Position = UDim2.new(0, 0, 0, 50)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 2
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

UIListLayout.Parent = ScrollingFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- 1. 搜索框 (置顶)
local SearchBox = Instance.new("TextBox", ScrollingFrame)
SearchBox.Size = UDim2.new(0.9, 0, 0, 40)
SearchBox.PlaceholderText = "🔍 搜索脚本..."
SearchBox.Text = ""
SearchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SearchBox.TextColor3 = Color3.new(1, 1, 1)
SearchBox.LayoutOrder = 1
Instance.new("UICorner", SearchBox)

-- 2. JOIN DISCORD (蓝色按钮)
CreateButton("JOIN DISCORD", Color3.fromRGB(88, 101, 242), 2, function()
    setclipboard("https://discord.gg/cjpezEZub")
end)

-- 3. 其他功能 (按顺位排列)
CreateButton("刘某某基本功能", Color3.fromRGB(40, 40, 40), 3, function() print("功能1") end)
CreateButton("Aimbot", Color3.fromRGB(40, 40, 40), 4, function() print("功能2") end)

-- 控制按钮 (- 和 X)
local CloseBtn = CreateButton("X", Color3.fromRGB(180, 50, 50), 99, function() LMM_V4:Destroy() end)
CloseBtn.Parent = MainFrame
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)

local MinBtn = CreateButton("-", Color3.fromRGB(60, 60, 60), 98, function()
    ScrollingFrame.Visible = not ScrollingFrame.Visible
    MainFrame.Size = ScrollingFrame.Visible and UDim2.new(0, 400, 0, 520) or UDim2.new(0, 400, 0, 40)
end)
MinBtn.Parent = MainFrame
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -70, 0, 5)
