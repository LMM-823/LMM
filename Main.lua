-- [[ 🌚 刘某某·全能黑盒 🌝 | Main 入口 ]]
local _CG = game:GetService("CoreGui"); local _UIS = game:GetService("UserInputService"); local _TS = game:GetService("TweenService")

if _CG:FindFirstChild("LMM_BlackBox_V3") then _CG.LMM_BlackBox_V3:Destroy() end
local _S = Instance.new("ScreenGui", _CG); _S.Name = "LMM_BlackBox_V3"; _S.ResetOnSpawn = false

-- 主背景：黑色背景，白色边框
local _M = Instance.new("Frame", _S); _M.Size = UDim2.new(0, 420, 0, 500); _M.Position = UDim2.new(0.5, -210, 0.5, -250); _M.BackgroundColor3 = Color3.new(0,0,0); _M.BorderSizePixel = 0; Instance.new("UICorner", _M)
local _B = Instance.new("UIStroke", _M); _B.Thickness = 2; _B.Color = Color3.new(1,1,1)

-- [顺位 1] 搜索框
local _Search = Instance.new("TextBox", _M); _Search.Size = UDim2.new(0.9, 0, 0, 40); _Search.Position = UDim2.new(0.05, 0, 0.1, 0); _Search.PlaceholderText = "🔍 搜索脚本..."; _Search.Text = ""; _Search.BackgroundColor3 = Color3.fromRGB(30, 30, 30); _Search.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", _Search)

local _SF = Instance.new("ScrollingFrame", _M); _SF.Size = UDim2.new(0.9, 0, 0.75, 0); _SF.Position = UDim2.new(0.05, 0, 0.22, 0); _SF.BackgroundTransparency = 1; _SF.ScrollBarThickness = 2; _SF.AutomaticCanvasSize = "Y"
local _L = Instance.new("UIListLayout", _SF); _L.Padding = UDim.new(0, 10); _L.HorizontalAlignment = "Center"

-- 按钮动画：按下缩小，松开放大
local function ApplyAnim(b)
    b.MouseButton1Down:Connect(function() _TS:Create(b, TweenInfo.new(0.1), {Size = UDim2.new(0.95, 0, 0, 45)}):Play() end)
    b.MouseButton1Up:Connect(function() _TS:Create(b, TweenInfo.new(1, Enum.EasingStyle.Elastic), {Size = UDim2.new(1, 0, 0, 50)}):Play() end)
end

-- 二次确认 UI
local function ShowConfirm(name, cb)
    local cf = Instance.new("Frame", _S); cf.Size = UDim2.new(0, 300, 0, 150); cf.Position = UDim2.new(0.5, -150, 0.5, -75); cf.BackgroundColor3 = Color3.new(0,0,0); cf.ZIndex = 100; Instance.new("UICorner", cf); Instance.new("UIStroke", cf).Color = Color3.new(1,1,1)
    local t = Instance.new("TextLabel", cf); t.Size = UDim2.new(1, 0, 0.6, 0); t.Text = "确定运行\n"..name.."?"; t.TextColor3 = Color3.new(1,1,1); t.BackgroundTransparency = 1; t.TextSize = 18
    local y = Instance.new("TextButton", cf); y.Size = UDim2.new(0.4, 0, 0.3, 0); y.Position = UDim2.new(0.05, 0, 0.6, 0); y.Text = "确定"; y.BackgroundColor3 = Color3.fromRGB(0, 150, 0); y.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", y)
    local n = Instance.new("TextButton", cf); n.Size = UDim2.new(0.4, 0, 0.3, 0); n.Position = UDim2.new(0.55, 0, 0.6, 0); n.Text = "取消"; n.BackgroundColor3 = Color3.fromRGB(150, 0, 0); n.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", n)
    y.MouseButton1Click:Connect(function() cf:Destroy(); cb() end); n.MouseButton1Click:Connect(function() cf:Destroy() end)
end

local function CreateBtn(name, col, cb, conf)
    local b = Instance.new("TextButton", _SF); b.Size = UDim2.new(1, 0, 0, 50); b.BackgroundColor3 = col; b.Text = name; b.TextColor3 = Color3.new(1,1,1); b.Font = "GothamBold"; b.TextSize = 16; Instance.new("UICorner", b)
    ApplyAnim(b); b.MouseButton1Click:Connect(function() if conf then ShowConfirm(name, cb) else cb() end end)
end

-- [顺位 2] Discord 按钮
CreateBtn("🔵 JOIN DISCORD 🔵", Color3.fromRGB(88, 101, 242), function() setclipboard("https://discord.gg/cjpezEZub") end, false)

-- [顺位 3] 刘某某 V2.9 脚本按钮
CreateBtn("🌚 运行 刘某某 V2.9 🌚", Color3.fromRGB(40, 40, 40), function()
    -- 通过 loadstring 加载你的 Core.lua
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LMM-823/LMM/main/Core.lua"))()
end, true)

-- 搜索与关闭逻辑
_Search.Changed:Connect(function() local t = _Search.Text:lower(); for _, v in pairs(_SF:GetChildren()) do if v:IsA("TextButton") then v.Visible = v.Text:lower():find(t) and true or false end end end)
local _Cl = Instance.new("TextButton", _M); _Cl.Size = UDim2.new(0, 30, 0, 30); _Cl.Position = UDim2.new(1, -40, 0, 5); _Cl.Text = "×"; _Cl.BackgroundColor3 = Color3.fromRGB(200, 0, 0); _Cl.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", _Cl); _Cl.MouseButton1Click:Connect(function() _S:Destroy() end)

-- 拖动逻辑
local _d, _dS, _sP; _M.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then _d = true; _dS = i.Position; _sP = _M.Position end end)
_UIS.InputChanged:Connect(function(i) if _d and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then local d = i.Position - _dS; _M.Position = UDim2.new(_sP.X.Scale, _sP.X.Offset + d.X, _sP.Y.Scale, _sP.Y.Offset + d.Y) end end)
_UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then _d = false end end)
