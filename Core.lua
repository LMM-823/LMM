-- [[ 🌚刘某某脚本🌝 | 确认 UI 修复版 | Core.lua ]]

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
UIStroke.Color = Color3.new(1, 1, 1) -- 保持白色边框

-- 标题文字
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

-- 🛠️ 关闭按钮 (X)
local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 50, 50) -- X保持红色提示
CloseBtn.TextSize = 25
CloseBtn.Font = "GothamBold"
CloseBtn.ZIndex = 5 -- 设个层级
CloseBtn.MouseButton1Click:Connect(function() LMM_V4:Destroy() end)

-- 🛠️ 最小化按钮 (-)
local MinBtn = Instance.new("TextButton", MainFrame)
MinBtn.Name = "MinBtn"
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -70, 0, 5)
MinBtn.BackgroundTransparency = 1
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.new(1, 1, 1)
MinBtn.TextSize = 25
MinBtn.Font = "GothamBold"
MinBtn.ZIndex = 5 -- 设个层级

local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    ScrollingFrame.Visible = not minimized
    MainFrame:TweenSize(minimized and UDim2.new(0, 330, 0, 40) or UDim2.new(0, 330, 0, 350), "Out", "Quad", 0.3, true)
end)

-- 内容滚动区域
ScrollingFrame.Parent = MainFrame
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Position = UDim2.new(0, 10, 0, 50)
ScrollingFrame.Size = UDim2.new(1, -20, 1, -60)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 500)
ScrollingFrame.ScrollBarThickness = 0
ScrollingFrame.ZIndex = 2 -- 主体层级低一些

UIListLayout.Parent = ScrollingFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- [[ ✨ 确认弹窗函数 - 修复层级 ]]
local function ShowConfirm(name, callback)
    local cf = Instance.new("Frame", LMM_V4)
    cf.Size = UDim2.new(0, 260, 0, 120)
    cf.Position = UDim2.new(0.5, -130, 0.5, -60)
    cf.BackgroundColor3 = Color3.new(0, 0, 0)
    cf.ZIndex = 100 -- 🛠️ 关键修复：强制将整个弹窗层级调高，覆盖所有东西
    Instance.new("UICorner", cf)
    local s = Instance.new("UIStroke", cf); s.Color = Color3.new(1,1,1); s.Thickness = 2
    
    local t = Instance.new("TextLabel", cf)
    t.Size = UDim2.new(1, 0, 0.6, 0); t.BackgroundTransparency = 1; t.Text = "确定要运行\n["..name.."] 吗？"; t.TextColor3 = Color3.new(1,1,1); t.TextSize = 16; t.Font = "GothamBold"
    t.ZIndex = 101 -- 🛠️ 关键修复：文字层级比弹窗高

    local yes = Instance.new("TextButton", cf)
    yes.Size = UDim2.new(0.4, 0, 0.3, 0); yes.Position = UDim2.new(0.05, 0, 0.6, 0); yes.BackgroundColor3 = Color3.fromRGB(0, 150, 0); yes.Text = "确定执行"; yes.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", yes)
    yes.ZIndex = 101 -- 🛠️ 关键修复：按钮层级比弹窗高
    
    local no = Instance.new("TextButton", cf)
    no.Size = UDim2.new(0.4, 0, 0.3, 0); no.Position = UDim2.new(0.55, 0, 0.6, 0); no.BackgroundColor3 = Color3.fromRGB(150, 0, 0); no.Text = "取消"; no.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", no)
    no.ZIndex = 101 -- 🛠️ 关键修复：按钮层级比弹窗高
    
    yes.MouseButton1Click:Connect(function() cf:Destroy(); callback() end)
    no.MouseButton1Click:Connect(function() cf:Destroy() end)
end

-- DC 按钮 (顺位 2)
local DiscordBtn = Instance.new("TextButton", ScrollingFrame)
DiscordBtn.Name = "JOIN DISCORD"
DiscordBtn.LayoutOrder = 2
DiscordBtn.BackgroundColor3 = Color3.fromRGB(60, 80, 200)
DiscordBtn.Size = UDim2.new(0.9, 0, 0, 50)
DiscordBtn.Font = "GothamBold"
DiscordBtn.Text = "JOIN DISCORD"
DiscordBtn.TextColor3 = Color3.new(1, 1, 1)
DiscordBtn.TextSize = 18
DiscordBtn.ZIndex = 3 -- DC按钮层级低
Instance.new("UICorner", DiscordBtn)
DiscordBtn.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/cjpezEZub") end)

-- ✨ 第三个按钮：刘某某 V2.9 (带弹窗确认)
local V29Btn = Instance.new("TextButton", ScrollingFrame)
V29Btn.Name = "运行 刘某某 V2.9"
V29Btn.LayoutOrder = 3
V29Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- 黑白风格
V29Btn.Size = UDim2.new(0.9, 0, 0, 50)
V29Btn.Font = "GothamBold"
V29Btn.Text = "🌚 运行 刘某某 V2.9 🌚"
V29Btn.TextColor3 = Color3.new(1, 1, 1)
V29Btn.TextSize = 16
V29Btn.ZIndex = 3 -- 脚本按钮层级低
Instance.new("UICorner", V29Btn)

V29Btn.MouseButton1Click:Connect(function()
    ShowConfirm("刘某某 V2.9", function()
        -- 这里放入你发给我的 V2.9 核心逻辑代码
        print("V2.9 已成功加载")
    end)
end)
