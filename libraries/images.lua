slot0 = {}
slot1 = require("ffi")
slot2 = require("gamesense/steamworks")
slot3 = require("gamesense/csgo_weapons")
slot4 = string.gsub
slot5 = math.floor
slot6 = slot1.cast
slot7 = slot1.typeof([[
struct {
	char type[4];
	uint32_t width;
	uint32_t height;
	char bitDepth;
	char colorType;
	char compression;
	char filter;
	char interlace;
} *
]])
slot8 = slot1.typeof([[
struct {
	char type[2];
	uint16_t size;
} *
]])
slot9 = slot1.typeof([[
struct {
	uint16_t size;
	char precision;
	uint16_t height;
	uint16_t width;
} __attribute__((packed)) *
]])
slot10 = slot1.typeof("uint16_t*")
slot11 = slot1.typeof("char[?]")
slot12 = slot1.typeof("unsigned int[?]")
slot13 = -1
slot14 = "\\x89PNG\r\n\n"
slot15 = "\\xff\\xd8\\xff\\xdb"
slot16 = "\\xff\\xd8\\xff\\xe0 JFIF "
slot17 = "\\xff\\xd8"
slot18 = "\\xff\\xc0"
slot19 = "\\xff\\xda"
slot20 = "\\xff\\xd9"
slot21 = {
	png = renderer.load_png,
	svg = renderer.load_svg,
	jpg = renderer.load_jpg,
	rgba = renderer.load_rgba
}

function slot22(slot0)
	return bit.rshift(bit.bswap(slot0), 16)
end

function slot23(slot0)
	slot0:gsub(".", function (slot0)
		table.insert(uv0, string.format("%02x", string.byte(slot0)))
	end)

	return table.concat({}, " ")
end

slot24 = vtable_bind("filesystem_stdio.dll", "VBaseFileSystem011", 0, "int(__thiscall*)(void*, void*, int, void*)")
slot25 = vtable_bind("filesystem_stdio.dll", "VBaseFileSystem011", 2, "void*(__thiscall*)(void*, const char*, const char*, const char*)")
slot26 = vtable_bind("filesystem_stdio.dll", "VBaseFileSystem011", 3, "void(__thiscall*)(void*, void*)")
slot27 = vtable_bind("filesystem_stdio.dll", "VBaseFileSystem011", 7, "unsigned int(__thiscall*)(void*, void*)")

function slot28(slot0)
	if uv0(slot0, "r", "MOD") == nil then
		return
	end

	if uv1(slot1) == nil or slot2 < 0 then
		return
	end

	if uv2(slot2 + 1) == nil then
		return
	end

	if not uv3(slot3, slot2, slot1) then
		return
	end

	return uv4.string(slot3, slot2)
end

slot29 = vtable_bind("steamclient.dll", "SteamClient017", 2, "int(__thiscall*)(void*, int)")
slot30 = vtable_bind("steamclient.dll", "SteamClient017", 8, "int*(__thiscall*)(void*, int, int, const char*)")
slot31 = vtable_bind("steamclient.dll", "SteamClient017", 9, "int*(__thiscall*)(void*, int, const char*)")
slot32, slot33, slot34, slot35 = nil
slot36 = vtable_thunk(34, "int(__thiscall*)(void*, uint64_t)")
slot37 = vtable_thunk(35, "int(__thiscall*)(void*, uint64_t)")
slot38 = vtable_thunk(36, "int(__thiscall*)(void*, uint64_t)")
slot39 = vtable_thunk(5, "bool(__thiscall*)(void*, int, uint32_t*, uint32_t*)")
slot40 = vtable_thunk(6, "bool(__thiscall*)(void*, int, unsigned char*, int)")
slot43 = {
	__index = {
		measure = function (slot0, slot1, slot2)
			if slot1 ~= nil and slot2 ~= nil then
				return slot1, slot2
			elseif slot0.width == nil or slot0.height == nil then
				error("Image dimensions not known, full size is required")
			elseif slot1 == nil then
				slot2 = slot2 or slot0.height

				return uv0(slot0.width * slot2 / slot0.height), slot2
			elseif slot2 == nil then
				slot1 = slot1 or slot0.width

				return slot1, uv0(slot0.height * slot1 / slot0.width)
			else
				return slot0.width, slot0.height
			end
		end,
		draw = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10)
			slot11, slot12 = uv0(slot0, slot3, slot4)

			if slot0.textures[string.format("%f_%f", slot11, slot12)] == nil then
				if ({
					next(slot0.textures)
				})[2] == nil or slot9 or slot9 == nil then
					if uv1[slot0.type] then
						if slot0.type == "rgba" then
							slot4 = slot0.height
							slot3 = slot0.width
						end

						slot12 = slot13(slot0.contents, slot3, slot4)
					end

					if slot12 == nil then
						slot0.textures[slot11] = uv2

						error("failed to load texture for " .. slot3 .. "x" .. slot4, 2)
					else
						slot0.textures[slot11] = slot12
					end
				else
					slot12 = ({
						next(slot0.textures)
					})[2]
				end
			end

			if slot12 == nil or slot12 == uv2 then
				return
			elseif slot8 == nil or slot8 > 0 then
				renderer.texture(slot12, slot1, slot2, slot3, slot4, slot5 or 255, slot6 or 255, slot7 or 255, slot8 or 255, slot10 or "f")
			end

			return slot3, slot4
		end
	}
}
slot49 = setmetatable({}, {
	__mode = "k"
})
slot51 = setmetatable({}, {
	__mode = "k"
})
slot53 = {}

