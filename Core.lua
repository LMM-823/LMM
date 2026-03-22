-- [[ 🌚刘某某脚本🌝 | 纯净白边最终版 | Core.lua ]]

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
UIStroke.Color = Color3.new(1, 1, 1) -- 纯白色边框

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

-- 🛠️ 功能按钮 (打叉和减号)
local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.Size = UDim2.new(0, 30, 0, 30); CloseBtn.Position = UDim2.new(1, -35, 0, 5); CloseBtn.BackgroundTransparency = 1; CloseBtn.Text = "×"; CloseBtn.TextColor3 = Color3.fromRGB(255, 50, 50); CloseBtn.TextSize = 25; CloseBtn.MouseButton1Click:Connect(function() LMM_V4:Destroy() end)

local MinBtn = Instance.new("TextButton", MainFrame)
MinBtn.Size = UDim2.new(0, 30, 0, 30); MinBtn.Position = UDim2.new(1, -70, 0, 5); MinBtn.BackgroundTransparency = 1; MinBtn.Text = "-"; MinBtn.TextColor3 = Color3.new(1, 1, 1); MinBtn.TextSize = 25
local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    ScrollingFrame.Visible = not minimized
    MainFrame:TweenSize(minimized and UDim2.new(0, 330, 0, 40) or UDim2.new(0, 330, 0, 350), "Out", "Quad", 0.3, true)
end)

-- 滚动区域
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

-- [[ 确认弹窗 UI ]]
local function ShowConfirm(name, callback)
    local cf = Instance.new("Frame", LMM_V4)
    cf.Size = UDim2.new(0, 260, 0, 120); cf.Position = UDim2.new(0.5, -130, 0.5, -60); cf.BackgroundColor3 = Color3.new(0, 0, 0); cf.ZIndex = 2000
    Instance.new("UIStroke", cf).Color = Color3.new(1,1,1); Instance.new("UICorner", cf)
    local t = Instance.new("TextLabel", cf)
    t.Size = UDim2.new(1, 0, 0.6, 0); t.BackgroundTransparency = 1; t.Text = "确定要运行\n["..name.."] 吗？"; t.TextColor3 = Color3.new(1,1,1); t.ZIndex = 2001; t.Font = "GothamBold"
    local yes = Instance.new("TextButton", cf)
    yes.Size = UDim2.new(0.4, 0, 0.3, 0); yes.Position = UDim2.new(0.05, 0, 0.6, 0); yes.BackgroundColor3 = Color3.fromRGB(0, 150, 0); yes.Text = "确定执行"; yes.TextColor3 = Color3.new(1,1,1); yes.ZIndex = 2001; Instance.new("UICorner", yes)
    local no = Instance.new("TextButton", cf)
    no.Size = UDim2.new(0.4, 0, 0.3, 0); no.Position = UDim2.new(0.55, 0, 0.6, 0); no.BackgroundColor3 = Color3.fromRGB(150, 0, 0); no.Text = "取消"; no.TextColor3 = Color3.new(1,1,1); no.ZIndex = 2001; Instance.new("UICorner", no)
    yes.MouseButton1Click:Connect(function() cf:Destroy(); callback() end)
    no.MouseButton1Click:Connect(function() cf:Destroy() end)
end

-- 按钮 2: Discord
local DiscordBtn = Instance.new("TextButton", ScrollingFrame)
DiscordBtn.Size = UDim2.new(0.9, 0, 0, 50); DiscordBtn.BackgroundColor3 = Color3.fromRGB(60, 80, 200); DiscordBtn.Text = "JOIN DISCORD"; DiscordBtn.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", DiscordBtn)
DiscordBtn.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/cjpezEZub") end)

-- 🛠️ 按钮 3: 严格修改点 - 注入 V2.9 核心逻辑
local V29Btn = Instance.new("TextButton", ScrollingFrame)
V29Btn.Size = UDim2.new(0.9, 0, 0, 50); V29Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35); V29Btn.Text = "🌚 运行 刘某某 V2.9 🌚"; V29Btn.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", V29Btn)

