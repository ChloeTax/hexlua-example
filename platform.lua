local requireCache = {}

table.unpack = table.unpack or unpack

math.randomseed(os.time())

return {
    platform = "Lua",
    print = print,
    random = math.random,
    require = function(path, ...)
        local file = requireCache[path]
        if file then return file end
        
        file =  loadfile(path .. ".lua")
        requireCache[path] = file
        if not file then 
            local file2 = io.open(path.. ".lua", "r")
            if file2 then
                print("broken")
                error(path .. ".lua broken")
                file2:close()
            else
                -- print(path .. ".lua", " not found")
            end
        return nil end
        return file(...)
    end,
    file = {
        read = function(path)
            local file = io.open(path, "r")
            if not file then return nil end
            local content = file:read("*a")
            file:close()
            return content
        end
    },
    readChat = function ()
        local message = io.read("*l")
        if message then
            return message
        else
            return ""
        end
    end,
    Plugins = {
        "custom",
        "hexcasting",
        "moreiotas",
        "hexal",
        "internal"
    }
}