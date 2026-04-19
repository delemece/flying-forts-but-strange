changeUi = false
Hmove = Vec3(0, 0, 0)
CurrentStruct = -1
MovementKeys = {["up"] = Vec3(0, -1, 0), ["right"] = Vec3(1, 0, 0), ["left"] = Vec3(-1, 0, 0), ["down"] = Vec3(0, 1, 0)}
exists = false
local kPressed = 0
local savedforce = Vec3(0, 0, 0)

function DrawChas()
	for i, v in pairs(data.chasics) do
		if v.hit ~= 1 and v.effectId ~= -1 then 
			CancelEffect(v.effectId)
			v.effectId = -1
		elseif v.hit == 1 then
			if v.effectId == -1 then
				v.effectId = SpawnEffect(path .."/effects/chas.lua", v.hitpos)
			end
			if v.groudAngle > 0 then 
				SetEffectDirection(v.effectId, Vec3(math.cos(v.groudAngle), math.abs(math.sin(v.groudAngle)) * -1, 0))
				SetEffectPosition(v.effectId, v.hitpos)
			else
				SetEffectDirection(v.effectId, Vec3(math.cos(v.groudAngle) * -1, math.abs(math.sin(v.groudAngle)) * -1, 0))
				SetEffectPosition(v.effectId, v.hitpos)
			end
		end
	end
end

function DrawThrusters()
	for i, v in pairs(data.Thrusters) do 
		local ang = GetDeviceAngle(i)
		if v.fly and v.effectId == -1 then
		v.effectId = SpawnEffect(path .."/effects/th_".. v.SN ..".lua", GetDevicePosition(i))
		SetEffectDirection(v.effectId,Vec3(math.cos(v.ang) * (-1), math.sin(v.ang)))
		SetEffectPosition(v.effectId,Vec3(GetDevicePosition(i).x - 50 * math.cos(ang) * -1, GetDevicePosition(i).y - 50 * math.sin(ang)))
		elseif 	v.fly then
		SetEffectDirection(v.effectId,Vec3(math.cos(v.ang) * (-1), math.sin(v.ang)))
		SetEffectPosition(v.effectId,Vec3(GetDevicePosition(i).x - 50 * math.cos(ang) * -1, GetDevicePosition(i).y - 50 * math.sin(ang)))
		else
		CancelEffect(v.effectId)
		v.effectId = -1
		end
	end
end


function HandyFunc(k, d)
	if d then
		Hmove = Vec3(Hmove.x + MovementKeys[k].x, Hmove.y + MovementKeys[k].y, 0)
	elseif not d then 
		Hmove = Vec3(Hmove.x - MovementKeys[k].x, Hmove.y - MovementKeys[k].y, 0)
	end
	if math.abs(Hmove.x) == 1 and math.abs(Hmove.y) == 1 then
		SendScriptEvent("SetForce", tostring(Hmove.x * ControlRadius * 0.707) .. " , " .. tostring(Hmove.y * ControlRadius * 0.707) .. " , " .. tostring(CurrentStruct), "", true)
	else
		SendScriptEvent("SetForce", tostring(Hmove.x * ControlRadius) .. " , " .. tostring(Hmove.y * ControlRadius) .. " , " .. tostring(CurrentStruct), "", true)
	end
end

