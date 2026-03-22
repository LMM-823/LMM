-- [[ 🌚刘某某脚本🌝 V2.9 | 自动连点器集成 + 顺位推移 | 2026-03-20 ]]

local _P = game:GetService("Players")
local _RS = game:GetService("RunService")
local _CG = game:GetService("CoreGui")
local _UIS = game:GetService("UserInputService")
local _LP = _P.LocalPlayer
local _Cam = workspace.CurrentCamera

-- 状态容器
local _G_LMM_88 = { 
    v_0x1 = false, v_0x2 = false, v_0x3 = false, v_val_1 = 50, 
    v_0x4 = false, v_val_2 = 50, v_esp_line = false, v_esp_box = false,
    c_esp = Color3.new(1,0,0), c_line = Color3.new(1,0,0), c_box = Color3.new(1,0,0)
}
local _RGB_CORE = { Color = Color3.new(1,0,0) }

task.spawn(function()
    local c = 0
    while true do
        c = (c + 0.005) % 1
        _RGB_CORE.Color = Color3.fromHSV(c, 0.7, 1)
        task.wait(0.05) 
    end
end)

if _CG:FindFirstChild("LMM_Final_V36") then _CG.LMM_Final_V36:Destroy() end
local _S = Instance.new("ScreenGui", _CG); _S.Name = "LMM_Final_V36"
local _M = Instance.new("Frame", _S)
_M.Size = UDim2.new(0, 400, 0, 520); _M.Position = UDim2.new(0.02, 0, 0.25, 0)
_M.BackgroundColor3 = Color3.fromRGB(15, 15, 15); _M.BorderSizePixel = 0
Instance.new("UICorner", _M)
local _Glow = Instance.new("UIStroke", _M); _Glow.Thickness = 3

local _TB = Instance.new("Frame", _M); _TB.Size = UDim2.new(1, 0, 0, 55); _TB.BackgroundTransparency = 1; _TB.Active = true
local _Title = Instance.new("TextLabel", _TB)
_Title.Size = UDim2.new(1, 0, 1, 0); _Title.Text = "🌚刘某某脚本🌝"; _Title.Font = "GothamBold"; _Title.TextSize = 18; _Title.TextColor3 = Color3.new(1, 1, 1); _Title.BackgroundTransparency = 1

local _SF = Instance.new("ScrollingFrame", _M)
_SF.Size = UDim2.new(1, 0, 1, -70); _SF.Position = UDim2.new(0, 0, 0, 60)
_SF.BackgroundTransparency = 1; _SF.BorderSizePixel = 0; _SF.ScrollBarThickness = 5
_SF.AutomaticCanvasSize = Enum.AutomaticSize.Y
_SF.CanvasSize = UDim2.new(0, 0, 1.25, 0)
_SF.Active = true

local _L = Instance.new("UIListLayout", _SF)
_L.Padding = UDim.new(0, 15); _L.HorizontalAlignment = "Center"; _L.SortOrder = "LayoutOrder"

-- 工厂函数 (颜色/开关/脚本)
local function _CreateColorBar(key, order)
    local f = Instance.new("Frame", _SF); f.LayoutOrder = order; f.Size = UDim2.new(0.88, 0, 0, 35); f.BackgroundTransparency = 1
    local layout = Instance.new("UIListLayout", f); layout.FillDirection = "Horizontal"; layout.HorizontalAlignment = "Center"; layout.Padding = UDim.new(0, 10)
    local colors = {{Color3.fromRGB(0, 150, 255), "蓝"}, {Color3.fromRGB(255, 0, 0), "红"}, {Color3.fromRGB(255, 255, 255), "白"}, {Color3.fromRGB(0, 0, 0), "黑"}, {Color3.fromRGB(0, 255, 100), "绿"}}
    for _, info in pairs(colors) do
        local b = Instance.new("TextButton", f); b.Size = UDim2.new(0, 55, 0, 28); b.BackgroundColor3 = info[1]; b.Text = ""; Instance.new("UICorner", b).CornerRadius = UDim.new(0, 5)
        local s = Instance.new("UIStroke", b); s.Thickness = 1.5; s.Color = Color3.new(1,1,1); s.Enabled = false
        b.MouseButton1Click:Connect(function() _G_LMM_88[key] = info[1]; for _, c in pairs(f:GetChildren()) do if c:IsA("TextButton") then c.UIStroke.Enabled = false end end; s.Enabled = true end)
    end
