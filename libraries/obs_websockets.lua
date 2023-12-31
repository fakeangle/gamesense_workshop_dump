slot0 = require("gamesense/websockets")
slot1 = require("gamesense/base64")
slot2 = false

function slot4(slot0, slot1, slot2)
	slot0:call("GetAuthRequired", function (slot0)
		if not slot0.status or slot0.status ~= "ok" then
			return error("wtf happened")
		end

		if slot0.authRequired then
			uv2:call("Authenticate", {
				auth = uv1.encode(hex2bin(sha256(uv1.encode(hex2bin(sha256(uv0 .. slot0.salt))) .. slot0.challenge)))
			}, function (slot0)
				if slot0.status == "ok" then
					uv0(true)
				else
					uv0(false, slot0.error)
				end
			end)
		else
			uv3(true)
		end
	end)
end

function slot5(slot0)
	return setmetatable({}, {
		__index = function (slot0, slot1)
			slot2 = uv0(slot1)
			uv1[slot1] = slot2

			return slot2
		end
	})
end

function slot6(slot0, slot1)
	return function (slot0, slot1)
		slot2 = 0
		slot3 = 1

		while slot0 ~= 0 and slot1 ~= 0 do
			slot4 = slot0 % uv0
			slot5 = slot1 % uv0
			slot2 = slot2 + uv1[slot4][slot5] * slot3
			slot0 = (slot0 - slot4) / uv0
			slot1 = (slot1 - slot5) / uv0
			slot3 = slot3 * uv0
		end

		return slot2 + (slot0 + slot1) * slot3
	end
end

slot8 = function (slot0)
	slot1 = uv0(slot0, 2)

	return uv0(uv1(function (slot0)
		return uv0(function (slot0)
			return uv0(uv1, slot0)
		end)
	end), 2^(slot0.n or 1))
end({
	[0] = {
		[0] = 0,
		1
	},
	{
		[0] = 1,
		0
	},
	n = 4
})
slot9 = {
	1116352408,
	1899447441,
	3049323471.0,
	3921009573.0,
	961987163,
	1508970993,
	2453635748.0,
	2870763221.0,
	3624381080.0,
	310598401,
	607225278,
	1426881987,
	1925078388,
	2162078206.0,
	2614888103.0,
	3248222580.0,
	3835390401.0,
	4022224774.0,
	264347078,
	604807628,
	770255983,
	1249150122,
	1555081692,
	1996064986,
	2554220882.0,
	2821834349.0,
	2952996808.0,
	3210313671.0,
	3336571891.0,
	3584528711.0,
	113926993,
	338241895,
	666307205,
	773529912,
	1294757372,
	1396182291,
	1695183700,
	1986661051,
	2177026350.0,
	2456956037.0,
	2730485921.0,
	2820302411.0,
	3259730800.0,
	3345764771.0,
	3516065817.0,
	3600352804.0,
	4094571909.0,
	275423344,
	430227734,
	506948616,
	659060556,
	883997877,
	958139571,
	1322822218,
	1537002063,
	1747873779,
	1955562222,
	2024104815,
	2227730452.0,
	2361852424.0,
	2428436474.0,
	2756734187.0,
	3204031479.0,
	3329325298.0
}

function slot10(slot0)
	return string.gsub(slot0, ".", function (slot0)
		return string.format("%02x", string.byte(slot0))
	end)
end

function hex2bin(slot0)
	return string.gsub(slot0, "%x%x", function (slot0)
		return string.char(tonumber(slot0, 16))
	end)
end

function slot11(slot0, slot1)
	for slot6 = 1, slot1 do
		slot7 = slot0 % 256
		slot2 = string.char(slot7) .. ""
		slot0 = (slot0 - slot7) / 256
	end

	return slot2
end

function slot12(slot0, slot1)
	for slot6 = slot1, slot1 + 3 do
		slot2 = 0 * 256 + string.byte(slot0, slot6)
	end

	return slot2
end

