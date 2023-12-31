slot0 = require("vector")
slot1 = require("gamesense/entity")
slot2 = require("gamesense/uilib")
slot3 = client.userid_to_entindex
slot4 = client.color_log
slot5 = client.error_log
slot6 = client.eye_position
slot8 = globals.tickcount
slot9 = {
	"generic",
	"head",
	"chest",
	"stomach",
	"left arm",
	"right arm",
	"left leg",
	"right leg",
	"neck",
	"?",
	"gear"
}
slot11 = {}
slot12 = {}
slot13 = "rage"
slot14 = "other"
slot16 = slot2.reference("misc", "settings", "menu color")
slot19 = loadstring(slot2.new_string("aim_logs", function ()
	function slot0(slot0)
		return slot0:gsub("\"", "\\\"")
	end

	slot1 = {}
	slot2 = nil

	function slot2(slot0, slot1)
		uv0[slot0] = true
		slot1 = slot1 or ""

		for slot6, slot7 in pairs(slot0) do
			slot2 = "" .. slot1
			slot2 = type(slot6) == "string" and slot2 .. "[\"" .. uv1(slot6) .. "\"] = " or slot2 .. "[" .. tostring(slot6) .. "] = "
			slot2 = (type(slot7) == "table" and slot2 .. "{\n" .. uv2(slot7, slot1 .. "\t") .. slot1 .. "}" or type(slot7) == "string" and slot2 .. "\"" .. uv1(slot7) .. "\"" or slot2 .. tostring(slot7)) .. ",\n"
		end

		return slot2
	end

	return function (slot0)
		return "return {\n" .. uv0(slot0, "\t") .. "}"
	end
end()({
	hit = {
		"/c[gamesense]/r Hit /c$target_name/r in the /c$hitgroup_name/r for /c$dmg/r damage (/c$target_hp/r health remaining)",
		"/c[gamesense]/r Hit /c$target_name$wanted_target/r in the /c$hitgroup_name$wanted_hitgroup/r for /c$dmg$wanted_dmg/r damage (/c$target_hp/r health remaining) /c($flags, $hit_chance%, $spread°, $bt_tickt)"
	},
	miss = {
		"/c[gamesense]/r Missed /c$target_name/r's /c$hitgroup_name/r due to /c$reason/r",
		"/c[gamesense]/r Missed /c$target_name/r's /c$hitgroup_name/r due to /c$reason/r /c($flags, $hit_chance%, $spread°, $bt_tickt)"
	},
	dormant = {
		"/c[gamesense/dormant]/r Hit /c$target_name/r's /c$hitgroup_name/r for /c$dmg/r damage (/c$target_hp/r health remaining)",
		"/c[gamesense/dormant]/r Hit /c$target_name/r's /c$hitgroup_name$wanted_hitgroup/r for /c$dmg/r damage (/c$target_hp/r health remaining) /c($hit_chance%)",
		"/c[gamesense/dormant]/r Missed /c$target_name/r's /c$hitgroup_name",
		"/c[gamesense/dormant]/r Missed /c$target_name/r's /c$hitgroup_name /c($hit_chance%, $aim_point)"
	}
}))())()

function slot20(...)
	for slot3, slot4 in pairs({
		...
	}) do
		slot5 = 255
		slot6 = 255
		slot7 = 255
		slot8 = slot4

		if type(slot4) == "table" then
			slot5, slot6, slot7, slot8 = unpack(slot4)
		end

		uv0(slot5, slot6, slot7, slot8 .. " ")
	end

	uv0(220, 220, 220, " ")
end

slot19 = function ()
	if loadstring(uv1())().dormant == nil then
		uv2.dormant = uv0.dormant
		uv1.value = uv3(uv2)
		slot0 = uv2
	end

	return slot0
end()

