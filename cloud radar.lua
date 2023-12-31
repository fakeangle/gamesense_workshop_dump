slot0 = require("gamesense/http")
slot1 = require("gamesense/websockets")
slot2 = require("gamesense/chat")
slot3 = require("gamesense/clipboard")
slot4 = client.userid_to_entindex
slot5 = client.color_log
slot6 = client.trace_line
slot7 = entity.get_all
slot8 = entity.get_local_player
slot9 = entity.get_player_resource
slot10 = entity.get_player_name
slot11 = entity.get_steam64
slot12 = entity.get_classname
slot13 = entity.is_dormant
slot14 = entity.get_prop
slot15 = entity.get_origin
slot16 = globals.tickcount
slot17 = globals.mapname
slot18 = globals.maxplayers
slot19 = json.stringify
slot20 = renderer.indicator
slot21 = math.rad
slot22 = math.sin
slot23 = math.cos
slot24 = math.tan
slot25 = math.sqrt
slot26 = ui.get
slot27 = ui.set
slot28 = ui.set_visible
slot29 = _NAME:gsub("*", ""):upper()

function slot30(...)
	uv0(217, 217, 217, "[  ")
	uv0(85, 134, 190, uv1 .. " ")
	uv0(217, 217, 217, " ] ")

	slot0 = 1

	while select(slot0, ...) ~= nil do
		uv0(217, 217, 217, " ", select(slot0, ...), " ")

		slot0 = slot0 + 1
	end

	uv0(217, 217, 217, " ")
end

slot33 = "cr.velema.dev/"
slot34 = "https://" .. slot33
slot35 = ""
slot36 = ""
slot37 = false
slot38 = "wss://" .. slot33 .. "in"
slot39 = nil
slot40 = {}
slot41 = 1
slot42 = 0

function slot43()
	if uv0 <= 5 then
		if uv1 == true and uv2 ~= "" and uv3 == nil then
			uv4(uv5.green, "Connection lost! Trying to reconnect! Attempt: " .. uv0 .. "/" .. slot0)
			uv6.connect(uv7, uv8)

			uv0 = uv0 + 1
		end
	else
		uv4(uv5.red, "Could not reconnect, please reload or open a support ticket in the discord!")
	end
end

slot40 = {
	open = function (slot0)
		uv0(uv1.green, "Connection opened!")

		uv2 = slot0
		uv3 = 1
	end,
	message = function (slot0, slot1)
		uv0(uv1.blue, slot1)
	end,
	close = function (slot0, slot1, slot2, slot3)
		uv0(uv1.red, "Connection closed!")

		uv2 = nil

		if uv3 then
			uv4()
		end
	end,
	error = function (slot0, slot1)
		uv0 = nil

		if uv1 then
			uv2()
		else
			uv3(uv4.red, "[WS] Error: ", slot1, "!")
		end
	end
}

function slot44()
	if uv0 ~= nil then
		uv1.get(uv2 .. "in/ClearScoreboard?radarId=" .. uv3, function (slot0, slot1)
			if slot0 then
				uv0 = globals.realtime() + 30
			end
		end)
	end
end

