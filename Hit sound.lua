slot0 = require("ffi")
slot1 = require("gamesense/uix")
slot2 = client.set_event_callback
slot3 = client.unset_event_callback
slot4 = client.userid_to_entindex
slot5 = entity.get_local_player
slot6 = ui.get
slot7 = ui.new_checkbox
slot8 = ui.new_combobox
slot9 = ui.set_callback
slot10 = ui.set_visible

function slot11(slot0, slot1, slot2, slot3)
	slot4 = client.create_interface(slot0, slot1) or error("invalid interface", 2)
	slot5 = client.find_signature(slot0, slot2) or error("invalid signature", 2)
	slot6, slot7 = pcall(uv0.typeof, slot3)

	if not slot6 then
		error(slot7, 2)
	end

	slot8 = uv0.cast(slot7, slot5) or error("invalid typecast", 2)

	return function (...)
		return uv0(uv1, ...)
	end
end

function slot12(slot0, slot1, slot2)
	return uv0.cast(slot2, uv0.cast("void***", slot0)[0][slot1])
end

slot14, slot15, slot16, slot17 = nil
slot18 = {}
slot19 = {}
slot20 = slot0.typeof("int[1]")
slot21 = slot0.typeof("char[?]")
slot22 = slot11("filesystem_stdio.dll", "VFileSystem017", "U\\x8b\\xecj \\xffu\\xffu\\xffu\\xe8\\xcc\\xcc\\xcc\\xcc]", "const char*(__thiscall*)(void*, const char*, const char*, int*)")
slot23 = slot11("filesystem_stdio.dll", "VFileSystem017", "U\\x8b\\xec\\x83\\xecS\\x8bً\r\\xcc\\xcc\\xcc\\xcc", "const char*(__thiscall*)(void*, int)")
slot24 = slot11("filesystem_stdio.dll", "VFileSystem017", "U\\x8b\\xecS\\x8b]\\x85", "void(__thiscall*)(void*, int)")
slot25 = slot11("filesystem_stdio.dll", "VFileSystem017", "U\\x8b\\xecV\\x8buV\\xffu", "bool(__thiscall*)(void*, char*, int)")
slot26 = slot11("filesystem_stdio.dll", "VFileSystem017", "U\\x8b\\xec\\x81\\xec\\xcc\\xcc\\xcc̋USVW", "void(__thiscall*)(void*, const char*, const char*, int)")
slot27 = slot11("filesystem_stdio.dll", "VFileSystem017", "U\\x8b\\xec\\xb7E", "bool(__thiscall*)(void*, int)")
slot28 = cvar.sndplaydelay
slot29 = function (slot0, slot1, slot2, slot3)
	slot4 = client.create_interface(slot0, slot1) or error("invalid interface")
	slot5, slot6 = pcall(uv0.typeof, slot3)

	if not slot5 then
		error(slot6, 2)
	end

	slot7 = uv1(slot4, slot2, slot6) or error("invalid vtable")

	return function (...)
		return uv0(uv1, ...)
	end
end("vguimatsurface.dll", "VGUI_Surface031", 82, "void(__thiscall*)(void*, const char*)")

function slot30()
	slot0 = {}
	slot2 = uv1("*", "XGAME", uv0())

	while slot2 ~= nil do
		slot3 = uv2.string(slot2)

		if uv3(slot1[0]) == false and (slot3:find(".mp3") or slot3:find(".wav")) then
			slot0[#slot0 + 1] = slot3
		end

		slot2 = uv4(slot1[0])
	end

	uv5(slot1[0])

	return slot0
end

function slot31(slot0)
	if slot0:find("_") then
		slot0 = slot0:gsub("_", " ")
	end

	if slot0:find(".mp3") then
		slot0 = slot0:gsub(".mp3", "")
	end

	if slot0:find(".wav") then
		slot0 = slot0:gsub(".wav", "")
	end

	return slot0
end

function slot32(slot0)
	if uv0(slot0.attacker) == uv1() and uv2[slot0.hitgroup == 1 and uv3(uv4) or uv3(uv5)] then
		for slot5 = 1, uv3(uv6) do
			uv7(slot1)
		end
	end
end

function slot33(slot0)
	if uv0(slot0.attacker) == uv1() then
		uv5:invoke_callback(0, uv2[uv3(uv4)])
	end
end

function slot34(slot0, slot1)
	slot2 = slot1 or uv0(slot0)

	uv1(uv2, slot2)
	uv1(uv3, slot2)
	uv1(uv4, slot2)
end

function slot35(slot0, slot1)
	uv0[#uv0 + 1] = slot0
	uv1[slot0] = slot1
end

function ()
	uv0("Wood stop", "doors/wood_stop1.wav")
	uv0("Wood strain", "physics/wood/wood_strain7.wav")
	uv0("Wood plank impact", "physics/wood/wood_plank_impact_hard4.wav")
	uv0("Warning", "resource/warning.wav")

	slot0 = uv1(128)

	uv2(slot0, uv3.sizeof(slot0))
	uv4(string.format("%s\\csgo\\sound\\hitsounds", uv3.string(slot0)), "XGAME", 0)

	for slot5 = 1, #uv5() do
		slot6 = slot1[slot5]

		uv0(uv6(slot6), string.format("hitsounds/%s", slot6))
	end

	uv7 = uv8.new_checkbox("LUA", "B", "Hit marker sound")
	uv9 = uv10("LUA", "B", "Head shot sound", uv11)
	uv12 = uv10("LUA", "B", "Body shot sound", uv11)
	uv13 = ui.new_slider("LUA", "B", "\nSound volume", 1, 100, 1, true, "%")

	uv7:on("change", uv14)
	uv7:on("player_hurt", uv15)
	uv7:on("player_blind", uv16)
end()
