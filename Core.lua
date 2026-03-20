-- [[ 🌚刘某某脚本🌝 | 纯净框架版 | Core.lua ]]

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
UIStroke.Color = Color3.fromRGB(255, 0, 255) -- 紫色边框

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "🌚刘某某脚本🌝"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 20
-- 注意：这里没有添加最小化(-)和关闭(X)按钮，彻底移除

ScrollingFrame.Parent = MainFrame
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Position = UDim2.new(0, 10, 0, 50)
ScrollingFrame.Size = UDim2.new(1, -20, 1, -280) -- 缩小高度，保持简洁
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 500)
ScrollingFrame.ScrollBarThickness = 0 -- 隐藏滚动条更美观

UIListLayout.Parent = ScrollingFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder -- 强制按顺序排列

-- 唯一的 DC 按钮 (排在第二位)
local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Name = "JOIN DISCORD"
DiscordBtn.Parent = ScrollingFrame
DiscordBtn.LayoutOrder = 2 -- 锁死在第二位
DiscordBtn.BackgroundColor3 = Color3.fromRGB(60, 80, 200)
DiscordBtn.Size = UDim2.new(0.9, 0, 0, 50)
DiscordBtn.Font = Enum.Font.GothamBold
DiscordBtn.Text = "JOIN DISCORD"
DiscordBtn.TextColor3 = Color3.new(1, 1, 1)
DiscordBtn.TextSize = 18
Instance.new("UICorner", DiscordBtn)

DiscordBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/yourlink")
end)
