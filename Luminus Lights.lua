slot0 = bit.bor
slot2 = client.set_event_callback
slot3 = client.visible
slot4 = entity.get_local_player
slot5 = entity.get_origin
slot6 = entity.get_prop
slot7 = entity.is_alive
slot8 = entity.set_prop
slot9 = globals.curtime
slot10 = globals.frametime
slot11 = globals.tickinterval
slot12 = math.max
slot13 = math.min
slot15 = renderer.measure_text
slot16 = renderer.text
slot17 = renderer.texture
slot18 = renderer.world_to_screen
slot19 = table.sort
slot20 = ui.get
slot21 = ui.new_checkbox
slot22 = ui.new_color_picker
slot24 = ui.new_slider
slot26 = ui.set_visible
slot28 = pairs
slot29 = unpack
slot31 = require("ffi")
slot32 = require("vector")

slot31.cdef([[
    typedef struct { 
        float x; 
        float y; 
        float z;
    } nml_vec3_t;

    struct nml_ColorRGBExp32 {
        unsigned char r, g, b;
        signed char exponent;
    };
    
    struct nml_dlight_t {
        int flags;
        nml_vec3_t origin;
        float radius;
        struct nml_ColorRGBExp32 color;
        float die;
        float decay;
        float minlight;
        int key;
        int style;
        nml_vec3_t direction;
        float innerAngle;
        float outerAngle;
    };

    struct nml_dworldlight_t
    {
        nml_vec3_t origin;
        nml_vec3_t intensity;
        nml_vec3_t normal;
        nml_vec3_t shadow_cast_offset;
        int cluster;
        int type;
        int style;
        float stopdot;
        float stopdot2;
        float exponent;
        float radius;
        float constant_attn;
        float linear_attn;
        float quadratic_attn;
        int flags;
        int texinfo;
        int owner;
    };

    struct nml_worldbrushdata_t
    {
        char pad_0000[168]; //0x0000
        int32_t numworldlights; //0x00A8
        struct nml_dworldlight_t* worldlights; //0x00AC
        char pad_00B0[11888]; //0x00B0
    };
]])

slot33 = slot31.new("nml_vec3_t")
slot34 = {}
slot35 = {}
slot36 = vtable_bind("engine.dll", "VEngineEffects001", 4, "struct nml_dlight_t*(__thiscall*)(void*, int)")
slot38 = slot31.cast("int", client.find_signature("engine.dll", "\\xa1\\xcc\\xcc\\xcc\\xcc\\x84\\xcc\\xcc\\xcc\\xcc3")) + 1
slot39 = nil

function slot40(slot0)
	slot1 = uv0(slot0.index)
	uv1.z = slot0.origin.z
	uv1.y = slot0.origin.y
	uv1.x = slot0.origin.x
	slot1.key = slot0.index
	slot1.color.r = slot0.color[1]
	slot1.color.g = slot0.color[2]
	slot1.color.b = slot0.color[3]
	slot1.color.exponent = slot0.color[4] / 8.5
	slot1.flags = slot0.flags
	slot1.style = slot0.style
	slot1.direction = uv1
	slot1.origin = uv1
	slot1.radius = slot0.radius
	slot1.decay = slot0.radius / 5
	slot1.die = slot0.time
end

