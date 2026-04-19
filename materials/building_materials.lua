local armorchange = FindMaterial("armour")
if armorchange then
	armorchange.AirDrag = 60.0
	armorchange.Stiffness = 500000
end
local doorchange = FindMaterial("door")
if doorchange then
	doorchange.AirDrag = 70.0
	doorchange.Stiffness = 500000
end
local bracingd = FindMaterial("bracing")
if bracingd then
	bracingd.AirDrag = 45.0
	bracingd.Stiffness = 400000
end
local bracingbgch = FindMaterial("backbracing")
if bracingbgch then
	bracingbgch.AirDrag = 40.0
	bracingbgch.Stiffness = 400000
end
	