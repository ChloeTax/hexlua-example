platform = dofile("platform.lua")
json = platform.require("setup/json")


patterns = {}

for _,pattern in pairs(
    json.decode(
        platform.file.read(
            "setup/registry.json"
        )
    ).patterns) do




    mod = pattern.operators[1].mod_id
    if not patterns[mod] then patterns[mod] = {} end
    
    line = 'Actions["%s"] = {direction = "%s", name = "%s", is_per_world = "%s", id = "%s", action = function(self, castEnv) hexUtils.Unimplemented(self) end}'
    line = line:format(pattern.signature, pattern.direction, pattern.name, pattern.is_per_world and "True" or "False", pattern.id)

    table.insert(patterns[mod], line)

    -- print()
end

if arg[1] then
    print('Actions = {}')
    for _,pattern in pairs(patterns[arg[1]]) do
        print(pattern)
    end
    print("return Actions")
else
    for mod, _ in pairs(patterns) do
        print(mod)
    end

    print("usage: lua pluginTemplateBuilder.lua [modname]")
end