slot45, slot46 = nil
slot47 = ui.new_button("LUA", "A", "Create cloud radar", function ()
	if uv0 == "" then
		slot1 = ""

		if uv1(uv2) then
			slot1 = "&customUrl=" .. uv1(uv3):gsub("%p", ""):gsub("%c", ""):gsub(" ", "_")
		end

		uv4.get(uv5 .. "in/create?steamId=" .. panorama.open().MyPersonaAPI.GetXuid() .. slot1, function (slot0, slot1)
			if slot0 and slot1 and slot1.body then
				uv0 = slot1.body

				if string.match(uv0, "IN_USE") then
					uv1(uv2.red, "Custom radar link already in use!")

					return
				end

				uv3 = uv4 .. "?id=" .. uv0

				uv1(uv2.green, "Created cloud radar. Link: " .. uv3)

				if uv5 == nil then
					uv6.connect(uv7, uv8)
				end

				client.delay_call(3, uv9)

				uv10 = true
			elseif slot1.timed_out then
				uv1(uv2.red, "Timed out while trying to create a cloud radar.")
			else
				uv1(uv2.red, "An unknown error accoured while creating the cloud radar.")
			end
		end)
	else
		uv7(uv8.white, "You already created a cloud radar. Link: " .. uv0)

		if uv9 == nil then
			uv10.connect(uv11, uv12)
		end
	end
end)
slot45 = ui.new_checkbox("LUA", "A", "[CR] Custom Link")
slot46 = ui.new_textbox("LUA", "A", "Custom Link")
slot48 = ui.new_button("LUA", "A", "Destroy cloud radar", function ()
	uv0 = false

	uv1.get(uv2 .. "in/delete?steamId=" .. panorama.open().MyPersonaAPI.GetXuid(), function (slot0, slot1)
		uv0 = ""
		uv1 = ""
		uv2 = false

		if slot0 then
			uv3(uv4.green, "Destroyed cloud radar.")

			if uv5 ~= nil then
				uv5:close()
			else
				uv3(uv4.red, "No open connection.")
			end
		elseif slot1.timed_out then
			uv3(uv4.red, "Timed out while trying to destroy a cloud radar.")

			if uv5 ~= nil then
				uv5:close()
			end
		else
			uv3(uv4.red, "An unknown error accoured while destroying the cloud radar.")

			if uv5 ~= nil then
				uv5:close()
			end
		end
	end)
end)
slot49 = ui.new_button("LUA", "A", "Copy link", function ()
	uv0.set(uv1)
end)
slot51 = ui.new_slider("LUA", "A", "[CR] Update rate", 1, 64, 4, true, "", 1, {
	"7bf542FF Very Fast",
	[6.0] = "7bf542FF Fast",
	[12.0] = "d6a335FF Medium",
	[64.0] = "6e1916FF Slowest",
	[48.0] = "8a3936FF Very Slow",
	[32.0] = "f54242FF Slow"
})
slot52 = ui.new_checkbox("LUA", "A", "[CR]d6a335FF Enable dormant for better results")
slot53 = ui.reference("VISUALS", "Player ESP", "Dormant")

function slot54(slot0)
	slot1, slot2 = nil

	if slot0 == nil or slot0 == 0 then
		return "0"
	end

	if slot0 % 2 == 0 then
		slot1 = 0
		slot2 = slot0 / 2
	else
		slot1 = 1
		slot2 = (slot0 - 1) / 2
	end

	return "7656119" .. slot2 * 2 + 7960265728.0 + slot1
end

function slot55(slot0)
	if uv0(slot0, "m_flC4Blow") - globals.curtime() == nil then
		return 0
	end

	if slot1 > 0 then
		return slot1
	end

	return 0
end

slot56 = false
slot57 = 0
slot58 = {}

