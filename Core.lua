-- [[ 🌚刘某某脚本🌝 | 纯净大黑盒 | 恢复滑动版 ]]

local LMM_V4 = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UIStroke = Instance.new("UIStroke")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

-- 基础设置
LMM_V4.Name = "LMM_Core_UI"
LMM_V4.Parent = game:GetService("CoreGui")
LMM_V4.ResetOnSpawn = false

-- 主体 (可拖动)
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
UIStroke.Color = Color3.fromRGB(255, 0, 255)

-- 标题
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Size = UDim2.new(0, 200, 0, 45)
Title.Font = "GothamBold"
Title.Text = "🌚 刘某某脚本 🌝"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left

-- 控制按钮
local function CreateHeaderBtn(name, text, pos, color, callback)
    local btn = Instance.new("TextButton", MainFrame)
    btn.Name = name
    btn.Size = UDim2.new(0, 30, 0, 30)
    btn.Position = pos
    btn.BackgroundTransparency = 1; btn.Text = text; btn.TextColor3 = color; btn.TextSize = 25; btn.Font = "GothamBold"
    btn.MouseButton1Click:Connect(callback)
end
CreateHeaderBtn("X", "×", UDim2.new(1, -35, 0, 5), Color3.fromRGB(255, 50, 50), function() LMM_V4:Destroy() end)
CreateHeaderBtn("-", "-", UDim2.new(1, -70, 0, 5), Color3.new(1, 1, 1), function()
    ScrollingFrame.Visible = not ScrollingFrame.Visible
    MainFrame:TweenSize(ScrollingFrame.Visible and UDim2.new(0, 330, 0, 350) or UDim2.new(0, 330, 0, 45), "Out", "Quad", 0.3, true)
end)

-- 🛠️ 修复后的滑动区 (关键：CanvasSize 要够大才能滑)
ScrollingFrame.Parent = MainFrame
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Position = UDim2.new(0, 10, 0, 50)
ScrollingFrame.Size = UDim2.new(1, -20, 1, -60) -- 占满框体
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 1000) -- 预留超长滑动空间
ScrollingFrame.ScrollBarThickness = 2
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 255)

UIListLayout.Parent = ScrollingFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- 唯一保留的 DC 按钮
local DiscordBtn = Instance.new("TextButton", ScrollingFrame)
DiscordBtn.Name = "JOIN DISCORD"
DiscordBtn.LayoutOrder = 2
DiscordBtn.BackgroundColor3 = Color3.fromRGB(60, 80, 200)
DiscordBtn.Size = UDim2.new(0.9, 0, 0, 50)
DiscordBtn.Font = "GothamBold"; DiscordBtn.Text = "JOIN DISCORD"; DiscordBtn.TextColor3 = Color3.new(1, 1, 1); DiscordBtn.TextSize = 18
Instance.new("UICorner", DiscordBtn)
DiscordBtn.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/yourlink") end)
