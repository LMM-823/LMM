-- [[ 🌚 刘某某·全能黑盒 🌝 | Main ]]
local _CG = game:GetService("CoreGui"); local _UIS = game:GetService("UserInputService")
if _CG:FindFirstChild("LMM_BlackBox_V3") then _CG.LMM_BlackBox_V3:Destroy() end
local _S = Instance.new("ScreenGui", _CG); _S.Name = "LMM_BlackBox_V3"

-- 背景：黑底白边
local _M = Instance.new("Frame", _S); _M.Size = UDim2.new(0, 420, 0, 500); _M.Position = UDim2.new(0.5, -210, 0.5, -250); _M.BackgroundColor3 = Color3.new(0,0,0); Instance.new("UICorner", _M)
local _B = Instance.new("UIStroke", _M); _B.Thickness = 2; _B.Color = Color3.new(1,1,1)

-- 搜索框
local _Search = Instance.new("TextBox", _M); _Search.Size = UDim2.new(0.9, 0, 0, 40); _Search.Position = UDim2.new(0.05, 0, 0.1, 0); _Search.PlaceholderText = "🔍 搜索功能..."; _Search.BackgroundColor3 = Color3.fromRGB(30,30,30); _Search.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", _Search)

local _SF = Instance.new("ScrollingFrame", _M); _SF.Size = UDim2.new(0.9, 0, 0.75, 0); _SF.Position = UDim2.new(0.05, 0, 0.22, 0); _SF.BackgroundTransparency = 1; _SF.AutomaticCanvasSize = "Y"
local _L = Instance.new("UIListLayout", _SF); _L.Padding = UDim.new(0, 10); _L.HorizontalAlignment = "Center"

local function CreateBtn(name, col, cb)
    local b = Instance.new("TextButton", _SF); b.Size = UDim2.new(1, 0, 0, 50); b.BackgroundColor3 = col; b.Text = name; b.TextColor3 = Color3.new(1,1,1); b.Font = "GothamBold"; b.TextSize = 16; Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(cb)
end

-- [顺位 2] Discord
CreateBtn("🔵 JOIN DISCORD 🔵", Color3.fromRGB(88, 101, 242), function() setclipboard("https://discord.gg/cjpezEZub") end)

-- [顺位 3] 运行 Core.lua
CreateBtn("🌚 运行 刘某某 V2.9 🌚", Color3.fromRGB(40, 40, 40), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LMM-823/LMM/main/Core.lua"))()
end)

-- 关闭大黑盒 (仅打叉)
local _Cl = Instance.new("TextButton", _M); _Cl.Size = UDim2.new(0, 30, 0, 30); _Cl.Position = UDim2.new(1, -40, 0, 5); _Cl.Text = "×"; _Cl.BackgroundColor3 = Color3.fromRGB(200, 0, 0); _Cl.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", _Cl); _Cl.MouseButton1Click:Connect(function() _S:Destroy() end)
