-- [[ 🌚刘某某脚本🌝 | 确认 UI + 搜索框 + 按钮动画 终极修复版 ]]

-- 1. 核心重点：这里必须写 Core.lua！(已加入随机数，秒更新)
loadstring(game:HttpGet("https://raw.githubusercontent.com/LMM-823/LMM/refs/heads/main/Core.lua?t=" .. math.random(1, 999)))()

local _CG = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- 2. 确认弹窗函数
local function CreateConfirmUI(oldSignals)
    if _CG:FindFirstChild("LMM_Confirm") then _CG.LMM_Confirm:Destroy() end
    local _S = Instance.new("ScreenGui", _CG); _S.Name = "LMM_Confirm"; _S.DisplayOrder = 999
    local _F = Instance.new("Frame", _S)
    _F.Size = UDim2.new(0, 300, 0, 140); _F.Position = UDim2.new(0.5, -150, 0.5, -70)
    _F.BackgroundColor3 = Color3.fromRGB(15, 15, 15); _F.Active = true; _F.Draggable = true
    Instance.new("UICorner", _F)
    local _Stroke = Instance.new("UIStroke", _F); _Stroke.Thickness = 3; _Stroke.ApplyStrokeMode = "Border"
    task.spawn(function()
        local c = 0
        while _F.Parent do c = (c + 0.005) % 1; _Stroke.Color = Color3.fromHSV(c, 0.7, 1); task.wait(0.05) end
    end)
    local _T = Instance.new("TextLabel", _F)
    _T.Size = UDim2.new(1, 0, 0, 60); _T.Text = "确定要加载吗？"; _T.Font = "GothamBold"; _T.TextSize = 20; _T.TextColor3 = Color3.new(1, 1, 1); _T.BackgroundTransparency = 1
    local _Yes = Instance.new("TextButton", _F)
    _Yes.Size = UDim2.new(0, 110, 0, 40); _Yes.Position = UDim2.new(0.1, 0, 0.6, 0); _Yes.BackgroundColor3 = Color3.fromRGB(0, 180, 80); _Yes.Text = "确定"; _Yes.TextColor3 = Color3.new(1, 1, 1); _Yes.Font = "GothamBold"; Instance.new("UICorner", _Yes)
    _Yes.MouseButton1Click:Connect(function() _S:Destroy(); for _, sig in pairs(oldSignals) do sig.Function() end end)
    local _No = Instance.new("TextButton", _F)
    _No.Size = UDim2.new(0, 110, 0, 40); _No.Position = UDim2.new(0.55, 0, 0.6, 0); _No.BackgroundColor3 = Color3.fromRGB(180, 0, 0); _No.Text = "不要"; _No.TextColor3 = Color3.new(1, 1, 1); _No.Font = "GothamBold"; Instance.new("UICorner", _No)
    _No.MouseButton1Click:Connect(function() _S:Destroy() end)
end

-- 3. 注入逻辑
task.spawn(function()
    local scrollFrame, firstBtn, discordBtn = nil, nil, nil
    local scriptButtons, comingSoonButtons = {}, {}

    -- 🔍 循环检测：直到抓到界面按钮
    while not firstBtn do
        for _, v in pairs(_CG:GetDescendants()) do
            if v:IsA("TextButton") then
                local t = v.Text:upper()
                if t:find("HUB") or t:find("ESP") or t:find("连点器") then 
                    firstBtn = v; scrollFrame = v.Parent 
                end
                if t:find("DISCORD") or t:find("JOIN") then discordBtn = v end
            end
        end
        task.wait(0.5)
    end

    -- 🟦 Discord 按钮动画
    if discordBtn then
        discordBtn.MouseButton1Down:Connect(function() discordBtn:TweenSize(UDim2.new(0.85, 0, 0, 45), "Out", "Quad", 0.1, true) end)
        discordBtn.MouseButton1Up:Connect(function() discordBtn:TweenSize(UDim2.new(0.95, 0, 0, 55), "Out", "Quad", 0.1, true) end)
    end

    -- 🛠️ 插入搜索框 (LayoutOrder 设置为极小值，确保排在最上面)
    local _SB = Instance.new("TextBox", scrollFrame)
    _SB.LayoutOrder = -9999
    _SB.Size = UDim2.new(0.9, 0, 0, 65); _SB.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    _SB.PlaceholderText = "🔍 搜索脚本..."; _SB.TextSize = 22; _SB.TextColor3 = Color3.new(1, 1, 1); _SB.Font = "GothamBold"
    Instance.new("UICorner", _SB)
    local _Stroke = Instance.new("UIStroke", _SB); _Stroke.Thickness = 3; _Stroke.Color = Color3.fromRGB(0, 180, 255)

    -- 扫描所有按钮
    for _, btn in pairs(scrollFrame:GetChildren()) do
        if btn:IsA("TextButton") and btn ~= discordBtn then
            table.insert(scriptButtons, btn)
            local conns = getconnections(btn.MouseButton1Click)
            if #conns > 0 then
                local saved = {}
                for _, c in pairs(conns) do table.insert(saved, {Function = c.Function}); c:Disable() end
                btn.MouseButton1Click:Connect(function() CreateConfirmUI(saved) end)
            end
        end
    end

    -- 搜索联动
    _SB:GetPropertyChangedSignal("Text"):Connect(function()
        local s = _SB.Text:lower()
        for _, b in pairs(scriptButtons) do
            if s == "" then b.Visible = true else b.Visible = b.Text:lower():find(s) ~= nil end
        end
    end)
end)
