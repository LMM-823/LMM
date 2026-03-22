-- [[ 🌚刘某某脚本🌝 | 搜索框白字优化 + 1.搜索 2.DC | Main.lua ]]

-- 加载核心框架 (加上你记得的随机数强制更新)
loadstring(game:HttpGet("https://raw.githubusercontent.com/LMM-823/LMM/main/Core.lua?t=" .. math.random(1, 999)))()

local _CG = game:GetService("CoreGui")

task.spawn(function()
    local scrollFrame = nil
    -- 🔍 定位 UI 容器
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
        -- 🛠️ 创建/美化搜索框
        local _SB = scrollFrame:FindFirstChild("LMM_SearchBar") or Instance.new("TextBox", scrollFrame)
        _SB.Name = "LMM_SearchBar"
        _SB.LayoutOrder = 1 -- 永远第一位
        _SB.Size = UDim2.new(0.9, 0, 0, 45)
        _SB.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        
        -- ✨ 字体颜色优化：改为白色/浅灰，不再刺眼
        _SB.PlaceholderText = "🔍 搜索功能..."
        _SB.PlaceholderColor3 = Color3.fromRGB(180, 180, 180) -- 浅灰色提示字
        _SB.Text = ""
        _SB.TextColor3 = Color3.fromRGB(255, 255, 255) -- 纯白色输入字
        
        _SB.Font = "GothamBold"
        _SB.TextSize = 16
        _SB.ClearTextOnFocus = false

        -- 保持紫色边框风格一致
        local _Stroke = _SB:FindFirstChildOfClass("UIStroke") or Instance.new("UIStroke", _SB)
        _Stroke.Thickness = 2
        _Stroke.Color = Color3.fromRGB(255, 0, 255)
        
        local _Corner = _SB:FindFirstChildOfClass("UICorner") or Instance.new("UICorner", _SB)
        _Corner.CornerRadius = UDim.new(0, 8)

        -- 实时搜索逻辑
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
