slot0 = {
	format = function (slot0, slot1, slot2, slot3)
		slot6 = slot2 or "\t"
		slot6 = uv0
		slot7 = slot3 or " "
		slot1 = uv0(slot1 or "\n")
		slot4 = 1
		slot5 = 0
		slot6 = 0
		slot11 = uv2(slot6(slot7), -1) == "\n"

		for slot15 = 1, uv1(uv0(slot0)) do
			slot16 = uv2(slot0, slot15, slot15)

			if not nil and (slot16 == "{" or slot16 == "[") then
				slot5 = slot5 + 1
			elseif not slot10 and (slot16 == "}" or slot16 == "]") then
				if slot9 == "{" or slot9 == "[" then
					slot8[slot4 - 1] = uv3(slot2, slot5 - 1) .. slot9 .. slot16
				else
					slot8[slot4] = slot1 .. uv3(slot2, slot5) .. slot16
				end
			elseif not slot10 and slot16 == "," then
				slot8[slot4] = slot16 .. slot1
				slot6 = -1
			elseif not slot10 and slot16 == ":" then
				slot8[slot4] = slot16 .. slot3

				if slot11 then
					slot8[slot4 + 1] = uv3(slot2, slot5)
				end
			else
				if slot16 == "\"" and slot9 ~= "\\" then
					slot10 = not slot10 and true or nil
				end

				if slot5 ~= slot6 then
					slot8[slot4] = uv3(slot2, slot5)
					slot6 = slot5
					slot4 = slot4 + 1
				end

				slot8[slot4] = slot16
			end

			slot4 = slot4 + 1
			slot9 = slot16
		end

		return uv4({
			[slot4] = nil == ":" and slot16 .. slot1 or uv3(uv0(slot6), slot5) .. slot16 .. slot1
		})
	end
}
slot1 = client.color_log
slot2 = unpack
slot3 = tostring
slot4 = table.concat
slot5 = table.insert
slot6 = table.remove
slot7 = string.sub
slot8 = string.rep
slot9 = string.len
slot10 = {
	221,
	221,
	221
}
slot11 = {
	180,
	230,
	30
}
slot12 = {
	96,
	160,
	220
}
slot13 = {
	218,
	230,
	30
}
slot14 = slot0.format

function slot0.highlight(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot1 or uv0
	slot2 = slot2 or uv3
	slot4 = slot4 or uv2
	slot3 = slot3 or uv1
	slot5 = 1
	slot7 = {}
	slot10 = slot5

	for slot15 = 1, uv5(uv4(slot0)) do
		slot16 = uv6(slot0, slot15, slot15)
		slot17 = nil

		if not nil and (slot16 == "{" or slot16 == "[") then
			slot17 = slot1

			uv7({}, slot16)
		elseif not slot9 and (slot16 == "}" or slot16 == "]") then
			slot17 = slot1

			if slot8 == "{" or slot8 == "[" then
				uv7(slot11, uv8(slot8, slot16))
			else
				uv7(slot11, slot16)
			end
		elseif not slot9 and (slot16 == "," or slot16 == ":") then
			slot17 = slot1

			uv7(slot11, slot16)
		else
			if slot16 == "\"" and slot8 ~= "\\" then
				slot9 = not slot9 and true or nil
				slot17 = slot2
			elseif slot10 == slot2 then
				slot17 = slot9 and slot3 or slot4
			elseif slot10 == slot1 and slot16 ~= " " and slot16 ~= "\n" and slot16 ~= "\t" then
				slot17 = slot9 and slot3 or slot4
			end

			uv7(slot11, slot16)
		end

		if slot17 ~= nil and slot17 ~= slot10 then
			uv7(slot7, {
				slot10[1],
				slot10[2],
				slot10[3],
				uv8(slot11)
			})

			slot11 = {
				uv9(slot11, #slot11)
			}
			slot10 = slot17
		end

		slot8 = slot16
	end

	if #slot11 > 0 then
		uv7(slot7, {
			slot10[1],
			slot10[2],
			slot10[3],
			uv8(slot11)
		})
	end

	return slot7
end

slot15 = slot0.highlight

function slot0.print_highlighted(slot0, slot1, slot2, slot3, slot4)
	slot10 = slot2

	for slot10 = 1, #uv0(slot0, slot1, slot3, slot4, slot10) do
		slot16, slot17, slot18, slot19 = uv1(slot5[slot10])

		uv2(slot16, slot17, slot18, slot19, slot10 == slot6 and "" or " ")
	end

	return slot5
end

function slot0.stringify(slot0, slot1, slot2, slot3)
	slot4, slot5 = pcall(json.stringify, slot0)

	if not slot4 then
		error(slot5, 2)

		return
	end

	return uv0(slot5, slot1, slot2, slot3)
end

return slot0
