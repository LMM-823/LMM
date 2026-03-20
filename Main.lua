-- [[ 🌚刘某某脚本🌝 | 搜索框 + 按钮动画 增强版 ]]

-- 1. 运行你的核心脚本 (保持你原本的黑色 UI 不变)
loadstring(game:HttpGet("https://raw.githubusercontent.com/LMM-823/LMM/refs/heads/main/Core.lua?t=" .. math.random(1, 999)))()

local _CG = game:GetService("CoreGui")

-- 2. 注入逻辑：把搜索框“贴”到你原本的 UI 上
task.spawn(function()
    local scrollFrame = nil
    local firstBtn = nil
    local allButtons = {}

    -- 🔍 持续寻找你原本 UI 里的滚动区域和按钮
    while not scrollFrame do
        for _, v in pairs(_CG:GetDescendants()) do
            if v:IsA("TextButton") and (v.Text:find("Hub") or v.Text:find("连点器")) then
                firstBtn = v
                scrollFrame = v.Parent -- 找到存放按钮的那个框
                break
            end
        end
        task.wait(0.5)
    end

    -- 🛠️ 插入搜索框 (外观适配你原本的黑色风格)
    if scrollFrame and not scrollFrame:FindFirstChild("LMM_Search") then
        local _SB = Instance.new("TextBox", scrollFrame)
        _SB.Name = "LMM_Search"
        _SB.LayoutOrder = -9999 -- 强制插队到最上面
        _SB.Size = UDim2.new(0.9, 0, 0, 50)
        _SB.BackgroundColor3 = Color3.fromRGB(25, 25, 25) -- 适配你的黑色主题
        _SB.PlaceholderText = "🔍 搜索功能..."
        _SB.TextSize = 18
        _SB.TextColor3 = Color3.new(1, 1, 1)
        _SB.Font = "GothamBold"
        Instance.new("UICorner", _SB)
        
        local _Stroke = Instance.new("UIStroke", _SB)
        _Stroke.Thickness = 2
        _Stroke.Color = Color3.fromRGB(50, 50, 50)

        -- 扫描现有按钮
        for _, btn in pairs(scrollFrame:GetChildren()) do
            if btn:IsA("TextButton") and btn ~= _SB then
                table.insert(allButtons, btn)
            end
        end

        -- 搜索逻辑
        _SB:GetPropertyChangedSignal("Text"):Connect(function()
            local s = _SB.Text:lower()
            for _, b in pairs(allButtons) do
                if s == "" then
                    b.Visible = true
                else
                    b.Visible = b.Text:lower():find(s) ~= nil
                end
            end
        end)
    end
end)
