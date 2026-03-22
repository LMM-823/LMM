-- [[ 🌚刘某某脚本🌝 | 搜索增强 + 确认UI版 | 2026-03-22 ]]
local _P = game:GetService("Players")
local _CG = game:GetService("CoreGui")
local _UIS = game:GetService("UserInputService")
local _LP = _P.LocalPlayer

-- 清理旧界面
if _CG:FindFirstChild("LMM_Final_V36") then _CG.LMM_Final_V36:Destroy() end

local _S = Instance.new("ScreenGui", _CG); _S.Name = "LMM_Final_V36"
local _M = Instance.new("Frame", _S)
_M.Size = UDim2.new(0, 400, 0, 520); _M.Position = UDim2.new(0.5, -200, 0.5, -260)
_M.BackgroundColor3 = Color3.fromRGB(15, 15, 15); _M.BorderSizePixel = 0
Instance.new("UICorner", _M)
local _Glow = Instance.new("UIStroke", _M); _Glow.Thickness = 2; _Glow.Color = Color3.new(1,1,1)

-- 标题栏
local _TB = Instance.new("Frame", _M); _TB.Size = UDim2.new(1, 0, 0, 45); _TB.BackgroundTransparency = 1; _TB.Active = true
local _Title = Instance.new("TextLabel", _TB)
_Title.Size = UDim2.new(1, 0, 1, 0); _Title.Text = "🌚刘某某脚本库🌝"; _Title.Font = "GothamBold"; _Title.TextSize = 16; _Title.TextColor3 = Color3.new(1, 1, 1); _Title.BackgroundTransparency = 1

-- 【新增：搜索框】
local _SearchBox = Instance.new("TextBox", _M)
_SearchBox.Size = UDim2.new(0.9, 0, 0, 35); _SearchBox.Position = UDim2.new(0.05, 0, 0, 50)
_SearchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30); _SearchBox.Text = ""; _SearchBox.PlaceholderText = "输入脚本名称搜索..."; _SearchBox.TextColor3 = Color3.new(1,1,1); _SearchBox.Font = "Gotham"; _SearchBox.TextSize = 14
local _SBStroke = Instance.new("UIStroke", _SearchBox); _SBStroke.Color = Color3.new(1,1,1); _SBStroke.Thickness = 1; Instance.new("UICorner", _SearchBox)

-- 滚动区域
local _SF = Instance.new("ScrollingFrame", _M)
_SF.Size = UDim2.new(1, 0, 1, -100); _SF.Position = UDim2.new(0, 0, 0, 95)
_SF.BackgroundTransparency = 1; _SF.BorderSizePixel = 0; _SF.ScrollBarThickness = 4
_SF.AutomaticCanvasSize = Enum.AutomaticSize.Y; _SF.CanvasSize = UDim2.new(0, 0, 0, 0)

local _L = Instance.new("UIListLayout", _SF)
_L.Padding = UDim.new(0, 10); _L.HorizontalAlignment = "Center"; _L.SortOrder = "LayoutOrder"

