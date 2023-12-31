slot2 = {
	data = {
		write = database.write,
		read = database.read
	},
	render = {
		rectangle = renderer.rectangle,
		gradient = renderer.gradient,
		text = renderer.text,
		measure = renderer.measure_text,
		load_rgba = renderer.load_rgba,
		texture = renderer.texture
	}
}
slot3 = "\\xff"
slot4 = "    "
slot6 = slot2.render.load_rgba(table.concat({
	slot3,
	slot3,
	slot4,
	slot3,
	slot4,
	slot3,
	slot4,
	slot3,
	slot4,
	slot3,
	slot3,
	slot3,
	slot4,
	slot3,
	slot4,
	slot3
}), 4, 4)
slot7 = require("ffi").typeof("int[1]")
slot8 = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 100, "unsigned int(__thiscall*)(void*, int*, int*)")
slot9 = vtable_bind("vgui2.dll", "VGUI_System010", 7, "int(__thiscall*)(void*)")
slot10 = vtable_bind("vgui2.dll", "VGUI_System010", 11, "void(__thiscall*)(void*, int, const char*, int)")
slot11 = panorama.open().SteamOverlayAPI
slot12, slot13 = client.screen_size()
slot15 = {
	logs = slot2.data.read("custom_console/logs") or {},
	param = slot2.data.read("custom_console/parameters") or {
		h = 100,
		w = 250,
		x = slot12 / 2 - 125,
		y = slot13 / 2 - 50
	}
}
slot16 = {
	fade = 1,
	open_send = false,
	dpi = 1,
	open = true,
	gs_color = {
		r = 187,
		a = 255,
		b = 13,
		g = 220
	},
	mouse = {
		y = 0,
		x_ = 0,
		y_ = 0,
		x = 0
	},
	drag = {},
	scroll = {
		drag_y = 0,
		drag = false,
		y_ = 0,
		x = slot15.param.x + slot15.param.w,
		y = slot15.param.y,
		h = slot15.param.h
	},
	clr = {
		r = 0,
		a = 255,
		b = 0,
		g = 0
	},
	pre = {
		"game",
		"sense"
	},
	hovered = {
		corner = false,
		send = false,
		message = -1,
		window = false,
		scroll = false
	}
}
slot16.gs_color.r, slot16.gs_color.g, slot16.gs_color.b, slot16.gs_color.a = ui.get(({
	color = ui.reference("misc", "settings", "menu color"),
	layout = ui.reference("misc", "settings", "lock menu layout"),
	dpi = ui.reference("misc", "settings", "dpi scale")
}).color)
slot16.clr = slot16.gs_color

if slot2.data.read("custom_console/clear") then
	ui.set(({
		show = ui.new_checkbox("lua", "b", "• Custom console settings"),
		hotkey = ui.new_hotkey("lua", "b", "console_hotkey", true, 45),
		style = ui.new_combobox("lua", "b", "\n", "Gamesense", "Pasted"),
		open_menu = ui.new_checkbox("lua", "b", "• Open with ui"),
		render_line = ui.new_checkbox("lua", "b", "• Render line"),
		clr_override = ui.new_checkbox("lua", "b", "• Override color"),
		clr = ui.new_color_picker("lua", "b", "clr_ovr", slot16.gs_color.r, slot16.gs_color.g, slot16.gs_color.b, slot16.gs_color.a),
		dont_copy = ui.new_checkbox("lua", "b", "• Ignore prefix"),
		render_rounds = ui.new_multiselect("lua", "b", "• Indicate rounds", "Render", "Print on round start"),
		clear_logs = ui.new_checkbox("lua", "b", "• Clear logs on shutdown"),
		_ = ui.new_label("lua", "b", "• Prefix"),
		prefix = ui.new_textbox("lua", "b", "cnsl_prefix"),
		__ = ui.new_label("lua", "b", "• Prefix (color)"),
		prefix_clr = ui.new_textbox("lua", "b", "cnsl_clr_prefix")
	}).clear_logs, slot2.data.read("custom_console/clear"))
