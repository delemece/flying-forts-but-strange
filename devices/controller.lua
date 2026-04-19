ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_complete.lua"
Scale = 1
SelectionWidth = 40.0
SelectionHeight = 40.0
SelectionOffset = { 0.0, -40.5 }
Mass = 40.0
HitPoints = 60
EnergyProductionRate = -40
MetalProductionRate = -3.0
EnergyStorageCapacity = 0.0
MetalStorageCapacity = 0.0
MinWindEfficiency = 0
MaxWindHeight = 0
MaxRotationalSpeed = 0
DeviceSplashDamage = 200
DeviceSplashDamageMaxRadius = 250
DeviceSplashDamageDelay = 0.3
IgnitePlatformOnDestruct = true
IncendiaryRadius = 120
IncendiaryRadiusHeated = 150
StructureSplashDamage = 200
StructureSplashDamageMaxRadius = 150
IgnitePlatformOnDestruct = true
Repairable = true
ClaimsStructures = true

Sprites =
{
	{
		Name = "controller",
		States =
		{
			Normal = { Frames = { { texture = path.. "/weapons/controller/base.png" }, mipmap = true, }, },

		},
	},
}



Root =
{
	Name = "base",
	Angle = 0,
	Pivot = { 0, -0.235 },
	PivotOffset = { 0, 0 },
	Sprite = "controller",
	
}