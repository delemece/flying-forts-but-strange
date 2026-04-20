dofile("scripts/forts.lua")
dofile(path .. "/draw.lua")
dofile(path .. "/magic.lua")
dofile(path .. "/thrusters.lua")

data.Structures = {Nodes = {--[[deviceId, Nodes]]}, Affected = {--[[devIdcont, True/nil]]}, Forces = {--[[devIdcont, vec3]]}}
data.FuelS = {Fuel = {--[[contId, {cap, fuel}]]}, ReFuel = {--[[devId, True/nil]]}, Tnk = {--[[dont touch]]}, iFuel = {--[[dont touch]]}}
data.chasics = {}
data.Thrusters = {}
ControlPlace = Vec3(450, 400, 0)
ControlSize = Vec3(150, 150, 0)
ControlRadius = 67
DirectionSize = Vec3(60, 60, 0)
chas_len = 400

ContName = "infcontroller"
TnkType = {
["tank_S"] = 400000,
["Tank_B"] = 2000000,
}
chas = "chasics1"
Refl = "refuel"
FORCETEXTNAME = "1.png" -- in /sprites
CONTTEXTNAME = "2.png" -- in /sprites


function Load()
	Log("[HL=" .. string.format("%02X%02X%02X%02X", 250, 250, 0, 255) .. "]" .. "Welcome to FortFleet")
	LoadThrusters()
end

--DEVICES--

function OnDeviceCompleted(teamId, deviceId, saveName)
	if saveName == ContName then
		data.Structures.Affected[deviceId] = true
		data.Structures.Forces[deviceId] = Vec3(0,0,0)
		data.FuelS.Fuel[deviceId] = {cap = 100, pool = 100}
	elseif ThType[saveName] ~= nil then
		data.Structures.Nodes[deviceId] = {GetDevicePlatformA(deviceId), GetDevicePlatformB(deviceId)}
		data.Thrusters[deviceId] = {SN = saveName, ang = math.pi/2 * 3, fly = false, effectId = -1}
	elseif TnkType[saveName] ~= nil then
		data.FuelS.Tnk[deviceId] = TnkType[saveName]
	elseif saveName == Refl then
		data.FuelS.ReFuel[deviceId] = true
	elseif saveName == chas then
		data.chasics[deviceId] = {GetDevicePlatformA(deviceId), GetDevicePlatformB(deviceId),
		effectId = -1, hitpos = -1, hitpos2 = -1, hit = -1, groudAngle = -1
	}
	end
end

function OnDeviceDestroyed(teamId, deviceId, saveName, nodeA, nodeB, t)
	if saveName == ContName then 
		data.Structures.Affected[deviceId] = nil
		data.Structures.Forces[deviceId] = nil
		data.FuelS.Fuel[deviceId] = nil
	elseif ThType[saveName] ~= nil then
		data.Structures.Nodes[deviceId] = nil
		if data.Thrusters[deviceId] ~= nil then 
			CancelEffect(data.Thrusters[deviceId].effectId)
			data.Thrusters[deviceId] = nil
		end
	elseif TnkType[saveName] ~= nil then
		data.FuelS.Tnk[deviceId] = nil
	elseif saveName == Refl then
		data.FuelS.ReFuel[deviceId] = nil
	elseif saveName == chas then
		if data.chasics[deviceId] ~= nil then 
			CancelEffect(data.chasics[deviceId].effectId)
			data.chasics[deviceId] = nil
		end
	end
	if deviceId == CurretStruct then CurrentStruct = nil end
end

function OnDeviceDeleted(teamId, deviceId, saveName, nodeA, nodeB, t)
	if saveName == ContName then 
		data.Structures.Affected[deviceId] = nil
		data.Structures.Forces[deviceId] = nil 
		data.FuelS.Fuel[deviceId] = nil
	elseif ThType[saveName] ~= nil then
		data.Structures.Nodes[deviceId] = nil
		if data.Thrusters[deviceId] ~= nil then 
		CancelEffect(data.Thrusters[deviceId].effectId)
		data.Thrusters[deviceId] = nil
		end
	elseif TnkType[saveName] ~= nil then
		data.FuelS.Tnk[deviceId] = nil
	elseif saveName == Refl then
		data.FuelS.ReFuel[deviceId] = nil
	elseif saveName == chas then
		if data.chasics[deviceId] ~= nil then 
			CancelEffect(data.chasics[deviceId].effectId)
			data.chasics[deviceId] = nil
		end
	end
	if deviceId == CurretStruct then CurrentStruct = nil end
end

--Movement--

function SetForce(x, y, deviceId)
	local str = GetDeviceStructureId(deviceId)
	for i, v in pairs(data.Structures.Affected) do 
		if GetDeviceStructureId(i) == str then
			data.Structures.Forces[i] = Vec3(tonumber(x), tonumber(y), 0)
		end
	end
end

function MoveStruct()
	local used = {}
	for contId, h in pairs(data.Structures.Affected) do
		for Struct, Nodes in pairs(data.Structures.Nodes) do
			if (GetDeviceStructureId(contId) == GetDeviceStructureId(Struct)) and (used[GetDeviceStructureId(Struct)] ~= 1) then
				--dlc2_ApplyForce(Node, Vec3(data.Structures.Forces[contId].x * magx * thtype[t], (data.Structures.Forces[contId].y - 17) * magy * thtype[t], 0))
				for i, v in pairs(Nodes) do
					applyThrust(v, data.Structures.Forces[contId].x, data.Structures.Forces[contId].y, Struct)
				end
			end
		end
		used[GetDeviceStructureId(contId)] = 1 
	end
end

--MainLoop--

function Update(frame)
	if changeUi then
		local mouse = GetMousePos()
		if  VecLen(Vec3(mouse.x - ControlPlace.x, mouse.y - ControlPlace.y, 0)) < ControlRadius then 
			SetControlAbsolutePos("BUTTON1", "BUTTON2", mouse)
			SendScriptEvent("SetForce", tostring(mouse.x - ControlPlace.x) .. " , " .. tostring(mouse.y - ControlPlace.y) .. " , " .. tostring(CurrentStruct), "", true)
		end
	end
	if frame % 2 == 0 then
		UpdateTanks()
		MoveStruct()
		BounceThingy()
		LogWatch()
	end
end



