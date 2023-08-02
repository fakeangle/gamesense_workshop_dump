slot0 = bit.band
slot1 = bit.lshift
slot2 = client.color_log
slot3 = client.create_interface
slot5 = client.find_signature
slot6 = client.key_state
slot8 = client.screen_size
slot10 = client.system_time
slot11 = client.timestamp
slot12 = client.unset_event_callback
slot13 = database.read
slot15 = entity.get_classname
slot16 = entity.get_local_player
slot17 = entity.get_origin
slot18 = entity.get_player_name
slot19 = entity.get_prop
slot20 = entity.get_steam64
slot21 = entity.is_alive
slot22 = globals.framecount
slot23 = globals.realtime
slot24 = math.ceil
slot25 = math.floor
slot26 = math.max
slot27 = math.min
slot28 = panorama.loadstring
slot29 = renderer.gradient
slot30 = renderer.line
slot31 = renderer.rectangle
slot32 = table.concat
slot33 = table.insert
slot34 = table.remove
slot35 = table.sort
slot36 = ui.get
slot37 = ui.is_menu_open
slot38 = ui.mouse_position
slot39 = ui.new_checkbox
slot42 = ui.new_slider
slot43 = ui.set
slot44 = ui.set_visible
slot45 = setmetatable
slot46 = pairs
slot47 = error
slot48 = globals.absoluteframetime
slot49 = globals.curtime
slot50 = globals.frametime
slot51 = globals.maxplayers
slot52 = globals.tickcount
slot53 = globals.tickinterval
slot54 = math.abs
slot55 = type
slot56 = pcall
slot57 = renderer.circle_outline
slot58 = renderer.load_rgba
slot59 = renderer.measure_text
slot60 = renderer.text
slot61 = renderer.texture
slot62 = tostring
slot63 = ui.name
slot64 = ui.new_button
slot65 = ui.new_hotkey
slot66 = ui.new_label
slot67 = ui.new_listbox
slot68 = ui.new_textbox
slot69 = ui.reference
slot71 = ui.update
slot72 = unpack
slot73 = tonumber
slot74 = require("ffi")
slot75 = require("vector")
slot76 = require("gamesense/images")
slot77 = require("gamesense/antiaim_funcs")

function slot78(slot0, slot1, slot2)
	return function ()
		slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14 = nil
		slot15 = {
			__index = {
				drag = function (slot0, ...)
					slot1, slot2 = slot0:get()
					slot3, slot4 = uv0.drag(slot1, slot2, ...)

					if slot1 ~= slot3 or slot2 ~= slot4 then
						slot0:set(slot3, slot4)
					end

					return slot3, slot4
				end,
				set = function (slot0, slot1, slot2)
					slot3, slot4 = uv0()

					uv1(slot0.x_reference, slot1 / slot3 * slot0.res)
					uv1(slot0.y_reference, slot2 / slot4 * slot0.res)
				end,
				get = function (slot0)
					slot1, slot2 = uv0()

					return uv1(slot0.x_reference) / slot0.res * slot1, uv1(slot0.y_reference) / slot0.res * slot2
				end
			}
		}

		return {
			new = function (slot0, slot1, slot2, slot3)
				slot3 = slot3 or 10000
				slot4, slot5 = uv0()
				slot6 = uv1("LUA", "A", slot0 .. " window position", 0, slot3, slot1 / slot4 * slot3)
				slot7 = uv1("LUA", "A", "\n" .. slot0 .. " window position y", 0, slot3, slot2 / slot5 * slot3)

				uv2(slot6, false)
				uv2(slot7, false)

				return uv3({
					name = slot0,
					x_reference = slot6,
					y_reference = slot7,
					res = slot3
				}, uv4)
			end,
			drag = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
				if uv0() ~= uv1 then
					uv2 = uv3()
					uv5 = uv7
					uv4 = uv6
					uv6, uv7 = uv8()
					uv9 = uv10
					uv10 = uv11(1) == true
					uv12 = uv13
					uv13 = {}
					uv14 = uv15
					uv15 = false
					uv16, uv17 = uv18()
				end

				if uv2 and uv9 ~= nil and (not uv9 or uv14) and uv10 and slot0 < uv4 and slot1 < uv5 and uv4 < slot0 + slot2 and uv5 < slot1 + slot3 then
					uv15 = true

					if not slot5 then
						slot0 = uv19(0, uv20(uv16 - slot2, slot0 + uv6 - uv4))
						slot1 = uv19(0, uv20(uv17 - slot3, slot1 + uv7 - uv5))
					end
				end

				uv21(uv13, {
					slot0,
					slot1,
					slot2,
					slot3
				})

				return slot0, slot1, slot2, slot3
			end
		}
	end().new(slot0, slot1, slot2)
end

