-- [[ 🌚刘某某脚本🌝 | 搜索条白字修复版 | Main.lua ]]

-- 修复：这里必须用 loadstring，指向 Core.lua
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
        -- 美化搜索框 ( LayoutOrder = 1 锁死在第一排)
        local _SB = Instance.new("TextBox", scrollFrame)
        _SB.Name = "LMM_SearchBar"
        _SB.LayoutOrder = 1 
        _SB.Size = UDim2.new(0.9, 0, 0, 45)
        _SB.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        
        -- ✨ 这里改成了白色提示和白色输入
        _SB.PlaceholderText = "🔍 搜索..."
        _SB.PlaceholderColor3 = Color3.fromRGB(180, 180, 180) -- 浅灰色提示，点击变白
        _SB.Text = ""
        _SB.TextColor3 = Color3.new(1, 1, 1) -- 纯白色输入字
        
        _SB.Font = "GothamBold"
        _SB.TextSize = 16
        _SB.ClearTextOnFocus = false
        
        -- 给搜索框一个白边框 (适配外边框)
        local _Stroke = Instance.new("UIStroke", _SB)
        _Stroke.Thickness = 2
        _Stroke.Color = Color3.fromRGB(255, 255, 255) -- ✨ 变白
        Instance.new("UICorner", _SB).CornerRadius = UDim.new(0, 8)

        -- 搜索逻辑 (现在下面没按钮，以后填入脚本时会自动生效)
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
