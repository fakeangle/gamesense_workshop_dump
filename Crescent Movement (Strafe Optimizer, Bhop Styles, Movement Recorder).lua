slot0 = bit.band
slot1 = client.camera_angles
slot2 = client.color_log
slot3 = client.exec
slot4 = client.eye_position
slot5 = client.key_state
slot8 = client.trace_line
slot9 = client.userid_to_entindex
slot10 = entity.get_game_rules
slot11 = entity.get_local_player
slot12 = entity.get_origin
slot13 = entity.get_prop
slot14 = entity.is_alive
slot15 = globals.curtime
slot16 = globals.frametime
slot17 = globals.mapname
slot18 = globals.tickinterval
slot19 = json.parse
slot20 = json.stringify
slot21 = math.abs
slot22 = math.atan2
slot23 = math.ceil
slot24 = math.cos
slot25 = math.deg
slot26 = math.floor
slot27 = math.min
slot28 = math.rad
slot29 = math.sin
slot30 = math.sqrt
slot31 = pairs
slot32 = renderer.indicator
slot33 = renderer.line
slot34 = renderer.text
slot35 = renderer.world_to_screen
slot36 = string.format
slot37 = string.len
slot38 = type
slot39 = ui.get
slot40 = ui.new_button
slot41 = ui.new_checkbox
slot43 = ui.new_hotkey
slot44 = ui.new_multiselect
slot45 = ui.new_slider
slot48 = tostring
slot49 = readfile
slot50 = ui.set
slot51 = ui.set_callback
slot52 = writefile
slot53 = ipairs
slot54 = ui.set_visible
slot55 = require("vector")

function slot56(...)
	slot0 = {
		...
	}
	slot1 = {
		255,
		255,
		255
	}
	slot2 = nil
	slot3 = "No text"
	slot4 = #slot0

	for slot8, slot9 in uv0(slot0) do
		if uv1(slot9) == "table" then
			slot9[1] = slot9[1] or 255
			slot9[2] = slot9[2] or 255
			slot9[3] = slot9[3] or 255
			slot1 = slot9
		else
			uv2(slot1[1], slot1[2], slot1[3], slot9 .. (slot8 == slot4 and "" or " "))
		end
	end

	return uv3
end

