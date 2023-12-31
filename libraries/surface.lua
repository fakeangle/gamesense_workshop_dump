slot0 = {
	create_font = function (slot0, slot1, slot2, slot3)
		slot4 = 0

		if type(slot3) == "number" then
			slot4 = slot3
		elseif slot5 == "table" then
			for slot9 = 1, #slot3 do
				slot4 = slot4 + slot3[slot9]
			end
		else
			error("invalid flags type, has to be number or table")
		end

		if uv0[string.format("%s %d %d %d", slot0, slot1, slot2, slot4)] == nil then
			uv0[slot6] = uv1()

			uv2(uv0[slot6], slot0, slot1, slot2, 0, 0, uv3(slot4), 0, 0)
		end

		return uv0[slot6]
	end,
	localize_string = function (slot0, slot1)
		uv2(uv0(slot0), uv1(slot1 or 1024), slot1 or 1024)

		return slot3 and uv3(slot3) or nil
	end,
	draw_text = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
		uv0(slot0, slot1)
		uv1(slot6)
		uv2(slot2, slot3, slot4, slot5)

		return uv3(slot7, false)
	end,
	draw_localized_text = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
		uv0(slot0, slot1)
		uv1(slot6)
		uv2(slot2, slot3, slot4, slot5)

		return uv4(uv3(slot7), true)
	end,
	draw_line = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
		uv0(slot4, slot5, slot6, slot7)

		return uv1(slot0, slot1, slot2, slot3)
	end,
	draw_filled_rect = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
		uv0(slot4, slot5, slot6, slot7)

		return uv1(slot0, slot1, slot0 + slot2, slot1 + slot3)
	end,
	draw_outlined_rect = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
		uv0(slot4, slot5, slot6, slot7)

		return uv1(slot0, slot1, slot0 + slot2, slot1 + slot3)
	end,
	draw_filled_outlined_rect = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11)
		uv0(slot4, slot5, slot6, slot7)
		uv1(slot0, slot1, slot0 + slot2, slot1 + slot3)
		uv0(slot8, slot9, slot10, slot11)

		return uv2(slot0, slot1, slot0 + slot2, slot1 + slot3)
	end,
	draw_filled_gradient_rect = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12)
		uv0(slot4, slot5, slot6, slot7)
		uv1(slot0, slot1, slot0 + slot2, slot1 + slot3, 255, 255, slot12)
		uv0(slot8, slot9, slot10, slot11)

		return uv1(slot0, slot1, slot0 + slot2, slot1 + slot3, 0, 255, slot12)
	end,
	draw_outlined_circle = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
		uv0(slot2, slot3, slot4, slot5)

		return uv1(slot0, slot1, slot6, slot7)
	end,
	draw_poly_line = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		uv0(slot2, slot3, slot4, slot5)

		return uv1(uv2(slot0), uv2(slot1), slot6)
	end,
	test_font = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		slot7, slot8 = uv0(slot6, "a b c d e f g h i j k l m n o p q r s t u v w x y z")

		uv1.draw_text(slot0, slot1, slot2, slot3, slot4, slot5, slot6, "a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9 ß + # ä ö ü , . -")
		uv1.draw_text(slot0, slot1 + slot8, slot2, slot3, slot4, slot5, slot6, "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z = ! \" § $ % & / ( ) = ? { [ ] } \\ * ' _ : ; ~ ")
	end,
	get_text_size = function (slot0, slot1)
		return uv0(slot0, slot1)
	end,
	set_mouse_pos = function (slot0, slot1)
		return uv0(slot0, slot1)
	end,
	get_mouse_pos = function ()
		slot0 = uv0()
		slot1 = uv0()

		uv1(slot0, slot1)

		return tonumber(slot0[0]), tonumber(slot1[0])
	end,
	unlock_cursor = function ()
		return uv0()
	end,
	lock_cursor = function ()
		return uv0()
	end,
	load_texture = function (slot0)
		slot1 = uv0(false)

		uv1(slot1, slot0, true, true)

		slot2 = uv2()
		slot3 = uv2()

		uv3(slot1, slot2, slot3)

		return slot1, tonumber(slot2[0]), tonumber(slot3[0])
	end
}
slot1 = require("ffi")
slot3 = require("bit").bor
slot4 = slot1.string
slot5 = slot1.cast

function slot6(slot0, slot1, slot2)
	return uv0.cast(slot2, uv0.cast("void***", slot0)[0][slot1])
end

function slot7(slot0, slot1, slot2, slot3)
	slot4 = client.create_interface(slot0, slot1) or error("invalid interface")
	slot5, slot6 = pcall(uv0.typeof, slot3)

	if not slot5 then
		error(slot6, 2)
	end

	slot7 = uv1(slot4, slot2, slot6) or error("invalid vtable")

	return function (...)
		return uv0(uv1, ...)
	end
end

function slot8(slot0, slot1)
	slot2 = uv0.typeof(slot1)

	return function (slot0, ...)
		assert(slot0 ~= nil)

		if slot0 then
			return uv0(slot0, uv1, uv2)(slot0, ...)
		end
	end
end