function slot79()
	return {
		renderer_line = function (slot0, slot1, slot2, slot3)
			uv0(slot1.x, slot1.y, slot2.x, slot2.y, slot3.r, slot3.g, slot3.b, slot3.a)
		end,
		renderer_rectangle_outlined = function (slot0, slot1, slot2, slot3)
			uv0(slot1.x, slot1.y, slot1.x, slot2.y, slot3.r, slot3.g, slot3.b, slot3.a)
			uv0(slot1.x, slot1.y, slot2.x, slot1.y, slot3.r, slot3.g, slot3.b, slot3.a)
			uv0(slot2.x, slot1.y, slot2.x, slot2.y, slot3.r, slot3.g, slot3.b, slot3.a)
			uv0(slot1.x, slot2.y, slot2.x, slot2.y, slot3.r, slot3.g, slot3.b, slot3.a)
		end,
		renderer_rectangle_filled = function (slot0, slot1, slot2, slot3)
			slot5 = slot2.y - slot1.y

			if slot2.x - slot1.x < 0 then
				if slot5 < 0 then
					uv0(slot2.x, slot2.y, -slot4, -slot5, slot3.r, slot3.g, slot3.b, slot3.a)
				else
					uv0(slot2.x, slot1.y, -slot4, slot5, slot3.r, slot3.g, slot3.b, slot3.a)
				end
			elseif slot5 < 0 then
				uv0(slot1.x, slot2.y, slot4, -slot5, slot3.r, slot3.g, slot3.b, slot3.a)
			else
				uv0(slot1.x, slot1.y, slot4, slot5, slot3.r, slot3.g, slot3.b, slot3.a)
			end
		end,
		renderer_rectangle_outlined = function (slot0, slot1, slot2, slot3)
			uv0(slot1.x, slot1.y, slot1.x, slot2.y, slot3.r, slot3.g, slot3.b, slot3.a)
			uv0(slot1.x, slot1.y, slot2.x, slot1.y, slot3.r, slot3.g, slot3.b, slot3.a)
			uv0(slot2.x, slot1.y, slot2.x, slot2.y, slot3.r, slot3.g, slot3.b, slot3.a)
			uv0(slot1.x, slot2.y, slot2.x, slot2.y, slot3.r, slot3.g, slot3.b, slot3.a)
		end,
		renderer_rectangle_filled_gradient = function (slot0, slot1, slot2, slot3, slot4, slot5)
			slot7 = slot2.y - slot1.y

			if slot2.x - slot1.x < 0 then
				if slot7 < 0 then
					uv0(slot2.x, slot2.y, -slot6, -slot7, slot3.r, slot3.g, slot3.b, slot3.a, slot4.r, slot4.g, slot4.b, slot4.a, slot5)
				else
					uv0(slot2.x, slot1.y, -slot6, slot7, slot3.r, slot3.g, slot3.b, slot3.a, slot4.r, slot4.g, slot4.b, slot4.a, slot5)
				end
			elseif slot7 < 0 then
				uv0(slot1.x, slot2.y, slot6, -slot7, slot4.r, slot4.g, slot4.b, slot4.a, slot3.r, slot3.g, slot3.b, slot3.a, slot5)
			else
				uv0(slot1.x, slot1.y, slot6, slot7, slot4.r, slot4.g, slot4.b, slot4.a, slot3.r, slot3.g, slot3.b, slot3.a, slot5)
			end
		end,
		draw = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
			slot8 = slot5.clr_1
			slot2 = 0
			slot3 = slot3 - slot2
			slot5.h = slot5.h - slot5.thickness

			if slot6 then
				uv0:renderer_rectangle_outlined({
					x = slot5.x,
					y = slot5.y
				}, {
					x = slot5.x + slot5.w - 1,
					y = slot5.y + slot5.h - 1 + slot5.thickness
				}, {
					r = slot8[1],
					g = slot8[2],
					b = slot8[3],
					a = slot8[4]
				})
			end

			if slot2 == slot3 then
				uv0:renderer_line({
					x = slot5.x,
					y = slot5.y + slot5.h
				}, {
					x = slot5.x + slot5.w,
					y = slot5.y + slot5.h
				}, {
					r = slot8[1],
					g = slot8[2],
					b = slot8[3],
					a = slot8[4]
				})

				return
			end

			slot9 = slot5.w / (slot4 - 1)
			slot10 = slot3 - slot2

			for slot14 = 1, slot4 - 1 do
				slot15 = {
					(slot1[slot14] - slot7) / slot10,
					(slot1[slot14 + 1] - slot7) / slot10
				}
				slot16 = {
					{
						x = slot5.x + slot9 * (slot14 - 1),
						y = slot5.y + slot5.h - slot5.h * slot15[1]
					},
					{
						x = slot5.x + slot9 * slot14,
						y = slot5.y + slot5.h - slot5.h * slot20
					}
				}
				slot20 = slot15[2]

				for slot20 = 1, slot5.thickness do
					uv0:renderer_line({
						x = slot16[1].x,
						y = slot16[1].y + slot20 - 1
					}, {
						x = slot16[2].x,
						y = slot16[2].y + slot20 - 1
					}, {
						r = slot8[1],
						g = slot8[2],
						b = slot8[3],
						a = slot8[4]
					})
				end
			end
		end,
		draw_histogram = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
			slot2 = 0
			slot3 = slot3 - slot2

			if slot6 then
				uv0:renderer_rectangle_outlined({
					x = slot5.x,
					y = slot5.y
				}, {
					x = slot5.x + slot5.w - 1,
					y = slot5.y + slot5.h - 1
				}, {
					a = 255,
					b = 255,
					g = 255,
					r = 255
				})
			end

			slot8 = slot5.w / (slot4 - 1)
			slot9 = slot3 - slot2

			for slot13 = 1, slot4 - 1 do
				slot14 = {
					(slot1[slot13] - slot7) / slot9,
					(slot1[slot13 + 1] - slot7) / slot9
				}
				slot15 = {
					{
						x = uv1(slot5.x + slot8 * (slot13 - 1)),
						y = uv1(slot5.y + slot5.h - slot5.h * slot14[1])
					},
					{
						x = uv1(slot5.x + slot8 * slot13),
						y = uv1(slot5.y + slot5.h)
					},
					isZero = uv1(slot5.y + slot5.h) == uv1(slot5.y + slot5.h - slot5.h * slot14[1])
				}

				if slot5.sDrawBar == "fill" then
					uv0:renderer_rectangle_filled({
						x = slot15[1].x,
						y = slot15[1].y
					}, {
						x = slot15[2].x,
						y = slot15[2].y
					}, {
						r = slot5.clr_1[1],
						g = slot5.clr_1[2],
						b = slot5.clr_1[3],
						a = slot5.clr_1[4]
					})
				elseif slot5.sDrawBar == "gradient_fadeout" then
					uv0:renderer_rectangle_filled_gradient({
						x = slot15[1].x,
						y = slot15[1].y
					}, {
						x = slot15[2].x,
						y = slot15[2].y
					}, {
						a = 0,
						r = slot5.clr_1[1],
						g = slot5.clr_1[2],
						b = slot5.clr_1[3]
					}, {
						r = slot5.clr_1[1],
						g = slot5.clr_1[2],
						b = slot5.clr_1[3],
						a = slot5.clr_1[4]
					}, false)
				elseif slot5.sDrawBar == "gradient_fadein" then
					uv0:renderer_rectangle_filled_gradient({
						x = slot15[1].x,
						y = slot15[1].y
					}, {
						x = slot15[2].x,
						y = slot15[2].y
					}, {
						r = slot5.clr_1[1],
						g = slot5.clr_1[2],
						b = slot5.clr_1[3],
						a = slot5.clr_1[4]
					}, {
						a = 0,
						r = slot5.clr_1[1],
						g = slot5.clr_1[2],
						b = slot5.clr_1[3]
					}, false)
				end

				if slot5.bDrawPeeks and not slot15.isZero then
					uv0:renderer_line({
						x = slot15[1].x,
						y = slot15[1].y
					}, {
						x = slot15[2].x,
						y = slot15[1].y
					}, {
						r = slot5.clr_2[1],
						g = slot5.clr_2[2],
						b = slot5.clr_2[3],
						a = slot5.clr_2[4]
					})
				end
			end
		end
	}
end

function slot80(slot0, slot1)
	for slot6 = 1, slot1 do
	end

	return {
		[slot6] = slot0
	}
end

