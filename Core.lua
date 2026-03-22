-- [[ 刘某某脚本库 | Core.lua ]]
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

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Size = UDim2.new(0, 200, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "刘某某脚本库"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left

-- 🛠️ 顶部功能键：- 和 ×
local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.Size = UDim2.new(0, 30, 0, 30); CloseBtn.Position = UDim2.new(1, -35, 0, 5); CloseBtn.BackgroundTransparency = 1; CloseBtn.Text = "×"; CloseBtn.TextColor3 = Color3.fromRGB(255, 50, 50); CloseBtn.TextSize = 25
CloseBtn.MouseButton1Click:Connect(function() LMM_V4:Destroy() end)

local MinBtn = Instance.new("TextButton", MainFrame)
MinBtn.Size = UDim2.new(0, 30, 0, 30); MinBtn.Position = UDim2.new(1, -70, 0, 5); MinBtn.BackgroundTransparency = 1; MinBtn.Text = "-"; MinBtn.TextColor3 = Color3.new(1, 1, 1); MinBtn.TextSize = 25
local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    ScrollingFrame.Visible = not minimized
    MainFrame:TweenSize(minimized and UDim2.new(0, 330, 0, 40) or UDim2.new(0, 330, 0, 350), "Out", "Quad", 0.3, true)
end)

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

-- [[ 1. 搜索框 ]]
local SearchBox = Instance.new("TextBox", ScrollingFrame)
SearchBox.Size = UDim2.new(0.9, 0, 0, 45); SearchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30); SearchBox.Text = "🔍 搜索脚本..."; SearchBox.TextColor3 = Color3.new(0.6, 0.6, 0.6); SearchBox.TextSize = 14; Instance.new("UICorner", SearchBox)

-- [[ 2. JOIN DISCORD ]]
local DiscordBtn = Instance.new("TextButton", ScrollingFrame)
DiscordBtn.Size = UDim2.new(0.9, 0, 0, 50); DiscordBtn.BackgroundColor3 = Color3.fromRGB(60, 80, 200); DiscordBtn.Text = "JOIN DISCORD"; DiscordBtn.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", DiscordBtn)
DiscordBtn.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/cjpezEZub") end)