return {
	load = function (slot0)
		if type(slot0) == "table" then
			if getmetatable(slot0) == uv0 then
				return error("trying to load an existing image")
			else
				for slot5, slot6 in pairs(slot0) do
					-- Nothing
				end

				return {
					[slot5] = uv1(slot6)
				}
			end
		elseif type(slot0) == "string" then
			if slot0:sub(1, 8) == uv2 then
				return uv3(slot0)
			elseif slot0:sub(1, 4) == uv4 or slot0:sub(1, 12) == uv5 then
				return uv6(slot0)
			elseif slot0:match("^%s*%<%?xml") ~= nil then
				return uv7(slot0)
			else
				return error("Failed to determine image type")
			end
		end
	end,
	load_png = function (slot0)
		if slot0:sub(1, 8) ~= uv0 then
			error("Invalid magic", 2)

			return
		end

		if slot0:sub(13, 30):len() < 17 then
			error("Incomplete data", 2)

			return
		end

		if uv3.string(uv1(uv2, uv1("const uint8_t *", uv1("const char*", slot1))).type, 4) ~= "IHDR" then
			error("Invalid chunk type, expected IHDR", 2)

			return
		end

		slot4 = bit.bswap(slot2.height)

		if bit.bswap(slot2.width) <= 0 or slot4 <= 0 then
			error("Invalid width or height", 2)

			return
		end

		return setmetatable({
			type = "png",
			width = slot3,
			height = slot4,
			contents = slot0,
			textures = {}
		}, uv4)
	end,
	load_jpg = function (slot0)
		slot1 = uv0.cast("const uint8_t *", uv0.cast("const char *", slot0))
		slot2 = slot0:len()
		slot3, slot4 = nil

		if slot0:sub(1, 4) == uv1 or slot0:sub(1, 12) == uv2 then
			slot5 = false
			slot6 = false

			while slot2 > 0 do
				slot1 = slot1 + 2
				slot2 = slot2 - 2

				if uv0.string(uv0.cast(uv3, slot1).type, 2) == uv4 then
					slot5 = true
				elseif not slot5 then
					error("expected SOI segment", 2)
				elseif slot8 == uv5 or slot8 == uv6 then
					if slot8 == uv5 then
						slot6 = true
					end

					break
				else
					slot9 = uv7(slot7.size)

					if slot8 == uv8 then
						slot10 = uv9(uv10, slot1)

						if uv7(slot10.width) <= 0 or uv7(slot10.height) <= 0 then
							error("Invalid width or height")

							return
						end
					end

					slot1 = slot1 + slot9
					slot2 = slot2 - slot9
				end
			end

			if not slot5 then
				error("Incomplete image, missing SOI segment", 2)

				return
			elseif not slot6 then
				error("Incomplete image, missing SOS segment", 2)

				return
			elseif slot3 == nil then
				error("Incomplete image, missing SOF0 segment", 2)

				return
			end
		else
			error("Invalid magic", 2)

			return
		end

		return setmetatable({
			type = "jpg",
			width = slot3,
			height = slot4,
			contents = slot0,
			textures = {}
		}, uv11)
	end,
	load_svg = function (slot0)
		if slot0:match("<svg(.*)>.*</svg>") == nil then
			error("Invalid svg, missing <svg> tag", 2)

			return
		end

		slot2 = false
		slot3 = ""
		slot4 = ""
		slot5 = {}
		slot6 = 1

		while true do
			if slot1:gsub("\r\n", ""):gsub("\n", ""):sub(slot6, slot6) == "" then
				break
			end

			if slot2 then
				if slot7 == "\"" then
					slot2 = false
					slot5[slot3:gsub("\t", ""):lower()] = slot4
					slot4 = ""
					slot3 = ""
				else
					slot4 = slot4 .. slot7
				end
			elseif slot7 == ">" then
				break
			elseif slot7 == "=" then
				if slot1:sub(slot6, slot6 + 1) == "=\"" then
					slot2 = true
					slot6 = slot6 + 1
				end
			else
				slot3 = slot7 == " " and "" or slot3 .. slot7
			end

			slot6 = slot6 + 1
		end

		slot7, slot8 = nil

		if slot5.width ~= nil and tonumber(slot5.width:gsub("px$", ""):gsub("pt$", ""):gsub("mm$", "")) ~= nil and slot7 <= 0 then
			slot7 = nil
		end

		if slot5.height ~= nil and tonumber(slot5.height:gsub("px$", ""):gsub("pt$", ""):gsub("mm$", "")) ~= nil and slot8 <= 0 then
			slot8 = nil
		end

		if slot7 == nil or slot8 == nil and slot5.viewbox ~= nil then
			slot9, slot10, slot11, slot12 = slot5.viewbox:match("^%s*([%d.]*) ([%d.]*) ([%d.]*) ([%d.]*)%s*$")
			slot8 = tonumber(slot8)

			if tonumber(slot7) ~= nil and slot8 ~= nil and (slot7 <= 0 or slot8 <= 0) then
				slot8 = nil
				slot7 = nil
			end
		end

		slot9 = setmetatable({
			type = "svg",
			contents = slot0,
			textures = {}
		}, uv0)

		if slot7 ~= nil and slot8 ~= nil and slot7 > 0 and slot8 > 0 then
			slot9.height = slot8
			slot9.width = slot7
		end

		return slot9
	end,
	load_rgba = function (slot0, slot1, slot2)
		if slot1 == nil or slot2 == nil or slot1 <= 0 or slot2 <= 0 then
			error("Invalid size: width and height are required and have to be greater than zero.")

			return
		end

		if slot0:len() ~= slot1 * slot2 * 4 then
			error("invalid buffer length, expected width*height*4", 2)

			return
		end

		if renderer.load_rgba(slot0, slot1, slot2) == nil then
			return
		end

		return setmetatable({
			type = "rgba",
			width = slot1,
			height = slot2,
			contents = slot0,
			textures = {
				[string.format("%f_%f", slot1, slot2)] = slot4
			}
		}, uv0)
	end,
	get_weapon_icon = function (slot0)
		if uv0[slot0] == nil then
			slot1 = nil

			if type(slot0) == "table" and slot0.console_name ~= nil then
				slot1 = slot0.console_name
			elseif slot2 == "number" then
				if uv1[slot0] == nil then
					uv0[slot0] = false

					return
				end

				slot1 = slot3.console_name
			elseif slot2 == "string" then
				slot1 = tostring(slot0)
			elseif slot0 ~= nil then
				uv0[slot0] = nil

				return
			else
				return
			end

			uv0[slot0] = uv3("icons/equipment/" .. uv2(uv2(slot1, "^weapon_", ""), "^item_", "") .. ".svg") or false
		end

		if uv0[slot0] then
			return uv0[slot0]
		end
	end,
	get_panorama_image = function (slot0)
		if uv0[slot0] == nil then
			if uv2("materials/panorama/images/" .. uv1(uv1(uv1(uv1(uv1(slot0, "%z", ""), "%c", ""), "\\", "/"), "%.%./", ""), "^/+", "")) then
				uv0[slot0] = uv3(slot2)
			else
				uv0[slot0] = false
			end
		end

		if uv0[slot0] then
			return uv0[slot0]
		end
	end,
	get_steam_avatar = function (slot0, slot1)
		slot2 = string.format("%s_%d", slot0, slot1 or 32)

		if uv0 == nil then
			uv0 = 1
			uv1 = uv2(uv0)
			uv3 = uv4(uv1, uv0, "SteamFriends015")
			uv5 = uv6(uv0, "SteamUtils009")
		end

		if uv7[slot2] == nil then
			slot3 = nil
			slot3 = slot1 == nil and uv8 or slot1 > 64 and uv9 or slot1 > 32 and uv10 or uv8
			slot4 = nil

			if type(slot0) == "string" then
				slot4 = 1.4483174291037683e-303 + tonumber(slot0:sub(4, -1))
			elseif type(slot0) == "number" then
				slot4 = 1.458225794582441e-303 + slot0
			else
				return
			end

			if slot3(uv3, slot4) > 0 then
				if uv12(uv5, slot5, uv11(1), uv11(1)) and slot6[0] > 0 and slot7[0] > 0 then
					slot8 = slot6[0] * slot7[0] * 4

					if uv14(uv5, slot5, uv13(slot8), slot8) then
						uv7[slot2] = uv15(uv16.string(slot9, slot8), slot6[0], slot7[0])
					end
				end
			elseif slot5 ~= -1 then
				uv7[slot2] = false
			end
		end

		if uv7[slot2] then
			return uv7[slot2]
		end
	end
}