V29Btn.MouseButton1Click:Connect(function()
    ShowConfirm("刘某某 V2.9", function()
        -- 核心逻辑开始
        local _P = game:GetService("Players"); local _RS = game:GetService("RunService"); local _CG = game:GetService("CoreGui"); local _UIS = game:GetService("UserInputService")
        local _LP = _P.LocalPlayer; local _Cam = workspace.CurrentCamera
        local _G_LMM_88 = { v_0x1 = false, v_0x2 = false, v_0x3 = false, v_val_1 = 50, v_0x4 = false, v_val_2 = 50, v_esp_line = false, v_esp_box = false, c_esp = Color3.new(1,0,0), c_line = Color3.new(1,0,0), c_box = Color3.new(1,0,0) }
        local _RGB_CORE = { Color = Color3.new(1,0,0) }
        task.spawn(function() local c = 0 while true do c = (c + 0.005) % 1; _RGB_CORE.Color = Color3.fromHSV(c, 0.7, 1); task.wait(0.05) end end)
        if _CG:FindFirstChild("LMM_Final_V36") then _CG.LMM_Final_V36:Destroy() end
        local _S = Instance.new("ScreenGui", _CG); _S.Name = "LMM_Final_V36"; _S.ResetOnSpawn = false
        local _M = Instance.new("Frame", _S); _M.Size = UDim2.new(0, 400, 0, 520); _M.Position = UDim2.new(0.02, 0, 0.25, 0); _M.BackgroundColor3 = Color3.fromRGB(15, 15, 15); _M.BorderSizePixel = 0; Instance.new("UICorner", _M); local _Glow = Instance.new("UIStroke", _M); _Glow.Thickness = 3
        local _Mini = Instance.new("TextButton", _S); _Mini.Name = "MiniButton"; _Mini.Size = UDim2.new(0, 65, 0, 65); _Mini.Position = _M.Position; _Mini.BackgroundColor3 = Color3.fromRGB(15, 15, 15); _Mini.Visible = false; _Mini.Text = ""; _Mini.AutoButtonColor = false; _Mini.ZIndex = 999; Instance.new("UICorner", _Mini).CornerRadius = UDim.new(1, 0)
        local _MStroke = Instance.new("UIStroke", _Mini); _MStroke.Thickness = 3; _MStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        _RS.Heartbeat:Connect(function() _Glow.Color = _RGB_CORE.Color; _MStroke.Color = _RGB_CORE.Color end)
        local _mDragging, _mStart, _mPos, _pressTime
        _Mini.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then _mDragging = true; _pressTime = tick(); _mStart = input.Position; _mPos = _Mini.Position; input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then _mDragging = false end end) end end)
        _UIS.InputChanged:Connect(function(input) if _mDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then local delta = input.Position - _mStart; _Mini.Position = UDim2.new(_mPos.X.Scale, _mPos.X.Offset + delta.X, _mPos.Y.Scale, _mPos.Y.Offset + delta.Y) end end)
        _Mini.MouseButton1Up:Connect(function() if tick() - _pressTime < 0.2 then _M.Position = _Mini.Position; _M.Visible = true; _Mini.Visible = false end end)
        local _TB2 = Instance.new("Frame", _M); _TB2.Size = UDim2.new(1, 0, 0, 55); _TB2.BackgroundTransparency = 1; _TB2.Active = true
        local _Title2 = Instance.new("TextLabel", _TB2); _Title2.Size = UDim2.new(1, 0, 1, 0); _Title2.Text = "🌚刘某某脚本🌝"; _Title2.Font = "GothamBold"; _Title2.TextSize = 18; _Title2.TextColor3 = Color3.new(1, 1, 1); _Title2.BackgroundTransparency = 1
        local _SF2 = Instance.new("ScrollingFrame", _M); _SF2.Size = UDim2.new(1, 0, 1, -70); _SF2.Position = UDim2.new(0, 0, 0, 60); _SF2.BackgroundTransparency = 1; _SF2.ScrollBarThickness = 12; _SF2.AutomaticCanvasSize = Enum.AutomaticSize.Y; _SF2.CanvasSize = UDim2.new(0, 0, 1.25, 0); _SF2.Active = true
        local _L2 = Instance.new("UIListLayout", _SF2); _L2.Padding = UDim.new(0, 15); _L2.HorizontalAlignment = "Center"; _L2.SortOrder = "LayoutOrder"
        local function _CreateColorBar(key, order)
            local f = Instance.new("Frame", _SF2); f.LayoutOrder = order; f.Size = UDim2.new(0.88, 0, 0, 35); f.BackgroundTransparency = 1
            local layout = Instance.new("UIListLayout", f); layout.FillDirection = "Horizontal"; layout.HorizontalAlignment = "Center"; layout.Padding = UDim.new(0, 10)
            local colors = {{Color3.fromRGB(0, 150, 255), "蓝"}, {Color3.fromRGB(255, 0, 0), "红"}, {Color3.fromRGB(255, 255, 255), "白"}, {Color3.fromRGB(0, 0, 0), "黑"}, {Color3.fromRGB(0, 255, 100), "绿"}}
            for _, info in pairs(colors) do
                local b = Instance.new("TextButton", f); b.Size = UDim2.new(0, 55, 0, 28); b.BackgroundColor3 = info[1]; b.Text = ""; Instance.new("UICorner", b).CornerRadius = UDim.new(0, 5)
                local s = Instance.new("UIStroke", b); s.Thickness = 1.5; s.Color = Color3.new(1,1,1); s.Enabled = false
                b.MouseButton1Click:Connect(function() _G_LMM_88[key] = info[1]; for _, c in pairs(f:GetChildren()) do if c:IsA("TextButton") then c.UIStroke.Enabled = false end end; s.Enabled = true end)
            end
        end
        local function _CreateT(name, key, order)
            local b = Instance.new("TextButton", _SF2); b.LayoutOrder = order; b.Size = UDim2.new(0.88, 0, 0, 60); b.BackgroundColor3 = Color3.fromRGB(30, 30, 30); b.Text = name; b.Font = "GothamBold"; b.TextSize = 14; b.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", b)
            local s = Instance.new("UIStroke", b); s.Thickness = 1.8; s.Color = Color3.fromRGB(60, 60, 60)
            local i = Instance.new("Frame", b); i.Size = UDim2.new(0, 6, 0.6, 0); i.Position = UDim2.new(0, 12, 0.2, 0); i.BackgroundColor3 = Color3.fromRGB(200, 0, 0); i.BorderSizePixel = 0
            b.MouseButton1Click:Connect(function() _G_LMM_88[key] = not _G_LMM_88[key]; i.BackgroundColor3 = _G_LMM_88[key] and Color3.fromRGB(0, 255, 120) or Color3.fromRGB(200, 0, 0) end)
            _RS.Heartbeat:Connect(function() s.Color = _G_LMM_88[key] and _RGB_CORE.Color or Color3.fromRGB(60,60,60) end)
        end
        local _In1 = Instance.new("TextBox", _SF2); _In1.LayoutOrder = 1; _In1.Size = UDim2.new(0.88, 0, 0, 45); _In1.BackgroundColor3 = Color3.fromRGB(25, 25, 25); _In1.Text = "行走速度: 50"; _In1.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", _In1)
        _In1.FocusLost:Connect(function() _G_LMM_88.v_val_1 = tonumber(_In1.Text:match("%d+")) or 50; _In1.Text = "行走速度: ".._G_LMM_88.v_val_1 end)
        local _In2 = Instance.new("TextBox", _SF2); _In2.LayoutOrder = 2; _In2.Size = UDim2.new(0.88, 0, 0, 45); _In2.BackgroundColor3 = Color3.fromRGB(25, 25, 25); _In2.Text = "飞行速度: 50"; _In2.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", _In2)
        _In2.FocusLost:Connect(function() _G_LMM_88.v_val_2 = tonumber(_In2.Text:match("%d+")) or 50; _In2.Text = "飞行速度: ".._G_LMM_88.v_val_2 end)
        _CreateT("内置透视 (ESP)", "v_0x1", 3); _CreateColorBar("c_esp", 4)
        _CreateT("内置ESP射线", "v_esp_line", 5); _CreateColorBar("c_line", 6)
        _CreateT("内置ESP方框", "v_esp_box", 7); _CreateColorBar("c_box", 8)
        _CreateT("内置穿墙 (NOCLIP)", "v_0x2", 9)
        _CreateT("内置速度开关", "v_0x3", 10)
        _CreateT("内置飞行开关 (FLY)", "v_0x4", 11)
        local _Ex = Instance.new("Frame", _SF2); _Ex.LayoutOrder = 99; _Ex.Size = UDim2.new(1, 0, 0, 500); _Ex.BackgroundTransparency = 1
        local _BG = Instance.new("BodyGyro"); local _BV = Instance.new("BodyVelocity"); _BG.P = 9e4; _BG.MaxTorque = Vector3.new(9e9, 9e9, 9e9); _BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        _RS.Heartbeat:Connect(function()
            local lChar = _LP.Character
            if lChar and lChar:FindFirstChild("HumanoidRootPart") then
                local lHrp = lChar.HumanoidRootPart; local hum = lChar:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum.WalkSpeed = _G_LMM_88.v_0x3 and _G_LMM_88.v_val_1 or 16
                    if _G_LMM_88.v_0x2 then for _, p in pairs(lChar:GetChildren()) do if p:IsA("BasePart") then p.CanCollide = false end end end
                    if _G_LMM_88.v_0x4 then _BG.Parent = lHrp; _BV.Parent = lHrp; _BG.CFrame = _Cam.CFrame; _BV.Velocity = hum.MoveDirection.Magnitude > 0 and _Cam.CFrame.LookVector * _G_LMM_88.v_val_2 or Vector3.zero else _BG.Parent = nil; _BV.Parent = nil end
                end
            end
            for _, p in pairs(_P:GetPlayers()) do
                if p ~= _LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local tChar = p.Character; local tHrp = tChar.HumanoidRootPart
                    if _G_LMM_88.v_0x1 then local hl = tChar:FindFirstChild("LMM_ESP") or Instance.new("Highlight", tChar); hl.Name = "LMM_ESP"; hl.FillColor = _G_LMM_88.c_esp; hl.Enabled = true elseif tChar:FindFirstChild("LMM_ESP") then tChar.LMM_ESP:Destroy() end
                    if _G_LMM_88.v_esp_box then local bb = tChar:FindFirstChild("LMM_BOX") or Instance.new("BillboardGui", tChar); if bb.Name ~= "LMM_BOX" then bb.Name = "LMM_BOX"; bb.AlwaysOnTop = true; bb.Size = UDim2.new(4.5, 0, 6, 0); bb.Adornee = tHrp; local f = Instance.new("Frame", bb); f.Size = UDim2.new(1,0,1,0); f.BackgroundTransparency = 1; local st = Instance.new("UIStroke", f); st.Name = "S"; st.Thickness = 2 end; bb.Frame.S.Color = _G_LMM_88.c_box; bb.Enabled = true elseif tChar:FindFirstChild("LMM_BOX") then tChar.LMM_BOX:Destroy() end
                    local beam = tHrp:FindFirstChild("LMM_LINE_FIX")
                    if _G_LMM_88.v_esp_line then if not beam and lChar and lChar:FindFirstChild("HumanoidRootPart") then beam = Instance.new("Beam", tHrp); beam.Name = "LMM_LINE_FIX"; local a0 = lChar.HumanoidRootPart:FindFirstChild("LMM_A0") or Instance.new("Attachment", lChar.HumanoidRootPart); a0.Name = "LMM_A0"; beam.Attachment0 = a0; beam.Attachment1 = Instance.new("Attachment", tHrp); beam.Width0 = 0.1; beam.Width1 = 0.1; beam.FaceCamera = true end; if beam then beam.Color = ColorSequence.new(_G_LMM_88.c_line) end elseif beam then beam:Destroy() end
                end
            end
        end)
        local function _Ctrl(t, x, c, f) local b = Instance.new("TextButton", _TB2); b.Size = UDim2.new(0, 32, 0, 32); b.Position = UDim2.new(1, x, 0.5, -16); b.Text = t; b.BackgroundColor3 = c; b.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", b); b.MouseButton1Click:Connect(f) end
        _Ctrl("×", -45, Color3.fromRGB(180, 50, 50), function() _S:Destroy() end)
        _Ctrl("—", -90, Color3.fromRGB(50, 50, 50), function() _M.Visible = false; _Mini.Position = _M.Position; _Mini.Visible = true end)
        local _drag, _dStart, _sPos
        _TB2.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then _drag = true; _dStart = i.Position; _sPos = _M.Position end end)
        _UIS.InputChanged:Connect(function(i) if _drag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then local d = i.Position - _dStart; _M.Position = UDim2.new(_sPos.X.Scale, _sPos.X.Offset + d.X, _sPos.Y.Scale, _sPos.Y.Offset + d.Y) end end)
        _UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then _drag = false end end)
    end)
end)
