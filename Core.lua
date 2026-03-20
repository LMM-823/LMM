-- [[ 🌚刘某某脚本🌝 | 白框白字修复版 | Core.lua ]]

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
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- 保持黑色背景
MainFrame.Position = UDim2.new(0.5, -165, 0.5, -175)
MainFrame.Size = UDim2.new(0, 330, 0, 350)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.Parent = MainFrame
UIStroke.Parent = MainFrame
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(255, 255, 255) -- ✨ 这里改成了白色边框

-- 标题栏图标和文字 (保持原样)
local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 30, 0, 30); CloseBtn.Position = UDim2.new(1, -35, 0, 5); CloseBtn.BackgroundTransparency = 1; CloseBtn.Text = "×"; CloseBtn.TextColor3 = Color3.fromRGB(255, 50, 50); CloseBtn.TextSize = 25; CloseBtn.Font = "GothamBold"
CloseBtn.MouseButton1Click:Connect(function() LMM_V4:Destroy() end)
local MinBtn = Instance.new("TextButton", MainFrame)
MinBtn.Name = "MinBtn"; MinBtn.Size = UDim2.new(0, 30, 0, 30); MinBtn.Position = UDim2.new(1, -70, 0, 5); MinBtn.BackgroundTransparency = 1; MinBtn.Text = "-"; MinBtn.TextColor3 = Color3.new(1, 1, 1); MinBtn.TextSize = 25; MinBtn.Font = "GothamBold"
MinBtn.MouseButton1Click:Connect(function() minimized = not minimized; ScrollingFrame.Visible = not minimized; MainFrame:TweenSize(minimized and UDim2.new(0, 330, 0, 40) or UDim2.new(0, 330, 0, 350), "Out", "Quad", 0.3, true) end)
Title.Name = "Title"; Title.Parent = MainFrame; Title.BackgroundTransparency = 1; Title.Size = UDim2.new(1, 0, 0, 40); Title.Font = "GothamBold"; Title.Text = "🌚刘某某脚本🌝"; Title.TextColor3 = Color3.new(1, 1, 1); Title.TextSize = 18

-- 内容区域 (保持布局)
ScrollingFrame.Parent = MainFrame
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Position = UDim2.new(0, 10, 0, 50)
ScrollingFrame.Size = UDim2.new(1, -20, 1, -60)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 500)
ScrollingFrame.ScrollBarThickness = 0

UIListLayout.Parent = ScrollingFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- 唯一的 DC 按钮 (排在第二位)
local DiscordBtn = Instance.new("TextButton", ScrollingFrame)
DiscordBtn.Name = "JOIN DISCORD"; DiscordBtn.LayoutOrder = 2; DiscordBtn.BackgroundColor3 = Color3.fromRGB(60, 80, 200); DiscordBtn.Size = UDim2.new(0.9, 0, 0, 50); DiscordBtn.Font = "GothamBold"; DiscordBtn.Text = "JOIN DISCORD"; DiscordBtn.TextColor3 = Color3.new(1, 1, 1); DiscordBtn.TextSize = 18; Instance.new("UICorner", DiscordBtn)
DiscordBtn.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/yourlink") end)
