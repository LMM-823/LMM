-- [[ 🌚 刘某某·核心功能 | Core ]]
local _CG = game:GetService("CoreGui"); local _UIS = game:GetService("UserInputService")
if _CG:FindFirstChild("LMM_Core_UI") then _CG.LMM_Core_UI:Destroy() end
local _S = Instance.new("ScreenGui", _CG); _S.Name = "LMM_Core_UI"

-- 核心菜单界面
local _M = Instance.new("Frame", _S); _M.Size = UDim2.new(0, 400, 0, 520); _M.Position = UDim2.new(0.02, 0, 0.25, 0); _M.BackgroundColor3 = Color3.fromRGB(15,15,15); Instance.new("UICorner", _M)
local _Gl = Instance.new("UIStroke", _M); _Gl.Thickness = 3; _Gl.Color = Color3.new(1,0,0) -- 这里的颜色会随 RGB 变化

-- 【恢复：悬浮球】
local _Mini = Instance.new("TextButton", _S); _Mini.Size = UDim2.new(0, 65, 0, 65); _Mini.Visible = false; _Mini.Text = ""; _Mini.BackgroundColor3 = Color3.new(0,0,0); Instance.new("UICorner", _Mini).CornerRadius = UDim.new(1,0)
local _MS = Instance.new("UIStroke", _Mini); _MS.Thickness = 3; _MS.Color = Color3.new(1,0,0)

-- 【恢复：减号和打叉】
local _TB = Instance.new("Frame", _M); _TB.Size = UDim2.new(1, 0, 0, 55); _TB.BackgroundTransparency = 1
local function _Ctrl(t, x, c, f)
    local b = Instance.new("TextButton", _TB); b.Size = UDim2.new(0, 32, 0, 32); b.Position = UDim2.new(1, x, 0.5, -16); b.Text = t; b.BackgroundColor3 = c; b.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", b); b.MouseButton1Click:Connect(f)
end

-- 减号：隐藏菜单，显示球
_Ctrl("—", -90, Color3.fromRGB(50, 50, 50), function() 
    _M.Visible = false; _Mini.Position = _M.Position; _Mini.Visible = true 
end)

-- 打叉：彻底关闭功能
_Ctrl("×", -45, Color3.fromRGB(180, 50, 50), function() _S:Destroy() end)

-- 悬浮球点击恢复逻辑
local _pT = 0
_Mini.MouseButton1Down:Connect(function() _pT = tick() end)
_Mini.MouseButton1Up:Connect(function() if tick() - _pT < 0.2 then _M.Position = _Mini.Position; _M.Visible = true; _Mini.Visible = false end end)
