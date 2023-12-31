slot0 = require("ffi")
slot1 = require("gamesense/string_tables")
slot4 = slot0.typeof("$*", slot0.typeof([[
	struct {
		uint64_t version;
		uint64_t xuid;
		char name[128];
		int userid;
		char guid[33];
		uint32_t friendsid;
		char friendsname[128];
		bool isbot;
		bool ishltv;
		uint32_t customfiles[4];
		uint8_t filesdownloaded;
	}
]]))
slot5 = slot0.cast("char*(__thiscall*)(void*, const char*)", function (slot0)
	if uv0.cast("uint8_t*", slot0)[0] == 232 then
		return slot1 + uv0.cast("int32_t*", slot1 + 1)[0] + 5
	elseif slot1[0] == 255 and slot1[1] == 21 then
		return uv0.cast("uint32_t**", uv0.cast("const char*", slot0) + 2)[0][0]
	else
		error(string.format("unknown instruction to follow: %02X!", slot1[0]))
	end
end(client.find_signature("client.dll", "\\xe8\\xcc\\xcc\\xcc̉\\x87  ")))
slot6 = slot0.cast("void**", slot0.cast("char*", client.find_signature("client.dll", "\\xb9\\xcc\\xcc\\xcc\\xcc\\xe8\\xcc\\xcc\\xcc̉")) + 1)[0]
slot9 = ui.new_string("Client side string", "")

ui.set_visible(ui.new_textbox("MISC", "Miscellaneous", "Client side name text"), false)

slot10, slot11 = nil

function slot12(slot0)
	if entity.get_local_player() == nil then
		return
	end

	if uv0.userinfo == nil then
		return
	end

	if uv1.cast(uv2, slot2:get_user_data(slot1 - 1)) == nil then
		return
	end

	if uv1.string(slot3.name) ~= uv3 then
		uv4 = slot4
	end

	if (slot0 or uv4) == nil then
		return
	end

	uv1.copy(slot3.name, slot0)

	if uv5(uv6, slot0) ~= nil then
		uv1.copy(slot5, slot0)
	end

	uv3 = slot0
end

function slot13()
	slot0 = ui.get(uv0):sub(1, 128)

	ui.set(uv1, slot0)

	if slot0 == "" then
		slot0 = " "
	end

	uv2(slot0)
end

function slot14()
	uv0()
end

ui.set_callback(ui.new_checkbox("MISC", "Miscellaneous", "Client side name"), function ()
	if ui.get(uv0) then
		client.set_event_callback("net_update_end", uv1)
		client.set_event_callback("shutdown", uv2)
	else
		client.unset_event_callback("net_update_end", uv1)
		client.unset_event_callback("shutdown", uv2)
		uv2()
	end

	ui.set_visible(uv3, slot0)
end)
client.delay_call(0, function ()
	ui.set(uv0, ui.get(uv1))
end)
client.set_event_callback("post_config_load", function ()
	ui.set(uv0, ui.get(uv1))
end)
