ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_complete.lua"
DestroyUnderwaterEffect = "mods/dlc2/effects/device_explode_submerged.lua"
Scale = 0.75
SelectionWidth = 85.0
SelectionHeight = 120
SelectionOffset = { 0.0, 29.33 }
Mass = 40
HitPoints = 150
EnergyProductionRate = -2
MetalProductionRate = -2
MinWindEfficiency = 1
MaxWindHeight = 0
MaxRotationalSpeed = 0

dofile("effects/device_smoke.lua")
SmokeEmitter = StandardDeviceSmokeEmitter

Sprites =
{
	{
		Name = "refl-base",
		States =
		{
			Normal = { Frames = { { texture = path .. "/devices/refuel/base.png" }, mipmap = true, }, },
		},
	},
}


Root =
{
	Name = "refl",
	Angle = 0,
	Pivot = { 0, 0.055 },
	PivotOffset = { 0, 0 },
	Sprite = "refl-base",
}
