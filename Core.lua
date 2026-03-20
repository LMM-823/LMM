-- [[ 🌚刘某某脚本🌝 | 大黑盒母本 | 纯黑可滑动 ]]

local LMM_V4 = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UIStroke = Instance.new("UIStroke")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

-- 1. 基础 UI 容器
LMM_V4.Name = "LMM_Core_UI"
LMM_V4.Parent = game:GetService("CoreGui")
LMM_V4.ResetOnSpawn = false

-- 2. 主体大黑盒 (可拖动)
MainFrame.Name = "MainFrame"
MainFrame.Parent = LMM_V4
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12) -- 极黑
MainFrame.Position = UDim2.new(0.5, -165, 0.5, -175)
MainFrame.Size = UDim2.new(0, 330, 0, 380)
MainFrame.Active = true
MainFrame.Draggable = true -- 开启拖动

UICorner.Parent = MainFrame
UIStroke.Parent = MainFrame
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(255, 0, 255) -- 招牌紫色边框

-- 3. 标题栏
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Size = UDim2.new(0, 200, 0, 45)
Title.Font = "GothamBold"
Title.Text = "🌚 刘某某 · 脚本库 🌝"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left

-- 🛠️ 顶部控制按钮 (X 和 -)
local function CreateHeaderBtn(name, text, pos, color, callback)
    local btn = Instance.new("TextButton", MainFrame)
    btn.Name = name
    btn.Size = UDim2.new(0, 30, 0, 30)
    btn.Position = pos
    btn.BackgroundTransparency = 1
    btn.Text = text
    btn.TextColor3 = color
    btn.TextSize = 22
    btn.Font = "GothamBold"
    btn.MouseButton1Click:Connect(callback)
end

CreateHeaderBtn("Close", "×", UDim2.new(1, -35, 0, 8), Color3.fromRGB(255, 50, 50), function() LMM_V4:Destroy() end)
CreateHeaderBtn("Min", "-", UDim2.new(1, -70, 0, 8), Color3.new(1, 1, 1), function() 
    ScrollingFrame.Visible = not ScrollingFrame.Visible
    MainFrame:TweenSize(ScrollingFrame.Visible and UDim2.new(0, 330, 0, 380) or UDim2.new(0, 330, 0, 45), "Out", "Quad", 0.3, true)
end)

-- 4. 核心滑动区 (所有脚本按钮往这里塞)
ScrollingFrame.Parent = MainFrame
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Position = UDim2.new(0, 10, 0, 55)
ScrollingFrame.Size = UDim2.new(1, -20, 1, -70)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0) -- 自动随按钮增多而延长
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.ScrollBarThickness = 2
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 255)

UIListLayout.Parent = ScrollingFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- 5. 按钮模板生成函数 (方便你以后一句话塞一个脚本)
local function AddScript(name, color, callback)
    local Btn = Instance.new("TextButton", ScrollingFrame)
    Btn.Name = name
    Btn.Size = UDim2.new(0.95, 0, 0, 50)
    Btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Btn.Text = name
    Btn.TextColor3 = color or Color3.new(1, 1, 1)
    Btn.Font = "GothamBold"
    Btn.TextSize = 16
    Btn.LayoutOrder = 10 -- 默认排在搜索和DC后面
    Instance.new("UICorner", Btn)
    local s = Instance.new("UIStroke", Btn); s.Thickness = 1; s.Color = Color3.fromRGB(40,40,40)
    Btn.MouseButton1Click:Connect(callback)
    return Btn
end

-- ==========================================
-- 🌚 以后你在这里加按钮就行 🌝
-- ==========================================

-- 默认的 DC 按钮 (排在第 2 位)
local dc = AddScript("JOIN DISCORD", Color3.fromRGB(88, 101, 242), function()
    setclipboard("https://discord.gg/LMM")
end)
dc.LayoutOrder = 2

-- 示例：塞入你的大脚本按钮
AddScript("Owl Hub (全功能版)", Color3.fromRGB(255, 0, 255), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()
end)

AddScript("Rivals 辅助", Color3.fromRGB(0, 180, 255), function()
    print("运行 Rivals 脚本...")
end)