function slot81(slot0, slot1, slot2)
	slot3 = slot0

	if slot2 or slot3[#slot3] ~= slot1 then
		uv0(slot3, slot1)
		uv1(slot3, 1)
	end

	slot0 = slot3
end

function slot82(slot0)
	for slot6, slot7 in uv0(slot0) do
		slot2 = 0 + slot7
		slot1 = 0 + 1
	end

	return slot2 / slot1
end

function slot83(slot0, slot1, slot2, slot3)
	slot4, slot5, slot6 = nil
	slot7 = uv0(slot0 * 6)
	slot8 = slot0 * 6 - slot7
	slot10 = slot2 * (1 - slot8 * slot1)

	if slot7 % 6 == 0 then
		slot6 = slot2 * (1 - slot1)
		slot5 = slot2 * (1 - (1 - slot8) * slot1)
		slot4 = slot2
	elseif slot7 == 1 then
		slot6 = slot9
		slot5 = slot2
		slot4 = slot10
	elseif slot7 == 2 then
		slot6 = slot11
		slot5 = slot2
		slot4 = slot9
	elseif slot7 == 3 then
		slot6 = slot2
		slot5 = slot10
		slot4 = slot9
	elseif slot7 == 4 then
		slot6 = slot2
		slot5 = slot9
		slot4 = slot11
	elseif slot7 == 5 then
		slot6 = slot10
		slot5 = slot9
		slot4 = slot2
	end

	return slot4 * 255, slot5 * 255, slot6 * 255, slot3 * 255
end

function slot84(slot0)
	function slot1(slot0, slot1)
		slot2 = {}

		for slot6 in uv0(slot0) do
			uv1(slot2, slot6)
		end

		uv2(slot2, slot1)

		slot3 = 0

		return function ()
			uv0 = uv0 + 1

			if uv1[uv0] == nil then
				return nil
			else
				return uv1[uv0], uv2[uv1[uv0]]
			end
		end
	end

	slot2 = {
		get = function (slot0)
			slot2 = {}

			for slot6, slot7 in uv0(package.solus_notes) do
				if slot7 == true then
					slot2[#slot2 + 1] = {
						slot6,
						0 + 1
					}
				end
			end

			for slot6 = 1, #slot2 do
				if slot2[slot6][1] == uv1 then
					return slot0(slot2[slot6][2] - 1)
				end
			end
		end,
		set_state = function (slot0)
			package.solus_notes[uv0] = slot0

			uv1(package.solus_notes)
		end,
		unset = function ()
			uv0("shutdown", callback)
		end
	}

	uv4("shutdown", function ()
		if package.solus_notes[uv0] ~= nil then
			package.solus_notes[uv0] = nil
		end
	end)

	if package.solus_notes == nil then
		package.solus_notes = {}
	end

	return slot2
end

function slot85(slot0)
	if slot0 == nil then
		return 0
	end

	if #slot0 == 0 then
		for slot5 in uv0(slot0) do
			slot1 = 0 + 1
		end

		return slot1
	end

	return #slot0
end

function slot86(slot0, slot1)
	for slot5 = 1, #slot0 do
		if slot0[slot5] == slot1 then
			return true
		end
	end

	return false
end

slot91 = {
	"LUA",
	"A",
	"B"
}
slot93 = {}
slot94 = true
slot95 = nil
slot96 = slot39("CONFIG", "Presets", "Watermark")
slot97 = slot39("CONFIG", "Presets", "Spectators")
slot98 = slot39("CONFIG", "Presets", "Hotkey list")
slot99 = slot39("CONFIG", "Presets", "Anti-aimbot indication")
slot100 = slot39("CONFIG", "Presets", "Frequency update information")
slot102 = ui.new_color_picker("CONFIG", "Presets", "Solus Global color", 142, 165, 229, 85)
slot103 = slot42("CONFIG", "Presets", "Fade offset", 1, 1000, 825, false, nil, 0.001)
slot104 = slot42("CONFIG", "Presets", "Fade frequency", 1, 100, 10, false, nil, 0.01)
slot105 = slot42("CONFIG", "Presets", "Fade split ratio", 0, 100, 100, false, nil, 0.01)
slot106, slot107 = function (slot0, slot1, slot2)
	if slot0 == nil or slot0 == "" or slot1 == nil or slot1 == "" or slot2 == nil or slot2 == {} then
		uv0(216, 181, 121, ("[%s]  "):format(slot0))
		uv0(255, 0, 0, "Error occured while parsing data")
		uv1()
	end

	slot4 = false
	slot5 = false
	slot6 = {}

	if uv2(slot1) == nil then
		slot4 = true
		slot3 = slot2
	else
		for slot10 in uv3(slot3) do
			slot11 = false

			for slot15 in uv3(slot2) do
				if slot10 == slot15 then
					slot11 = true
				end
			end

			if not slot11 then
				slot3[slot10] = nil
			end
		end

		for slot10, slot11 in uv3(slot2) do
			if slot3[slot10] == nil then
				slot5 = true
				slot3[slot10] = slot11
				slot6[#slot6 + 1] = "*" .. slot10
			else
				for slot16, slot17 in uv3(slot11) do
					if slot16 ~= "keybinds" and slot3[slot10][slot16] == nil or uv4(slot17) ~= uv4(slot3[slot10][slot16]) then
						slot5 = true
						slot3[slot10][slot16] = slot17

						if not false then
							slot6[#slot6 + 1] = "*" .. slot10
							slot12 = true
						end
					end
				end
			end
		end

		if #slot6 > 0 then
			uv0(216, 181, 121, ("[%s]  "):format(slot0))
			uv0(255, 255, 255, ("Repairing %d sector(s)  "):format(#slot6))
			uv0(155, 220, 220, ("[ %s ]"):format(uv5(slot6, " ")))
		end
	end

	if slot4 or slot5 then
		uv6(slot1, slot3)
	end

	return slot3, slot2
end("solus", "solus", {
	watermark = {
		gc_state = true,
		beta_status = true,
		nickname = "",
		style = function (slot0, slot1, slot2, slot3)
			return {
				min = slot0,
				max = slot1,
				init_val = slot2,
				scale = slot3,
				value = slot2
			}
		end(1, 4, 1, 1)
	},
	spectators = {
		auto_position = true,
		avatars = true
	},
	keybinds = {
		{
			custom_name = "Legit aimbot",
			ui_offset = 2,
			require = "",
			reference = {
				"legit",
				"aimbot",
				"Enabled"
			}
		},
		{
			custom_name = "Legit triggerbot",
			ui_offset = 2,
			require = "",
			reference = {
				"legit",
				"triggerbot",
				"Enabled"
			}
		},
		{
			custom_name = "Rage aimbot",
			ui_offset = 2,
			require = "",
			reference = {
				"rage",
				"aimbot",
				"Enabled"
			}
		},
		{
			custom_name = "Safe point",
			ui_offset = 1,
			require = "",
			reference = {
				"rage",
				"aimbot",
				"Force safe point"
			}
		},
		{
			custom_name = "Damage override",
			ui_offset = 2,
			require = "",
			reference = {
				"rage",
				"aimbot",
				"Minimum damage override"
			}
		},
		{
			custom_name = "",
			ui_offset = 2,
			require = "",
			reference = {
				"rage",
				"aimbot",
				"Quick stop"
			}
		},
		{
			custom_name = "",
			ui_offset = 2,
			require = "",
			reference = {
				"rage",
				"other",
				"Quick peek assist"
			}
		},
		{
			custom_name = "",
			ui_offset = 1,
			require = "",
			reference = {
				"rage",
				"aimbot",
				"Force body aim"
			}
		},
		{
			custom_name = "",
			ui_offset = 1,
			require = "",
			reference = {
				"rage",
				"other",
				"Duck peek assist"
			}
		},
		{
			custom_name = "",
			ui_offset = 2,
			require = "",
			reference = {
				"rage",
				"aimbot",
				"Double tap"
			}
		},
		{
			custom_name = "",
			ui_offset = 2,
			require = "",
			reference = {
				"aa",
				"anti-aimbot angles",
				"Freestanding"
			}
		},
		{
			custom_name = "",
			ui_offset = 2,
			require = "",
			reference = {
				"aa",
				"other",
				"Slow motion"
			}
		},
		{
			custom_name = "",
			ui_offset = 2,
			require = "",
			reference = {
				"aa",
				"other",
				"On shot anti-aim"
			}
		},
		{
			custom_name = "",
			ui_offset = 2,
			require = "",
			reference = {
				"aa",
				"other",
				"Fake peek"
			}
		},
		{
			custom_name = "",
			ui_offset = 2,
			require = "",
			reference = {
				"misc",
				"movement",
				"Z-Hop"
			}
		},
		{
			custom_name = "",
			ui_offset = 2,
			require = "",
			reference = {
				"misc",
				"movement",
				"Pre-speed"
			}
		},
		{
			custom_name = "",
			ui_offset = 2,
			require = "",
			reference = {
				"misc",
				"movement",
				"Blockbot"
			}
		},
		{
			custom_name = "",
			ui_offset = 2,
			require = "",
			reference = {
				"misc",
				"movement",
				"Jump at edge"
			}
		},
		{
			custom_name = "",
			ui_offset = 1,
			require = "",
			reference = {
				"misc",
				"miscellaneous",
				"Last second defuse"
			}
		},
		{
			custom_name = "",
			ui_offset = 1,
			require = "",
			reference = {
				"misc",
				"miscellaneous",
				"Free look"
			}
		},
		{
			custom_name = "",
			ui_offset = 2,
			require = "",
			reference = {
				"misc",
				"miscellaneous",
				"Ping spike"
			}
		},
		{
			custom_name = "Grenade release",
			ui_offset = 2,
			require = "",
			reference = {
				"misc",
				"miscellaneous",
				"Automatic grenade release"
			}
		},
		{
			custom_name = "Visuals",
			ui_offset = 1,
			require = "",
			reference = {
				"visuals",
				"player esp",
				"Activation type"
			}
		}
	}
})

function slot108()
	slot0, slot1, slot2, slot3 = uv0(uv1)

	if uv0(uv2) ~= uv3[1] then
		slot5 = uv0(uv4) / 100
		slot7, slot8, slot9 = uv8(slot4 == uv3[3] and uv5() * uv0(uv6) / 100 or uv0(uv7) / 1000, 1, 1, 1)
		slot2 = slot9 * slot5
		slot1 = slot8 * slot5
		slot0 = slot7 * slot5
	end

	return slot0, slot1, slot2, slot3
end

function slot109(slot0, slot1, slot2)
	return slot3[function (slot0, slot1, slot2)
		return (slot2 or slot1) / (slot1 / (slot1 < slot0 and slot1 or slot0)) >= 0 and uv0(slot5 + 0.5) or uv1(slot5 - 0.5)
	end(slot0, slot1, #{
		{
			255,
			0,
			0
		},
		{
			237,
			27,
			3
		},
		{
			235,
			63,
			6
		},
		{
			229,
			104,
			8
		},
		{
			228,
			126,
			10
		},
		{
			220,
			169,
			16
		},
		{
			213,
			201,
			19
		},
		{
			176,
			205,
			10
		},
		{
			124,
			195,
			13
		}
	}) <= 1 and 1 or slot2][1], slot3[slot2 <= 1 and 1 or slot2][2], slot3[slot2 <= 1 and 1 or slot2][3], slot2
end

slot110 = {
	watermark = function ()
		slot0 = uv0("a_watermark")
		slot1 = {
			"gamesense",
			"gamesense.pub",
			"skeet",
			"skeet.cc"
		}
		slot2 = uv1(uv2, "misc", "Settings", "Crash logs")
		slot3 = uv3(" return MyPersonaAPI.GetName() ")
		slot4 = uv3(" return MyPersonaAPI.IsConnectedToGC() ")
		slot6 = uv4.typeof("float(__thiscall*)(void*, int)")
		slot9 = uv4.cast("bool(__thiscall*)(void*)", (uv4.cast(uv4.typeof("void***"), uv5("engine.dll", "VEngineClient014") or uv6("VEngineClient014 wasnt found", 2)) or uv6("rawivengineclient is nil", 2))[0][26]) or uv6("is_in_game is nil")

		uv22("paint_ui", function ()
			slot1, slot2, slot3, slot4 = uv2()

			uv3.set_state(uv0(uv1))
			uv3.get(function (slot0)
				slot1 = uv0.watermark or {}
				slot2 = slot1.nickname and uv1(slot1.nickname) or ""
				slot3 = (slot1.suffix and uv1(slot1.suffix) or ""):gsub("beta", "")

				if slot1.beta_status and uv2 and (not slot3 or #slot3 < 1) then
					slot3 = "beta"
				end

				slot4 = {
					uv3()
				}
				slot10 = ("%s%s | %s | %s"):format(not (not slot1.gc_state or uv4()) and "     " or "", ("%s%s"):format(uv6[slot1.style and slot1.style.value or 1] or uv6[1], #slot3 > 0 and (" [%s]"):format(slot3) or ""), #slot2 > 0 and slot2 or uv5(), ("%02d:%02d:%02d"):format(slot4[1], slot4[2], slot4[3]))

				if uv7(uv7) == true then
					slot10 = ("%s%s | %s%s | %s"):format(slot7, slot9, slot8, client.latency() * 1000 > 5 and (" | delay: %dms"):format(slot11) or "", slot5)
				end

				slot11 = 18

				if uv10(uv11) == uv12[1] then
					uv13(uv9() - (uv8(nil, slot10) + 8) - 10, 10 + 25 * slot0, slot12, 2, uv14, uv15, uv16, 255)
				else
					uv17(slot13, slot14, slot12 / 2 + 1, 2, uv15, uv16, uv14, 255, uv14, uv15, uv16, 255, true)
					uv17(slot13 + slot12 / 2, slot14, slot12 - slot12 / 2, 2, uv14, uv15, uv16, 255, uv16, uv14, uv15, 255, true)
				end

				uv13(slot13, slot14 + 2, slot12, slot11, 17, 17, 17, uv18)
				uv19(slot13 + 4, slot14 + 4, 255, 255, 255, 255, "d", 0, slot10)

				if not slot6 then
					if uv20() * 1.5 % 2 <= 1 then
						uv21(slot13 + 10, slot14 + 11, 89, 119, 239, 255, 5, 0, slot15 % 1, 2)
					else
						uv21(slot13 + 10, slot14 + 11, 89, 119, 239, 255, 5, slot15 % 1 * 370, 1 - slot15 % 1, 2)
					end
				end
			end)
		end)
	end,
	spectators = function ()
		slot0 = {
			uv0()
		}
		slot1 = {
			slot0[1] - slot0[1] * slot4:get_float(),
			slot0[2] * slot3:get_float()
		}
		slot4 = cvar.safezonex
		slot3 = cvar.safezoney
		slot2 = uv1("Spectators", slot1[1] / 1.385, slot1[2] / 2)
		slot3 = 0
		slot4 = {}
		slot5 = {}
		slot6 = {}

		function slot7()
			slot1 = {}
			slot2 = uv0()

			for slot6 = 1, uv1() do
				if uv2(slot6) == "CCSPlayer" then
					slot7 = uv3(slot6, "m_iObserverMode")

					if uv3(slot6, "m_hObserverTarget") ~= nil and slot8 <= 64 and not uv4(slot6) and (slot7 == 4 or slot7 == 5) then
						if slot1[slot8] == nil then
							slot1[slot8] = {}
						end

						if slot6 == slot0 then
							slot2 = slot8
						end

						uv5(slot1[slot8], slot6)
					end
				end
			end

			return slot1, slot2
		end

		uv27("paint", function ()
			slot0 = uv0.spectators or {}
			slot1 = uv1(uv2)
			slot2 = uv3()
			slot3 = 8 * uv4()
			slot4 = false
			slot5 = 85
			slot6 = uv5()
			slot7, slot8 = uv6()

			for slot12 = 1, 64 do
				uv7[slot12] = {
					active = false,
					idx = slot12
				}
			end

			if slot7[slot8] ~= nil then
				for slot12, slot13 in uv8(slot7[slot8]) do
					uv7[slot13] = {
						idx = slot13,
						active = function ()
							if uv0 == uv1 then
								return false
							end

							return true
						end(),
						avatar = function ()
							if not uv0.avatars then
								return nil
							end

							slot0 = uv1(uv2)
							slot1 = uv3.get_steam_avatar(slot0)

							if slot0 == nil or slot1 == nil then
								return nil
							end

							if uv4[uv2] == nil or uv4[uv2].conts ~= slot1.contents then
								uv4[uv2] = {
									conts = slot1.contents,
									texture = uv5(slot1.contents, slot1.width, slot1.height)
								}
							end

							return uv4[uv2].texture
						end()
					}
				end
			end

			for slot12, slot13 in uv8(uv7) do
				slot14 = slot13.idx
				slot15 = uv13(slot13.idx)

				if slot13.active then
					slot4 = true

					if uv14[slot14] == nil then
						uv14[slot14] = {
							alpha = 0,
							active = true,
							offset = 0
						}
					end

					uv14[slot14].active = true
					uv14[slot14].offset = uv15(nil, slot15)
					uv14[slot14].alpha = uv14[slot14].alpha + slot3
					uv14[slot14].avatar = slot13.avatar
					uv14[slot14].name = slot15

					if uv14[slot14].alpha > 1 then
						uv14[slot14].alpha = 1
					end
				elseif uv14[slot14] ~= nil then
					uv14[slot14].active = false
					uv14[slot14].alpha = uv14[slot14].alpha - slot3

					if uv14[slot14].alpha <= 0 then
						uv14[slot14] = nil
					end
				end

				if uv14[slot14] ~= nil and slot5 < uv14[slot14].offset then
					slot5 = uv14[slot14].offset
				end
			end

			if slot2 and not slot4 then
				slot4 = true

				if slot5 < uv15(nil, " ") then
					slot5 = slot10 or slot5
				end

				uv14[slot9] = {
					alpha = 1,
					name = "",
					active = true,
					offset = slot10
				}
			end

			slot9 = "spectators"
			slot10, slot11 = uv16:get()
			slot12, slot13, slot14, slot15 = uv17()
			slot16 = 23
			slot18 = 50
			slot19 = slot0.auto_position and slot10 + (55 + slot5 - (slot0.avatars and 0 or 17)) / 2 > ({
				uv18()
			})[1] / 2

			if uv1(uv19) == uv20[1] then
				uv21(slot10, slot11, slot17, 2, slot12, slot13, slot14, uv22 * 255)
			else
				uv23(slot10, slot11, slot17 / 2 + 1, 2, slot13, slot14, slot12, uv22 * 255, slot12, slot13, slot14, uv22 * 255, true)
				uv23(slot10 + slot17 / 2, slot11, slot17 - slot17 / 2, 2, slot12, slot13, slot14, uv22 * 255, slot14, slot12, slot13, uv22 * 255, true)
			end

			uv21(slot10, slot11 + 2, slot17, 18, 17, 17, 17, uv22 * slot15)

			slot23 = 255
			slot24 = 255

			uv24(slot10 - uv15(nil, slot9) / 2 + slot17 / 2, slot11 + 4, slot23, slot24, 255, uv22 * 255, "d", 0, slot9)

			for slot23, slot24 in uv8(uv14) do
				slot25, slot26 = uv15(nil, slot24.name)

				uv24(slot10 + (slot24.avatar and not slot19 and slot26 or -5) + 10, slot11 + slot16, 255, 255, 255, uv22 * slot24.alpha * 255, "d", 0, slot24.name)

				if slot24.avatar ~= nil then
					uv25(slot24.avatar, slot10 + (slot19 and slot17 - 15 or 5), slot11 + slot16, slot26, slot26, 255, 255, 255, uv22 * slot24.alpha * 255, "fd")
				end

				slot16 = slot16 + 15
			end

			uv16:drag(slot17, (3 + 15 * uv26(uv14)) * 2)

			if slot1 and uv26(uv14) > 0 and slot4 then
				uv22 = uv22 + slot3

				if uv22 > 1 then
					uv22 = 1
				end
			else
				uv22 = uv22 - slot3

				if uv22 < 0 then
					uv22 = 0
				end
			end

			if slot2 then
				uv14[" "] = nil
			end
		end)
	end,
	keybinds = function ()
		slot0 = {
			uv0()
		}
		slot1 = {
			slot0[1] - slot0[1] * slot4:get_float(),
			slot0[2] * slot3:get_float()
		}
		slot4 = cvar.safezonex
		slot3 = cvar.safezoney
		slot2 = uv1("Keybinds", slot1[1] / 1.385, slot1[2] / 2.5)
		slot3 = 0
		slot4 = {}
		slot5 = {
			"holding",
			"toggled",
			"disabled"
		}
		slot6 = {
			rage = {
				"weapon type",
				"aimbot",
				"other"
			},
			aa = {
				"anti-aimbot angles",
				"fake lag",
				"other"
			},
			legit = {
				"weapon type",
				"aimbot",
				"triggerbot",
				"other"
			},
			visuals = {
				"player esp",
				"colored models",
				"other esp",
				"effects"
			},
			misc = {
				"miscellaneous",
				"movement",
				"settings"
			},
			skins = {
				"knife options",
				"glove options",
				"weapon skin"
			},
			players = {
				"players",
				"adjustments"
			},
			config = {
				"presets",
				"lua"
			},
			lua = {
				"a",
				"b"
			}
		}

		function slot7(...)
			if uv0(uv1, ...) then
				return true
			end
		end

		function slot8(slot0)
			slot1 = {
				[slot7] = slot3[slot7]
			}
			slot2 = slot0.custom_name

			for slot7 = 1, #{
				uv0(uv1(slot0.reference))
			} do
				if slot7 <= slot0.ui_offset then
					-- Nothing
				end
			end

			slot2 = slot2 and #uv2(slot2) > 0 and slot2 or nil
			slot0.reference[3] = slot0.ui_offset == 2 and uv3(slot1[1]) or slot0.reference[3]
			uv4[slot2 or slot0.reference[3] or "?"] = {
				reference = slot0.reference,
				ui_offset = slot0.ui_offset,
				custom_name = slot2,
				custom_file = slot0.require,
				collected = slot1
			}

			return true
		end

		function uv26(slot0)
			if slot0.reference == nil or uv0[slot1[1]:lower()] == nil or not uv1(uv0[slot1[1]:lower()], slot1[2]:lower()) then
				return false
			end

			if uv2(uv3(slot1)) then
				return uv4(slot0)
			elseif uv5(require, slot0.require) and uv2(uv3(slot1)) then
				return uv4(slot0)
			else
				uv6(216, 181, 121, ("[%s]  "):format(uv7))
				uv6(155, 220, 220, ("Unable to reference hotkey: %s [ %s ]"):format(slot1[3], slot0.require and #slot0.require > 0 and slot0.require .. ".lua" or "-"))
			end

			return false
		end

		uv27("paint", function ()
			slot0 = uv0(uv1)
			slot1 = uv2()
			slot2 = 8 * uv3()
			slot3 = false
			slot4 = 66

			if uv4 == true then
				uv5 = {}
				uv6 = {}

				for slot8, slot9 in uv7(uv8.keybinds or {}) do
					uv9({
						reference = slot9.reference,
						custom_name = slot9.custom_name,
						ui_offset = slot9.ui_offset or 1,
						require = slot9.require
					})
				end

				uv4 = false
			end

			for slot8, slot9 in uv7(uv5) do
				slot10 = true
				slot11 = slot9.collected
				slot12 = uv10(slot11)
				slot13 = {
					uv0(slot11[slot12])
				}

				if slot12 > 1 then
					slot10 = uv0(slot11[1])
				end

				if slot10 and slot13[2] ~= 0 and (slot13[2] == 3 and not slot13[1] or slot13[2] ~= 3 and slot13[1]) then
					slot3 = true

					if uv6[slot8] == nil then
						uv6[slot8] = {
							alpha = 0,
							active = true,
							mode = "",
							offset = 0
						}
					end

					uv6[slot8].active = true
					uv6[slot8].offset = uv11(nil, slot8)
					uv6[slot8].mode = uv12[slot13[2]]
					uv6[slot8].alpha = uv6[slot8].alpha + slot2

					if uv6[slot8].alpha > 1 then
						uv6[slot8].alpha = 1
					end
				elseif uv6[slot8] ~= nil then
					uv6[slot8].active = false
					uv6[slot8].alpha = uv6[slot8].alpha - slot2

					if uv6[slot8].alpha <= 0 then
						uv6[slot8] = nil
					end
				end

				if uv6[slot8] ~= nil and slot4 < uv6[slot8].offset then
					slot4 = uv6[slot8].offset
				end
			end

			if slot1 and not slot3 then
				slot3 = true

				if slot4 < uv11(nil, "Menu toggled") then
					slot4 = slot6 or slot4
				end

				uv6[slot5] = {
					mode = "~",
					active = true,
					alpha = 1,
					offset = slot6
				}
			end

			slot5 = "keybinds"
			slot6, slot7 = uv13:get()
			slot8, slot9, slot10, slot11 = uv14()
			slot12 = 23
			slot14 = 50

			if uv0(uv15) == uv16[1] then
				uv17(slot6, slot7, 75 + slot4, 2, slot8, slot9, slot10, uv18 * 255)
			else
				uv19(slot6, slot7, slot13 / 2 + 1, 2, slot9, slot10, slot8, uv18 * 255, slot8, slot9, slot10, uv18 * 255, true)
				uv19(slot6 + slot13 / 2, slot7, slot13 - slot13 / 2, 2, slot8, slot9, slot10, uv18 * 255, slot10, slot8, slot9, uv18 * 255, true)
			end

			uv17(slot6, slot7 + 2, slot13, 18, 17, 17, 17, uv18 * slot11)

			slot18 = 255
			slot19 = 255

			uv20(slot6 - uv11(nil, slot5) / 2 + slot13 / 2, slot7 + 4, slot18, slot19, 255, uv18 * 255, "d", 0, slot5)

			for slot18, slot19 in uv7(uv6) do
				slot20 = "[" .. (slot19.mode or "?") .. "]"

				uv20(slot6 + 5, slot7 + slot12, 255, 255, 255, uv18 * slot19.alpha * 255, "d", 0, slot18)
				uv20(slot6 + slot13 - uv11(nil, slot20) - 5, slot7 + slot12, 255, 255, 255, uv18 * slot19.alpha * 255, "d", 0, slot20)

				slot12 = slot12 + 15
			end

			uv13:drag(slot13, (3 + 15 * uv10(uv6)) * 2)

			if slot0 and uv10(uv6) > 0 and slot3 then
				uv18 = uv18 + slot2

				if uv18 > 1 then
					uv18 = 1
				end
			else
				uv18 = uv18 - slot2

				if uv18 < 0 then
					uv18 = 0
				end
			end

			if slot1 then
				uv6["Menu toggled"] = nil
			end
		end)
	end,
	antiaim = function ()
		slot0 = uv0("a_wbantiaim")
		slot1 = uv1(0, 2)
		slot2 = uv1(0, 3)
		slot3 = 0
		slot4 = 0
		slot5 = 0
		slot6 = 0
		slot7 = 0
		slot8 = 0
		slot9 = nil
		slot10 = 0

		uv27("setup_command", function (slot0)
			if slot0.chokedcommands == 0 then
				slot2 = uv1(uv2(uv0()))

				if uv3 ~= nil then
					uv4 = (slot2 - uv3):length2dsqr()

					uv5(uv6, uv4, true)
				end

				uv5(uv7, uv8(uv9.get_desync(1)), true)

				uv10 = uv11
				uv3 = slot2
			end

			uv12 = uv13(uv6) > 3200 and 1 or uv9.get_tickbase_shifting() > 0 and 2 or 0
			uv11 = slot0.chokedcommands
		end)
		uv27("paint_ui", function ()
			uv0.set_state(false)

			if uv1() == nil or not uv2(slot0) then
				return
			end

			slot2, slot3, slot4, slot5 = uv5()

			uv0.set_state(uv3(uv4))
			uv0.get(function (slot0)
				slot1 = {
					uv0(uv1)
				}
				slot2 = ""
				slot3 = false
				slot4 = 150
				slot5 = 150
				slot6 = 150
				slot7 = uv2() * 3.75
				slot8 = 1200 + uv3(0, uv4(uv5) - 3800)

				if uv9 ~= uv6(uv7(uv8 - 3800, slot8) / slot8 * 100) and uv10 < uv11() then
					uv10 = uv11() + 0.005
					uv9 = uv9 + (slot9 < uv9 and -1 or 1)
				end

				uv12 = uv12 + (uv13 == 1 and slot7 or -slot7)
				uv12 = uv12 > 1 and 1 or uv12
				uv12 = uv12 < 0 and 0 or uv12

				if uv13 == 2 then
					uv9 = 0
					uv12 = 0
					slot2 = " | SHIFTING"
					slot6 = 10
					slot5 = 126
					slot4 = 228
				elseif uv12 > 0.1 then
					slot2 = " | dst:          "
				end

				slot10 = ("FL: %s%s"):format(function ()
					if uv0(uv1) < 10 then
						return "  " .. uv1
					end

					return uv1
				end(), slot2)
				slot11 = 17
				slot12 = uv16(nil, slot10) + 8
				slot14 = 10 + 25 * slot0
				slot13 = uv17() - slot12 - 10

				uv18(slot13, slot14 + slot11, slot12 / 2, 1, 0, 0, 0, 25, slot4, slot5, slot6, 255, true)
				uv18(slot13 + slot12 / 2, slot14 + slot11, slot12 - slot12 / 2, 1, slot4, slot5, slot6, 255, 0, 0, 0, 25, true)
				uv19(slot13, slot14, slot12, slot11, 17, 17, 17, uv20)
				uv21(slot13 + 4, slot14 + 2, 255, 255, 255, 255, "d", 0, slot10)

				if uv12 > 0 then
					uv18(slot13 + slot12 - uv16(nil, " | dst: ") + 2, slot14 + 6, uv7(100, uv9) / 100 * 24, 5, slot1[1], slot1[2], slot1[3], uv12 * 220, slot1[1], slot1[2], slot1[3], uv12 * 25, true)
				end

				slot15 = uv22.get_balance_adjust()
				slot16, slot17, slot18 = uv23(uv6(uv22.get_desync()), 30)
				slot21 = ("%sFAKE (%.1f°)"):format(slot15.updating and (slot15.next_update - uv24()) / 1.1 * 1 >= 0 and "     " or "", uv4(uv25))
				slot22 = 18
				slot23 = uv16(nil, slot21) + 8
				slot24 = {
					slot16 - slot16 / 100 * 50,
					slot17 - slot17 / 100 * 50,
					slot18 - slot18 / 100 * 50
				}

				uv18(slot13 - slot23 - 6, slot14, 2, slot22 / 2, slot24[1], slot24[2], slot24[3], 0, slot16, slot17, slot18, 255, false)
				uv18(slot13 - slot23 - 6, slot14 + slot22 / 2, 2, slot22 / 2, slot16, slot17, slot18, 255, slot24[1], slot24[2], slot24[3], 0, false)
				uv18(slot13 - slot23 - 4, slot14, slot23 / 2, slot22, 17, 17, 17, 25, 17, 17, 17, uv20, true)
				uv18(slot13 - slot23 - 4 + slot23 / 2, slot14, slot23 / 2, slot22, 17, 17, 17, uv20, 17, 17, 17, 25, true)
				uv21(slot13 - slot23, slot14 + 2, 255, 255, 255, 255, "d", 0, slot21)

				if slot15.updating and slot19 >= 0 then
					uv26(slot13 - slot23 + 6, slot14 + 8.5, 89, 119, 239, 255, 5, 0, slot19, 2)
				end
			end)
		end)
	end,
	ilstate = function ()
		slot0 = uv0("a_winput")
		slot1 = uv1()

		function slot2(slot0)
			if slot0 < 1 then
				return ("%.2f"):format(slot0)
			end

			if slot0 < 10 then
				return ("%.1f"):format(slot0)
			end

			return ("%d"):format(slot0)
		end

		slot3 = uv2("engine.dll", "\\xff\\xe1")
		slot4 = uv3.cast("uint32_t(__fastcall*)(unsigned int, unsigned int, const char*)", slot3)
		slot5 = uv3.cast("uint32_t(__fastcall*)(unsigned int, unsigned int, uint32_t, const char*)", slot3)
		slot6 = uv3.cast("uint32_t**", uv3.cast("uint32_t", uv2("engine.dll", "\\xff\\xcc\\xcc\\xcc̣\\xcc\\xcc\\xcc\\xcc\\xeb")) + 2)[0][0]
		slot7 = uv3.cast("uint32_t**", uv3.cast("uint32_t", uv2("engine.dll", "\\xff\\xcc\\xcc\\xcc̅\\xc0t")) + 2)[0][0]

		function slot11(slot0, slot1)
			for slot6 = 1, slot1 do
			end

			return {
				[slot6] = slot0
			}
		end

		function slot12(slot0, slot1, slot2)
			slot3 = slot0

			if slot2 or slot3[#slot3] ~= slot1 then
				uv0(slot3, slot1)
				uv1(slot3, 1)
			end

			slot0 = slot3
		end

		function slot13(slot0)
			for slot6, slot7 in uv0(slot0) do
				slot2 = 0 + slot7
				slot1 = 0 + 1
			end

			return slot2 / slot1
		end

		slot14 = uv7()
		slot15 = slot11(0, 90)
		slot16 = slot11(0, 30)
		slot17 = 0
		slot18 = 0

		uv8("post_render", function ()
			uv0 = uv1()
		end)
		uv8("pre_render", function ()
			uv0(uv1, uv2() - uv3)
		end)
		function (slot0, slot1, slot2)
			slot3 = uv0.typeof(slot2)

			return function (...)
				return uv0.cast(uv1, uv2)(uv3(uv4, 0, uv5(uv6, 0, uv7), uv8), 0, ...)
			end
		end("user32.dll", "EnumDisplaySettingsA", "int(__fastcall*)(unsigned int, unsigned int, unsigned int, unsigned long, void*)")(0, 4294967295.0, uv3.new("struct { char pad_0[120]; unsigned long dmDisplayFrequency; char pad_2[32]; }[1]")[0])
		uv8("paint_ui", function ()
			uv0 = 0.9 * uv0 + 0.09999999999999998 * uv1()

			uv2(uv3, uv4(uv5 - 1 / uv0), true)

			uv5 = 1 / uv0
			slot1, slot2, slot3, slot4 = uv8()

			uv9.set_state(uv6(uv7))
			uv9.get(function (slot0)
				slot1 = uv0(uv1)
				slot3 = ("%sms / %dhz"):format(uv4(slot1), uv2(uv3[0].dmDisplayFrequency))
				slot4 = {
					uv5(15 - slot1, 15)
				}
				slot5 = 18
				slot6 = uv6(nil, slot3) + 8
				slot8 = 10 + 25 * slot0
				slot7 = uv7() - slot6 - 10

				uv8(slot7, slot8 + slot5, slot6 / 2, 1, 0, 0, 0, 25, slot4[1], slot4[2], slot4[3], 255, true)
				uv8(slot7 + slot6 / 2, slot8 + slot5, slot6 - slot6 / 2, 1, slot4[1], slot4[2], slot4[3], 255, 0, 0, 0, 25, true)
				uv9(slot7, slot8, slot6, slot5, 17, 17, 17, uv10)
				uv11(slot7 + 4, slot8 + 2, 255, 255, 255, 255, "d", 0, slot3)

				slot9 = "IO | "
				slot10 = slot9 .. "       "
				slot11 = 18
				slot12 = uv6(nil, slot10) + 8
				slot13 = uv6(nil, slot9) + 4
				slot14, slot15, slot16 = uv12(uv13)
				slot17 = {
					slot1,
					1,
					3,
					uv0(uv14) / 4,
					0
				}
				slot18 = uv15(uv16(slot17))

				uv9(slot7 - slot12 - 4, slot8, slot12, slot11, 17, 17, 17, uv10)
				uv11(slot7 - slot12, slot8 + 2, 255, 255, 255, 255, "d", 0, slot10)
				uv18:draw_histogram(slot17, 0, uv17(uv16(slot17)), #slot17, {
					bDrawPeeks = false,
					sDrawBar = "gradient_fadein",
					thickness = 1,
					x = slot7 - slot12 - 4 + slot13,
					y = slot8 + 4,
					w = slot12 - slot13 - 4,
					h = slot11 - 8,
					clr_1 = {
						slot14,
						slot15,
						slot16,
						255
					},
					clr_2 = {
						0,
						127,
						255,
						255
					}
				}, false)
			end)
		end)
	end,
	editor = function ()
		uv13("console_input", function (slot0)
			if ({
				["solus:watermark:set_suffix"] = function ()
					uv0.watermark.suffix = ""

					uv1(uv2, uv0)
					uv3(216, 181, 121, ("[%s]  "):format(uv4))
					uv3(155, 220, 220, "Suffix is now active")
					uv5()
				end,
				["solus:watermark:unset_suffix"] = function ()
					uv0.watermark.suffix = nil

					uv1(uv2, uv0)
					uv3(216, 181, 121, ("[%s]  "):format(uv4))
					uv3(155, 220, 220, "Suffix is now inactive")
					uv5()
				end,
				["solus:reset"] = function ()
					for slot3 in uv0(uv1) do
						uv1[slot3] = slot3 == "keybinds" and uv1.keybinds or {}
					end

					uv2(uv3, uv1)
					uv4(216, 181, 121, ("[%s]  "):format(uv5))
					uv4(255, 0, 0, "Wiping data sectors")
					uv6()
				end,
				["solus:keybinds:reset"] = function ()
					uv0.keybinds = uv1.keybinds

					uv2(uv3, uv0)
					uv4(216, 181, 121, ("[%s]  "):format(uv5))
					uv4(255, 0, 0, "Wiping keybinds sector")
					uv6()
				end
			})[slot0:gsub(" ", "")] ~= nil then
				slot2[slot1]()

				return true
			end
		end)
		function ()
			slot0 = uv0(uv1[1], uv1[2], "Solus Data editor")
			slot2 = {}

			function slot3()
			end

			for slot7, slot8 in uv2(uv3) do
				if slot7 ~= "keybinds" then
					slot12 = uv1[1]
					slot13 = uv1[2]

					uv4({}, uv5(slot12, slot13, slot7:upper()))

					for slot12, slot13 in uv2(slot8) do
						if ({
							string = function ()
								slot0 = nil
								slot2 = uv4(uv1[1], uv1[2], ("%s:%s"):format(uv3, uv2))

								uv5(slot2, uv6[uv3][uv2])
								function ()
									uv0[uv1][uv2] = uv3(uv4)

									uv5(0.01, function ()
										uv0()
									end)
								end()

								return {
									uv0(uv1[1], uv1[2], ("\t  > %s \n %s:%s"):format(uv2, uv3, uv2)),
									slot2
								}
							end,
							boolean = function ()
								slot0 = uv0(uv1[1], uv1[2], ("\t  > %s \n %s:%s"):format(uv2, uv3, uv2))

								uv4(slot0, uv5)
								uv6(slot0, function (slot0)
									uv0[uv1][uv2] = uv3(slot0)
								end)

								return {
									slot0
								}
							end,
							table = function ()
								uv5(uv0(uv1[1], uv1[2], ("\t  > %s \n %s:%s"):format(uv2, uv3, uv2), uv4.min, uv4.max, uv4.init_val, true, nil, uv4.scale), uv4.value or uv4.init_val)
								uv6(slot0, function (slot0)
									uv0[uv1][uv2].value = uv3(slot0)
								end)

								return {
									slot0
								}
							end
						})[uv6(slot13)] ~= nil then
							for slot19, slot20 in uv2(slot15[slot14]()) do
								uv4(slot1, slot20)
							end
						end
					end
				end
			end

			function slot4()
				uv0(uv1, false)

				for slot3, slot4 in uv2(uv3) do
					uv4[slot4] = uv5(slot4)
				end
			end

			function slot5()
				uv0(uv1, false)

				for slot3, slot4 in uv2(uv3) do
					if uv4[slot4] ~= nil then
						uv0(slot4, uv4[slot4])

						uv4[slot4] = nil
					end
				end
			end

			uv13("pre_config_save", function ()
				uv0()
			end)
			uv13("post_config_save", function ()
				uv0()
			end)
			uv13("pre_config_load", function ()
				uv0()
			end)
			uv13("post_config_load", function ()
				uv0()
			end)

			function slot3()
				for slot4, slot5 in uv2(uv3) do
					uv4(slot5, uv0(uv1))
				end
			end

			uv11(slot0, slot3)
			slot3()
		end()
		function ()
			slot2, slot3 = nil
			slot5 = {
				"Basic",
				"Extended"
			}
			slot6 = {
				custom_name = "",
				require = "",
				ui_offset = 1,
				reference = {
					"",
					"",
					""
				}
			}
			slot9 = uv5(uv6[1], uv6[2], "Solus Hotkey editor")
			slot13 = {
				uv8(uv6[1], uv6[2], "Reference"),
				uv9(uv6[1], uv6[2], "solus:keybinds:reference1"),
				uv9(uv6[1], uv6[2], "solus:keybinds:reference2"),
				uv9(uv6[1], uv6[2], "solus:keybinds:reference3")
			}
			slot14 = {
				uv10(uv6[1], uv6[2], "Hotkey type", slot5),
				uv11(uv6[1], uv6[3], slot18:format(slot5[1])),
				uv5(uv6[1], uv6[3], slot18:format(slot5[2])),
				uv11(uv6[1], uv6[3], " ", true),
				uv10(uv6[1], uv6[3], slot18:format(slot5[2]), "-"),
				uv11(uv6[1], uv6[3], " ", true)
			}
			slot18 = "Example: %s"
			slot18 = "Example: %s"
			slot18 = "Example: %s"
			slot15 = uv12(uv6[1], uv6[2], "Save Changes", function ()
				if (uv0[uv1(uv2) + 1] or uv0[1]) ~= uv0[1] then
					if uv7[slot0] ~= nil then
						uv8.keybinds[slot4.hotkey_id] = {
							ui_offset = uv1(uv3[1]) == uv4[2] and 2 or 1,
							reference = {
								uv1(uv5[2]):lower(),
								uv1(uv5[3]):lower(),
								uv1(uv5[4])
							},
							require = uv1(uv9[1]) and uv1(uv9[3]):lower() or "",
							custom_name = uv1(uv6[1]) and uv1(uv6[3]) or ""
						}
					end
				else
					slot4 = true
					slot5 = {
						ui_offset = slot1,
						reference = slot2,
						require = uv1(uv9[1]) and uv1(uv9[3]) or "",
						custom_name = slot3
					}
					slot6 = {
						slot5.reference[1]:lower(),
						slot5.reference[2]:lower(),
						slot5.reference[3]:lower()
					}

					for slot10, slot11 in uv10(uv8.keybinds) do
						if ({
							slot11.reference[1]:lower(),
							slot11.reference[2]:lower(),
							slot11.reference[3]:lower()
						})[1] == slot6[1] and slot12[2] == slot6[2] and slot12[3] == slot6[3] then
							slot4 = false

							break
						end
					end

					if slot4 and uv11(slot5) then
						uv8.keybinds[#uv8.keybinds + 1] = slot5

						uv12(216, 181, 121, ("[%s]  "):format(uv13))
						uv12(255, 255, 255, "Created hotkey  ")
						uv12(155, 220, 220, ("[ %s ]"):format(uv14(slot5.reference, " > ")))
					end

					if not slot4 then
						uv12(216, 181, 121, ("[%s]  "):format(uv13))
						uv12(255, 255, 255, "Could'nt create hotkey  ")
						uv12(155, 220, 220, "[ keybind already exists ]")
						uv15()
					end
				end

				uv16 = true
				uv7 = uv17()
				uv0 = uv18(uv7)

				uv19(uv2, uv0)
				uv20(uv2)
				uv21()
			end)
			slot16 = uv12(uv6[1], uv6[2], "Delete Hotkey", function ()
				if (uv0[uv1(uv2) + 1] or uv0[1]) ~= uv0[1] then
					uv4.keybinds[uv3[slot0].hotkey_id] = nil
					slot2 = {}

					for slot6 = 1, #uv4.keybinds do
						if uv4.keybinds[slot6] ~= nil then
							slot2[#slot2 + 1] = uv4.keybinds[slot6]
						end
					end

					uv4.keybinds = slot2

					uv5(216, 181, 121, ("[%s]  "):format(uv6))
					uv5(255, 255, 255, "Removed hotkey  ")
					uv5(155, 220, 220, ("[ %s ]"):format(uv7(slot1.reference, " > ")))

					uv8 = true
					uv3 = uv9()
					uv0 = uv10(uv3)

					uv11(uv2, uv0)
					uv12(uv2)
					uv13()
				end
			end)

			function slot2()
				slot0 = uv0(uv1)
				slot1 = uv0(uv2) == 0

				uv3(uv2, slot0)
				uv3(uv4[1], slot0 and slot1)
				uv3(uv4[2], slot0 and uv0(uv4[1]) and slot1)
				uv3(uv4[3], slot0 and uv0(uv4[1]) and slot1)
				uv3(uv5[1], slot0)
				uv3(uv5[2], slot0 and uv0(uv5[1]) and not slot1)
				uv3(uv5[3], slot0 and uv0(uv5[1]))
				uv3(uv6[1], slot0)
				uv3(uv6[2], slot0 and slot1)
				uv3(uv6[3], slot0 and slot1)
				uv3(uv6[4], slot0 and slot1)
				uv3(uv7, slot0)
				uv3(uv8, slot0 and not slot1)

				for slot5 = 1, #uv9 do
					uv3(uv9[slot5], slot0 and slot1)
				end
			end

			uv23("pre_config_save", function ()
				uv0(uv1, false)
			end)
			uv23("post_config_load", function ()
				uv0(uv1, false)
			end)
			uv24(slot9, slot2)
			uv24(uv7(uv6[1], uv6[2], "Solus Keybinds", function (slot0)
				slot1 = {}

				for slot5 in uv0(slot0) do
					uv1(slot1, slot5)
				end

				uv2(slot1, function (slot0, slot1)
					return slot0:lower() < slot1:lower()
				end)

				slot2 = {
					"» Create new keybind"
				}

				for slot6 = 1, #slot1 do
					uv1(slot2, slot1[slot6])
				end

				return slot2
			end(function ()
				for slot4, slot5 in uv0(uv1.keybinds) do
					-- Nothing
				end

				return {
					[slot5.custom_name and #uv2(slot6) > 0 and slot6 or nil or slot5.reference[3] or "?"] = {
						hotkey_id = slot4,
						reference = slot5.reference,
						custom_name = slot5.custom_name,
						ui_offset = slot5.ui_offset,
						require = slot5.require
					}
				}
			end())), function (slot0)
				if uv0[uv1[uv2(slot0) + 1] or uv1[1]] == nil then
					slot3 = uv3
				end

				slot4 = {
					require = {
						#slot3.require > 0,
						slot3.require or ""
					},
					custom_name = {
						slot3.custom_name ~= "",
						("Original name: %s"):format(slot3.reference[3]),
						slot3.custom_name
					},
					reference = {
						("Reference: %s > %s (%d)"):format(slot3.reference[1], slot3.reference[2], slot3.ui_offset),
						slot3.reference[1],
						slot3.reference[2],
						slot3.reference[3]
					},
					ui_offset = slot3.ui_offset
				}

				uv4(uv5[1], slot2 ~= uv1[1] and slot4.reference[1] or "Reference")
				uv4(uv6[1], slot4.require[1])
				uv4(uv6[3], slot4.require[2])
				uv4(uv7[1], slot4.custom_name[1])
				uv4(uv7[2], slot4.custom_name[2])
				uv4(uv7[3], slot4.custom_name[3])
				uv4(uv5[2], slot4.reference[2])
				uv4(uv5[3], slot4.reference[3])
				uv4(uv5[4], slot4.reference[4])
				uv4(uv8[1], uv9[slot4.ui_offset])
				uv10()
			end)
			uv24(({
				uv5(uv6[1], uv6[2], "Custom hotkey"),
				uv8(uv6[1], uv6[2], "File name (without \".lua\")"),
				uv9(uv6[1], uv6[2], "solus:keybinds:required_file")
			})[1], slot2)
			uv24(({
				uv5(uv6[1], uv6[2], "Custom name"),
				uv8(uv6[1], uv6[2], "Original name"),
				uv9(uv6[1], uv6[2], "solus:keybinds:custom_name")
			})[1], slot2)
			slot2()

			return slot9
		end()
	end
}

slot110.watermark()
slot110.spectators()
slot110.keybinds()
slot110.antiaim()
slot110.ilstate()
client.delay_call(0.1, slot110.editor)
client.set_event_callback("shutdown", function ()
	uv0(uv1, uv2)
end)

function slot111()
	uv2(uv3, uv0(uv1) ~= uv4[1] and slot0 == uv4[2])
	uv2(uv5, slot0 ~= uv4[1] and slot0 == uv4[3])
	uv2(uv6, slot0 ~= uv4[1])
end

ui.set_callback(ui.new_combobox("CONFIG", "Presets", "Solus Palette", {
	"Solid",
	"Fade",
	"Dynamic fade"
}), slot111)
slot111()

if database.read("solusfix") == nil or slot112 ~= 1 then
	database.write("solusfix", 1)

	slot106.keybinds = slot107.keybinds

	database.write(slot90, slot106)
	slot2(216, 181, 121, ("[%s]  "):format(slot89))
	slot2(255, 0, 0, "Wiping keybinds sector")
	client.reload_active_scripts()
end
