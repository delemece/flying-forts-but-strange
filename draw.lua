changeUi = false
Hmove = {["up"] = 0, ["right"] = 0, ["left"] = 0, ["down"] = 0}
CurrentStruct = -1
MovementKeys = {["up"] = Vec3(0, -1, 0), ["right"] = Vec3(1, 0, 0), ["left"] = Vec3(-1, 0, 0), ["down"] = Vec3(0, 1, 0)}
exists = false
SavedForce = Vec3(0, 0, 0)
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
		local ThPos = 55
		if v.SN == "marchThruster" then
			ThPos = -55
		end
		if v.fly and v.effectId == -1 then
			v.effectId = SpawnEffect(path .."/effects/th_".. v.SN ..".lua", GetDevicePosition(i))
			SetEffectDirection(v.effectId,Vec3(math.cos(v.ang) * (-1), math.sin(v.ang)))
			SetEffectPosition(v.effectId,Vec3(GetDevicePosition(i).x - ThPos * math.cos(ang) * -1, GetDevicePosition(i).y - ThPos * math.sin(ang)))
		elseif v.fly then
			SetEffectDirection(v.effectId,Vec3(math.cos(v.ang) * (-1), math.sin(v.ang)))
			SetEffectPosition(v.effectId,Vec3(GetDevicePosition(i).x - ThPos * math.cos(ang) * -1, GetDevicePosition(i).y - ThPos * math.sin(ang)))
		else
			CancelEffect(v.effectId)
			v.effectId = -1
		end
	end
end


function HandyFunc(k, d) 
	if d then Hmove[k] = 1 
	else Hmove[k] = 0 end
	local v = Vec3(Hmove["down"] - Hmove["up"], Hmove["right"] - Hmove["left"], 0)
	if (math.abs(v.x) == 1 and math.abs(v.y) == 1) then
		SendScriptEvent("SetForce", tostring(v.y * ControlRadius * 0.707) .. " , " .. tostring(v.x * ControlRadius * 0.707) .. " , " .. tostring(CurrentStruct), "", true)
	elseif InArray(1, Hmove) then
		SendScriptEvent("SetForce", tostring(v.y * ControlRadius) .. " , " .. tostring(v.x * ControlRadius) .. " , " .. tostring(CurrentStruct), "", true)
	else
		Log("HELLOOo")
		SendScriptEvent("SetForce", tostring(SavedForce.x) .. " , " .. tostring(SavedForce.y) .. " , " .. tostring(CurrentStruct), "", true)
	end
end

function OnKey(key, down)
	if MovementKeys[key] ~= nil and not changeUi then
		HandyFunc(key, down)
	end

	if (IsDesiredDevice(ContName, GetLocalSelectedDeviceId())) and not (key == "mouse right") and not ShwUI and (GetTeamId(GetLocalTeamId()) == GetDeviceTeamIdActual(GetLocalSelectedDeviceId())) then

		ShwUI = true
		local location = ControlPlace

		AddButtonControl("HUD", "BUTTON1", path .. "/sprites/" .. CONTTEXTNAME, ANCHOR_CENTER_CENTER, ControlSize, ControlPlace, "Normal")
		CurrentStruct = GetLocalSelectedDeviceId() 

		if data.Structures.Forces[CurrentStruct] ~= nil then
			location = Vec3(data.Structures.Forces[CurrentStruct].x, data.Structures.Forces[CurrentStruct].y, 0)
		end
		AddButtonControl("BUTTON1", "BUTTON2", path .. "/sprites/" .. FORCETEXTNAME, ANCHOR_CENTER_CENTER, DirectionSize, location, "Normal")

	elseif key == "mouse left" and down then
		if IsDesiredDevice(ContName, GetLocalSelectedDeviceId()) then
			changeUi = true
		end

		if data.Structures.Forces[CurrentStruct] ~= nil then
			SavedForce = Vec3(data.Structures.Forces[CurrentStruct].x, data.Structures.Forces[CurrentStruct].y, 0)
		end
	elseif not (IsDesiredDevice(ContName, GetLocalSelectedDeviceId())) or key == "mouse right" then
		DeleteControl("HUD", "BUTTON1") 
		ShwUI = false
		changeUi = false

	elseif key == "mouse left" and not down then
		changeUi = false

		if data.Structures.Forces[CurrentStruct] ~= nil and not InArray(1, Hmove) then
			SavedForce = Vec3(data.Structures.Forces[CurrentStruct].x, data.Structures.Forces[CurrentStruct].y, 0)
		end
	end
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
	if ShwUI and data.Structures.Forces[CurrentStruct] ~= nil then
		SetControlAbsolutePos("BUTTON1", "BUTTON2", Vec3(ControlPlace.x + data.Structures.Forces[CurrentStruct].x, ControlPlace.y + data.Structures.Forces[CurrentStruct].y))
	end
end