client.set_event_callback("paint", function ()
	if uv0 and uv1 ~= nil then
		if uv2 + uv3(uv4) < uv5() and not uv6 then
			slot0 = uv7()
			uv2 = uv5()
			slot1 = {
				Premium = "4dc6822c-22d9-4f54-853b-bf3cfe7f265f",
				Map = uv8(),
				MatchId = uv9,
				GameType = tostring(cvar.game_type:get_int()),
				IsPlanted = true,
				PlantedX = tostring(slot7),
				PlantedY = tostring(slot8),
				DefuseTimer = tostring(uv11(slot3, "m_hBombDefuser") ~= 4294967295.0 and math.floor((uv11(slot3, "m_flDefuseCountDown") - globals.curtime()) * 100) / 100 or -1),
				BombTimer = tostring(slot5),
				Players = {},
				Smokes = {}
			}
			slot4 = uv10("CC4")[1]
			slot5 = ""
			slot6 = entity.get_game_rules()
			slot5 = tostring(uv11(slot6, "m_fRoundStartTime") + uv11(slot6, "m_iRoundTime") - globals.curtime())

			if uv10("CPlantedC4")[1] ~= nil then
				slot7, slot8, slot9 = uv12(slot3)
				slot5 = uv13(slot3)
				slot11 = uv11(slot3, "m_flDefuseLength")

				if uv11(slot3, "m_hBombDefuser") ~= nil then
					-- Nothing
				else
					slot1.DefuseTimer = "0"
				end
			elseif slot4 ~= nil then
				slot1.IsPlanted = false
				slot7, slot8, slot9 = uv12(slot4)
				slot1.PlantedX = tostring(slot7)
				slot1.PlantedY = tostring(slot8)
			end

			slot8 = uv10("CCSTeam")[3]

			if uv10("CCSTeam")[4] ~= nil then
				slot1.CT_Rounds = tostring(uv11(slot7, "m_scoreTotal"))
			else
				slot1.CT_Rounds = "-"
			end

			if slot8 ~= nil then
				slot1.T_Rounds = tostring(uv11(slot8, "m_scoreTotal"))
			else
				slot1.CT_Rounds = "-"
			end

			for slot12 = 1, uv14() do
				if uv15(slot12) == "CCSPlayer" then
					player = {
						Name = uv16(slot12),
						Steam_ID = uv17(uv18(slot12))
					}
					slot13, slot14, slot15 = uv12(slot12)

					if slot13 ~= nil then
						slot15 = slot15 + 64 - uv11(slot12, "m_flDuckAmount")
						slot16, slot17 = uv11(slot12, "m_angEyeAngles")
						player.X = tostring(slot13)
						player.Y = tostring(slot14)
						slot18 = 0

						while 1 == 1 and slot18 < 5000 do
							slot18 = slot18 + 100
							slot19 = uv23(slot12, slot13, slot14, slot15, slot13 - uv19(uv20(slot17 + 180)) * slot18, slot14 - uv21(uv20(slot17 + 180)) * slot18, slot15 - uv22(uv20(slot16)) * slot18)
						end

						player.VX = tostring(slot13 - uv19(uv20(slot17 + 180)) * slot18 * slot19)
						player.VY = tostring(slot14 - uv21(uv20(slot17 + 180)) * slot18 * slot19)
					else
						player.X = ""
						player.Y = ""
						player.VX = ""
						player.VY = ""
					end

					player.IsInactive = uv24(slot12)
					slot16 = "0"

					if slot2 == "0" then
						slot16 = uv11(slot0, "m_iTeam", slot12)
					elseif slot2 == "6" then
						slot16 = entity.get_prop(slot12, "m_nSurvivalTeam")
					end

					player.Team = slot16
					player.Health = uv11(slot0, "m_iHealth", slot12)

					if uv11(slot12, "m_iAccount") ~= nil then
						player.Money = tostring(slot17)
					else
						player.Money = "-"
					end

					if uv11(slot0, "m_iCompetitiveRanking", slot12) ~= nil then
						player.Rank = tostring(slot18)
					else
						player.Rank = "0"
					end

					if uv11(slot0, "m_iCompetitiveWins", slot12) ~= nil then
						player.Wins = tostring(slot19)
					else
						player.Wins = "-"
					end

					if entity.get_classname(entity.get_player_weapon(slot12)) ~= nil then
						player.ActiveWeapon = slot21
					else
						player.ActiveWeapon = ""
					end

					if uv11(slot0, "m_iPlayerC4") ~= nil then
						player.HasC4 = slot22 == slot12
					else
						player.HasC4 = false
					end

					player.IsAlive = entity.is_alive(slot12)

					if uv11(slot0, "m_iArmor", slot12) ~= nil then
						player.HasArmor = slot24 > 0
					else
						player.HasArmor = false
					end

					if uv11(slot0, "m_bHasHelmet", slot12) ~= nil then
						player.HasHelmet = slot25 == 1
					else
						player.HasHelmet = false
					end

					if uv11(slot0, "m_bHasDefuser", slot12) ~= nil then
						player.HasDefuse = slot26 == 1
					else
						player.HasDefuse = false
					end

					playerWeapons = {}

					if slot20 ~= nil and slot23 then
						for slot30 = 0, 63 do
							if uv11(slot12, "m_hMyWeapons", slot30) ~= nil then
								table.insert(playerWeapons, entity.get_classname(slot31, "m_iItemDefinitionIndex"))
							end
						end
					end

					if #playerWeapons == 0 then
						table.insert(playerWeapons, "default_empty")
					end

					player.Weapons = playerWeapons

					if player.X ~= "" and player.Y ~= "" then
						table.insert(slot1.Players, player)
					end
				end
			end

			for slot13 = 1, #uv10("CSmokeGrenadeProjectile") do
				slot14 = slot9[slot13]
				slot15, slot16 = uv12(slot14)

				if uv11(slot14, "m_nSmokeEffectTickBegin") ~= 0 and (globals.tickcount() - slot17) * globals.tickinterval() < 17.5 then
					table.insert(slot1.Smokes, {
						X = tostring(slot15),
						Y = tostring(slot16)
					})
				end
			end

			if #slot1.Smokes == 0 then
				slot1.Smokes = {
					{}
				}
			end

			slot1.Incendiaries = {}

			for slot14 = 1, #uv10("CInferno") do
				slot15 = slot10[slot14]
				slot16, slot17 = uv12(slot15)

				if uv11(slot15, "m_bFireIsBurning") ~= false then
					molo = {
						X = tostring(slot16),
						Y = tostring(slot17)
					}

					table.insert(slot1.Incendiaries, molo)
				end

				slot14 = slot14 + 1
			end

			if #slot1.Incendiaries == 0 then
				slot1.Incendiaries = {
					{}
				}
			end

			if slot1 ~= uv25 then
				uv25 = slot1
				uv6 = true

				uv1:send(uv26(slot1))

				uv6 = false
			end
		elseif uv5() < uv2 then
			uv2 = uv5()
		end
	end
end)