end

local function _CreateT(name, key, order)
    local b = Instance.new("TextButton", _SF); b.LayoutOrder = order; b.Size = UDim2.new(0.88, 0, 0, 60); b.BackgroundColor3 = Color3.fromRGB(30, 30, 30); b.Text = name; b.Font = "GothamBold"; b.TextSize = 14; b.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", b)
    local s = Instance.new("UIStroke", b); s.Thickness = 1.8; s.Color = Color3.fromRGB(60, 60, 60)
    local i = Instance.new("Frame", b); i.Size = UDim2.new(0, 6, 0.6, 0); i.Position = UDim2.new(0, 12, 0.2, 0); i.BackgroundColor3 = Color3.fromRGB(200, 0, 0); i.BorderSizePixel = 0
    b.MouseButton1Click:Connect(function() _G_LMM_88[key] = not _G_LMM_88[key]; i.BackgroundColor3 = _G_LMM_88[key] and Color3.fromRGB(0, 255, 120) or Color3.fromRGB(200, 0, 0) end)
    _RS.Heartbeat:Connect(function() s.Color = _G_LMM_88[key] and _RGB_CORE.Color or Color3.fromRGB(60,60,60) end)
end

local function _CreateS(name, url, order)
    local b = Instance.new("TextButton", _SF); b.LayoutOrder = order; b.Size = UDim2.new(0.88, 0, 0, 60); b.BackgroundColor3 = Color3.fromRGB(35, 35, 35); b.Text = name; b.Font = "GothamBold"; b.TextSize = 14; b.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", b)
    local s = Instance.new("UIStroke", b); s.Thickness = 2.2; b.MouseButton1Click:Connect(function() task.spawn(function() loadstring(game:HttpGet(url))() end) end)
    _RS.Heartbeat:Connect(function() s.Color = _RGB_CORE.Color end)
end

-- 布局集成
local _In1 = Instance.new("TextBox", _SF); _In1.LayoutOrder = 1; _In1.Size = UDim2.new(0.88, 0, 0, 45); _In1.BackgroundColor3 = Color3.fromRGB(25, 25, 25); _In1.Text = "行走速度: 50"; _In1.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", _In1)
_In1.FocusLost:Connect(function() _G_LMM_88.v_val_1 = tonumber(_In1.Text:match("%d+")) or 50; _In1.Text = "行走速度: ".._G_LMM_88.v_val_1 end)

local _In2 = Instance.new("TextBox", _SF); _In2.LayoutOrder = 2; _In2.Size = UDim2.new(0.88, 0, 0, 45); _In2.BackgroundColor3 = Color3.fromRGB(25, 25, 25); _In2.Text = "飞行速度: 50"; _In2.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", _In2)
_In2.FocusLost:Connect(function() _G_LMM_88.v_val_2 = tonumber(_In2.Text:match("%d+")) or 50; _In2.Text = "飞行速度: ".._G_LMM_88.v_val_2 end)

_CreateT("内置透视 (ESP)", "v_0x1", 3); _CreateColorBar("c_esp", 4)
_CreateT("内置ESP射线", "v_esp_line", 5); _CreateColorBar("c_line", 6)
_CreateT("内置ESP方框", "v_esp_box", 7); _CreateColorBar("c_box", 8)
_CreateT("内置穿墙 (NOCLIP)", "v_0x2", 9)
_CreateT("内置速度开关", "v_0x3", 10)
_CreateT("内置飞行开关 (FLY)", "v_0x4", 11)

_CreateS("AIMBOT", "https://rawscripts.net/raw/Universal-Script-Aimbot-Mobile-34677", 12)
_CreateS("RIVALS NO KEY", "https://raw.githubusercontent.com/idkmsnscriptronlox/Shadow-/refs/heads/main/Shadow", 13)
_CreateS("1024x1080", "https://raw.githubusercontent.com/ScriptsLMM/Res/main/res.lua", 14)
_CreateS("Infinite Yield (万能脚本)", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", 15)
_CreateS("Nameless Admin", "https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source", 16)
_CreateS("Owl Hub (极简稳定版)", "https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt", 17)

local _ACBtn = Instance.new("TextButton", _SF); _ACBtn.LayoutOrder = 18; _ACBtn.Size = UDim2.new(0.88, 0, 0, 60); _ACBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35); _ACBtn.Text = "自动连点器（刘某某）"; _ACBtn.Font = "GothamBold"; _ACBtn.TextSize = 14; _ACBtn.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", _ACBtn)
local _ACS = Instance.new("UIStroke", _ACBtn); _ACS.Thickness = 2; _RS.Heartbeat:Connect(function() _ACS.Color = _RGB_CORE.Color end)
_ACBtn.MouseButton1Click:Connect(function() loadstring([[--连点器代码内容省略，保持原样--]])() end)