function OnKey(key, down)
	if MovementKeys[key] ~= nil then
		HandyFunc(key, down)
		
		if down == true then
			kPressed = kPressed + 1
		else
			kPressed = kPressed - 1
		end
	end
	if (GetDeviceType(GetLocalSelectedDeviceId()) == ContName) and not (key == "mouse right") and not ShwUI and ((GetLocalTeamId() % 10) == GetDeviceTeamId(GetLocalSelectedDeviceId())) then

		ShwUI = true
		local location = ControlPlace

		--[[if MovementKeys[key] ~= nil then
			HandyFunc(key, down)
		end]]

		AddButtonControl("HUD", "BUTTON1", path .. "/sprites/" .. CONTTEXTNAME, ANCHOR_CENTER_CENTER, ControlSize, ControlPlace, "Normal")
		CurrentStruct = GetLocalSelectedDeviceId() 

		if data.Structures.Forces[CurrentStruct] ~= nil then
			location = Vec3(data.Structures.Forces[CurrentStruct].x, data.Structures.Forces[CurrentStruct].y, 0)
		end
		AddButtonControl("BUTTON1", "BUTTON2", path .. "/sprites/" .. FORCETEXTNAME, ANCHOR_CENTER_CENTER, DirectionSize, location, "Normal")		
		
	elseif key == "mouse left" and down then
		if GetDeviceType(GetLocalSelectedDeviceId()) == ContName then
			changeUi = true
		end
		if data.Structures.Forces[CurrentStruct] ~= nil then
			savedforce = Vec3(data.Structures.Forces[CurrentStruct].x, data.Structures.Forces[CurrentStruct].y, 0)
		end
	elseif not (GetDeviceType(GetLocalSelectedDeviceId(v)) == ContName) or key == "mouse right" then
		DeleteControl("HUD", "BUTTON1") 
		ShwUI = false
		changeUi = false

	elseif key == "mouse left" and not down then
		changeUi = false
		
		if data.Structures.Forces[CurrentStruct] ~= nil then
			savedforce = Vec3(data.Structures.Forces[CurrentStruct].x, data.Structures.Forces[CurrentStruct].y, 0)
		end	
	end
	
	if kPressed < 0 then
		kPressed = 0
	end
	
	if kPressed == 0 and MovementKeys[key] ~= nil and not down then
		SendScriptEvent("SetForce", tostring(savedforce.x) .. " , " .. tostring(savedforce.y) .. " , " .. tostring(CurrentStruct), "", true)
		Hmove = Vec3(0, 0, 0)
	end
	--Log("Current direction: " .. tostring(Structures.Forces[CurrentStruct].x) .. " " .. tostring(Structures.Forces[CurrentStruct].y))
	return 
end
function OnUpdate(deltaTime)
	if CurrentStruct ~= nil and GetDeviceStructureId(CurrentStruct) ~= -1 and data.FuelS.iFuel ~= nil and data.FuelS.iFuel[GetDeviceStructureId(CurrentStruct)] ~= nil then
		if data.Structures.Affected[CurrentStruct] and ((GetLocalTeamId() % 10) == GetDeviceTeamId(GetLocalSelectedDeviceId())) and not exists then
			AddSpriteControl("", "Wbase",path .. "/sprites/Wbase", ANCHOR_TOP_RIGHT, Vec3(150, 150, 0), Vec3(1068, 300, 0), false)
			AddSpriteControl("Wbase", "ScalePower",path .. "/sprites/gauge0", ANCHOR_CENTER_CENTER, Vec3(150, 150, 0), Vec3(-75, 75, 0), false)
			exists = true
		elseif exists then
			if data.FuelS.iFuel[GetDeviceStructureId(CurrentStruct)].pool ~= nil and data.FuelS.iFuel[GetDeviceStructureId(CurrentStruct)].pool ~= 0 and data.FuelS.iFuel[GetDeviceStructureId(CurrentStruct)].cap ~= nil then
				local m = data.FuelS.iFuel[GetDeviceStructureId(CurrentStruct)].pool / data.FuelS.iFuel[GetDeviceStructureId(CurrentStruct)].cap
				SetControlSprite("ScalePower",path .. "/sprites/gauge" ..tostring(math.floor(100 * m) - math.floor(100 * m) % 10)) 
				RotateSpriteControl("", "ScalePower", 0)
			else
				SetControlSprite("ScalePower",path.. "/sprites/gauge0")
				RotateSpriteControl("", "ScalePower", 0)
			end
		end
	end
	DrawThrusters()
	DrawChas()
end