slot57 = false
slot58 = false
slot59 = nil
slot60 = false
slot61 = {
	last_yaw = 0,
	ideal_yaw = 0
}
slot62 = {
	["Left SW"] = {
		-450,
		450,
		90
	},
	["Right SW"] = {
		-450,
		450,
		-90
	},
	BW = {
		-450,
		450,
		180
	},
	W = {
		-450,
		450,
		90,
		-90
	},
	A = {
		-450,
		450,
		0,
		180
	},
	S = {
		-450,
		450,
		180,
		0
	},
	D = {
		-450,
		450,
		-90,
		90
	}
}
slot63 = {
	["2"] = "Stopped Recording",
	["0"] = "Cleared Recording",
	["1"] = "Started Recording"
}
slot64 = {
	["1"] = "Started Playback",
	["0"] = "Stopped Playback"
}
slot65, slot66 = nil
slot67 = {}
slot68 = 0
slot69 = 0
slot70 = false
slot71 = false
slot72 = 0
slot73 = nil
slot74 = {
	client.screen_size()
}
slot75 = slot74[1] / 2
slot76 = slot74[2] / 2
slot77 = slot74[2] / 10
slot78 = slot41("Misc", "Movement", "Crescent")
slot81 = ui.reference("MISC", "Movement", "Bunny hop")
slot82 = slot41("Misc", "Movement", "Bhop Styles")
slot85 = slot41("Misc", "Movement", "Optimizer")
slot88 = slot41("Misc", "Movement", "Recorder")
slot96 = {
	slot44("Misc", "Movement", "\nIndicators", {
		"Recorder",
		"Bhop Style",
		"1HP Flash"
	}),
	slot43("Misc", "Movement", "Jumpbug"),
	slot82,
	slot85,
	slot88
}
slot97 = {
	slot43("Misc", "Movement", "Bind", true),
	ui.new_combobox("Misc", "Movement", "\n", {
		"Left SW",
		"Right SW",
		"BW",
		"W",
		"A",
		"S",
		"D"
	})
}
slot98 = {
	slot45("Misc", "Movement", "Strength", 0, 100, 50, true, "%"),
	slot45("Misc", "Movement", "Threshold", 250, 350, 280, true)
}
slot99 = {
	slot44("Misc", "Movement", "\nOptions", {
		"Auto Align",
		"Silent Angles",
		"Visualize Trail"
	}),
	slot40("Misc", "Movement", "Start/Stop Recording", function ()
		uv0 = (uv0 + 1) % 3

		uv1({
			0,
			175,
			240
		}, "[Crescent] ", {
			255,
			255,
			255
		}, uv2[uv3(uv0)])
		uv4("playvol buttons\\blip1 1")

		if uv0 == 1 then
			uv5 = uv6(uv7(uv8(), "m_vecOrigin"))
		elseif uv0 == 2 then
			uv9 = uv6(uv7(uv8(), "m_vecOrigin"))
		else
			uv10 = {}
			uv9 = nil
			uv5 = nil
		end
	end),
	slot40("Misc", "Movement", "Play/Stop Playback", function ()
		uv0 = (uv0 + 1) % 2

		uv1({
			0,
			175,
			240
		}, "[Crescent] ", {
			255,
			255,
			255
		}, uv2[uv3(uv0)])
		uv4("playvol buttons\\blip1 1")

		uv5 = uv0 == 0
	end),
	slot40("Misc", "Movement", "Clear Recording", function ()
		uv8 = 0
		uv7 = 0
		uv6 = false
		uv5 = false
		uv4 = 0
		uv3 = 0
		uv2 = {}
		uv1 = nil
		uv0 = nil
	end),
	ui.new_textbox("Misc", "Movement", "Name"),
	slot40("Misc", "Movement", "Import Recording", function ()
		if uv0(uv1) == "" then
			return
		end

		uv2 = {}

		for slot5 = 1, #uv4(uv3("csgo\\" .. uv0(uv1) .. ".json")) do
			uv2[#uv2 + 1] = {
				slot1[slot5][1],
				slot1[slot5][2],
				slot1[slot5][3],
				slot1[slot5][4],
				slot1[slot5][5],
				slot1[slot5][6],
				slot1[slot5][7],
				slot1[slot5][8],
				slot1[slot5][9],
				slot1[slot5][10],
				slot1[slot5][11],
				slot1[slot5][12]
			}
		end

		uv5 = uv6(slot1[1][13], slot1[1][14], slot1[1][15])
		uv7 = uv6(slot1[1][16], slot1[1][17], slot1[1][18])
		uv12 = 0
		uv11 = 2
		uv10 = false
		uv9 = 0
		uv8 = false

		uv13({
			0,
			175,
			240
		}, "[Crescent] ", {
			255,
			255,
			255
		}, "Imported Recording from ", {
			0,
			175,
			240
		}, "csgo\\" .. uv0(uv1) .. ".json")
		uv14(uv1, "")
	end),
	slot40("Misc", "Movement", "Export Recording", function ()
		if uv0(uv1) == "" and uv2 ~= 2 then
			return
		end

		slot0 = {}

		for slot4 = 1, #uv3 do
			slot0[#slot0 + 1] = {
				uv3[slot4][1],
				uv3[slot4][2],
				uv3[slot4][3],
				uv3[slot4][4],
				uv3[slot4][5],
				uv3[slot4][6],
				uv3[slot4][7],
				uv3[slot4][8],
				uv3[slot4][9],
				uv3[slot4][10],
				uv3[slot4][11],
				uv3[slot4][12],
				uv4.x,
				uv4.y,
				uv4.z,
				uv5.x,
				uv5.y,
				uv5.z
			}
		end

		uv7("csgo\\" .. uv0(uv1) .. ".json", uv6(slot0))
		uv8("playvol buttons\\blip1 1")
		uv9({
			0,
			175,
			240
		}, "[Crescent] ", {
			255,
			255,
			255
		}, "Exported Recording to ", {
			0,
			175,
			240
		}, "csgo\\" .. uv0(uv1) .. ".json")
		uv10(uv1, "")
	end)
}

function slot100(slot0, slot1)
	for slot5, slot6 in uv0(slot0) do
		if slot6 == slot1 then
			return true
		end
	end

	return false
end

function slot101(slot0)
	return slot0 ~= slot0
end