end

if slot2.data.read("console/save/enabled") or slot2.data.read("console/pos/x") then
	slot2.data.write("console/save/enabled", nil)
	slot2.data.write("console/save/always", nil)
	slot2.data.write("console/save/prefix", nil)
	slot2.data.write("console/prefix_c", nil)
	slot2.data.write("console/save/dont_copy", nil)
	slot2.data.write("console/save/clr_c", nil)
	slot2.data.write("console/save/print_rounds", nil)
	slot2.data.write("console/save/clr_r", nil)
	slot2.data.write("console/save/clr_g", nil)
	slot2.data.write("console/save/clr_b", nil)
	slot2.data.write("console/save/clr_a", nil)
	slot2.data.write("console/width", nil)
	slot2.data.write("console/height", nil)
	slot2.data.write("console/prev_logs__", logs)
	slot2.data.write("console/pos/x", nil)
	slot2.data.write("console/pos/y", nil)
	print("Cleared old data and applied some to the new database [console]")
end

if slot2.data.read("custom_console/") then
	slot2.data.write("custom_console/pos", nil)
	slot2.data.read("custom_console/size", nil)
	slot2.data.read("custom_console/", nil)
	slot2.data.read("custom_console/data", nil)
end

slot18 = {
	draw_ui = function (slot0, slot1, slot2, slot3, slot4)
		slot5 = {
			10,
			60,
			40,
			40,
			40,
			60,
			10
		}

		for slot9 = 0, 6 do
			uv0.render.rectangle(slot0 + slot9, slot1 + slot9, slot2 - slot9 * 2, slot3 - slot9 * 2, slot5[slot9 + 1], slot5[slot9 + 1], slot5[slot9 + 1], 255 * slot4)
		end

		uv0.render.texture(uv1, slot0 + 6, slot1 + 6, slot2 - 12, slot3 - 12, 255, 255, 255, 255 * slot4, "r")

		if ui.get(uv2.render_line) then
			uv0.render.gradient(slot0 + 7, slot1 + 7, slot2 / 2, 2, 5, 221, 255, 255 * slot4, 186, 12, 230, 255 * slot4, true)
			uv0.render.gradient(slot0 + 7 + slot2 / 2, slot1 + 7, slot2 / 2 - 14, 2, 186, 12, 230, 255 * slot4, 219, 226, 60, 255 * slot4, true)
			uv0.render.rectangle(slot0 + 7, slot1 + 8, slot2 - 14, 1, 0, 0, 0, 190 * slot4)
		end
	end,
	draw_container = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		slot7 = {
			10,
			45,
			25
		}
		slot8 = uv0.render.measure("db", slot5)

		if slot6 then
			slot8 = uv0.render.measure("db", slot5 .. slot6)
		end

		for slot12 = 1, 3 do
			uv0.render.rectangle(slot0 + slot12, slot1 + slot12, slot2 - slot12 * 2, slot3 - slot12 * 2, slot7[slot12], slot7[slot12], slot7[slot12], 255 * slot4)
		end

		uv0.render.rectangle(slot0 + 14, slot1 + 1, slot8 + 4, 2, 30, 30, 30, 255 * slot4)
	end,
	get_clipboard = function ()
		if uv0() > 0 then
			slot1 = uv1.new("char[?]", slot0)

			uv2(0, slot1, slot0 * uv1.sizeof("char[?]", slot0))

			return uv1.string(slot1, slot0 - 1)
		end

		return nil
	end,
	get_mouse_positon = function ()
		slot0 = uv0()
		slot1 = uv0()

		uv1(slot0, slot1)

		return tonumber(slot0[0]), tonumber(slot1[0])
	end,
	intersect = function (slot0, slot1, slot2, slot3, slot4)
		return slot1 <= slot0[1] and slot0[1] <= slot1 + slot3 and slot2 <= slot0[2] and slot0[2] <= slot2 + slot4
	end,
	clamp = function (slot0, slot1, slot2)
		if slot0 < slot1 then
			slot3 = slot1 or slot3
		end

		if slot2 < slot3 then
			slot3 = slot2 or slot3
		end

		return slot3
	end,
	contains = function (slot0, slot1)
		for slot5 = 1, #slot0 do
			if slot0[slot5] == slot1 then
				return true
			end
		end

		return false
	end
}
slot19 = {
	print = function (slot0, slot1, slot2, slot3, slot4, ...)
		if type(slot0 or "log") ~= "string" or slot5 ~= "log" and slot5 ~= "message" and slot5 ~= "player" then
			client.error_log("Invalid argument[1] in api.print()")

			return
		end

		if type(slot1) ~= "number" then
			client.error_log("Invalid argument[2] in api.print()")

			return
		end

		if type(slot2) ~= "number" then
			client.error_log("Invalid argument[3] in api.print()")

			return
		end

		if type(slot3) ~= "number" then
			client.error_log("Invalid argument[4] in api.print()")

			return
		end

		if type(slot4) ~= "boolean" then
			client.error_log("Invalid argument[5] in api.print()")

			return
		end

		slot6 = {
			...
		}
		slot8 = nil

		if entity.get_game_rules() ~= nil then
			slot8 = entity.get_prop(slot7, "m_totalRoundsPlayed") + 1
		end

		if (entity.get_prop(slot7, "m_bWarmupPeriod") or 0) == 1 then
			slot8 = "W"
		end

		uv0.logs[#uv0.logs + 1] = {
			type = slot5,
			r = slot1,
			g = slot2,
			b = slot3,
			round = slot8 or "nil",
			can_copy = slot4,
			text = unpack(slot6)
		}

		uv1.data.write("custom_console/logs", uv0.logs)

		return #uv0.logs
	end,
	clear = function (slot0)
		if type(slot0) ~= "string" and type(slot0) ~= "number" then
			client.error_log("Invalid argument in api.clear()")

			return
		end

		if type(slot0) == "number" then
			if uv0.logs[slot0] then
				uv0.logs[slot0] = nil

				return
			end
		elseif type(slot0) == "string" then
			for slot4, slot5 in pairs(uv0.logs) do
				if ({
					slot5.text:find(slot0)
				})[1] then
					uv0.logs[slot4] = nil

					return
				end
			end
		end

		client.error_log("Couldn't find specified index (api.clear)")
	end,
	edit = function (slot0, slot1, slot2, slot3, slot4, slot5, ...)
		slot6 = slot1

		if type(slot0) ~= "number" then
			client.error_log("Invalid argument[1] in api.edit()")

			return
		end

		if type(slot6) ~= "string" or slot6 ~= "log" and slot6 ~= "message" and slot6 ~= "player" then
			client.error_log("Invalid argument[2] in api.edit()")

			return
		end

		for slot17, slot18 in pairs(uv0.logs) do
			if slot0 == slot17 then
				slot10 = slot6 or slot18.type
				slot9 = slot4 or slot18.b
				slot8 = slot3 or slot18.g
				slot7 = slot2 or slot18.r
				slot11 = nil or slot18.can_copy
				slot12 = unpack({
					...
				}) or slot18.text
			end
		end

		if uv0.logs[slot0] then
			slot14 = uv0.logs[slot0]
			slot14.text = slot12
			slot14.can_copy = slot11
			slot14.b = slot9
			slot14.g = slot8
			slot14.r = slot7
			slot14.type = slot10

			return
		end

		client.error_log("Couldn't find specified index (api.edit)")
	end,
	return_logs = function ()
		slot0 = {}

		for slot4, slot5 in pairs(uv0.logs) do
			slot0[#slot0] = slot5
		end

		return slot0
	end,
	get_parameters = function ()
		return uv0.param.x, uv0.param.y, uv0.param.w, uv0.param.h
	end,
	is_open = function ()
		return uv0.open, uv0.fade
	end
}
slot20 = {
	{
		globals.realtime(),
		false,
		false,
		false
	},
	{
		globals.realtime(),
		false,
		false,
		false
	}
}

client.set_event_callback("paint_ui", function ()
	for slot3, slot4 in pairs(uv0) do
		slot4[3] = client.key_state(slot3)

		if slot4[3] then
			if slot4[1] < globals.realtime() then
				slot4[2] = true
			else
				slot4[2] = false
			end

			slot4[1] = globals.realtime() + 0.05
		elseif globals.realtime() < slot4[1] then
			slot4[4] = true
		else
			slot4[4] = false
		end
	end
end)
client.set_event_callback("paint_ui", ({
	handle = function (slot0)
		slot1 = uv0
		slot2 = slot1.gs_color
		slot3 = slot1.mouse
		slot4 = slot1.dpi
		slot5 = slot1.drag
		slot6 = slot1.scroll
		slot7 = slot1.hovered
		slot8 = ui.get(uv1.dpi):gsub("%%", "%")
		slot9 = uv2[1][3]
		slot2.r, slot2.g, slot2.b, slot2.a = ui.get(uv1.color)
		slot1.clr = slot2

		if ui.get(uv3.clr_override) then
			slot1.clr.r, slot1.clr.g, slot1.clr.b, slot1.clr.a = ui.get(uv3.clr)
		end

		slot1.dpi = tonumber(slot8) / 100
		slot10 = uv4.param.x
		slot11 = uv4.param.y
		slot12 = uv4.param.w * slot4
		slot13 = uv4.param.h * slot4
		slot3.x, slot3.y = uv5.get_mouse_positon()
		slot7.scroll = uv5.intersect({
			slot3.x,
			slot3.y
		}, slot6.x, slot6.y, 6, slot6.h)
		slot7.corner = uv5.intersect({
			slot3.x,
			slot3.y
		}, slot10 + slot12 - 10, slot11 + slot13 - 10, 10, 10)
		slot7.window = uv5.intersect({
			slot3.x,
			slot3.y
		}, slot10, slot11, slot12, slot13)
		slot1.open = ui.get(uv3.hotkey) or ui.get(uv3.open_menu) and ui.is_menu_open()
		slot1.pre[1] = ui.get(uv3.prefix) == "" and "game" or ui.get(uv3.prefix)
		slot1.pre[2] = ui.get(uv3.prefix_clr) == "" and "sense" or ui.get(uv3.prefix_clr)

		if not slot9 then
			slot3.y_ = slot3.y
			slot3.x_ = slot3.x
		end

		if slot1.open then
			if ui.is_menu_open() then
				if slot5.bool and not slot9 then
					slot5.bool = false
				end

				if slot5.bool and slot9 then
					uv4.param.y = slot3.y - slot5.y
					uv4.param.x = slot3.x - slot5.x

					uv6.data.write("custom_console/parameters", uv4.param)
				end

				if slot7.window and slot7.message == -1 and slot9 then
					slot5.bool = true
					slot5.y = slot3.y - uv4.param.y
					slot5.x = slot3.x - uv4.param.x
				end

				if slot9 then
					if slot5.rbool then
						uv4.param.h = math.max(120, slot3.y - slot5.ry)
						uv4.param.w = math.max(350, slot3.x - slot5.rx)
						slot5.bool = false

						uv6.data.write("custom_console/parameters", uv4.param)
					end

					if slot7.corner then
						slot5.rbool = true
						slot5.ry = slot3.y - uv4.param.h
						slot5.rx = slot3.x - uv4.param.w
					end
				else
					slot5.rbool = false
				end
			end

			if slot6.drag and not uv2[1][3] then
				slot6.drag = false
			end

			if slot6.drag and uv2[1][3] then
				slot6.y_ = math.min(0, math.max(-uv6.render.measure("d", "A") * #uv4.logs, slot3.y - slot6.drag_y))
				slot5.bool = false
				slot5.rbool = false
			end

			if slot7.scroll then
				slot6.drag_y = slot3.y - slot6.y_
				slot6.drag = true
			end
		end
	end,
	text = function (slot0, slot1, slot2, slot3, slot4)
		slot6 = 0
		slot7 = "[" .. table.concat(uv0.pre) .. "] "
		slot8 = ""

		if uv1.contains(ui.get(uv2.render_rounds), "Render") and slot3.round ~= "nil" then
			slot7 = string.format("[%s] [%s] ", slot3.round, table.concat(slot5.pre))
		end

		slot3.text = tostring(slot3.text)

		({
			log = function ()
				slot0 = uv0.render.measure("d", uv1)
				slot2 = uv2.alpha or 1
				uv3 = (uv0.render.measure("d", uv2.text) + slot0 + 32 - uv4.param.w) / 4
				uv3 = math.max(0, uv2.text:len() - uv3)

				uv0.render.text(uv5, uv6, uv7.clr.r, uv7.clr.g, uv7.clr.b, 255 * uv8 * slot2, "d", 0, uv1)
				uv0.render.text(uv5 + slot0, uv6, uv2.r, uv2.g, uv2.b, 255 * uv8 * slot2, "d", 0, uv2.text:sub(1, uv3))

				if ui.get(uv9.dont_copy) then
					uv10 = uv2.text
				else
					uv10 = "[" .. table.concat(uv7.pre) .. "] " .. uv2.text
				end
			end,
			message = function ()
				uv2 = (uv0.render.measure("d", uv1.text) + 32 - uv3.param.w) / 4
				uv2 = math.max(0, uv1.text:len() - uv2)

				uv0.render.text(uv4, uv5, uv1.r, uv1.g, uv1.b, 255 * uv6 * (uv1.alpha or 1), "d", 0, uv1.text:sub(1, uv2))

				if ui.get(uv7.dont_copy) then
					uv8 = uv1.text
				else
					uv8 = "[" .. table.concat(uv9.pre) .. "] " .. uv1.text
				end
			end,
			player = function ()
				slot1 = {
					uv0.text:find("}")
				}

				if {
					uv0.text:find("{")
				} and slot1 then
					uv1 = uv0.text:sub(slot0[1] + 1, slot1[1] - 1) .. "» "
				else
					slot1[1] = -1
					uv1 = "unknown » "
				end

				slot2 = uv2.render.measure("d", uv1)
				slot4 = uv0.alpha or 1
				uv3 = (uv2.render.measure("d", uv0.text) + slot2 + 32 - uv4.param.w) / 4
				uv3 = math.max(0, uv0.text:len() - uv3)

				uv2.render.text(uv5, uv6, uv7.clr.r, uv7.clr.g, uv7.clr.b, 255 * uv8 * slot4, "d", 0, uv1)
				uv2.render.text(uv5 + slot2, uv6, uv0.r, uv0.g, uv0.b, 255 * uv8 * slot4, "d", 0, uv0.text:sub(slot1[1] + 2, uv3))

				if ui.get(uv9.dont_copy) then
					uv10 = uv0.text
				else
					uv10 = uv1 .. ": " .. uv0.text
				end
			end
		})[slot3.type]()

		return slot8
	end,
	window = function ()
		uv0:handle()

		slot0 = uv1
		slot1 = slot0.clr
		slot2 = slot0.mouse
		slot3 = slot0.dpi
		slot4 = slot0.drag
		slot7 = slot0.fade
		slot12 = {
			uv3.render.measure("d", "A")
		}
		slot13 = {
			x = uv2.param.x + 24,
			y = uv2.param.y + 10,
			w = uv2.param.w * slot3 - 43,
			h = uv2.param.h * slot3 - 30
		}
		slot15 = slot13.y + slot13.h - slot0.scroll.y_ - 15 + (ui.get(uv4.render_line) and 4 or 0)
		slot16 = globals.frametime() * 10

		if not slot0.open_send then
			slot0.hovered.message = -1
		end

		slot17 = {
			style = ui.get(uv4.style)
		}
		slot0.scroll.x = slot13.x + slot13.w - 5

		if #uv2.logs > 150 then
			table.remove(uv2.logs, 1)
		end

		if slot7 > 0 then
			if slot17.style == "Gamesense" then
				uv5.draw_ui(slot8, slot9, slot10, slot11 + slot14, slot7)

				slot21 = slot10 - 32
				slot22 = slot11 - 32

				uv5.draw_container(slot8 + 16, slot9 + 16 + slot14, slot21, slot22, slot7, slot0.pre[1], slot0.pre[2])

				for slot21, slot22 in pairs(uv2.logs) do
					slot24 = false

					if slot15 - (slot12[2] + 2) * (#uv2.logs - slot21) >= slot13.y + slot14 + 10 and slot15 - slot23 <= slot13.y + slot14 + slot13.h - 12 then
						if slot22.can_copy then
							slot24 = uv5.intersect({
								slot2.x,
								slot2.y
							}, slot13.x, slot15 - slot23, slot13.w - 8, 12)
						end

						slot25 = slot7

						if slot24 then
							slot25 = (uv6[1][3] or uv6[2][3]) and 0.5 or 0.65

							if not slot0.open_send then
								slot6.message = slot21
							end
						elseif slot6.message == slot21 then
							slot25 = 0.5
						end

						if slot24 then
							if uv6[1][4] then
								uv7.CopyTextToClipboard(uv0:text(slot13.x, slot15 - slot23, slot22, slot25))
							end

							if uv6[2][2] then
								slot0.open_send = not slot0.open_send
							end
						end

						uv2.logs[slot21].to_copy = slot26
					end
				end

				if slot0.open_send then
					slot18 = {
						x = slot13.x - 110,
						y = slot15 - (slot12[2] + 2) * (#uv2.logs - slot6.message)
					}
					slot6.send = uv5.intersect({
						slot2.x,
						slot2.y
					}, slot18.x, slot18.y, 80, 40)
					slot19 = uv5.intersect({
						slot2.x,
						slot2.y
					}, slot18.x, slot18.y, 80, 18)
					slot20 = uv5.intersect({
						slot2.x,
						slot2.y
					}, slot18.x, slot18.y + 20, 80, 18)

					if not slot6.send and uv6[1][2] then
						slot0.open_send = false
					end

					uv3.render.rectangle(slot18.x - 1, slot18.y - 1, 82, 42, 0, 0, 0, 255 * slot7)
					uv3.render.rectangle(slot18.x, slot18.y, 80, 40, 25, 25, 25, 255 * slot7)

					if slot19 then
						uv3.render.rectangle(slot18.x, slot18.y, 80, 20, 15, 15, 15, 255 * slot7)

						if uv6[1][4] then
							client.exec("say ", uv2.logs[slot6.message].to_copy or uv2.logs[slot6.message].text)

							slot0.open_send = false
						end
					end

					uv3.render.text(slot18.x + 8, slot18.y + 4, 220, 220, 220, 255 * slot7, "", 0, "Global chat")

					if slot20 then
						uv3.render.rectangle(slot18.x, slot18.y + 20, 80, 20, 15, 15, 15, 255 * slot7)

						if uv6[1][4] then
							client.exec("say_team ", uv2.logs[slot6.message].to_copy or uv2.logs[slot6.message].text)

							slot0.open_send = false
						end
					end

					uv3.render.text(slot18.x + 8, slot18.y + 24, 220, 220, 220, 255 * slot7, "", 0, "Team chat")
				end

				uv3.render.rectangle(slot8 + 20, slot9 + 18 + slot14, slot10 - 40, 1, 45, 45, 45, 255 * slot7)
				uv3.render.rectangle(slot8 + 20, slot9 + 19 + slot14, slot10 - 40, 7, 25, 25, 25, 255 * slot7)
				uv3.render.gradient(slot8 + 20, slot9 + 25 + slot14, slot10 - 40, 15, 25, 25, 25, 255 * slot7, 25, 25, 25, 20 * slot7, false)
				uv3.render.gradient(slot8 + 20, slot9 + slot11 - 34 + slot14, slot10 - 40, 15, 25, 25, 25, 20 * slot7, 25, 25, 25, 255 * slot7, false)
				uv3.render.text(slot8 + 32, slot9 + 10 + slot14, 220, 220, 220, 255 * slot7, "db", 0, slot0.pre[1])
				uv3.render.text(slot8 + 32 + uv3.render.measure("db", slot0.pre[1]), slot9 + 10 + slot14, uv1.clr.r, uv1.clr.g, uv1.clr.b, 255 * slot7, "db", 0, slot0.pre[2])

				slot0.scroll.y = math.max(slot13.y + 12, math.min(slot13.y + slot13.h - slot5.h, slot13.y + slot5.y_ + 1 + 2 * #uv2.logs))
				slot0.scroll.h = math.max(12, slot13.h - 2 - 2 * #uv2.logs)

				if slot5.h < slot13.h - 15 then
					uv3.render.rectangle(slot13.x + slot13.w - 6, slot13.y + 8 + slot14, 6, slot13.h - 6, 45, 45, 45, 255 * slot7)
					uv3.render.rectangle(slot5.x, slot5.y + slot14, 4 * slot3, slot5.h, 60, 60, 60, 255 * slot7)
				end
			elseif slot17.style == "Pasted" then
				uv3.render.rectangle(slot8, slot9, slot10, slot11, 25, 25, 25, 255 * slot7)
				uv3.render.rectangle(slot8 + 12, slot9 + 20 + slot14, slot10 - 26, slot11 - 32, 15, 15, 15, 255 * slot7)

				slot13.x = slot13.x - 4

				if ui.get(uv4.render_line) then
					uv3.render.rectangle(slot8 + 1, slot9 + 1, slot10 - 2, 2, slot0.clr.r, slot0.clr.g, slot0.clr.b, 255 * slot7)
					uv3.render.rectangle(slot8 + 1, slot9 + 2, slot10 - 2, 1, 0, 0, 0, 190 * slot7)
				end

				for slot21, slot22 in pairs(uv2.logs) do
					slot24 = false

					if slot15 - ((slot12[2] + 2) * (#uv2.logs - slot21) - 8) >= slot13.y + slot14 + 10 and slot15 - slot23 <= slot13.y + slot14 + slot13.h - 6 then
						if slot22.can_copy then
							slot24 = uv5.intersect({
								slot2.x,
								slot2.y
							}, slot13.x, slot15 - slot23, slot13.w - 8, 12)
						end

						slot25 = slot7

						if slot24 then
							slot25 = (uv6[1][3] or uv6[2][3]) and 0.5 or 0.65

							if not slot0.open_send then
								slot6.message = slot21
							end
						elseif slot6.message == slot21 then
							slot25 = 0.5
						end

						if slot24 then
							if uv6[1][4] then
								uv7.CopyTextToClipboard(uv0:text(slot13.x, slot15 - slot23, slot22, slot25))
							end

							if uv6[2][2] then
								slot0.open_send = not slot0.open_send
							end
						end
					end
				end

				if slot0.open_send then
					slot18 = {
						x = slot13.x - 110,
						y = slot15 - (slot12[2] + 2) * (#uv2.logs - slot6.message)
					}
					slot6.send = uv5.intersect({
						slot2.x,
						slot2.y
					}, slot18.x, slot18.y, 80, 40)
					slot19 = uv5.intersect({
						slot2.x,
						slot2.y
					}, slot18.x, slot18.y, 80, 18)
					slot20 = uv5.intersect({
						slot2.x,
						slot2.y
					}, slot18.x, slot18.y + 20, 80, 18)

					if not slot6.send and uv6[1][2] then
						slot0.open_send = false
					end

					uv3.render.rectangle(slot18.x - 1, slot18.y - 1, 82, 42, 0, 0, 0, 255 * slot7)
					uv3.render.rectangle(slot18.x, slot18.y, 80, 40, 25, 25, 25, 255 * slot7)

					if slot19 then
						uv3.render.rectangle(slot18.x, slot18.y, 80, 20, 15, 15, 15, 255 * slot7)

						if uv6[1][4] then
							client.exec("say ", uv2.logs[slot6.message].text)

							slot0.open_send = false
						end
					end

					uv3.render.text(slot18.x + 8, slot18.y + 4, 220, 220, 220, 255 * slot7, "", 0, "Global chat")

					if slot20 then
						uv3.render.rectangle(slot18.x, slot18.y + 20, 80, 20, 15, 15, 15, 255 * slot7)

						if uv6[1][4] then
							client.exec("say_team ", uv2.logs[slot6.message].text)

							slot0.open_send = false
						end
					end

					uv3.render.text(slot18.x + 8, slot18.y + 24, 220, 220, 220, 255 * slot7, "", 0, "Team chat")
				end

				uv3.render.rectangle(slot8 + 14, slot9 + 20 + slot14, slot10 - 40, 7, 15, 15, 15, 255 * slot7)
				uv3.render.gradient(slot8 + 14, slot9 + 25 + slot14, slot10 - 40, 15, 15, 15, 15, 255 * slot7, 15, 15, 15, 20 * slot7, false)
				uv3.render.gradient(slot8 + 14, slot9 + slot11 - 30 + slot14, slot10 - 40, 15, 15, 15, 15, 20 * slot7, 15, 15, 15, 255 * slot7, false)
				uv3.render.text(slot8 + 12, slot9 + 2 + slot14, 220, 220, 220, 255 * slot7, "db", 0, slot0.pre[1])
				uv3.render.text(slot8 + 12 + uv3.render.measure("db", slot0.pre[1]), slot9 + 2 + slot14, uv1.clr.r, uv1.clr.g, uv1.clr.b, 255 * slot7, "db", 0, slot0.pre[2])

				slot0.scroll.x = slot13.x + slot13.w + 4
				slot0.scroll.y = math.max(slot13.y + 12, math.min(slot13.y + slot13.h - slot5.h, slot13.y + slot5.y_ + 2 * #uv2.logs))
				slot0.scroll.h = math.max(12, slot13.h - 2 * #uv2.logs)

				uv3.render.rectangle(slot13.x + slot13.w + 3, slot13.y + 10 + slot14, 6, slot13.h - 2, 45, 45, 45, 255 * slot7)

				if slot5.h < slot13.h - 5 then
					uv3.render.rectangle(slot5.x, slot5.y + slot14, 4 * slot3, slot5.h, 60, 60, 60, 255 * slot7)
				end
			end
		else
			slot0.open_send = false
		end

		slot0.fade = uv5.clamp(slot0.fade + (slot0.open and slot16 / 2 or -slot16), 0, 1)
	end
}).window)
client.set_event_callback("output", function (slot0)
	uv0.print("log", slot0.r, slot0.g, slot0.b, true, slot0.text)
end)
client.set_event_callback("console_input", function (slot0)
	if slot0:sub(1, 9):lower() == "clear_lua" then
		print("Cleared custom console")

		uv0.logs = {}

		uv1.data.write("custom_console/logs", nil)

		return true
	end
end)
client.set_event_callback("round_start", function ()
	if uv0.contains(ui.get(uv1.render_rounds), "Print on round start") then
		uv2.print("message", uv3.clr.r, uv3.clr.g, uv3.clr.b, false, "» Round started!")
	end
end)

function slot23(slot0)
	for slot5, slot6 in pairs(uv0) do
		if slot5 ~= "show" and slot5 ~= "hotkey" then
			ui.set_visible(uv0[slot5], ui.get(slot0))
		end
	end
end

ui.set_callback(slot17.show, slot23)
slot23(slot17.show)
client.set_event_callback("shutdown", function ()
	if ui.get(uv0.clear_logs) then
		uv1.data.write("custom_console/logs", nil)
	end

	uv1.data.write("custom_console/clear", ui.get(uv0.clear_logs))
end)

package.preload["gamesense/custom_console"] = function ()
	return uv0
end
