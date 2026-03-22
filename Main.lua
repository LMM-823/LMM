-- [[ 刘某某脚本库 | Main.lua ]]
local function LoadCore()
    local core_url = "你的_CORE_LUA_RAW链接" 
    local success, result = pcall(function()
        return loadstring(game:HttpGet(core_url))()
    end)
    if not success then
        warn("加载失败: " .. tostring(result))
    end
end
LoadCore()
