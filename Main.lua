-- [[ 🌚刘某某脚本🌝 | 搜索框 + 按钮动画 + 核心加载 终极版 ]]

-- 1. 加载核心功能 (指向 Core.lua，加入随机数防止缓存)
loadstring(game:HttpGet("https://raw.githubusercontent.com/LMM-823/LMM/refs/heads/main/Core.lua?t=" .. math.random(1, 999)))()

local _CG = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- 2. 确认弹窗函数 (保持原样)
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

-- 3. 增强逻辑 (搜索栏 + 动画)
task.spawn(function()
    local scrollFrame = nil
    local discordBtn = nil
    local scriptButtons = {}

    -- 🔍 扫描 UI 元素
    while not scrollFrame do
        for _, v in pairs(_CG:GetDescendants()) do
            if v:IsA("ScrollingFrame") then scrollFrame = v end
            if v:IsA("TextButton") and (v.Text:upper():find("DISCORD") or v.Text:upper():find("JOIN")) then discordBtn = v end
        end
        task.wait(0.5)
    end

    -- 🛠️ 插入真正的搜索条 (样式修复版)
    if scrollFrame and not scrollFrame:FindFirstChild("LMM_SearchBar") then
        local _SB = Instance.new("TextBox", scrollFrame)
        _SB.Name = "LMM_SearchBar"
        _SB.LayoutOrder = -10000 -- 确保它排在最上面
        _SB.Size = UDim2.new(0.9, 0, 0, 45)
        _SB.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        _SB.PlaceholderText = "🔍 搜索功能..."
        _SB.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
        _SB.Text = ""
        _SB.TextColor3 = Color3.new(1, 1, 1)
        _SB.TextSize = 16
        _SB.Font = "GothamBold"
        _SB.ClearTextOnFocus = false
        
        local _Stroke = Instance.new("UIStroke", _SB)
        _Stroke.Thickness = 2
        _Stroke.Color = Color3.fromRGB(255, 0, 255) -- 适配紫色边框
        Instance.new("UICorner", _SB).CornerRadius = UDim.new(0, 8)

        -- 绑定所有功能按钮
        for _, btn in pairs(scrollFrame:GetChildren()) do
            if btn:IsA("TextButton") and btn ~= _SB and btn ~= discordBtn then
                table.insert(scriptButtons, btn)
                -- 拦截点击逻辑，加入二次确认
                local conns = getconnections(btn.MouseButton1Click)
                if #conns > 0 then
                    local saved = {}
                    for _, c in pairs(conns) do table.insert(saved, {Function = c.Function}); c:Disable() end
                    btn.MouseButton1Click:Connect(function() CreateConfirmUI(saved) end)
                end
            end
        end

        -- 搜索逻辑
        _SB:GetPropertyChangedSignal("Text"):Connect(function()
            local s = _SB.Text:lower()
            for _, b in pairs(scriptButtons) do
                if s == "" then b.Visible = true else
                    b.Visible = b.Text:lower():find(s) ~= nil
                end
            end
        end)
    end

    -- 蓝色按钮动画效果
    if discordBtn then
        discordBtn.MouseEnter:Connect(function()
            TweenService:Create(discordBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(88, 101, 242)}):Play()
            TweenService:Create(discordBtn, TweenInfo.new(0.2), {Size = UDim2.new(0.95, 0, 0, 55)}):Play()
        end)
        discordBtn.MouseLeave:Connect(function()
            TweenService:Create(discordBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(60, 80, 200)}):Play()
            TweenService:Create(discordBtn, TweenInfo.new(0.2), {Size = UDim2.new(0.9, 0, 0, 50)}):Play()
        end)
    end
end)
