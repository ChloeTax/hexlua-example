platform = dofile("platform.lua")

Hexcasting = platform.require("hexEmulator/Hexcasting")

local hexpatternParser = platform.require("jankyHexpatternParser")
local hex = hexpatternParser("test.hexpattern")
local caster = Hexcasting.Iotas.hexcasting.null:new()

hex = Hexcasting.buildCast(hex, caster)

hex:eval()