client.set_event_callback("console_input", function (slot0)
	if slot0:sub(0, 12) == "aim_logs.set" then
		slot1 = {
			hit = function (slot0)
				uv0.hit[1] = slot0

				return true
			end,
			hit_adv = function (slot0)
				uv0.hit[2] = slot0

				return true
			end,
			miss = function (slot0)
				uv0.miss[1] = slot0

				return true
			end,
			miss_adv = function (slot0)
				uv0.miss[2] = slot0

				return true
			end,
			dorm_hit = function (slot0)
				uv0.dormant[1] = slot0

				return true
			end,
			dorm_hit_adv = function (slot0)
				uv0.dormant[2] = slot0

				return true
			end,
			dorm_miss = function (slot0)
				uv0.dormant[3] = slot0

				return true
			end,
			dorm_miss_adv = function (slot0)
				uv0.dormant[4] = slot0

				return true
			end
		}
		slot2 = {}

		for slot6 in slot0:sub(14):gmatch("%S+") do
			slot2[#slot2 + 1] = slot6
		end

		if slot2[1] == nil then
			return false
		end

		slot4 = slot0:sub(({
			slot0:find(slot2[1])
		})[2] + 1)
		slot5 = slot1[slot2[1]] and slot1[slot2[1]](slot4) or nil

		if slot4:match("$default") then
			slot5 = slot1[slot2[1]] and slot1[slot2[1]](slot2[1] == "hit" and uv1.hit[1] or slot2[1] == "hit_adv" and uv1.hit[2] or slot2[1] == "miss" and uv1.miss[1] or slot2[1] == "miss_adv" and uv1.miss[2] or slot2[1] == "dorm_hit" and uv1.dormant[1] or slot2[1] == "dorm_hit_adv" and uv1.dormant[2] or slot2[1] == "dorm_miss" and uv1.dormant[3] or slot2[1] == "dorm_miss_adv" and uv1.dormant[4]) or nil
		end

		if slot5 ~= nil then
			uv2({
				165,
				220,
				15,
				"[aim_logs]"
			}, " Successfully set ", slot2[1], " logs")

			uv3.value = uv4(uv0)

			return true
		else
			uv5("Invalid log type")

			return true
		end
	elseif slot0:sub(0, 13) == "aim_logs.tags" then
		for slot5, slot6 in ipairs({
			"target_name",
			"target_hp",
			"wanted_hitgroup",
			"wanted_dmg",
			"wanted_target",
			"dmg",
			"hitgroup_name",
			"hit_chance",
			"reason",
			"spread",
			"bt_tick",
			"bt_time",
			"flags"
		}) do
			uv2({
				165,
				220,
				15,
				slot6
			})
		end
	end
end)
({
	enabled = slot2.new_checkbox(slot13, slot14, "Aimbot logs"),
	options = slot2.new_multiselect(slot13, slot14, "\naimbot_logs_opts", {
		"Hit",
		"Miss",
		"Advanced",
		"Dormant hit",
		"Dormant miss"
	}),
	hit_clr = {
		slot2.new_label(slot13, slot14, "Hit color"),
		slot2.new_color_picker(slot13, slot14, "aimbot_logs_hit", 165, 220, 15, 255)
	},
	miss_clr = {
		slot2.new_label(slot13, slot14, "Miss color"),
		slot2.new_color_picker(slot13, slot14, "aimbot_logs_miss", 220, 0, 0, 255)
	}
}).enabled:add_callback(function ()
	slot0 = uv0.enabled()
	uv0.options.vis = slot0
	uv0.hit_clr[2].vis = slot0 and uv0.options:contains("Hit")
	uv0.hit_clr[1].vis = slot0 and uv0.options:contains("Hit")
	uv0.miss_clr[2].vis = slot0 and uv0.options:contains("Miss")
	uv0.miss_clr[1].vis = slot0 and uv0.options:contains("Miss")
end)

for slot27, slot28 in pairs({
	bullet_impact = function (slot0)
		slot3 = uv2()

		if uv0(slot0.userid) == uv1.get_local_player():get_entindex() then
			if #uv3 > 150 and uv3[#uv3].tick ~= slot3 then
				uv3 = {}
			end

			uv3[#uv3 + 1] = {
				tick = slot3,
				origin = uv4(uv5()),
				shot = uv4(slot0.x, slot0.y, slot0.z)
			}
		end
	end,
	aim_fire = function (slot0)
		slot0.backtrack = uv0() - slot0.tick > 0 and slot1 - slot0.tick or 0
		slot0.target = uv1(slot0.target)
		uv2[slot0.id] = {
			spread = 0,
			fired = slot0
		}
	end,
	aim_hit = function (slot0)
		if not uv0.options:contains("Hit") then
			return
		end

		slot3 = uv1[slot0.id].fired
		slot5 = uv4.hit[uv0.options:contains("Advanced") and 2 or 1]
		slot8 = uv6[slot3.hitgroup + 1] or "?"
		slot9 = slot0.damage ~= slot3.damage and " (" .. slot3.damage .. ")" or ""
		slot10 = uv5(slot0.target):get_player_name() == slot3.target:get_player_name() and "" or " (" .. slot10 .. ")"
		slot8 = (uv6[slot0.hitgroup + 1] or "?") ~= slot8 and " (" .. slot8 .. ")" or ""
		slot11 = table.concat({
			slot3.teleported and "T" or "",
			slot3.interpolated and "I" or "",
			slot3.extrapolated and "E" or "",
			slot3.boosted and "B" or "",
			slot3.high_priority and "H" or "",
			slot0.refined and "R" or "",
			slot0.expired and "X" or "",
			slot0.noaccept and "N" or ""
		}) ~= "" and slot11 or "-"

		if uv2[#uv2] and slot2.tick == uv3() then
			slot1.spread = uv7((slot2.origin - uv7(slot3.x, slot3.y, slot3.z)):angles() - (slot2.origin - slot2.shot):angles()):length2d()
		end

		slot12 = {
			target_name = slot6:get_player_name(),
			target_hp = slot6:get_prop("m_iHealth"),
			wanted_target = slot10,
			wanted_hitgroup = slot8,
			wanted_dmg = slot9,
			hitgroup_name = slot7,
			hit_chance = ("%.1f"):format(slot0.hit_chance),
			dmg = slot0.damage,
			spread = ("%.3f"):format(slot1.spread),
			bt_tick = slot3.backtrack,
			bt_time = totime(slot3.backtrack),
			flags = slot11
		}
		slot13 = {}
		slot14 = 220
		slot15 = 220
		slot16 = 220

		for slot20 in slot5:gmatch("%S+") do
			if slot20:match("/c") then
				slot14, slot15, slot16 = uv0.hit_clr[2]()
			end

			if slot20:match("/a") then
				slot14, slot15, slot16 = uv8()
			end

			for slot24, slot25 in pairs(slot12) do
				if slot20:gsub("$" .. slot24, slot25) == slot25 then
					break
				end
			end

			slot13[#slot13 + 1] = {
				slot14,
				slot15,
				slot16,
				slot20:gsub("/r", ""):gsub("/c", ""):gsub("/a", "") .. " "
			}

			if slot20:match("/r") then
				slot16 = 220
				slot15 = 220
				slot14 = 220
			end
		end

		uv9(unpack(slot13))
	end,
	aim_miss = function (slot0)
		if not uv0.options:contains("Miss") then
			return
		end

		slot3 = uv1[slot0.id].fired
		slot5 = uv4.miss[uv0.options:contains("Advanced") and 2 or 1]
		slot8 = uv6[slot3.hitgroup + 1] or "?"
		slot9 = uv5(slot0.target):get_player_name() == slot3.target:get_player_name() and "" or " (" .. slot9 .. ")"
		slot8 = (uv6[slot0.hitgroup + 1] or "?") ~= slot8 and " (" .. slot8 .. ")" or ""
		slot10 = table.concat({
			slot3.teleported and "T" or "",
			slot3.interpolated and "I" or "",
			slot3.extrapolated and "E" or "",
			slot3.boosted and "B" or "",
			slot3.high_priority and "H" or "",
			slot0.refined and "R" or "",
			slot0.expired and "X" or "",
			slot0.noaccept and "N" or ""
		}) ~= "" and slot10 or "-"

		if uv2[#uv2] and slot2.tick == uv3() then
			slot1.spread = uv7((slot2.origin - uv7(slot3.x, slot3.y, slot3.z)):angles() - (slot2.origin - slot2.shot):angles()):length2d()
		end

		slot11 = {
			target_name = slot6:get_player_name(),
			target_hp = slot6:get_prop("m_iHealth"),
			wanted_target = slot9,
			wanted_hitgroup = slot8,
			wanted_dmg = slot3.damage,
			hitgroup_name = slot7,
			hit_chance = ("%.1f"):format(slot0.hit_chance),
			reason = slot0.reason,
			spread = ("%.3f"):format(slot1.spread),
			bt_tick = slot3.backtrack,
			bt_time = totime(slot3.backtrack),
			flags = slot10
		}
		slot12 = {}
		slot13 = 220
		slot14 = 220
		slot15 = 220

		for slot19 in slot5:gmatch("%S+") do
			if slot19:match("/c") then
				slot13, slot14, slot15 = uv0.miss_clr[2]()
			end

			if slot19:match("/a") then
				slot13, slot14, slot15 = uv8()
			end

			for slot23, slot24 in pairs(slot11) do
				if slot19:gsub("$" .. slot23, slot24) == slot24 then
					break
				end
			end

			slot12[#slot12 + 1] = {
				slot13,
				slot14,
				slot15,
				slot19:gsub("/r", ""):gsub("/c", ""):gsub("/a", "") .. " "
			}

			if slot19:match("/r") then
				slot15 = 220
				slot14 = 220
				slot13 = 220
			end
		end

		uv9(unpack(slot12))
	end,
	dormant_hit = function (slot0)
		if not uv0.options:contains("Dormant hit") then
			return
		end

		slot3 = uv3[slot0.hitgroup + 1] or "?"
		slot5 = {
			target_name = uv2(slot0.userid):get_player_name(),
			target_hp = slot0.health,
			wanted_hitgroup = slot3 ~= slot0.aim_hitbox:lower() and " (" .. slot4 .. ")" or "",
			hitgroup_name = slot3,
			dmg = slot0.dmg_health,
			hit_chance = ("%.1f"):format(slot0.accuracy * 100)
		}
		slot6 = {}
		slot7 = 220
		slot8 = 220
		slot9 = 220

		for slot13 in uv1.dormant[uv0.options:contains("Advanced") and 2 or 1]:gmatch("%S+") do
			if slot13:match("/c") then
				slot7, slot8, slot9 = uv0.hit_clr[2]()
			end

			if slot13:match("/a") then
				slot7, slot8, slot9 = uv4()
			end

			for slot17, slot18 in pairs(slot5) do
				if slot13:gsub("$" .. slot17, slot18) == slot18 then
					break
				end
			end

			slot6[#slot6 + 1] = {
				slot7,
				slot8,
				slot9,
				slot13:gsub("/r", ""):gsub("/c", ""):gsub("/a", "") .. " "
			}

			if slot13:match("/r") then
				slot9 = 220
				slot8 = 220
				slot7 = 220
			end
		end

		uv5(unpack(slot6))
	end,
	dormant_miss = function (slot0)
		if not uv0.options:contains("Dormant miss") then
			return
		end

		slot3 = {
			target_name = uv2(slot0.userid):get_player_name(),
			target_hp = slot0.health,
			hitgroup_name = slot0.aim_hitbox:lower(),
			aim_point = slot0.aim_point:lower(),
			hit_chance = ("%.1f"):format(slot0.accuracy * 100)
		}
		slot4 = {}
		slot5 = 220
		slot6 = 220
		slot7 = 220

		for slot11 in uv1.dormant[uv0.options:contains("Advanced") and 4 or 3]:gmatch("%S+") do
			if slot11:match("/c") then
				slot5, slot6, slot7 = uv0.miss_clr[2]()
			end

			if slot11:match("/a") then
				slot5, slot6, slot7 = uv3()
			end

			for slot15, slot16 in pairs(slot3) do
				if slot11:gsub("$" .. slot15, slot16) == slot16 then
					break
				end
			end

			slot4[#slot4 + 1] = {
				slot5,
				slot6,
				slot7,
				slot11:gsub("/r", ""):gsub("/c", ""):gsub("/a", "") .. " "
			}

			if slot11:match("/r") then
				slot7 = 220
				slot6 = 220
				slot5 = 220
			end
		end

		uv4(unpack(slot4))
	end,
	round_start = function ()
		uv1 = {}
		uv0 = {}
	end,
	post_config_load = function ()
		uv0 = uv1()
	end
}) do
	slot15.enabled:add_event_callback(slot27, slot28)
end

slot15.enabled:invoke()
slot15.options:add_callback(slot23)
