-- [[ 刘某某脚本库 | Main.lua ]]
-- 作用：远程加载主体 UI

local function LoadCore()
    -- 请将下方的链接替换为你存放 Core.lua 的真实原始链接 (Raw Link)
    local core_url = "你的_CORE_LUA_链接" 
    
    local success, result = pcall(function()
        return loadstring(game:HttpGet(core_url))()
    end)
    
    if not success then
        warn("刘某某脚本库加载失败: " .. tostring(result))
    end
end

LoadCore()
