function slot0(slot0)
	slot1 = {}

	for slot5 in pairs(slot0) do
		slot1[#slot1 + 1] = slot5
	end

	return slot1
end

slot1 = 0
slot2 = 0
slot4 = require("gamesense/swift_ui")
slot5 = "LUA"
slot6 = "A"
slot8 = slot4.new_combobox(slot5, slot6, "Clantag Changer", "Create new", table.unpack(slot0(database.read("sam_clantags") or {})))

slot8:add_children({
	slot4.new_label(slot5, slot6, "Create new clantag:"),
	slot4.new_label(slot5, slot6, "Name"),
	slot4.new_label(slot5, slot6, "Text"),
	name = slot4.new_textbox(slot5, slot6, "Name"),
	text = slot4.new_textbox(slot5, slot6, "Text"),
	animation = slot4.new_combobox(slot5, slot6, "Animation", slot0({
		Static = function (slot0)
			return slot0.text
		end,
		Default = function (slot0)
			return uv0 == 0 and " " or slot0.text:sub(1, uv0)
		end,
		Reverse = function (slot0)
			slot1 = slot0.text

			return uv0 <= slot0.text:len() and slot1:sub(1, uv1) or slot2 - uv1 == 0 and " " or slot1:sub(1, slot2 - uv1)
		end,
		Loop = function (slot0)
			slot1 = slot0.text

			for slot5 = 1, uv0 do
				slot1 = slot1 .. slot1:sub(1, 1)
				slot1 = slot1:sub(2, slot1:len())
			end

			return slot1
		end
	})),
	speed = slot4.new_slider(slot5, slot6, "Speed", 0, 100, 30, true, "%"),
	create = slot4.new_button(slot5, slot6, "Create", function ()
		slot1 = uv0.text:get()

		if uv0.name:get() == "" or slot1 == "" then
			error("Clantag name/text cannot be empty!")
		end

		uv1[uv0.name:get()] = {
			text = slot1,
			animation = uv0.animation:get(),
			speed = uv0.speed:get()
		}

		client.reload_active_scripts()
	end)
}, function (slot0)
	return slot0:compare("Create new")
end)
slot8:add_children(slot4.new_button(slot5, slot6, "Remove", function ()
	uv0[uv1:get()] = nil

	client.reload_active_scripts()
end), function (slot0)
	return not slot0:compare("Create new")
end)
client.set_event_callback("shutdown", function ()
	database.write("sam_clantags", uv0)
end)

slot10 = nil

client.set_event_callback("net_update_end", function ()
	slot0 = uv0:get()
	slot1 = uv1[slot0]

	if slot0 == "Create new" then
		slot1 = {
			text = uv2.text:get(),
			animation = uv2.animation:get(),
			speed = uv2.speed:get()
		}
	end

	slot3 = slot1.text:len()
	uv4 = math.floor(globals.curtime() * slot1.speed / 10 % slot3 + 1)
	uv5 = math.floor(globals.curtime() * slot1.speed / 10 % (slot3 * 2) + 1)

	if uv6 ~= uv3[slot1.animation](slot1) then
		client.set_clan_tag(slot4)

		uv6 = slot4
	end
end)
