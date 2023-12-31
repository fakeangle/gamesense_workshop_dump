slot0 = {
	[ui.new_button] = "button",
	[ui.new_checkbox] = "checkbox",
	[ui.new_color_picker] = "color_picker",
	[ui.new_combobox] = "combobox",
	[ui.new_hotkey] = "hotkey",
	[ui.new_label] = "label",
	[ui.new_listbox] = "listbox",
	[ui.new_multiselect] = "multiselect",
	[ui.new_slider] = "slider",
	[ui.new_string] = "string",
	[ui.new_textbox] = "textbox"
}
slot1 = {
	[0] = "Always on",
	"On hotkey",
	"Toggle",
	"Off hotkey"
}
slot2 = {}
slot3 = {}
slot4 = {}

function slot5(...)
	slot4 = "[UILIB]  "

	client.color_log(224, 54, 54, slot4)

	for slot4 = 1, #{
		...
	} - 1 do
		client.color_log(232, 181, 181, slot0[slot4], "  ")
	end

	client.color_log(232, 181, 181, slot0[#slot0])

	return nil
end

function slot6(...)
	slot4 = "[UILIB]  "

	client.color_log(224, 54, 54, slot4)

	for slot4 = 1, #{
		...
	} - 1 do
		client.color_log(232, 181, 181, tostring(slot0[slot4]), "  ")
	end

	client.color_log(232, 181, 181, tostring(slot0[#slot0]))
end

function slot7(slot0, slot1)
	slot2 = uv0[slot0]

	if uv1[slot0].events then
		if slot1 then
			for slot6, slot7 in pairs(uv1[slot0].events) do
				for slot11, slot12 in ipairs(slot7) do
					client.unset_event_callback(slot6, slot12[1])
				end
			end
		else
			for slot6, slot7 in pairs(uv1[slot0].events) do
				for slot11, slot12 in ipairs(slot7) do
					client.unset_event_callback(slot6, slot12[1])

					if slot12[2](slot2) then
						client.set_event_callback(slot6, slot12[1])
					end
				end
			end
		end
	end
end

function slot8(slot0)
	slot1 = uv0[slot0]

	if uv1[slot0].change then
		for slot5, slot6 in ipairs(uv1[slot0].change) do
			slot6(slot1)
		end
	end
end

function slot9(slot0, slot1)
	if slot1 ~= nil then
		slot2 = slot0.state and slot1
	end

	for slot6, slot7 in ipairs(slot0.children) do
		slot7.visible = slot2

		if uv0[slot7.reference] then
			uv1(slot7.reference, true)
		end

		if slot7.children and #slot7.children > 0 then
			uv2(slot7, slot2)
		end
	end
end

function slot10(slot0)
	if uv0[slot0].childs then
		uv2(uv1[slot0])
	end
end

function slot11(slot0)
	if uv0[slot0] then
		if uv1[slot0] and slot1.parent ~= nil and not slot1.parent.state then
			return
		end

		uv2(slot0)
		uv3(slot0)
		uv4(slot0)
	end
end

slot12 = {
	create_ref = function (slot0, slot1)
		uv0[slot1] = {
			events = {},
			change = {},
			childs = {}
		}

		ui.set_callback(slot1, uv1)
	end,
	add_event = function (slot0, slot1, slot2, slot3, slot4)
		if not uv0[slot1] then
			slot0:create_ref(slot1)
		end

		if uv0[slot1].events[slot2] == nil then
			uv0[slot1].events[slot2] = {}
		end

		table.insert(uv0[slot1].events[slot2], {
			slot3,
			slot4
		})
	end,
	add_change = function (slot0, slot1, slot2)
		if not uv0[slot1] then
			slot0:create_ref(slot1)
		end

		table.insert(uv0[slot1].change, slot2)
	end,
	add_child = function (slot0, slot1, slot2)
		if not uv0[slot1] then
			slot0:create_ref(slot1)
		end

		table.insert(uv0[slot1].childs, slot2)
	end,
	remove_event = function (slot0, slot1, slot2, slot3)
		if uv0[slot1] then
			for slot7, slot8 in pairs(uv0[slot1].events) do
				if slot7 == slot3 then
					for slot12, slot13 in ipairs(slot8) do
						if slot13[1] == slot2 then
							client.unset_event_callback(slot7, slot13[1])
							table.remove(uv0[slot1].events[slot7], slot12)

							return true
						end
					end
				end
			end
		end

		return false
	end,
	remove_change = function (slot0, slot1, slot2)
		if uv0[slot1] then
			for slot6, slot7 in ipairs(uv0[slot1].change) do
				if slot7 == slot2 then
					table.remove(uv0[slot1].change, slot6)

					return true
				end
			end
		end

		return false
	end,
	update_events = function (slot0, slot1)
		uv0(slot1)
	end,
	update_callbacks = function (slot0, slot1)
		uv0(slot1)
	end
}
slot13 = {}

function slot17(slot0)
	return slot0 and slot0 > 0 and slot0 < 64
end

slot18 = false

ui.set_callback(ui.reference("PLAYERS", "Players", "Player list"), function ()
	if ui.get(uv0) == nil then
		return
	end

	for slot3, slot4 in ipairs(uv1) do
		slot4:invoke_change()
	end
end)

function slot20(slot0)
	if uv0 or ui.get(uv1) == nil then
		return
	end

	for slot4, slot5 in ipairs(uv2) do
		if slot5.ref_to_element[slot0] ~= nil then
			if #{
				ui.get(slot0)
			} == 1 and slot8[1] ~= nil then
				slot5.states[ui.get(uv1)][slot6] = slot8[1]
			else
				slot5.states[slot7][slot6] = slot8
			end

			slot5.elements[slot6][2](slot6, slot7)
		end
	end
end

ui.set_callback(ui.reference("PLAYERS", "Players", "Reset all"), function ()
	for slot3, slot4 in ipairs(uv0) do
		for slot9 = 0, 64 do
			slot4.states[slot9] = {
				table.unpack(slot4.states[0])
			}
		end

		slot4:invoke_change()
	end
end)
ui.set_callback(ui.reference("PLAYERS", "Adjustments", "Apply to all"), function ()
	for slot3, slot4 in ipairs(uv0) do
		for slot9 = 1, 64 do
			slot4.states[slot9] = {
				table.unpack(slot4:get_entidx_states())
			}
		end
	end
end)

function slot23()
	slot0 = entity.get_player_resource()

	for slot4, slot5 in ipairs(uv0) do
		for slot9 = 1, 64 do
			if entity.get_prop(slot0, "m_bConnected", slot9) ~= 1 then
				slot5.states[slot9] = {
					table.unpack(slot5.states[0])
				}
			end
		end
	end
end

client.set_event_callback("player_spawn", slot23)
client.set_event_callback("player_team", slot23)
client.set_event_callback("player_disconnect", slot23)
client.set_event_callback("player_connect_full", slot23)
client.set_event_callback("shutdown", function ()
	uv0 = true

	for slot3, slot4 in ipairs(uv1) do
		for slot8, slot9 in ipairs(slot4.elements) do
			ui.set(slot9[1], slot4.states[0][slot8])
		end
	end

	uv0 = false
end)

function slot25(slot0)
	if uv0[slot0] == "multiselect" or uv0[slot0] == "color_picker" then
		return uv0[slot0]
	end

	return false
end

slot26 = {
	__metatable = "uilib_plist_handler",
	__index = function ()
	end,
	__newindex = function ()
	end
}

function slot27(slot0, slot1, slot2, ...)
	if not slot1 or type(slot1) ~= "function" or uv0[slot1] == nil or uv0[slot1] == "hotkey" then
		return uv1("invalid argument #1 to 'plist:add', takes ui.new_* function (excluding ui.new_hotkey)")
	end

	if not slot2 or type(slot2) ~= "string" then
		return uv1("invalid argument #2 to 'plist:add', pass the name of the element")
	end

	slot3, slot4 = pcall(slot1, "PLAYERS", "Adjustments", slot2, ...)

	if not slot3 or not slot4 then
		return uv1("invalid arguments passed to function in 'plist:add'")
	end

	slot0.elements[#slot0.elements + 1] = {
		slot4,
		function ()
		end
	}
	slot5 = #slot0.elements
	slot0.special[slot5] = uv2(slot1)
	slot0.ref_to_element[slot4] = slot5

	if #{
		ui.get(slot4)
	} == 1 and slot6[1] ~= nil then
		for slot11 = 0, 64 do
			slot0.states[slot11][slot5] = slot6[1]
		end
	else
		for slot10 = 0, 64 do
			slot0.states[slot10][slot5] = {
				table.unpack(slot6)
			}
		end
	end

	ui.set_callback(slot4, uv3)

	return slot5
end

function slot28(slot0)
	uv0 = true

	for slot5, slot6 in ipairs(slot0.states[ui.get(uv1)]) do
		if slot0.special[slot5] == "color_picker" then
			ui.set(slot0.elements[slot5][1], table.unpack(slot6))
		else
			ui.set(slot0.elements[slot5][1], slot6)
		end
	end

	uv0 = false
end

function slot29(slot0, slot1, slot2)
	if not slot2 then
		return ui.get(slot0.elements[slot1][1])
	elseif uv0(slot2) then
		if slot0.special[slot1] == "color_picker" then
			return table.unpack(slot0.states[slot2][slot1])
		else
			return slot3
		end
	else
		return uv1("invalid entidx")
	end
end

function slot30(slot0, slot1, slot2, ...)
	if #{
		...
	} == 1 then
		slot3 = slot3[1]
	end

	if not slot2 then
		ui.set(slot0.elements[slot1][1], slot3)
	elseif uv0(slot2) then
		slot0.states[slot2][slot1] = slot3
	else
		return uv1("invalid entidx")
	end
end

function slot31(slot0, slot1)
	if not slot1 then
		return slot0.states[ui.get(uv0)]
	elseif uv1(slot1) then
		return slot0.states[slot1]
	end
end

function slot32(slot0, slot1, ...)
	if uv0(slot1) then
		if #{
			...
		} > 0 and #slot2 <= #slot0.elements then
			for slot6, slot7 in ipairs(slot2) do
				if slot7 ~= nil then
					slot0.states[slot1][slot6] = slot7
				end
			end
		else
			uv1("invalid parameters")
		end
	else
		uv1("invalid entidx")
	end