function slot13(slot0, slot1)
	assert(#(slot0 .. "\\x80" .. string.rep(" ", 64 - (slot1 + 9) % 64) .. uv0(8 * slot1, 8)) % 64 == 0)

	return slot0
end

function slot14(slot0)
	slot0[1] = 1779033703
	slot0[2] = 3144134277.0
	slot0[3] = 1013904242
	slot0[4] = 2773480762.0
	slot0[5] = 1359893119
	slot0[6] = 2600822924.0
	slot0[7] = 528734635
	slot0[8] = 1541459225

	return slot0
end

function slot15(slot0, slot1, slot2)
	slot3 = {
		[slot7] = uv0(slot0, slot1 + (slot7 - 1) * 4)
	}

	for slot7 = 1, 16 do
	end

	for slot7 = 17, 64 do
		slot8 = slot3[slot7 - 15]
		slot8 = slot3[slot7 - 2]
		slot3[slot7] = slot3[slot7 - 16] + bit.bxor(bit.ror(slot8, 7), bit.ror(slot8, 18), bit.rshift(slot8, 3)) + slot3[slot7 - 7] + bit.bxor(bit.ror(slot8, 17), bit.ror(slot8, 19), bit.rshift(slot8, 10))
	end

	slot4 = slot2[1]
	slot5 = slot2[2]
	slot6 = slot2[3]
	slot7 = slot2[4]
	slot8 = slot2[5]

	for slot15 = 1, 64 do
		slot21 = slot2[8] + bit.bxor(bit.ror(slot8, 6), bit.ror(slot8, 11), bit.ror(slot8, 25)) + bit.bxor(bit.band(slot8, slot2[6]), bit.band(bit.bnot(slot8), slot2[7])) + uv1[slot15] + slot3[slot15]
		slot11 = slot21 + bit.bxor(bit.ror(slot4, 2), bit.ror(slot4, 13), bit.ror(slot4, 22)) + bit.bxor(bit.band(slot4, slot5), bit.band(slot4, slot6), bit.band(slot5, slot6)) + slot21
	end

	slot2[1] = bit.band(slot2[1] + slot4)
	slot2[2] = bit.band(slot2[2] + slot5)
	slot2[3] = bit.band(slot2[3] + slot6)
	slot2[4] = bit.band(slot2[4] + slot7)
	slot2[5] = bit.band(slot2[5] + slot8)
	slot2[6] = bit.band(slot2[6] + slot9)
	slot2[7] = bit.band(slot2[7] + slot10)
	slot2[8] = bit.band(slot2[8] + slot11)
end

function sha256(slot0)
	slot1 = uv1({})

	for slot5 = 1, #uv0(slot0, #slot0), 64 do
		uv2(slot0, slot5, slot1)
	end

	return uv3(uv4(slot1[1], 4) .. uv4(slot1[2], 4) .. uv4(slot1[3], 4) .. uv4(slot1[4], 4) .. uv4(slot1[5], 4) .. uv4(slot1[6], 4) .. uv4(slot1[7], 4) .. uv4(slot1[8], 4))
end

return {
	connect = function (slot0, slot1, slot2)
		slot3 = type(slot1) == "function" and "" or slot1
		slot4 = type(slot2) == "nil" and slot1 or slot2

		uv2.connect(slot0, {
			open = function (slot0)
				if uv0 then
					print("[WS] connection to ", slot0.url, " opened!")
				end

				uv1.ws = slot0

				uv2(uv1, uv3, function (slot0, slot1)
					uv0(slot0, slot1)
				end)
			end,
			message = function (slot0, slot1)
				if uv0 then
					print("[WS] Got message: ", slot1)
				end

				slot2, slot3 = pcall(json.parse, slot1)

				if slot2 and slot3 then
					if slot3["message-id"] then
						slot7 = uv1.waiting[tonumber(slot4:sub(6))]

						if slot4:sub(1, 4) == "call" and type(slot7) == "function" then
							slot7(slot3)

							uv1.waiting[slot6] = nil
						end
					end

					if slot3["update-type"] and uv1.registeredEvents[slot5] and #uv1.registeredEvents[slot5] > 0 then
						for slot9, slot10 in ipairs(uv1.registeredEvents[slot5]) do
							slot10(slot3)
						end
					end
				end
			end,
			close = function (slot0, slot1, slot2, slot3)
				if uv0 then
					print("[WS] Connection closed: code=", slot1, " reason=", slot2, " was_clean=", slot3)
				end

				uv1.ws = nil
			end,
			error = function (slot0, slot1)
				if uv0 then
					print("[WS] Error: ", slot1)
				end

				uv1.ws = nil
			end
		})

		function slot7(slot0, slot1, slot2)
			slot4 = type(slot1) == "table" and slot1 or {}
			slot5 = {}
			slot6 = "emit"
			slot7 = math.floor(uv0.messageIndex .. globals.realtime() * 1000)

			if type(type(slot1) == "function" and slot1 or slot2) == "function" then
				slot6 = "call"
				uv0.waiting[slot7] = slot3
			end

			slot5["message-id"] = slot6 .. "_" .. slot7
			slot5["request-type"] = slot0

			for slot11, slot12 in pairs(slot4) do
				slot5[slot11] = slot12
			end

			if uv1 then
				print("[WS] Sending message: ", json.stringify(slot5))
			end

			uv0.ws:send(json.stringify(slot5))

			uv0.messageIndex = uv0.messageIndex + 1
		end

		return {
			messageIndex = 1,
			waiting = {},
			registeredEvents = {},
			call = function (slot0, slot1, slot2, slot3)
				uv0(slot1, slot2, slot3)
			end,
			emit = function (slot0, slot1, slot2)
				uv0(slot1, slot2)
			end,
			registerEvent = function (slot0, slot1, slot2)
				uv0.registeredEvents[slot1] = uv0.registeredEvents[slot1] or {}

				table.insert(uv0.registeredEvents[slot1], slot2)
			end,
			unregisterEvent = function (slot0, slot1, slot2)
				if registeredEvents[slot1] then
					for slot6, slot7 in pairs(registeredEvents[slot1]) do
						if slot7 == slot2 then
							table.remove(slot6)
							uv0:unregisterEvent(slot1, slot2)

							break
						end
					end
				end
			end,
			close = function (slot0)
				wsconn:close()
			end
		}
	end
}
