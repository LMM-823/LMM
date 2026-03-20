-- [[ 🌚刘某某脚本🌝 | 核心功能文件 | Core.lua ]]

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
UIStroke.Color = Color3.fromRGB(255, 0, 255)

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "🌚刘某某脚本🌝"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 20

ScrollingFrame.Parent = MainFrame
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Position = UDim2.new(0, 10, 0, 50)
ScrollingFrame.Size = UDim2.new(1, -20, 1, -60)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 500)
ScrollingFrame.ScrollBarThickness = 2

UIListLayout.Parent = ScrollingFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0, 10)

-- 通用按钮创建函数
local function CreateButton(name, callback)
    local Button = Instance.new("TextButton")
    Button.Name = name
    Button.Parent = ScrollingFrame
    Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Button.Size = UDim2.new(0.9, 0, 0, 50)
    Button.Font = Enum.Font.GothamBold
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(255, 100, 200)
    Button.TextSize = 18
    Instance.new("UICorner", Button)
    Button.MouseButton1Click:Connect(callback)
    return Button
end

-- 1. JOIN DISCORD (蓝色按钮)
local DiscordBtn = CreateButton("JOIN DISCORD", function()
    setclipboard("https://discord.gg/yourlink")
end)
DiscordBtn.BackgroundColor3 = Color3.fromRGB(60, 80, 200)
DiscordBtn.TextColor3 = Color3.new(1, 1, 1)

-- 2. Owl Hub (核心功能)
CreateButton("Owl Hub (极简稳定版)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()
end)

-- 3. 自动连点器 (刘某某)
CreateButton("自动连点器 (刘某某)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LMM-823/LMM/main/AC.lua"))()
end)

-- 4. ESP 透视
CreateButton("开启 ESP 透视", function()
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Highlight") == nil then
            local highlight = Instance.new("Highlight", v.Character)
            highlight.FillColor = Color3.new(1, 0, 0)
        end
    end
end)
