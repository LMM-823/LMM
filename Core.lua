-- [[ 🌚刘某某脚本🌝 | 1.搜索 2.DC 3.新按钮 | Core.lua ]]

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
MainFrame.Draggable = true

UICorner.Parent = MainFrame
UIStroke.Parent = MainFrame
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(255, 255, 255) -- 保持白色边框

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
CreateHeaderBtn("CloseBtn", "×", UDim2.new(1, -35, 0, 5), Color3.fromRGB(255, 50, 50), function() LMM_V4:Destroy() end)
CreateHeaderBtn("MinBtn", "-", UDim2.new(1, -70, 0, 5), Color3.new(1, 1, 1), function()
    ScrollingFrame.Visible = not ScrollingFrame.Visible
    MainFrame:TweenSize(ScrollingFrame.Visible and UDim2.new(0, 330, 0, 350) or UDim2.new(0, 330, 0, 45), "Out", "Quad", 0.3, true)
end)

-- 5. 核心可滑动区
ScrollingFrame.Parent = MainFrame
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Position = UDim2.new(0, 10, 0, 50)
ScrollingFrame.Size = UDim2.new(1, -20, 1, -60)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 1000)
ScrollingFrame.ScrollBarThickness = 2
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)

UIListLayout.Parent = ScrollingFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- 6. 创建按钮的函数 (带动画)
local function CreateStyledButton(name, text, order, color, callback)
    local btn = Instance.new("TextButton", ScrollingFrame)
    btn.Name = name
    btn.LayoutOrder = order
    btn.BackgroundColor3 = color
    btn.Size = UDim2.new(0, 297, 0, 50)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextSize = 18
    Instance.new("UICorner", btn)

    btn.MouseButton1Click:Connect(function()
        if callback then callback() end
        -- 点击动画
        task.spawn(function()
            TweenService:Create(btn, TweenInfo.new(0.15), {Size = UDim2.new(0, 280, 0, 45)}):Play()
            task.wait(0.15)
            TweenService:Create(btn, TweenInfo.new(0.15), {Size = UDim2.new(0, 310, 0, 55)}):Play()
            task.wait(0.15)
            TweenService:Create(btn, TweenInfo.new(0.15), {Size = UDim2.new(0, 297, 0, 50)}):Play()
        end)
    end)
    return btn
end

-- 第二个按钮：JOIN DISCORD
CreateStyledButton("JOIN DISCORD", "JOIN DISCORD", 2, Color3.fromRGB(60, 80, 200), function()
    setclipboard("https://discord.gg/yourlink")
end)

-- 🛠️ 第三个按钮：占位按钮 (无功能)
CreateStyledButton("ScriptButton3", "待添加功能", 3, Color3.fromRGB(40, 40, 40), function()
    -- 暂无功能
end)