end

function slot33(slot0, slot1, slot2)
	slot0.elements[slot1][2] = slot2
end

function slot34()
	for slot4 = 0, 64 do
	end

	return {
		[slot4] = {}
	}
end

function slot36(slot0, slot1)
	if slot1 == "value" or slot1 == "state" then
		return ui.get(slot0.reference)
	elseif slot1 == "visible" or slot1 == "vis" then
		return slot0.is_visible
	else
		return nil
	end
end

function slot37(slot0, slot1, ...)
	if #{
		...
	} == 1 then
		slot2 = slot2[1]
	end

	if slot1 == "value" or slot1 == "state" then
		ui.set(slot0.reference, slot2)
	elseif (slot1 == "visible" or slot1 == "vis") and type(slot2) == "boolean" then
		ui.set_visible(slot0.reference, slot2)

		slot0.is_visible = slot2
	end
end

function slot41()
end

function slot42(slot0)
	return slot0()
end

function slot43(slot0)
	return slot0.value and #slot1 > 0
end

function slot44(slot0, slot1, slot2, slot3)
	if slot1 and type(slot1) == "string" then
		slot1 = {
			slot1
		}
	end

	if not slot1 or type(slot1) ~= "table" then
		return uv0("invalid event. must be a string or table of strings")
	end

	if not slot2 or type(slot2) ~= "function" then
		return uv0("invalid callback function. must be a function")
	end

	if slot3 and type(slot3) == "function" then
		slot4, slot5 = pcall(slot3, slot0)

		if not slot4 or type(slot5) ~= "boolean" then
			return uv0("invalid argument #3. function must take uilib object as the first argument and return a boolean")
		end

		for slot9, slot10 in ipairs(slot1) do
			uv1:add_event(slot0.reference, slot10, slot2, slot3)
		end
	elseif string.find(slot0.ref_type, "checkbox") then
		for slot7, slot8 in ipairs(slot1) do
			uv1:add_event(slot0.reference, slot8, slot2, uv2)
		end
	elseif string.find(slot0.ref_type, "multiselect") then
		for slot7, slot8 in ipairs(slot1) do
			uv1:add_event(slot0.reference, slot8, slot2, uv3)
		end
	else
		return uv0("invalid argument #3. must be a function (if element does not have a template)")
	end

	return true
