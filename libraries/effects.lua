slot0 = require("ffi")

slot0.cdef([[
    typedef struct _fxlib_CEffectData fxlib_CEffectData;
    typedef struct _fxlib_CClientEffectRegistration fxlib_CClientEffectRegistration;
    
    typedef void(*fxlib_ClientEffectCallback)(const fxlib_CEffectData& data);

    typedef struct _fxlib_CClientEffectRegistration
    {    
	const char* m_pEffectName;
	fxlib_ClientEffectCallback m_pFunction;
	fxlib_CClientEffectRegistration* m_pNext;
    } fxlib_CClientEffectRegistration;

    typedef struct _fxlib_Vec3
    {
	float x, y, z;
    } fxlib_Vec3;

    typedef struct _fxlib_CEffectData
    {
	fxlib_Vec3 origin;
	fxlib_Vec3 start;
	fxlib_Vec3 normal;
	fxlib_Vec3 angles;
	int flags;
	void* entity;
	float scale;
	float magnitude;
	float radius;
	int attachment_index;
	short surface_prop;
	int material;
	int damage_type;
	int hitbox;
	int other_ent_index;
	unsigned char color;
	bool are_positions_relative;
	int effect_name_index;
    } fxlib_CEffectData;
]])

slot1 = slot0.cast
slot3 = slot1("fxlib_CClientEffectRegistration***", slot1("char*", client.find_signature("client.dll", "\\x8b5\\xcc\\xcc\\xcc̅\\xf6\\x84\\xcc\\xcc\\xcc\\xcc ") or error("Couldnt find CClientEffectRegistration::s_head, notify the author.")) + 2)[0][0] or error("Couldnt find CClientEffectRegistration::s_head, notify the author.")
slot4 = {}
slot6 = {}
slot7 = {
	new = function (slot0, slot1)
		slot0.__index = slot0

		return setmetatable({
			_effect = slot1 or error("No effect supplied in effect:new()"),
			_original_func = uv0("fxlib_ClientEffectCallback", slot1.m_pFunction),
			_functions = {}
		}, slot0)
	end,
	hook = function (slot0, slot1)
		slot0._functions[#slot0._functions + 1] = slot1 or error("No function supplied in effect:hook()")
		slot0._callback = uv0("fxlib_ClientEffectCallback", function (slot0)
			should_call_original = true

			for slot4 = 1, #uv0._functions do
				should_call_original = should_call_original and uv0._functions[slot4](slot0)
			end

			if should_call_original then
				uv0._original_func(slot0, ent, out)
			end
		end)
		slot0._effect.m_pFunction = slot0._callback
	end,
	unbind_hooks = function (slot0)
		slot0._effect.m_pFunction = slot0._original_func
		slot0._functions = {}

		slot0._callback:free()
	end,
	spawn = function (slot0, slot1)
		slot0._original_func(slot1)
	end
}

function ()
	slot0 = uv0

	while slot0 ~= uv1("fxlib_CClientEffectRegistration*", 0) do
		uv2[uv3.string(slot0.m_pEffectName)] = slot0
		slot0 = slot0.m_pNext
	end
end()
client.set_event_callback("shutdown", function ()
	for slot3, slot4 in pairs(uv0) do
		slot4:unbind_hooks()
	end
end)

return {
	lookup = function (slot0)
		if uv1[uv0[slot0] or error("Effect could not be found under the given effect name " .. slot0)] == nil then
			uv1[slot1] = uv2:new(slot1)
		end

		return uv1[slot1]
	end
}