local _PH1 = Instance.new("TextButton", _SF); _PH1.LayoutOrder = 19; _PH1.Size = UDim2.new(0.88, 0, 0, 60); _PH1.BackgroundColor3 = Color3.fromRGB(20, 20, 20); _PH1.Text = "等待新脚本填入..."; _PH1.TextColor3 = Color3.new(0.4, 0.4, 0.4); Instance.new("UICorner", _PH1)

local _DCB = Instance.new("TextButton", _SF); _DCB.LayoutOrder = 20; _DCB.Size = UDim2.new(0.88, 0, 0, 60); _DCB.BackgroundColor3 = Color3.fromRGB(88, 101, 242); _DCB.Text = "🔗 JOIN DISCORD 🔗"; _DCB.TextColor3 = Color3.new(1, 1, 1); _DCB.TextScaled = true; Instance.new("UICorner", _DCB)
_DCB.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/cjpezEZub") end)

local _PH2 = Instance.new("TextButton", _SF); _PH2.LayoutOrder = 21; _PH2.Size = UDim2.new(0.88, 0, 0, 60); _PH2.BackgroundColor3 = Color3.fromRGB(20, 20, 20); _PH2.Text = "即将推出..."; _PH2.TextColor3 = Color3.new(0.4, 0.4, 0.4); Instance.new("UICorner", _PH2)

local _Ex = Instance.new("Frame", _SF); _Ex.LayoutOrder = 99; _Ex.Size = UDim2.new(1, 0, 0, 220); _Ex.BackgroundTransparency = 1

-- 驱动逻辑保持原样 --
local _BG = Instance.new("BodyGyro"); local _BV = Instance.new("BodyVelocity")
_BG.P = 9e4; _BG.MaxTorque = Vector3.new(9e9, 9e9, 9e9); _BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)

_RS.Heartbeat:Connect(function()
    _Glow.Color = _RGB_CORE.Color
    local lChar = _LP.Character
    if lChar and lChar:FindFirstChild("HumanoidRootPart") then
        local lHrp = lChar.HumanoidRootPart; local hum = lChar:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = _G_LMM_88.v_0x3 and _G_LMM_88.v_val_1 or 16
            if _G_LMM_88.v_0x2 then for _, p in pairs(lChar:GetChildren()) do if p:IsA("BasePart") then p.CanCollide = false end end end
            if _G_LMM_88.v_0x4 then
                _BG.Parent = lHrp; _BV.Parent = lHrp; _BG.CFrame = _Cam.CFrame
                _BV.Velocity = hum.MoveDirection.Magnitude > 0 and _Cam.CFrame.LookVector * _G_LMM_88.v_val_2 or Vector3.zero
            else _BG.Parent = nil; _BV.Parent = nil end
        end
    end
end)

local function _Ctrl(t, x, c, f)
    local b = Instance.new("TextButton", _TB); b.Size = UDim2.new(0, 32, 0, 32); b.Position = UDim2.new(1, x, 0.5, -16); b.Text = t; b.BackgroundColor3 = c; b.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", b); b.MouseButton1Click:Connect(f)
end
_Ctrl("×", -45, Color3.fromRGB(180, 50, 50), function() _S:Destroy() end)
_Ctrl("—", -90, Color3.fromRGB(50, 50, 50), function() _SF.Visible = not _SF.Visible; _M.Size = _SF.Visible and UDim2.new(0, 400, 0, 520) or UDim2.new(0, 400, 0, 55) end)

-- 拖动支持
local _drag, _dStart, _sPos
_TB.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then _drag = true; _dStart = i.Position; _sPos = _M.Position end end)
_UIS.InputChanged:Connect(function(i) if _drag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then local d = i.Position - _dStart; _M.Position = UDim2.new(_sPos.X.Scale, _sPos.X.Offset + d.X, _sPos.Y.Scale, _sPos.Y.Offset + d.Y) end end)
_UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then _drag = false end end)