end

function slot45(slot0, slot1, slot2)
	if not slot1 or type(slot1) ~= "table" then
		return uv0("invalid event table. must be a key value table")
	end

	if slot2 and type(slot2) == "function" then
		slot3, slot4 = pcall(slot2, slot0)

		if not slot3 or type(slot4) ~= "boolean" then
			uv0("invalid argument #2. function must take uilib object as the first argument and return a boolean")
		end

		for slot8, slot9 in pairs(slot1) do
			if type(slot8) == "string" and type(slot9) == "function" then
				uv1:add_event(slot0.reference, slot8, slot9, slot2)
			elseif type(slot8) == "string" then
				uv0("invalid event table entry for ", slot8, ", value must be a function (", slot8, " = function() end)")
			else
				uv0("invalid event table key")
			end
		end
	elseif string.find(slot0.ref_type, "checkbox") then
		for slot6, slot7 in pairs(slot1) do
			if type(slot6) == "string" and type(slot7) == "function" then
				uv1:add_event(slot0.reference, slot6, slot7, uv2)
			elseif type(slot6) == "string" then
				uv0("invalid event table entry for ", slot6, ", value must be a function (", slot6, " = function() end)")
			else
				uv0("invalid event table key")
			end
		end
	elseif string.find(slot0.ref_type, "multiselect") then
		for slot6, slot7 in pairs(slot1) do
			if type(slot6) == "string" and type(slot7) == "function" then
				uv1:add_event(slot0.reference, slot6, slot7, uv3)
			elseif type(slot6) == "string" then
				uv0("invalid event table entry for ", slot6, ", value must be a function (", slot6, " = function() end)")
			else
				uv0("invalid event table key")
			end
		end
	else
		return uv0("invalid argument #2. must be a function (if element does not have a template)")
	end
