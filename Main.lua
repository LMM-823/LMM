-- [[ 🌚刘某某脚本🌝 | 1.搜索置顶 2.白字搜索 3.纯净 | Main.lua ]]

-- 加载核心文件 (加入随机数强制刷新)
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
        -- 🛠️ 美化搜索框样式 (纯白字体修复)
        local _SB = scrollFrame:FindFirstChild("LMM_SearchBar") or Instance.new("TextBox", scrollFrame)
        _SB.Name = "LMM_SearchBar"
        _SB.LayoutOrder = 1 -- 永远排第一
        _SB.Size = UDim2.new(0.9, 0, 0, 45)
        _SB.BackgroundColor3 = Color3.fromRGB(25, 25, 25) -- 黑色输入背景
        
        -- 🛠️ 恢复点：纯白色字体，不发光
        _SB.PlaceholderText = "🔍 搜索..."
        _SB.PlaceholderColor3 = Color3.fromRGB(200, 200, 200) -- 浅灰色提示字
        _SB.Text = ""
        _SB.TextColor3 = Color3.new(1, 1, 1) -- 纯白色输入字
        
        _SB.Font = Enum.Font.GothamBold
        _SB.TextSize = 16
        _SB.ClearTextOnFocus = false

        -- 🛠️ 修复点：边框改为白色
        local _Stroke = Instance.new("UIStroke", _SB)
        _Stroke.Thickness = 2
        _Stroke.Color = Color3.fromRGB(255, 255, 255)
        Instance.new("UICorner", _SB).CornerRadius = UDim.new(0, 8)

        -- 搜索过滤逻辑
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
