require("gamesense/panorama_valve_utils")

if panorama.open().GameTypesAPI.GetActiveSeasionIndexValue() ~= nil and slot1 > 0 then
	function slot2(slot0, slot1, slot2, ...)
		slot3 = table.concat({
			...
		})
		slot7 = slot2

		client.color_log(slot0, slot1, slot7, slot3:match("^[^]*"), " ")

		for slot7 in slot3:gmatch("[^]*") do
			client.color_log(tonumber("0x" .. slot7:sub(2, 3)), tonumber("0x" .. slot7:sub(4, 5)), tonumber("0x" .. slot7:sub(6, 7)), slot7:sub(8, -1), " ")
		end

		client.color_log(slot0, slot1, slot2, "\n ")
	end

	slot3 = slot0.OperationUtil
	slot4 = slot0.MissionsAPI
	slot5 = slot0.InventoryAPI
	slot6 = slot0["$"].Localize
	slot7 = panorama.loadstring([[
		return [(text, missionid) => {
			let panel = $.CreatePanel("Panel", $.GetContextPanel(), "")
			MissionsAPI.ApplyQuestDialogVarsToPanelJS(missionid, panel)

			let str = $.Localize(text, panel)
			panel.DeleteAsync(0.0)

			return str
		}]
	]], "CSGOMainMenu")()[0]

	ui.new_button("MISC", "Miscellaneous", "Dump Operation Missions", function ()
		uv0.ValidateOperationInfo(uv1)

		slot4 = uv1 + 1

		client.log("Operation ", uv2("op" .. slot4 .. "_name"), " Missions:")

		for slot4 = 1, uv3.GetSeasonalOperationMissionCardsCount(uv1) do
			slot5 = json.parse(tostring(uv3.GetSeasonalOperationMissionCardDetails(uv1, slot4 - 1)))
			slot6 = slot4 - 1 < uv4.GetMissionBacklog()

			uv5(230, 230, 230, "B6E717Week ", slot4, ": ", uv2(slot5.name), " B6B6B6(", slot5.operational_points, " points possible)")

			if #slot5.quests == 0 then
				client.color_log(201, 201, 201, "  Missions not known yet")
			else
				for slot10 = 1, #slot5.quests do
					slot11 = slot5.quests[slot10]
					slot12 = uv4.GetQuestItemIDFromQuestID(slot11)
					slot13 = uv6(uv3.GetQuestDefinitionField(slot11, "loc_description"), slot11):gsub("<b>", ""):gsub("</b>", ""):gsub("%.$", "")
					slot14 = uv3.GetQuestPoints(slot11, "count")
					slot16 = uv3.GetQuestPoints(slot11, "remaining")
					slot17 = uv3.GetQuestDefinitionField(slot11, "operational_points")

					if slot15 > 1 and slot16 > 0 and slot16 ~= slot15 then
						slot18 = (uv3.GetQuestPoints(slot11, "goal") > 1 and "required: " .. slot15 .. ", " or "") .. "progress: " .. slot15 - slot16 .. ", "
					end

					uv5(160, 160, 160, "  DEDEDE", uv4.GetItemName(slot12), "C8C8C8: ", slot13, " ADADAD(", slot18, "awards ", slot17 * slot14, " points) ", slot6 and (slot16 == 0 and "9BC20C√" or "FF2929X") or "")
				end
			end
		end

		client.color_log(210, 210, 210, " ")
	end)
end
