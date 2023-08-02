slot0 = require("ffi")
slot1 = entity
slot2 = ui
slot3 = globals
slot4 = bit
slot5 = 14
slot6 = 100
slot7 = {
	"models/props/de_mirage/towertop_d/towertop_d",
	"models/props/de_dust/palace_bigdome",
	"models/props_lighting/",
	"decals/",
	"particle/",
	"de_nuke/nuke_beam_"
}
slot8 = {
	"models/props/de_dust/hr_dust/dust_skybox/",
	"models/props/de_inferno/hr_i/inferno_skybox",
	"models/props/de_nuke/hr_nuke/nuke_skydome_001",
	"models/props/cs_office/clouds",
	"skybox/"
}
slot12 = slot2.new_color_picker("VISUALS", "Effects", "Override fog color", 235, 225, 225, 105)
slot15 = slot2.new_checkbox("VISUALS", "Effects", "Skybox fog")

slot2.set_visible(slot2.new_slider("VISUALS", "Effects", "\nFog start color", -5000 / slot6, 15000 / slot6, 0 / slot6, true, "", slot6), false)
slot2.set_visible(slot2.new_slider("VISUALS", "Effects", "\nFog end color", -5000 / slot6, 15000 / slot6, 7500 / slot6, true, "", slot6), false)
slot2.set_visible(slot15, false)
slot2.set(slot15, true)

slot16 = vtable_bind("client.dll", "VClientEntityList003", 3, "uintptr_t(__thiscall*)(void*, int)")

cvar.r_disable_distance_fade_on_big_props:set_raw_int(1)
cvar.r_disable_distance_fade_on_big_props_thresh:set_raw_float(500)

slot17 = slot0.cast("intptr_t**", slot0.cast("char*", client.find_signature("engine.dll", "\\xbe\\xcc\\xcc\\xcc̋\\x85\\xc9t\\x8b\\xffP4")) + 1)[0]
slot18 = nil
slot19 = 1
slot21 = slot0.cast("uint32_t*", slot0.new("uint8_t[4]"))

function slot22(slot0, slot1, slot2, slot3)
	uv0[0] = slot0
	uv0[1] = slot1
	uv0[2] = slot2
	uv0[3] = slot3

	return uv1[0]
end

function slot23(slot0, slot1, slot2)
	return uv0.bor(slot0, uv0.lshift(slot1, 8), uv0.lshift(slot2, 16))
end

slot24 = {}

function slot25(slot0, slot1, ...)
	uv0[slot0][slot1] = {
		uv1.get_prop(slot0, slot1)
	}

	uv1.set_prop(slot0, slot1, ...)
end

function slot26()
	for slot3, slot4 in pairs(uv0) do
		for slot8, slot9 in pairs(slot4) do
			uv1.set_prop(slot3, slot8, unpack(slot9))
		end
	end

	table.clear(uv0)
end

function slot27(slot0)
	slot1 = not slot0 and uv0.get(uv1)

	for slot5, slot6 in ipairs(uv2) do
		for slot10, slot11 in ipairs(materialsystem.find_materials(slot6) or {}) do
			slot11:set_material_var_flag(uv3, not slot1)

			if slot11:get_shader_param("$fogfadeend") ~= nil and (slot12 == 0 or slot12 > 0.3) then
				slot11:set_shader_param("$fogfadeend", 0.33)
			end

			if slot11:get_shader_param("$fogscale") ~= nil then
				slot11:set_shader_param("$fogscale", 1)
			end

			if slot11:get_shader_param("$vertexfogamount") ~= nil then
				slot11:set_shader_param("$vertexfogamount", 2)
			end
		end
	end

	slot2 = slot1 and uv0.get(uv4)

	for slot6, slot7 in ipairs(uv5) do
		for slot11, slot12 in ipairs(materialsystem.find_materials(slot7) or {}) do
			slot12:set_material_var_flag(uv3, not slot2)
		end
	end

	if (uv6.mapname() or ""):find("office") then
		uv7 = 1.75
	elseif slot3:find("italy") then
		uv7 = 1.3
	else
		uv7 = 1
	end
end

function slot28()
	if uv0.get_local_player() == nil then
		return
	end

	slot1 = 1
	slot2, slot3, slot4, slot5 = uv1.get(uv2)
	slot6 = uv3(slot2, slot3, slot4)
	slot7 = uv1.get(uv4) * uv5 * uv6
	slot8 = uv1.get(uv7) * uv5 * uv6
	slot9 = slot5 / 255

	if uv8.band(math.max(0, uv0.get_prop(slot0, "m_PlayerFog.m_hCtrl") or 0), 65535) > 0 and slot10 < 65535 then
		uv9[slot10] = {}

		uv10(slot10, "m_fog.enable", slot1)
		uv10(slot10, "m_fog.dirPrimary", 0, 0, 0)
		uv10(slot10, "m_fog.colorPrimary", slot6)
		uv10(slot10, "m_fog.colorSecondary", slot6)
		uv10(slot10, "m_fog.start", slot7)
		uv10(slot10, "m_fog.end", slot8)
		uv10(slot10, "m_fog.maxdensity", slot9)
		uv10(slot10, "m_fog.ZoomFogScale", 0)
		uv10(slot10, "m_fog.HDRColorScale", 1)
		uv10(slot10, "m_fog.blend", 0)
		uv10(slot10, "m_fog.duration", 0)
	end

	uv9[slot0] = {}

	uv10(slot0, "m_skybox3d.fog.enable", slot1)
	uv10(slot0, "m_skybox3d.fog.dirPrimary", 0, 0, 0)
	uv10(slot0, "m_skybox3d.fog.colorPrimary", slot6)
	uv10(slot0, "m_skybox3d.fog.colorSecondary", slot6)
	uv10(slot0, "m_skybox3d.fog.start", slot7)
	uv10(slot0, "m_skybox3d.fog.end", slot8)
	uv10(slot0, "m_skybox3d.fog.maxdensity", slot9)
	uv10(slot0, "m_skybox3d.fog.HDRColorScale", 1)
	uv10(slot0, "m_skybox3d.fog.blend", 0)

	if tonumber(uv11[0]) ~= uv12 then
		uv13()

		uv12 = slot11
	end
end

function slot29()
	uv0()

	if not uv1.get(uv2) then
		client.unset_event_callback("pre_render", uv3)
		client.unset_event_callback("post_render", uv4)
	end
end

function slot30()
	uv0()
	client.delay_call(0, uv0)
end

function slot31()
	uv0(true)
end

slot2.set_callback(slot2.new_checkbox("VISUALS", "Effects", "Override fog"), function ()
	if uv0.get(uv1) then
		client.set_event_callback("pre_render", uv2)
		client.set_event_callback("post_render", uv3)
		client.set_event_callback("level_init", uv4)
		client.set_event_callback("shutdown", uv5)
		uv0.set(uv6, false)
	else
		client.unset_event_callback("level_init", uv4)
		client.unset_event_callback("shutdown", uv5)
	end

	uv0.set_visible(uv7, slot0)
	uv0.set_visible(uv8, slot0)
	uv0.set_visible(uv9, slot0)
	uv10()
end)
slot2.set_callback(slot15, function ()
	uv0()
end)
slot2.set_callback(slot2.reference("VISUALS", "Colored models", "Props"), function ()
	uv0()
end)
slot2.set_callback(slot2.reference("VISUALS", "Effects", "Remove fog"), function ()
	if uv0.get(uv1) then
		uv0.set(uv2, false)
	end
end)