end

function slot46(slot0, slot1, slot2)
	return uv0:remove_event(slot0.reference, slot1, slot2)
end

function slot47(slot0, slot1)
	return uv0:remove_change(slot0.reference, slot1)
end

function slot48(slot0, slot1)
	return uv0:add_change(slot0.reference, slot1)
end

function slot49(slot0)
	uv0(slot0.reference)
end

function slot50(slot0)
	uv0:update_events(slot0.reference)
end

function slot51(slot0)
	uv0:update_callbacks(slot0.reference)
end

function slot52(slot0, slot1)
	if not slot1 then
		return uv0[select(2, ui.get(slot0.reference))]
	elseif type(slot1) == "string" then
		ui.set(slot0.reference, slot1)
	end
end

function slot53(slot0, slot1)
	if not slot1 then
		return select(3, ui.get(slot0.reference))
	elseif type(slot1) == "number" then
		ui.set(slot0.reference, nil, slot1)
	end
end

function slot54(slot0, slot1)
	for slot5, slot6 in ipairs(ui.get(slot0.reference)) do
		if slot6 == slot1 then
			return true
		end
	end

	return false
end

function slot55(slot0, slot1)
	if not slot0:contains(slot1) then
		slot2 = ui.get(slot0.reference)
		slot2[#slot2 + 1] = slot1

		ui.set(slot0.reference, slot2)
	end
end

function slot56(slot0, slot1)
	if slot0:contains(slot1) then
		slot2 = {}

		for slot6, slot7 in ipairs(ui.get(slot0.reference)) do
			if slot7 ~= slot1 then
				slot2[#slot2 + 1] = slot7
			end
		end

		ui.set(slot0.reference, slot2)
	end
end

function slot57(slot0)
	ui.set(slot0.reference, {})
end

function slot58(slot0)
	return slot0.states[ui.get(slot0.reference) + 1]
end

function slot59(slot0, ...)
	slot1 = {
		...
	}

	ui.update(slot0.reference, slot1)

	slot0.states = slot1
end

function slot60(slot0, slot1)
	if ui.type(slot1.reference) == "checkbox" then
		uv0:add_child(slot1.reference, slot0.reference)

		slot1.children[#slot1.children + 1] = slot0

		rawset(slot0, "parent", slot1)
	else
		uv1("invalid parent type, only supports checkboxes")
	end
end

function slot61(slot0, slot1, slot2)
	if slot1 == "multiselect" or slot1 == "multiselect_reference" then
		slot0.contains = uv0
		slot0.add = uv1
		slot0.remove = uv2
		slot0.clear = uv3

		if slot1 == "multiselect" then
			slot0.states = slot2
			slot0.update = uv4
		end
	elseif slot1 == "listbox" then
		slot0.states = slot2
		slot0.update = uv4
		slot0.selected = uv5
	elseif slot1 == "combobox" then
		slot0.states = slot2
		slot0.update = uv4
	elseif slot1 == "hotkey" or slot1 == "hotkey_reference" then
		slot0.mode = uv6
		slot0.key = uv7
	elseif slot1 ~= "color_picker" and slot1 == "color_picker_reference" then
		-- Nothing
	end
end

slot62 = {
	__name = "uilib_object",
	__metatable = "uilib_object",
	__index = function (slot0, slot1)
		return uv0(slot0, slot1)
	end,
	__newindex = function (slot0, slot1, slot2)
		return uv0(slot0, slot1, slot2)
	end,
	__tostring = getmetatable,
	__call = function (slot0, ...)
		if #{
			...
		} > 0 then
			slot2 = uv0(slot0, "value")

			if #slot1 == 1 then
				uv1(slot0, "value", slot1[1])
			else
				uv1(slot0, "value", ...)
			end

			return slot2
		else
			return uv0(slot0, "value")
		end
	end
}

function slot63(slot0, slot1, slot2, slot3, slot4)
	slot5, slot6 = nil

	if type(slot0) == "function" then
		slot5 = (not slot4 or #slot4 <= 0 or slot0(slot1, slot2, slot3, table.unpack(slot4))) and slot0(slot1, slot2, slot3)
		slot6 = uv0[slot0]
	elseif type(slot0) == "number" and type(slot3) == "string" and type(slot4) == "string" then
		if uv1[slot0] then
			return uv1[slot0]
		else
			slot5 = slot0
			slot6 = slot4 .. "_reference"
		end
	else
		return uv2("unhandled arguments")
	end

	slot7 = ui.set_visible(slot5, true)

	ui.set_visible(slot5, slot7)

	slot8 = {
		reference = slot5,
		is_visible = slot7,
		ref_type = slot6,
		name = slot3,
		children = {},
		add_callback = uv3,
		remove_callback = uv4,
		add_event_callback = uv5,
		add_event_table = uv6,
		remove_event_callback = uv7,
		invoke = uv8,
		update_events = uv9,
		update_callbacks = uv10,
		set_parent = uv11
	}

	uv12(slot8, slot6, slot4)

	uv1[slot5] = setmetatable(slot8, uv13)

	return uv1[slot5]
end

function slot64(slot0, slot1, slot2, slot3, slot4)
	if slot4 then
		return uv0(slot0, slot1, slot2, slot3, slot4)
	else
		uv1("unimplemented method for guessing type of reference, please pass 4th arg as the reference type ('combobox', 'multiselect', 'color_picker')")
		error()
	end
end

return {
	new_button = function (slot0, slot1, slot2, ...)
		return uv0(ui.new_button, slot0, slot1, slot2, {
			function ()
			end
		})
	end,
	new_checkbox = function (slot0, slot1, slot2, ...)
		return uv0(ui.new_checkbox, slot0, slot1, slot2, {
			...
		})
	end,
	new_color_picker = function (slot0, slot1, slot2, ...)
		return uv0(ui.new_color_picker, slot0, slot1, slot2, {
			...
		})
	end,
	new_combobox = function (slot0, slot1, slot2, ...)
		return uv0(ui.new_combobox, slot0, slot1, slot2, {
			...
		})
	end,
	new_hotkey = function (slot0, slot1, slot2, ...)
		return uv0(ui.new_hotkey, slot0, slot1, slot2, {
			...
		})
	end,
	new_label = function (slot0, slot1, slot2, ...)
		return uv0(ui.new_label, slot0, slot1, slot2, {
			...
		})
	end,
	new_listbox = function (slot0, slot1, slot2, ...)
		return uv0(ui.new_listbox, slot0, slot1, slot2, {
			...
		})
	end,
	new_multiselect = function (slot0, slot1, slot2, ...)
		return uv0(ui.new_multiselect, slot0, slot1, slot2, {
			...
		})
	end,
	new_slider = function (slot0, slot1, slot2, ...)
		return uv0(ui.new_slider, slot0, slot1, slot2, {
			...
		})
	end,
	new_string = function (slot0, slot1, slot2, ...)
		return uv0(ui.new_string, slot0, slot1, slot2, {
			...
		})
	end,
	new_textbox = function (slot0, slot1, slot2, ...)
		return uv0(ui.new_textbox, slot0, slot1, slot2, {
			...
		})
	end,
	reference = function (slot0, slot1, slot2)
		if ({
			pcall(ui.reference, slot0, slot1, slot2)
		})[1] then
			table.remove(slot3, 1)

			for slot8, slot9 in ipairs(slot3) do
				-- Nothing
			end

			return table.unpack({
				[slot8] = uv0(slot9, slot0, slot1, slot2, ui.type(slot9))
			})
		else
			return uv1("invalid object")
		end
	end,
	reference_old = function (slot0, slot1, slot2, slot3)
		slot4, slot5 = pcall(ui.reference, slot0, slot1, slot2)

		if slot4 and slot5 then
			return uv0(slot5, slot0, slot1, slot2, slot3)
		else
			return uv1("invalid object")
		end
	end,
	create_from_reference = function (slot0, slot1, slot2)
		if slot0 and type(slot0) == "number" and slot1 and type(slot1) == "string" and slot2 and type(slot2) == "string" then
			return uv0(slot0, nil, , slot1, slot2)
		else
			return uv1("invalid reference")
		end
	end,
	get_ref = function (slot0)
		if uv0[slot0] then
			return uv0[slot0]
		else
			return uv1("reference is not a uilib object")
		end
	end,
	create_plist = function ()
		uv8[#uv8 + 1] = setmetatable({
			elements = {},
			special = {},
			ref_to_element = {},
			states = uv0(),
			add = uv1,
			invoke_change = uv2,
			get_state = uv3,
			set_state = uv4,
			get_entidx_states = uv5,
			set_entidx_states = uv6,
			set_callback = uv7
		}, uv9)

		return uv8[#uv8]
	end
}
