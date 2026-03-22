-- [[ 🌚 刘某某·核心脚本 🌝 | Core V2.9 修复版 ]]
local _P = game:GetService("Players"); local _RS = game:GetService("RunService"); local _CG = game:GetService("CoreGui"); local _UIS = game:GetService("UserInputService")
local _LP = _P.LocalPlayer; local _Cam = workspace.CurrentCamera

local _G_LMM_88 = { v_0x1 = false, v_0x2 = false, v_0x3 = false, v_val_1 = 50, v_0x4 = false, v_val_2 = 50, v_esp_line = false, v_esp_box = false, c_esp = Color3.new(1,0,0), c_line = Color3.new(1,0,0), c_box = Color3.new(1,0,0) }
local _RGB = { Color = Color3.new(1,0,0) }; task.spawn(function() local c = 0 while true do c = (c + 0.005) % 1; _RGB.Color = Color3.fromHSV(c, 0.7, 1); task.wait(0.05) end end)

if _CG:FindFirstChild("LMM_Final_V36") then _CG.LMM_Final_V36:Destroy() end
local _S = Instance.new("ScreenGui", _CG); _S.Name = "LMM_Final_V36"; _S.ResetOnSpawn = false

local _M = Instance.new("Frame", _S); _M.Size = UDim2.new(0, 400, 0, 520); _M.Position = UDim2.new(0.02, 0, 0.25, 0); _M.BackgroundColor3 = Color3.fromRGB(15, 15, 15); Instance.new("UICorner", _M); local _Gl = Instance.new("UIStroke", _M); _Gl.Thickness = 3

-- [关键修复] 悬浮球：基于时间判定点击
local _Mini = Instance.new("TextButton", _S); _Mini.Size = UDim2.new(0, 65, 0, 65); _Mini.Position = _M.Position; _Mini.BackgroundColor3 = Color3.fromRGB(15, 15, 15); _Mini.Visible = false; _Mini.Text = ""; _Mini.ZIndex = 999; Instance.new("UICorner", _Mini).CornerRadius = UDim.new(1, 0); local _MS = Instance.new("UIStroke", _Mini); _MS.Thickness = 3

_RS.Heartbeat:Connect(function() _Gl.Color = _RGB.Color; _MS.Color = _RGB.Color end)

local _mD, _mS, _mP, _pT
_Mini.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then _mD = true; _pT = tick(); _mS = i.Position; _mP = _Mini.Position end end)
_UIS.InputChanged:Connect(function(i) if _mD and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then local d = i.Position - _mS; _Mini.Position = UDim2.new(_mP.X.Scale, _mP.X.Offset + d.X, _mP.Y.Scale, _mP.Y.Offset + d.Y) end end)

-- 点击判定：少于 0.2 秒视为点击返回
_Mini.MouseButton1Up:Connect(function() if tick() - _pT < 0.2 then _M.Position = _Mini.Position; _M.Visible = true; _Mini.Visible = false; _mD = false end end)

-- 功能按钮 UI (行走速度, 飞行, 透视等)
local _TB = Instance.new("Frame", _M); _TB.Size = UDim2.new(1, 0, 0, 55); _TB.BackgroundTransparency = 1; _TB.Active = true
local function _Ctrl(t, x, c, f) local b = Instance.new("TextButton", _TB); b.Size = UDim2.new(0, 32, 0, 32); b.Position = UDim2.new(1, x, 0.5, -16); b.Text = t; b.BackgroundColor3 = c; b.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", b); b.MouseButton1Click:Connect(f) end
_Ctrl("×", -45, Color3.fromRGB(180, 50, 50), function() _S:Destroy() end)
_Ctrl("—", -90, Color3.fromRGB(50, 50, 50), function() _M.Visible = false; _Mini.Position = _M.Position; _Mini.Visible = true end)

-- ...此处保持你提供的 V2.9 完整驱动逻辑（ESP/Fly/Speed等）...
-- (为了节省回复长度，你把刚才发我的核心逻辑继续贴在后面即可)
