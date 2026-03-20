-- [[ 🌚刘某某脚本🌝 | 1.搜索 2.DC 3.功能 | 永远置顶版 ]]

-- 修复点：这里必须是 loadstring
loadstring(game:HttpGet("https://raw.githubusercontent.com/LMM-823/LMM/refs/heads/main/Core.lua?t=" .. math.random(1, 999)))()

local _CG = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

task.spawn(function()
    local scrollFrame = nil
    local discordBtn = nil
    local scriptButtons = {}

    -- 🔍 扫描 UI 容器
    while not scrollFrame do
        for _, v in pairs(_CG:GetDescendants()) do
            if v:IsA("ScrollingFrame") then scrollFrame = v end
            if v:IsA("TextButton") and (v.Text:upper():find("DISCORD") or v.Text:upper():find("JOIN")) then 
                discordBtn = v 
            end
        end
        task.wait(0.5)
    end

    -- 🛠️ 强制排序逻辑
    if scrollFrame then
        -- 1. 创建搜索框并永远置顶 (LayoutOrder = 1)
        local _SB = scrollFrame:FindFirstChild("LMM_SearchBar") or Instance.new("TextBox", scrollFrame)
        _SB.Name = "LMM_SearchBar"
        _SB.LayoutOrder = 1 
        _SB.Size = UDim2.new(0.9, 0, 0, 45)
        _SB.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        _SB.PlaceholderText = "🔍 搜索脚本..."
        _SB.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
        _SB.Text = ""
        _SB.TextColor3 = Color3.new(1, 1, 1)
        _SB.Font = "GothamBold"
        Instance.new("UICorner", _SB)
        local _Stroke = Instance.new("UIStroke", _SB)
        _Stroke.Thickness = 2; _Stroke.Color = Color3.fromRGB(255, 0, 255)

        -- 2. 强制 DC 按钮排在第二 (LayoutOrder = 2)
        if discordBtn then
            discordBtn.LayoutOrder = 2
        end

        -- 3. 其他所有功能按钮排在后面 (从 LayoutOrder 3 开始)
        for _, btn in pairs(scrollFrame:GetChildren()) do
            if btn:IsA("TextButton") and btn ~= _SB and btn ~= discordBtn then
                table.insert(scriptButtons, btn)
                btn.LayoutOrder = 10 -- 默认给个大的，排后面
            end
        end

        -- 自动排版：必须把 ScrollingFrame 的排版方式设为 LayoutOrder
        if scrollFrame:FindFirstChildOfClass("UIListLayout") then
            scrollFrame:FindFirstChildOfClass("UIListLayout").SortOrder = Enum.SortOrder.LayoutOrder
        end

        -- 搜索过滤逻辑
        _SB:GetPropertyChangedSignal("Text"):Connect(function()
            local s = _SB.Text:lower()
            for _, b in pairs(scriptButtons) do
                if s == "" then b.Visible = true else
                    b.Visible = b.Text:lower():find(s) ~= nil
                end
            end
        end)
    end
end)
