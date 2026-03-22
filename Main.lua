-- [[ 刘某某脚本库 | Main.lua ]]
local function LoadCore()
    -- 已为你填入 Core.lua 的 Raw 原始链接
    local core_url = "https://raw.githubusercontent.com/LMM-823/LMM/main/Core.lua" 
    
    local success, result = pcall(function()
        return loadstring(game:HttpGet(core_url))()
    end)
    
    if not success then
        warn("加载失败: " .. tostring(result))
    end
end

LoadCore()
