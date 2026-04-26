ThType = {--[[["Name"] = {Thrust = {x, y}, Arc = C3 deg, Angle = C2 deg (0 <= Angle <  360), Fuel = C4}]]
	["thruster1"] = {Thrust = {x = 20000, y = 20000}, Arc = 360, Angle = 360, drain = 1.1},
	["thruster2"] = {Thrust = {x = 30000, y = 30000}, Arc = 360, Angle = 360, drain = 2.3},
	["marchThruster"] = {Thrust = {x = 33000, y = 33000}, Arc = 40, Angle = 110, drain = 1.4},
}

function LoadThrusters()
	local thtype = {}
	for i, v in pairs(ThType) do
		thtype[i] = {}
		for name, value in pairs(v) do 
			if (type(value) == type({})) then
				for b, g in pairs(value) do
					thtype[i][name .. b] = g
				end
			else 
				if name == "Angle" or name == "Arc" then
					thtype[i][name] = math.rad(value)
				else
					thtype[i][name] = value
				end
			end
		end
		local angle = {}
		angle[1] = thtype[i].Angle
		angle[2] = angle[1] - thtype[i].Arc

		thtype[i]["EffectiveAngle"] = angle
	end
	ThType = thtype
end

--dlc2_ApplyForce(Node, Vec3(data.Structures.Forces[contId].x * magx * thtype[t], (data.Structures.Forces[contId].y - 17) * magy * thtype[t], 0))

function applyThrust(Nodes, x, y, devId)
	local thruster = ThType[GetDeviceType(devId)]
	local braceAngle = (GetDeviceAngle(devId) - (math.pi / 2))
	
	local half = math.asin(y / ControlRadius)

	if half < 0 then half = 0 else half = 2 * math.pi end
	
	local angle = math.abs(half - math.acos(x / ControlRadius))
	if (math.min(thruster.EffectiveAngle[1], thruster.EffectiveAngle[2]) > 0) then
		if (math.min(clamp(thruster.EffectiveAngle[1] + braceAngle), clamp(thruster.EffectiveAngle[2] + braceAngle)) <= angle) and (angle <= math.max(clamp(thruster.EffectiveAngle[1] + braceAngle), clamp(thruster.EffectiveAngle[2] + braceAngle))) then
			data.Thrusters[devId].ang = angle
			
			local fly = FuelDrain(devId, thruster.drain * math.sqrt(x * x + y * y))
			data.Thrusters[devId].fly = fly
			if fly then
				dlc2_ApplyForce(Nodes, Vec3(x * thruster.Thrustx, (y - 5) * thruster.Thrusty, 0))
			end
		end
	elseif ((math.min(thruster.EffectiveAngle[1], thruster.EffectiveAngle[2]) <= 0)) then
		if (2 * math.pi + math.min(thruster.EffectiveAngle[1], thruster.EffectiveAngle[2]) <= angle) or (angle <= math.max(thruster.EffectiveAngle[1], thruster.EffectiveAngle[2])) then
			data.Thrusters[devId].ang = angle
			
			local fly = FuelDrain(devId, thruster.drain * math.sqrt(x * x + y * y))
			data.Thrusters[devId].fly = fly
			if fly then
				dlc2_ApplyForce(Nodes, Vec3(x * thruster.Thrustx, (y - 5) * thruster.Thrusty, 0))

			end
		end
	end
end 

--FuelSystem--

function UpdateTanks()
	data.FuelS.iFuel = {}
	local used = {}
	for contId, Stats in pairs(data.FuelS.Fuel) do
		S = {pool = 0, cap = 100}
		for Tank, fCap in pairs(data.FuelS.Tnk) do
			if (GetDeviceStructureId(contId) == GetDeviceStructureId(Tank)) then
				S.cap = S.cap + fCap
			end
		end
		S.pool = data.FuelS.Fuel[contId].pool
		S.pool = S.pool + fReFuel(contId)
		if S.pool > S.cap then
			S.pool = S.cap
		end
		data.FuelS.Fuel[contId] = {pool = S.pool, cap = S.cap}
		if data.FuelS.iFuel[GetDeviceStructureId(contId)] == nil then
			data.FuelS.iFuel[GetDeviceStructureId(contId)] = {cap = S.cap, pool = S.pool, CNTID = contId}
		else
			data.FuelS.iFuel[GetDeviceStructureId(contId)].cap = S.cap
			data.FuelS.iFuel[GetDeviceStructureId(contId)].pool = S.pool
			data.FuelS.iFuel[GetDeviceStructureId(contId)].CNTID = contId
		end
		used[GetDeviceStructureId(contId)] = 1
	end
end

function FuelDrain(devId, drain)
	local ifuel = data.FuelS.iFuel[GetDeviceStructureId(devId)]
	ifuel.pool = ifuel.pool - drain
	if ifuel.pool <= 0 then
		ifuel.pool = 0
		data.FuelS.Fuel[ifuel.CNTID].pool = 0
		return false
	else
		data.FuelS.Fuel[ifuel.CNTID].pool = ifuel.pool
		return true
	end
end

function fReFuel(devId)
	for i, v in pairs(data.FuelS.ReFuel) do
		if GetDeviceStructureId(i) == GetDeviceStructureId(devId) and GetDeviceStructureId(devId) ~= 0 then
			return 5000 
		end
	end
	return 0
end

-- Chasics --

function BounceThingy()
	for i, v in pairs(data.chasics) do
		local ang = GetDeviceAngle(i)
		local pos = GetDevicePosition(i)
		local ray = CastGroundRay(pos, Vec3(pos.x - chas_len * math.cos(ang), pos.y + chas_len * math.sin(ang), 0), 0)
		v.hitpos = GetRayHitPosition()
		local ray2 = CastGroundRay(Vec3(pos.x + 5 * math.cos(ang), pos.y - 5 * math.sin(ang), 0), Vec3(pos.x - (chas_len - 5) * math.cos(ang), pos.y + (chas_len + 5) * math.sin(ang), 0), 0)
		v.hitpos2 = GetRayHitPosition()
		v.groudAngle = math.atan((v.hitpos.x - v.hitpos2.x)/(v.hitpos.y - v.hitpos2.y))
		local mov = NodeVelocity(v[1])
		local mov2 = NodeVelocity(v[2])
		if mov.y < 0 then
			mov.y = mov2.y/10
		end
		if mov2.y < 0 then
			mov2.y = mov2.y/10
		end
		local comp = chas_len - VecLen(Vec3(v.hitpos.x - pos.x, v.hitpos.y - pos.y, 0))
		local power = -12000 * comp - 500000
		if ray == 1 then 
			v.hit = 1
			dlc2_ApplyForce(v[1], Vec3(mov.x * -3000, power * math.sin(ang) + mov.y * -3000, 0))
			dlc2_ApplyForce(v[2], Vec3(mov2.x * -3000, power * math.sin(ang) + mov2.y * -3000, 0))
		else
			v.hit = -1
		end
	end
end