function slot102(slot0, slot1, slot2)
	return slot0 < slot1 and slot1 or slot2 < slot0 and slot2 or slot0
end

function slot103(slot0)
	while slot0 >= 180 do
		slot0 = slot0 - 360
	end

	while slot0 <= -180 do
		slot0 = slot0 + 360
	end

	return slot0
end

function slot104(slot0, slot1, slot2)
	return slot0 + (slot1 - slot0) * slot2
end

function slot105(slot0, slot1, slot2, slot3, slot4)
	return slot0 - uv0((slot4 - slot2) / -(slot2 - slot3), 0, 1) * (slot0 - slot1)
end

function slot106(slot0, slot1)
	slot2 = slot0 * math.pi / 180
	slot3 = slot1 * math.pi / 180
	slot7 = uv1(slot2)

	return slot7 * uv1(slot3), slot7 * uv0(slot3), -uv0(slot2)
end

function slot107(slot0)
	slot1 = 16
	slot2 = 10
	slot3 = 10
	slot4 = 360
	slot5 = 10
	slot6 = 180
	slot8 = uv0(uv1(slot0, "m_vecVelocity"))

	if not uv0(uv1(slot0, "m_vecOrigin")).x then
		return
	end

	if slot8.z == 0 then
		return
	end

	slot9 = uv2()
	px = slot7.x + slot8.x * slot9
	py = slot7.y + slot8.y * slot9
	pz = slot7.z + slot8.z * slot9
	slot10 = false
	slot11 = false

	for slot15 = 0, slot3, slot3 / slot5 do
		for slot19 = 0, slot4, slot4 / slot6 do
			slot20, slot21, slot22 = uv3(0, slot19)
			slot23 = px + slot20 * slot15
			slot24 = py + slot21 * slot15
			slot25 = pz + slot22 * slot15

			if slot1 > 256 * uv4(slot0, slot23, slot24, slot25, slot23, slot24, slot25 - 256) then
				slot10 = true
			end

			if slot2 > 256 * slot26 then
				return slot10, true
			end
		end
	end

	return slot10, slot11
end