-- 【新增：确认 UI 窗口】
local function ShowConfirm(name, callback)
    local _CF = Instance.new("Frame", _S)
    _CF.Size = UDim2.new(0, 260, 0, 140); _CF.Position = UDim2.new(0.5, -130, 0.5, -70); _CF.BackgroundColor3 = Color3.fromRGB(20, 20, 20); _CF.ZIndex = 10
    local _CS = Instance.new("UIStroke", _CF); _CS.Color = Color3.new(1,1,1); _CS.Thickness = 2; Instance.new("UICorner", _CF)
    
    local _CT = Instance.new("TextLabel", _CF); _CT.Size = UDim2.new(1, 0, 0, 60); _CT.Text = "确定运行\n["..name.."] 吗?"; _CT.TextColor3 = Color3.new(1,1,1); _CT.BackgroundTransparency = 1; _CT.TextSize = 14; _CT.Font = "GothamBold"
    
    local _Yes = Instance.new("TextButton", _CF); _Yes.Size = UDim2.new(0, 100, 0, 35); _Yes.Position = UDim2.new(0.1, 0, 0.65, 0); _Yes.Text = "确定"; _Yes.BackgroundColor3 = Color3.fromRGB(40, 40, 40); _Yes.TextColor3 = Color3.new(0, 1, 0)
    local _No = Instance.new("TextButton", _CF); _No.Size = UDim2.new(0, 100, 0, 35); _No.Position = UDim2.new(0.55, 0, 0.65, 0); _No.Text = "取消"; _No.BackgroundColor3 = Color3.fromRGB(40, 40, 40); _No.TextColor3 = Color3.new(1, 0, 0)
    Instance.new("UICorner", _Yes); Instance.new("UICorner", _No)
    Instance.new("UIStroke", _Yes).Color = Color3.new(1,1,1); Instance.new("UIStroke", _No).Color = Color3.new(1,1,1)

    _Yes.MouseButton1Click:Connect(function() callback(); _CF:Destroy() end)
    _No.MouseButton1Click:Connect(function() _CF:Destroy() end)
end

-- 按钮创建函数
local function _CreateS(name, url, order)
    local b = Instance.new("TextButton", _SF); b.LayoutOrder = order; b.Size = UDim2.new(0.9, 0, 0, 50); b.BackgroundColor3 = Color3.fromRGB(30, 30, 30); b.Text = name; b.Font = "GothamBold"; b.TextSize = 14; b.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", b)
    local s = Instance.new("UIStroke", b); s.Thickness = 1.5; s.Color = Color3.fromRGB(100, 100, 100)
    
    b.MouseButton1Click:Connect(function()
        ShowConfirm(name, function()
            task.spawn(function() loadstring(game:HttpGet(url))() end)
        end)
    end)
end

-- 搜索过滤逻辑
_SearchBox.GetPropertyChangedSignal("Text"):Connect(function()
    local input = _SearchBox.Text:lower()
    for _, item in pairs(_SF:GetChildren()) do
        if item:IsA("TextButton") then
            item.Visible = item.Text:lower():find(input) and true or false
        end
    end
end)

-- 按钮列表 (按你的顺位)
_CreateS("AIMBOT", "https://rawscripts.net/raw/Universal-Script-Aimbot-Mobile-34677", 1)
_CreateS("RIVALS NO KEY", "https://raw.githubusercontent.com/idkmsnscriptronlox/Shadow-/refs/heads/main/Shadow", 2)
_CreateS("1024x1080", "https://raw.githubusercontent.com/ScriptsLMM/Res/main/res.lua", 3)
_CreateS("Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", 4)

-- 窗口控制
local function _Ctrl(t, x, c, f)
    local b = Instance.new("TextButton", _TB); b.Size = UDim2.new(0, 30, 0, 30); b.Position = UDim2.new(1, x, 0.5, -15); b.Text = t; b.BackgroundColor3 = c; b.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", b); b.MouseButton1Click:Connect(f)
end
_Ctrl("×", -40, Color3.fromRGB(150, 50, 50), function() _S:Destroy() end)
_Ctrl("—", -80, Color3.fromRGB(60, 60, 60), function() _SF.Visible = not _SF.Visible; _SearchBox.Visible = _SF.Visible; _M.Size = _SF.Visible and UDim2.new(0, 400, 0, 520) or UDim2.new(0, 400, 0, 45) end)

-- 拖动
local d, ds, sp; _TB.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then d = true; ds = i.Position; sp = _M.Position end end)
_UIS.InputChanged:Connect(function(i) if d and i.UserInputType == Enum.UserInputType.MouseMovement then local delta = i.Position - ds; _M.Position = UDim2.new(sp.X.Scale, sp.X.Offset + delta.X, sp.Y.Scale, sp.Y.Offset + delta.Y) end end)
_UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then d = false end end)
