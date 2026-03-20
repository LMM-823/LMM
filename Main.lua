-- [[ 🌚刘某某脚本🌝 | 极简搜索 + 缩放关闭功能 ]]

-- 1. 加载核心功能 (Core.lua)
loadstring(game:HttpGet("https://raw.githubusercontent.com/LMM-823/LMM/refs/heads/main/Core.lua?t=" .. math.random(1, 999)))()

local _CG = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

task.spawn(function()
    local mainFrame, scrollFrame, titleLabel = nil, nil, nil
    local scriptButtons = {}

    -- 🔍 暴力寻找 UI 组件
    while not scrollFrame do
        for _, v in pairs(_CG:GetDescendants()) do
            if v.Name == "MainFrame" and v:IsA("Frame") then mainFrame = v end
            if v:IsA("ScrollingFrame") then scrollFrame = v end
            if v:IsA("TextLabel") and v.Text:find("刘某某") then titleLabel = v end
        end
        task.wait(0.5)
    end

    -- 🛠️ 增加：右上角 [-] 和 [X] 功能
    if titleLabel and not titleLabel:FindFirstChild("CloseBtn") then
        -- 关闭按钮 [X]
        local close = Instance.new("TextButton", titleLabel)
        close.Name = "CloseBtn"
        close.Size = UDim2.new(0, 30, 0, 30); close.Position = UDim2.new(1, -35, 0, 5)
        close.Text = "×"; close.TextColor3 = Color3.new(1, 0, 0); close.TextSize = 25
        close.BackgroundTransparency = 1; close.Font = "GothamBold"
        close.MouseButton1Click:Connect(function() mainFrame.Parent:Destroy() end)

        -- 最小化按钮 [-]
        local mini = Instance.new("TextButton", titleLabel)
        mini.Size = UDim2.new(0, 30, 0, 30); mini.Position = UDim2.new(1, -70, 0, 5)
        mini.Text = "-"; mini.TextColor3 = Color3.new(1, 1, 1); mini.TextSize = 25
        mini.BackgroundTransparency = 1; mini.Font = "GothamBold"
        
        local isMini = false
        mini.MouseButton1Click:Connect(function()
            isMini = not isMini
            scrollFrame.Visible = not isMini
            mainFrame:TweenSize(isMini and UDim2.new(0, 330, 0, 40) or UDim2.new(0, 330, 0, 350), "Out", "Quad", 0.3, true)
        end)
    end

    -- 🛠️ 插入搜索框 (永远最顶部)
    if scrollFrame and not scrollFrame:FindFirstChild("LMM_TopSearch") then
        local _SB = Instance.new("TextBox", scrollFrame)
        _SB.Name = "LMM_TopSearch"
        _SB.LayoutOrder = -99999 -- 绝对置顶
        _SB.Size = UDim2.new(0.9, 0, 0, 45)
        _SB.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        _SB.PlaceholderText = "🔍 搜索..."; _SB.Text = ""
        _SB.TextColor3 = Color3.new(1, 1, 1); _SB.Font = "GothamBold"
        Instance.new("UICorner", _SB)
        Instance.new("UIStroke", _SB).Color = Color3.fromRGB(255, 0, 255)

        -- 实时绑定按钮
        for _, btn in pairs(scrollFrame:GetChildren()) do
            if btn:IsA("TextButton") and btn ~= _SB then table.insert(scriptButtons, btn) end
        end

        _SB:GetPropertyChangedSignal("Text"):Connect(function()
            local s = _SB.Text:lower()
            for _, b in pairs(scriptButtons) do
                b.Visible = (s == "" or b.Text:lower():find(s) ~= nil)
            end
        end)
    end
end)