slot9 = slot1.typeof("char[?]")
slot10 = slot1.typeof("int[1]")
slot11 = slot1.typeof("wchar_t[?]")
slot12 = slot7("localize.dll", "Localize_001", 15, "int(__thiscall*)(void*, const char*, wchar_t*, int)")
slot13 = slot7("localize.dll", "Localize_001", 16, "int(__thiscall*)(void*, wchar_t*, char*, int)")
slot14 = slot7("localize.dll", "Localize_001", 12, "wchar_t*(__thiscall*)(void*, const char*)")
slot15 = slot7("vguimatsurface.dll", "VGUI_Surface031", 15, "void(__thiscall*)(void*, int, int, int, int)")
slot16 = slot7("vguimatsurface.dll", "VGUI_Surface031", 16, "void(__thiscall*)(void*, int, int, int, int)")
slot17 = slot7("vguimatsurface.dll", "VGUI_Surface031", 18, "void(__thiscall*)(void*, int, int, int, int)")
slot18 = slot7("vguimatsurface.dll", "VGUI_Surface031", 19, "void(__thiscall*)(void*, int, int, int, int)")
slot19 = slot7("vguimatsurface.dll", "VGUI_Surface031", 20, "void(__thiscall*)(void*, int*, int*, int)")
slot20 = slot7("vguimatsurface.dll", "VGUI_Surface031", 23, "void(__thiscall*)(void*, unsigned long)")
slot21 = slot7("vguimatsurface.dll", "VGUI_Surface031", 25, "void(__thiscall*)(void*, int, int, int, int)")
slot22 = slot7("vguimatsurface.dll", "VGUI_Surface031", 26, "void(__thiscall*)(void*, int, int)")
slot23 = slot7("vguimatsurface.dll", "VGUI_Surface031", 28, "void(__thiscall*)(void*, const wchar_t*, int, int)")
slot24 = slot7("vguimatsurface.dll", "VGUI_Surface031", 34, "int(__thiscall*)(void*, const char*)")
slot25 = slot7("vguimatsurface.dll", "VGUI_Surface031", 35, "bool(__thiscall*)(void*, int, char*, int)")
slot26 = slot7("vguimatsurface.dll", "VGUI_Surface031", 36, "void(__thiscall*)(void*, int, const char*, int, bool)")
slot27 = slot7("vguimatsurface.dll", "VGUI_Surface031", 37, "void(__thiscall*)(void*, int, const wchar_t*, int, int)")
slot28 = slot7("vguimatsurface.dll", "VGUI_Surface031", 38, "void(__thiscall*)(void*, int)")
slot29 = slot7("vguimatsurface.dll", "VGUI_Surface031", 39, "void(__thiscall*)(void*, int)")
slot30 = slot7("vguimatsurface.dll", "VGUI_Surface031", 40, "void(__thiscall*)(void*, int, int&, int&)")
slot31 = slot7("vguimatsurface.dll", "VGUI_Surface031", 41, "void(__thiscall*)(void*, int, int, int, int)")
slot32 = slot7("vguimatsurface.dll", "VGUI_Surface031", 42, "bool(__thiscall*)(void*, int)")
slot33 = slot7("vguimatsurface.dll", "VGUI_Surface031", 43, "int(__thiscall*)(void*, bool)")
slot34 = slot7("vguimatsurface.dll", "VGUI_Surface031", 66, "void(__thiscall*)(void*)")
slot35 = slot7("vguimatsurface.dll", "VGUI_Surface031", 67, "void(__thiscall*)(void*)")
slot36 = slot7("vguimatsurface.dll", "VGUI_Surface031", 71, "unsigned int(__thiscall*)(void*)")
slot37 = slot7("vguimatsurface.dll", "VGUI_Surface031", 72, "void(__thiscall*)(void*, unsigned long, const char*, int, int, int, int, unsigned long, int, int)")
slot38 = slot7("vguimatsurface.dll", "VGUI_Surface031", 79, "void(__thiscall*)(void*, unsigned long, const wchar_t*, int&, int&)")
slot39 = slot7("vguimatsurface.dll", "VGUI_Surface031", 100, "unsigned int(__thiscall*)(void*, int*, int*)")
slot40 = slot7("vguimatsurface.dll", "VGUI_Surface031", 101, "unsigned int(__thiscall*)(void*, int, int)")
slot41 = slot7("vguimatsurface.dll", "VGUI_Surface031", 103, "void(__thiscall*)(void*, int, int, int, int)")
slot42 = slot7("vguimatsurface.dll", "VGUI_Surface031", 123, "void(__thiscall*)(void*, int, int, int, int, unsigned int, unsigned int, bool)")

function slot43(slot0, slot1)
	if slot1 then
		slot2 = 1024
		slot3 = uv0(slot2)

		uv1(slot0, slot3, slot2)

		return uv3(slot0, uv2(slot3):len(), 0)
	else
		slot2 = 1024
		slot3 = uv4(slot2)

		uv5(slot0, slot3, slot2)

		return uv3(slot3, slot0:len(), 0)
	end
end

function slot44(slot0, slot1)
	slot2 = uv0(1024)
	slot3 = uv1()
	slot4 = uv1()

	uv2(slot1, slot2, 1024)
	uv3(slot0, slot2, slot3, slot4)

	return tonumber(slot3[0]), tonumber(slot4[0])
end

slot45 = {}

setmetatable(slot0, {
	__index = renderer
})

return slot0