slot41 = slot21("VISUALS", "Effects", "Luminus lights")
slot42 = slot22("VISUALS", "Effects", "\n Lights Color", 39, 39, 39, 41)
slot43 = slot24("VISUALS", "Effects", "Light radius", 0, 800, 95, true, "ft")
slot44 = slot24("VISUALS", "Effects", "Minimal distance to lights", 85, 850, 450)
slot45 = slot24("VISUALS", "Effects", "Light style", 1, 11, 1)
slot46 = ui.new_hotkey("VISUALS", "Effects", "Flashlight")
slot47 = slot21("VISUALS", "Other ESP", "Visualize lights")
slot48 = slot22("VISUALS", "Other ESP", "\n visualize_lights_color", 255, 255, 255, 220)
slot49 = "m_fEffects"
slot50 = {
	[0] = "| Surface",
	"| Point",
	"| Spotlight",
	"| Skylight",
	"| Quakelight",
	"| Skyambient"
}
slot51 = renderer.load_rgba([[
                                            \xff\xff\xff\xff\xff\xffW\xff\xff\xff\xb1\xff\xff\xff\xd6\xff\xff\xff\xee\xff\xff\xff\xf4\xff\xff\xff\xd3\xff\xff\xff\xae\xff\xff\xffa\xff\xff\xff                                                                                \xff\xff\xff\xff\xff\xff\x86\xff\xff\xff\xef\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xf1\xff\xff\xff\xeb\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xf6\xff\xff\xff\x85\xff\xff\xff                                                                    \xff\xff\xff"\xff\xff\xff\xca\xff\xff\xff\xff\xff\xff\xff\xf2\xff\xff\xff\xa0\xff\xff\xffC\xff\xff\xff
        \xff\xff\xff\xff\xff\xffG\xff\xff\xff\xc3\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xd5\xff\xff\xff(                                                            \xff\xff\xff+\xff\xff\xff\xf0\xff\xff\xff\xff\xff\xff\xff\xba\xff\xff\xff            \xff\xff\xff\xff\xff\xff%\xff\xff\xff        \xff\xff\xffD\xff\xff\xff\xc4\xff\xff\xff\xff\xff\xff\xff\xe7\xff\xff\xff(                                                    \xff\xff\xff\xff\xff\xff\xd8\xff\xff\xff\xff\xff\xff\xff\x88\xff\xff\xff                \xff\xff\xff\xd0\xff\xff\xff\xff\xff\xff\xff\xf0\xff\xff\xff\xbc\xff\xff\xffD        \xff\xff\xff\xab\xff\xff\xff\xff\xff\xff\xff\xe4\xff\xff\xff                        \xff\xff\xff|\xff\xff\xff\xe2\xff\xff\xff2            \xff\xff\xff\xa6\xff\xff\xff\xff\xff\xff\xff\xae                        \xff\xff\xffW\xff\xff\xff\xb9\xff\xff\xff\xec\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x99\xff\xff\xff\xff\xff\xff\xff\xff\xff\xd4\xff\xff\xff\xff\xff\xff\xff\x9b            \xff\xff\xff2\xff\xff\xff\xe2\xff\xff\xff|\xff\xff\xffh\xff\xff\xff\xff\xff\xff\xff\xee\xff\xff\xff$    \xff\xff\xff$\xff\xff\xff\xff\xff\xff\xff\xe1\xff\xff\xff                                    \xff\xff\xffH\xff\xff\xff\xe4\xff\xff\xff\xff\xff\xff\xff\xaf    \xff\xff\xff%\xff\xff\xff\xf0\xff\xff\xff\xfe\xff\xff\xff.    \xff\xff\xff$\xff\xff\xff\xee\xff\xff\xff\xff\xff\xff\xffh    \xff\xff\xff~\xff\xff\xff\xfd\xff\xff\xffP    \xff\xff\xff\x83\xff\xff\xff\xff\xff\xff\xffz                                            \xff\xff\xff\xff\xff\xff\xd8\xff\xff\xff\xff\xff\xff\xffX    \xff\xff\xff}\xff\xff\xff\xff\xff\xff\xff\x8c    \xff\xff\xffP\xff\xff\xff\xfd\xff\xff\xff~            \xff\xff\xff        \xff\xff\xff\xe0\xff\xff\xff\xfd\xff\xff\xff                                                \xff\xff\xff6\xff\xff\xff\xfc\xff\xff\xff\xe8\xff\xff\xff\xff\xff\xffA\xff\xff\xff\xff\xff\xff\xff\xe3        \xff\xff\xff                        \xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xd1                                                        \xff\xff\xff\xb9\xff\xff\xff\xff\xff\xff\xff$\xff\xff\xff
\xff\xff\xff\xfb\xff\xff\xff\xff\xff\xff\xff                                \xff\xff\xff(\xff\xff\xff\xff\xff\xff\xff\xb7                                                        \xff\xff\xff\x86\xff\xff\xff\xff\xff\xff\xffX    \xff\xff\xff\xcb\xff\xff\xff\xff\xff\xff\xff*                \xff\xff\xff~\xff\xff\xff\xc0\xff\xff\xff\xbe\xff\xff\xffP\xff\xff\xff8\xff\xff\xff\xff\xff\xff\xff\xa8                                                        \xff\xff\xffA\xff\xff\xff\xff\xff\xff\xff]    \xff\xff\xff\xae\xff\xff\xff\xff\xff\xff\xff2\xff\xff\xffP\xff\xff\xff\xbe\xff\xff\xff\xc0\xff\xff\xff~\xff\xff\xff\xd3\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x93\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xc6                                                            \xff\xff\xff        \xff\xff\xff\xd9\xff\xff\xff\xfc\xff\xff\xff	\xff\xff\xff\x93\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xd3\xff\xff\xff\xff\xff\xff \xff\xff\xff        \xff\xff\xff\xf5\xff\xff\xff\xed\xff\xff\xff                                                                \xff\xff\xff
\xff\xff\xff\xfd\xff\xff\xff\xd7        \xff\xff\xff\xff\xff\xff \xff\xff\xff                    \xff\xff\xff\xb7\xff\xff\xff\xff\xff\xff\xffF                                                                \xff\xff\xffB\xff\xff\xff\xff\xff\xff\xff\xa9                                        \xff\xff\xffU\xff\xff\xff\xff\xff\xff\xff\xad                                                            \xff\xff\xff\xff\xff\xff\xca\xff\xff\xff\xff\xff\xff\xffZ                        \xff\xff\xff0\xff\xff\xff\xac\xff\xff\xff'    \xff\xff\xff\xff\xff\xff\xe3\xff\xff\xff\xff\xff\xff\xffP                                                        \xff\xff\xffe\xff\xff\xff\xff\xff\xff\xff\xc2        \xff\xff\xff'\xff\xff\xff\xac\xff\xff\xff0    \xff\xff\xff/\xff\xff\xff\xee\xff\xff\xff\xff\xff\xff\xffM        \xff\xff\xffC\xff\xff\xff\xfe\xff\xff\xff\xec\xff\xff\xff                                                \xff\xff\xff\xff\xff\xff\xec\xff\xff\xff\xfb\xff\xff\xff-        \xff\xff\xffM\xff\xff\xff\xff\xff\xff\xff\xee\xff\xff\xff/\xff\xff\xff\x9c\xff\xff\xff\xff\xff\xff\xff\x80                \xff\xff\xff\x90\xff\xff\xff\xff\xff\xff\xff\xaa                                                \xff\xff\xff\xa7\xff\xff\xff\xff\xff\xff\xff\x8f                \xff\xff\xff\x80\xff\xff\xff\xff\xff\xff\xff\x9c\xff\xff\xff\xff\xff\xffB                    \xff\xff\xff\xff\xff\xff\xe2\xff\xff\xff\xff\xff\xff\xffN                                        \xff\xff\xffM\xff\xff\xff\xff\xff\xff\xff\xe5\xff\xff\xff                    \xff\xff\xffB\xff\xff\xff                                \xff\xff\xffQ\xff\xff\xff\xff\xff\xff\xff\xb4                                        \xff\xff\xff\xb4\xff\xff\xff\xff\xff\xff\xffU                                                                    \xff\xff\xff\xee\xff\xff\xff\xf3\xff\xff\xff                                \xff\xff\xff\xff\xff\xff\xf3\xff\xff\xff\xf2\xff\xff\xff                                                                    \xff\xff\xff\xbf\xff\xff\xff\xff\xff\xff\xff\x89\xff\xff\xffp\xff\xff\xffp\xff\xff\xffp\xff\xff\xffp\xff\xff\xffp\xff\xff\xffp\xff\xff\xffp\xff\xff\xffp\xff\xff\xff\x89\xff\xff\xff\xff\xff\xff\xff\xc1                                                                        \xff\xff\xff\x95\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x96                                                                        \xff\xff\xff\x90\xff\xff\xff\xff\xff\xff\xff\x9d\xff\xff\xffp\xff\xff\xffp\xff\xff\xffp\xff\xff\xffp\xff\xff\xffp\xff\xff\xffp\xff\xff\xffp\xff\xff\xffp\xff\xff\xff\x9d\xff\xff\xff\xff\xff\xff\xff\x90                                                                        \xff\xff\xff\xff\xff\xff\xff\xff\xff\xffe                                \xff\xff\xffe\xff\xff\xff\xff\xff\xff\xff                                                                        \xff\xff\xff.\xff\xff\xff\xff\xff\xff\xff\xf3\xff\xff\xff\xb3\xff\xff\xff\xb0\xff\xff\xff\xb0\xff\xff\xff\xb0\xff\xff\xff\xb0\xff\xff\xff\xb0\xff\xff\xff\xb0\xff\xff\xff\xb3\xff\xff\xff\xf3\xff\xff\xff\xff\xff\xff\xff.                                                                            \xff\xff\xffh\xff\xff\xff\xf7\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xf7\xff\xff\xffh                                                                                    \xff\xff\xffw\xff\xff\xff\xff\xff\xff\xff\xb6\xff\xff\xff0\xff\xff\xff0\xff\xff\xff0\xff\xff\xff0\xff\xff\xff\xb6\xff\xff\xff\xff\xff\xff\xffw                                                                                        \xff\xff\xff\xff\xff\xff\xf4\xff\xff\xff\xff\xff\xff\xffv\xff\xff\xff\xff\xff\xff\xff\xff\xffv\xff\xff\xff\xff\xff\xff\xff\xf4\xff\xff\xff                                                                                            \xff\xff\xffV\xff\xff\xff\xfc\xff\xff\xff\xff\xff\xff\xff\xfa\xff\xff\xff\xfa\xff\xff\xff\xff\xff\xff\xff\xfc\xff\xff\xffV                                                                                                    \xff\xff\xff1\xff\xff\xff\xb1\xff\xff\xff\xe7\xff\xff\xff\xe7\xff\xff\xff\xb1\xff\xff\xff1                                                    ]], 32, 32)

function slot52(slot0, slot1)
	return slot0.distance < slot1.distance
end

function slot53(slot0, slot1, slot2)
	return uv0(slot1, uv1(slot0, slot2))
end

function slot56()
	slot0 = uv0(uv1)

	uv2(uv3, slot0)
	uv2(uv4, slot0)
	uv2(uv5, slot0)
end

slot2("pre_render", function ()
	uv0 = {}

	if uv1() == nil or uv2 == nil then
		uv2 = uv3.cast("struct nml_worldbrushdata_t***", uv4)[0][0]
		uv5 = {}

		return
	end

	if uv2.numworldlights <= 0 then
		uv5 = {}

		return
	end

	slot1 = uv6(uv7(slot0))

	if uv8(uv9) and slot0 ~= nil and uv10(slot0) then
		uv11(slot0, uv12, uv13(uv14(slot0, uv12), 4))
	end

	slot2 = uv15() + uv16() * 2
	slot3 = {
		uv8(uv17)
	}
	slot4 = uv8(uv18)
	slot5 = uv8(uv19)
	slot7 = 0

	for slot11 = 0, uv2.numworldlights do
		if uv2.worldlights[slot11] ~= nil and (slot1 - uv6(slot12.origin.x, slot12.origin.y, slot12.origin.z)):length2d() < slot5 then
			uv0[#uv0 + 1] = {
				id = slot11,
				type = slot12.type,
				distance = slot14,
				origin = slot13,
				radius = (slot5 - slot14) / slot5 * uv8(uv20)
			}
		end
	end

	if not uv8(uv21) or #uv0 <= 0 then
		return
	end

	uv22(uv0, uv23)

	for slot11 = 1, #uv0 do
		if slot11 > 32 then
			break
		end

		slot12 = uv0[slot11]

		uv24({
			flags = 2,
			index = 5000 + slot12.id,
			origin = slot12.origin,
			radius = slot12.radius,
			style = slot4,
			color = slot3,
			time = slot2
		})
	end
end)
slot2("paint", function ()
	if not uv0(uv1) or uv2 == nil then
		uv3 = {}

		return
	end

	slot0 = uv4()
	slot1, slot2, slot3, slot4 = uv0(uv5)
	slot5 = uv0(uv6)
	slot6 = math.huge
	slot8 = uv8(uv9(uv7()))

	for slot12, slot13 in uv10(uv3) do
		slot13.count = nil
	end

	for slot12 = 1, #uv11 do
		if slot12 > 32 then
			break
		end

		if uv3[uv11[slot12].id] == nil then
			uv3[slot13.id] = {
				text_size = 0,
				alpha = 0
			}
		end

		uv3[slot13.id].light = slot13
		uv3[slot13.id].count = true
	end

	for slot12, slot13 in uv10(uv3) do
		slot14 = slot13.count and (slot8 - slot13.light.origin):length2d() or slot6
		slot17 = uv12(uv13({
			slot13.light.origin.x,
			slot13.light.origin.y,
			slot13.light.origin.z
		})) and slot14 < slot5 / 2 and slot0 or -slot0
		slot18 = slot14 < slot5 and slot0 or -slot0
		slot19 = false

		if slot14 < slot5 and slot13.alpha > 0.25 and not slot16 then
			slot19 = true
			slot18 = -slot0
		end

		slot13.alpha = uv14(slot13.alpha + slot18 * 4, slot19 and 0.25 or 0, 1)
		slot13.text_size = uv14(slot13.text_size + slot17 * 4, 0, 1)

		if slot13.alpha > 0 then
			slot20, slot21 = uv15(uv13(slot15))

			if slot20 ~= nil and slot21 ~= nil then
				slot23, slot24 = uv17(nil, uv16[slot13.light.type] or "| Unknown")

				uv18(uv2, slot20 - slot13.text_size * slot23 / 2, slot21, 18, 18, slot1, slot2, slot3, slot13.alpha * slot4, "f")

				if slot13.text_size > 0.05 then
					uv19(slot20 + 18 + 4 - slot25, slot21 + 3, slot1, slot2, slot3, slot13.alpha * slot4, "", slot13.text_size * (slot23 + 1), slot22)
				end
			end
		end

		if slot13.alpha == 0 and slot13.text_size == 0 then
			uv3[slot13.light.id] = nil
		end
	end
end)
ui.set_callback(slot41, slot56)
slot56(slot41)
