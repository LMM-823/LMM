-- [[ 🌚刘某某脚本🌝 | UI 增强注入终极版 ]]

-- 1. 先运行核心功能 (Core.lua)
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LMM-823/LMM/refs/heads/main/Core.lua?t=" .. math.random(1, 999)))()
end)

local _CG = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- 2. 注入逻辑：死等 UI 出现
task.spawn(function()
    local scrollFrame, firstBtn, discordBtn = nil, nil, nil
    
    -- 🔄 暴力循环：直到真的抓到按钮为止
    print("正在等待 UI 加载...")
    while not firstBtn do
        for _, v in pairs(_CG:GetDescendants()) do
            if v:IsA("TextButton") then
                local t = v.Text:upper()
                -- 只要匹配到你的核心功能关键词
                if t:find("HUB") or t:find("ESP") or t:find("连点器") then
                    firstBtn = v
                    scrollFrame = v.Parent
                end
                if t:find("DISCORD") or t:find("JOIN") then
                    discordBtn = v
                end
            end
        end
        task.wait(1) -- 每秒检测一次，直到抓到为止
    end
    print("UI 已抓取，开始注入增强功能！")

    -- 🟦 蓝色按钮强制动画
    if discordBtn then
        discordBtn.BackgroundColor3 = Color3.fromRGB(60, 80, 200)
        discordBtn.MouseButton1Down:Connect(function() 
            discordBtn:TweenSize(UDim2.new(0.85, 0, 0, 45), "Out", "Quad", 0.1, true) 
        end)
        discordBtn.MouseButton1Up:Connect(function() 
            discordBtn:TweenSize(UDim2.new(0.95, 0, 0, 55), "Out", "Quad", 0.1, true) 
        end)
    end

    -- 🛠️ 插入搜索框 (强制排在第一位)
    if scrollFrame and not scrollFrame:FindFirstChild("LMM_SearchBar") then
        local _SB = Instance.new("TextBox", scrollFrame)
        _SB.Name = "LMM_SearchBar"
        _SB.LayoutOrder = -9999 -- 确保它永远在最上面
        _SB.Size = UDim2.new(0.9, 0, 0, 60)
        _SB.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        _SB.PlaceholderText = "🔍 点击输入搜索脚本..."
        _SB.TextSize = 20
        _SB.TextColor3 = Color3.new(1, 1, 1)
        _SB.Font = "GothamBold"
        Instance.new("UICorner", _SB)
        local _Stroke = Instance.new("UIStroke", _SB); _Stroke.Thickness = 2; _Stroke.Color = Color3.fromRGB(255, 0, 255)

        -- 搜索过滤逻辑
        _SB:GetPropertyChangedSignal("Text"):Connect(function()
            local s = _SB.Text:lower()
            for _, btn in pairs(scrollFrame:GetChildren()) do
                if btn:IsA("TextButton") and btn ~= discordBtn then
                    if s == "" then
                        btn.Visible = true
                    else
                        btn.Visible = btn.Text:lower():find(s) ~= nil
                    end
                end
            end
        end)
    end
end)