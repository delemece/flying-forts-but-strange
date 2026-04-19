ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_complete.lua"
Scale = 1
SelectionWidth = 40.0
SelectionHeight = 40.0
SelectionOffset = { 0.0, -40.5 }
Mass = 350.0
HitPoints = 120
EnergyProductionRate = -30
MetalProductionRate = 0
EnergyStorageCapacity = 0.0
MetalStorageCapacity = 0.0
MinWindEfficiency = 0
MaxWindHeight = 0
MaxRotationalSpeed = 0
DeviceSplashDamage = 0
DeviceSplashDamageMaxRadius = 0
DeviceSplashDamageDelay = 0
Repairable = true

Sprites =
{
	{
		Name = "chasics",
		States =
		{
			Normal = { Frames = { { texture = path.. "/devices/chasics/placeholder.png" }, mipmap = true, }, },

		},
	},
}



Root =
{
	Name = "base",
	Angle = 0,
	Pivot = { 0, 0.31 },
	PivotOffset = { 0, 0 },
	Sprite = "chasics",
	
}