local armorchange = FindMaterial("armour")
if armorchange then
	armorchange.AirDrag = 60.0
	armorchange.Stiffness = 600000
end
local doorchange = FindMaterial("door")
if doorchange then
	doorchange.AirDrag = 70.0
	doorchange.Stiffness = 600000
end
local bracingd = FindMaterial("bracing")
if bracingd then
	bracingd.AirDrag = 45.0
	bracingd.Stiffness = 500000
end
local bracingbgch = FindMaterial("backbracing")
if bracingbgch then
	bracingbgch.AirDrag = 40.0
	bracingbgch.Stiffness = 500000
end

local ropech = FindMaterial("rope")
if ropech then
	ropech.MaxCompression = 0.4
	ropech.MaxExpansion = 2
	ropech.Pretension = 0.08
end