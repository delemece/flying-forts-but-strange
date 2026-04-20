-- tools
watchlist = {}

function tableLength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function VecLen(v)
	return math.sqrt(v.x * v.x + v.y * v.y)
end

function debugTable(Table)
	for i, v in pairs(Table) do
		Log(tostring(i))
		Log(tostring(v))
	end
	return
end

function InArray(value, array)
	for id, pointer in pairs(array) do
		if (value == pointer) then
			return true
		end
	end
	return false
end

function tonumbool(str)
	local bool = 0
	if str then
		bool = 1
	end
	return bool
end

function toboolnum(str)
	local bool = false
	if str == 1 then
		bool = true
	end
	return bool
end

function IsDesiredDevice(Dname, deviceId)
	if (GetDeviceType(deviceId) == Dname) then
		return true
	end
	return false
end

function clamp(ang)
	if ang >= math.pi*2 then
		local ang = ang - math.pi * 2
	elseif ang < 0 then
		local ang = ang + math.pi * 2
	end
	return ang
end

function RotateVec(v, angle)
	return Vec3(v.x * math.cos(ang) - v.y * math.sin(angle), v.x * math.sin(ang) - v.y * math.cos(angle), 0)
end
function LogWatch()
	for T, G in pairs(watchlist) do
		if type(T) == type({}) then 
			for i, v in pairs(T) do 
				if type(i) == type({}) then debugTable(i)
				else Log(tostring(i)) end
				if type(v) == type({}) then debugTable(v)
				else Log(tostring(v)) end
			end

		elseif type(T) == type(Vec3(0,0,0)) then Log(tostring(T.x), tostring(T.y))

		else Log(tostring(T)) end
	end
end

function Watch(T, index)
	if index == -1 then
		local count = #watchlist
		watchlist[count] = T
		return count
	end
	watchlist[index] = T
	return index
end