slot59 = ""

client.set_event_callback("paint_ui", function ()
	if uv0 then
		uv1(uv2, true)
		uv1(uv3, true)
		uv1(uv4, true)
		uv1(uv5, false)
		uv1(uv6, false)
		uv1(uv7, false)

		if not uv8(uv9) then
			uv1(uv10, true)

			if uv8(uv10) then
				uv11(uv9, true)
				uv11(uv10, false)
				uv1(uv10, false)
			end
		end
	end

	if uv12 == nil and uv0 == false then
		uv1(uv2, false)
		uv1(uv3, false)
		uv1(uv4, false)
		uv1(uv10, false)
		uv1(uv5, true)

		if uv8(uv5) then
			uv1(uv6, true)
		else
			uv1(uv6, false)
		end

		uv1(uv7, true)
	elseif uv13 < globals.realtime() and panorama.open().GameStateAPI.IsConnectedOrConnectingToServer() == true and panorama.open().GameStateAPI.IsDemoOrHltv() == false then
		if uv14 == "" then
			uv14 = panorama.open().GameStateAPI.GetLocalPlayerXuid()
		elseif panorama.open().GameStateAPI.IsPlayerConnected(uv14) == false then
			uv15()
		end
	end
end)
client.set_event_callback("shutdown", function ()
	if uv0 ~= nil then
		uv0:close()
	end
end)
client.set_event_callback("begin_new_match", function ()
	if uv0 ~= nil then
		uv1()
	end
end)
function (slot0, slot1)
	uv0.print("{white} [ {blue}" .. uv1 .. "{white} ] " .. slot0 .. slot1)
	uv2(slot1)
end(({
	white = "{white}",
	red = "{red}",
	green = "{lime}"
}).green, "Loaded successfully")
