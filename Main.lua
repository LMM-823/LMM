-- [[ 🌚刘某某脚本🌝 | 搜索置顶 + 图标兼容 | Main.lua ]]

-- 修复点：确保是 loadstring
loadstring(game:HttpGet("https://raw.githubusercontent.com/LMM-823/LMM/refs/heads/main/Core.lua?t=" .. math.random(1, 999)))()

local _CG = game:GetService("CoreGui")

task.spawn(function()
    local scrollFrame = nil
    while not scrollFrame do
        for _, v in pairs(_CG:GetDescendants()) do
            if v:IsA("ScrollingFrame") and v.Parent.Name == "MainFrame" then 
                scrollFrame = v 
                break 
            end
        end
        task.wait(0.5)
    end

    if scrollFrame then
        -- 创建搜索框 (LayoutOrder = 1)
        local _SB = Instance.new("TextBox", scrollFrame)
        _SB.Name = "LMM_SearchBar"
        _SB.LayoutOrder = 1 
        _SB.Size = UDim2.new(0.9, 0, 0, 45)
        _SB.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        _SB.PlaceholderText = "🔍 搜索..."
        _SB.PlaceholderColor3 = Color3.fromRGB(255, 0, 255)
        _SB.Text = ""
        _SB.TextColor3 = Color3.new(1, 1, 1)
        _SB.Font = "GothamBold"
        _SB.TextSize = 16
        
        local _Stroke = Instance.new("UIStroke", _SB)
        _Stroke.Thickness = 2
        _Stroke.Color = Color3.fromRGB(255, 0, 255)
        Instance.new("UICorner", _SB)

        -- 搜索逻辑
        _SB:GetPropertyChangedSignal("Text"):Connect(function()
            local s = _SB.Text:lower()
            for _, b in pairs(scrollFrame:GetChildren()) do
                if b:IsA("TextButton") and b.Name ~= "JOIN DISCORD" then
                    b.Visible = (s == "" or b.Text:lower():find(s) ~= nil)
                end
            end
        end)
    end
end)
