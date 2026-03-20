-- [[ 🌚刘某某脚本🌝 V3.0 | 2026-03-20 ]]
loadstring([[
    local _P = game:GetService("Players"); local _RS = game:GetService("RunService"); local _CG = game:GetService("CoreGui"); local _UIS = game:GetService("UserInputService")
    local _RGB = { Color = Color3.new(1,0,0) }; task.spawn(function() local c = 0 while true do c = (c + 0.005) % 1; _RGB.Color = Color3.fromHSV(c, 0.7, 1); task.wait(0.05) end end)
    if _CG:FindFirstChild("LMM_Final_V3") then _CG.LMM_Final_V3:Destroy() end
    local _S = Instance.new("ScreenGui", _CG); _S.Name = "LMM_Final_V3"; local _M = Instance.new("Frame", _S); _M.Size = UDim2.new(0, 400, 0, 520); _M.Position = UDim2.new(0.02, 0, 0.25, 0); _M.BackgroundColor3 = Color3.fromRGB(15, 15, 15); Instance.new("UICorner", _M)
    local _Gl = Instance.new("UIStroke", _M); _Gl.Thickness = 3; _RS.Heartbeat:Connect(function() _Gl.Color = _RGB.Color end)
    local _TB = Instance.new("Frame", _M); _TB.Size = UDim2.new(1, 0, 0, 55); _TB.BackgroundTransparency = 1; _TB.Active = true; local _Ti = Instance.new("TextLabel", _TB); _Ti.Size = UDim2.new(1, 0, 1, 0); _Ti.Text = "🌚刘某某脚本🌝"; _Ti.Font = "GothamBold"; _Ti.TextSize = 25; _Ti.TextColor3 = Color3.new(1, 1, 1); _Ti.BackgroundTransparency = 1
    local _SF = Instance.new("ScrollingFrame", _M); _SF.Size = UDim2.new(1, 0, 1, -70); _SF.Position = UDim2.new(0, 0, 0, 60); _SF.BackgroundTransparency = 1; _SF.ScrollBarThickness = 0; _SF.AutomaticCanvasSize = "Y"
    local _L = Instance.new("UIListLayout", _SF); _L.Padding = UDim.new(0, 15); _L.HorizontalAlignment = "Center"; _L.SortOrder = "LayoutOrder"
    local function _CS(n, u, o, c) local b = Instance.new("TextButton", _SF); b.LayoutOrder = o; b.Size = UDim2.new(0.88, 0, 0, 65); b.BackgroundColor3 = c or Color3.fromRGB(35, 35, 35); b.Text = n; b.Font = "GothamBold"; b.TextSize = 20; b.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", b); local s = Instance.new("UIStroke", b); s.Thickness = 2; _RS.Heartbeat:Connect(function() s.Color = _RGB.Color end); b.MouseButton1Click:Connect(function() if u ~= "" then task.spawn(function() loadstring(game:HttpGet(u))() end) end end) end
    
    _CS("自动连点器（刘某某）", "https://raw.githubusercontent.com/idkmsnscriptronlox/Shadow-/refs/heads/main/Shadow", 18)
    _CS("等待新脚本填入...", "", 19, Color3.fromRGB(25, 25, 25))
    _CS("🔗 JOIN DISCORD 🔗", "https://discord.gg/cjpezEZub", 20, Color3.fromRGB(0, 120, 255))
    _CS("即将推出...", "", 21, Color3.fromRGB(20, 20, 20))

    local _Ex = Instance.new("Frame", _SF); _Ex.LayoutOrder = 99; _Ex.Size = UDim2.new(1, 0, 0, 200); _Ex.BackgroundTransparency = 1
    local _drag, _dStart, _sPos; _TB.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then _drag = true; _dStart = i.Position; _sPos = _M.Position end end)
    _UIS.InputChanged:Connect(function(i) if _drag and i.UserInputType == Enum.UserInputType.MouseMovement then local d = i.Position - _dStart; _M.Position = UDim2.new(_sPos.X.Scale, _sPos.X.Offset + d.X, _sPos.Y.Scale, _sPos.Y.Offset + d.Y) end end)
    _UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then _drag = false end end)
]])()