function slot108(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot11 = {
		slot0,
		slot1
	}

	for slot15 = slot5, slot4 + slot5, 4 do
		slot16 = uv0(slot15)
		slot17 = uv1(slot3 * uv2(slot16) + slot0, slot3 * uv3(slot16) + slot1, slot2)
		slot19, slot20 = uv4(slot17.x, slot17.y, slot17.z)

		if ({
			slot0,
			slot1,
			y = slot20,
			x = slot19
		}).x and slot11.x then
			uv5(slot18.x, slot18.y, slot11.x, slot11.y, slot6, slot7, slot8, slot9)
		end

		slot11.y = slot18.y
		slot11.x = slot18.x
	end
end

function slot109()
	if not uv1(uv0()) then
		return
	end

	if uv2(uv3) then
		uv4(117, 205, 13, 255, "JB")
	end

	if uv5(uv2(uv6), "Recorder") and uv7[uv8] ~= nil and not uv9 then
		uv10(uv11, uv12 + uv13, 255, 255, 255, 255, "cbd", 0, uv14(" %d / %d (%d%%)", uv8, #uv7, uv15(uv8 / #uv7 * 100)))
	end

	if uv5(uv2(uv6), "Bhop Style") and uv2(uv16) then
		slot2 = uv18(uv17(slot0, "m_fFlags"), 1) ~= 0
		slot3 = uv2(uv19) and {
			117,
			205,
			13,
			255
		} or {
			255,
			0,
			0,
			100
		}

		uv10(uv11, uv12 + uv13 + 25, slot3[1], slot3[2], slot3[3], slot3[4], "cbd", 0, uv2(uv20))
	end

	if uv2(uv21) and uv5(uv2(uv22), "Visualize Trail") and uv7 and #uv7 > 0 then
		for slot4, slot5 in uv23(uv7) do
			if slot5[1] ~= uv24() then
				return
			end

			slot6 = {
				uv25(slot5[4], slot5[5], slot5[6])
			}

			if slot4 == 1 then
				if slot6[1] and slot6[2] then
					uv26(slot6[1], slot6[2], slot6[1] - 1, slot6[2] - 1, 255, 255, 255, 255)
				end
			elseif ({
				uv25(uv7[slot4 - 1][4], uv7[slot4 - 1][5], uv7[slot4 - 1][6])
			})[1] and slot7[2] then
				uv26(slot6[1], slot6[2], slot7[1], slot7[2], 255, 255, 255, 255)
			end
		end
	end

	if uv27 and uv28 then
		slot1 = uv29(uv30(slot0))
		slot4 = slot1:dist(uv27) <= 40 and {
			74,
			199,
			113,
			255
		} or {
			255,
			110,
			110,
			255
		}
		slot5 = slot1:dist(uv28) <= 40 and {
			74,
			199,
			113,
			255
		} or {
			255,
			110,
			110,
			255
		}

		uv31(uv27.x, uv27.y, uv27.z, 25, 360, 0, slot4[1], slot4[2], slot4[3], slot4[4])
		uv31(uv28.x, uv28.y, uv28.z, 25, 360, 0, slot5[1], slot5[2], slot5[3], slot5[4])
	end
end

function slot110(slot0)
	slot3 = uv2(uv1(uv0(), "m_fFlags"), 1) ~= 0
	slot4 = uv1(uv3(), "m_bIsValveDS")
	slot5 = uv4(uv1(slot1, "m_vecOrigin"))
	slot6 = uv4(uv1(slot1, "m_vecVelocity"))
	slot7 = uv4(uv5())
	slot8 = uv4(uv6())
	slot9 = uv7(uv8(slot6.x * slot6.x + slot6.y * slot6.y) + 0.5)

	if uv9 == 1 then
		uv10[#uv10 + 1] = {
			uv11(),
			slot0.in_jump,
			slot0.in_duck,
			slot5.x,
			slot5.y,
			slot5.z,
			uv12(),
			slot0.move_yaw,
			slot0.forwardmove,
			slot0.sidemove,
			slot7.x,
			slot7.y
		}
	elseif uv9 == 2 then
		if uv10[1][1] ~= uv11() then
			return
		end

		if uv13 == 1 then
			if uv14(uv15(uv16), "Auto Align") and not uv17 then
				slot12 = slot7:dist(uv4(uv10[1][11], uv10[1][12], 0))

				if slot5:dist(uv18) < 1 and slot10 > -1 and slot12 < 1 and slot12 > -1 then
					uv17 = true
					uv19 = false
				else
					slot13 = uv4(slot7.x - slot11.x, slot7.y - slot11.y, 0)
					slot14 = uv8(slot13.x * slot13.x + slot13.y * slot13.y)
					slot13.y = slot13.y / slot14
					slot13.x = slot13.x / slot14
					slot15 = uv20(1, slot14 / 3) * 0.5
					slot16 = (slot15 + uv21(slot14 * (1 - slot15))) * uv22() * 15 * 2
					slot19 = slot5:to(uv18)
					slot20, slot0.move_yaw = slot19:angles()

					uv5(slot7.x - slot13.x * slot16 * 0.1, slot7.y - slot13.y * slot16 * 0.1)

					slot0.sidemove = 0
					slot0.forwardmove = uv20(450, slot19:length() * uv23(450, 30, 500, 50, slot5:dist(uv18)))
				end
			elseif uv24 == 0 then
				if slot0.command_number ~= nil then
					uv24 = slot0.command_number
				end
			else
				uv25 = slot0.command_number - uv24

				if uv10[uv25] ~= nil and not uv19 then
					slot0.in_jump = uv10[uv25][2]
					slot0.in_duck = uv10[uv25][3]
					slot0.move_yaw = uv10[uv25][8]
					slot0.forwardmove = uv10[uv25][9]
					slot0.sidemove = uv10[uv25][10]

					if uv14(uv15(uv16), "Silent Angles") then
						slot0.pitch = uv10[uv25][11]
						slot0.yaw = uv10[uv25][12]
					else
						uv5(uv10[uv25][11], uv10[uv25][12])
					end

					if uv25 == #uv10 then
						uv17 = false
						uv25 = 0
						uv24 = 0
						uv19 = true

						uv26(uv27, true)
					end
				end
			end
		end
	end

	if (slot0.in_jump or not slot3) and uv15(uv28) and uv15(uv29) then
		slot10 = uv15(uv30)
		slot11 = uv31[slot10]

		if uv32(slot10) == 1 then
			if uv33(65) then
				slot0.sidemove = slot11[1]
				slot0.yaw = slot0.yaw + slot11[3]
			elseif uv33(68) then
				slot0.sidemove = slot11[2]
				slot0.yaw = slot0.yaw + slot11[4]
			end
		else
			slot0.yaw = slot0.yaw + slot11[3]

			if uv33(65) then
				slot0.sidemove = slot11[1]
			elseif uv33(68) then
				slot0.sidemove = slot11[2]
			end
		end
	end

	if uv15(uv34) and not slot3 then
		if uv13 == 1 then
			return
		end

		slot13 = uv23(uv15(uv35), 20, uv36, 1300, slot9) / 100
		slot14 = uv4()
		slot14.x = slot5.x + slot6.x * uv37() * 3
		slot14.y = slot5.y + slot6.y * uv37() * 3

		if slot0.forwardmove ~= 0 or slot0.sidemove == 0 or slot9 < uv15(uv36) or uv21(slot7.y - uv38.last_yaw) < 0.1 then
			uv38.last_yaw = slot7.y

			return
		else
			if slot0.sidemove < 0 then
				uv38.ideal_yaw = slot7.y + uv21(uv40(slot7.y - uv41(uv39(slot6.y, slot6.x))))
				slot0.in_moveright = 0
			elseif slot0.sidemove > 0 then
				uv38.ideal_yaw = slot7.y - slot16
				slot0.in_moveleft = 0
			end

			if uv38.ideal_yaw and slot7.y and slot13 and slot9 > 0 then
				uv5(uv5(), uv40(uv42(slot7.y, uv38.ideal_yaw, slot13)))

				uv38.last_yaw = slot7.y
			end
		end
	end

	if not uv15(uv43) then
		if uv44 then
			uv26(uv45, uv46)

			uv46 = nil
			uv44 = false
		end

		if uv47 then
			uv47 = false
		end

		if uv48 then
			uv48 = false
		end

		return
	end

	if not uv46 then
		uv46 = uv15(uv45)
	end

	slot10, slot11 = uv49(slot1)

	if slot11 and uv48 and slot6.z <= 0 then
		if slot0.command_number % 2 == 0 then
			slot0.in_jump = true
		else
			slot0.in_jump = false
		end
	end

	if slot10 or uv47 then
		slot0.in_duck = true
		uv47 = true
	end

	if slot11 or uv48 then
		uv26(uv45, false)

		slot0.in_duck = false
		slot0.in_jump = true
		uv48 = true
		uv44 = true
	end

	if not slot10 and not slot11 and uv44 then
		uv26(uv45, uv46)

		uv46 = nil
		uv44 = false
		uv47 = false
		uv48 = false
	end
end

function slot112()
	uv9.ideal_yaw = 0
	uv9.last_yaw = 0
	uv8 = 0
	uv7 = 0
	uv6 = false
	uv5 = false
	uv4 = 0
	uv3 = 0
	uv2 = {}
	uv1 = nil
	uv0 = nil
end

function slot113(slot0)
	slot1 = slot0 and client.set_event_callback or client.unset_event_callback

	slot1("setup_command", uv0)
	slot1("paint", uv1)
	slot1("round_start", uv2)
	slot1("client_disconnect", uv2)
	slot1("level_init", uv2)
	slot1("player_connect_full", function (slot0)
		if uv0(slot0.userid) == uv1() then
			uv2()
		end
	end)
end

function slot114(slot0)
	slot1 = uv0(slot0)

	for slot5 = 1, #uv1 do
		uv2(uv1[slot5], slot1)
	end

	uv3(slot1)
end

function slot115(slot0)
	for slot5 = 1, #uv1 do
		uv2(uv1[slot5], uv0(slot0))
	end
end

function slot116(slot0)
	for slot5 = 1, #uv1 do
		uv2(uv1[slot5], uv0(slot0))
	end
end

function slot117(slot0)
	for slot5 = 1, #uv1 do
		uv2(uv1[slot5], uv0(slot0))
	end
end

slot51(slot88, slot115)
slot51(slot78, slot114)
slot51(slot82, slot116)
slot51(slot85, slot117)
client.register_esp_flag("1HP", 255, 0, 0, function (slot0)
	return uv1(uv2(uv3), "1HP Flash") and uv0(slot0, "m_iHealth") == 1
end)
slot117(slot85)
slot116(slot82)
slot115(slot88)
slot114(slot78)
