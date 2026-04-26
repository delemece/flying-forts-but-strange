ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_construct.lua"
Scale = 1
SelectionWidth = 40.0
SelectionHeight = 60.0
SelectionOffset = { 0.0, 60.5 }
Mass = 80.0
HitPoints = 150
EnergyStorageCapacity = 0.0
MetalStorageCapacity = 0.0
MinWindEfficiency = 0
MaxWindHeight = 0
MaxRotationalSpeed = 0
IgnitePlatformOnDestruct = true

DeviceSplashDamage = 50
DeviceSplashDamageMaxRadius = 100
DeviceSplashDamageDelay = 0.3
IncendiaryRadius = 50
IncendiaryRadiusHeated = 50
StructureSplashDamage = 80
StructureSplashDamageMaxRadius = 150

dofile("effects/device_smoke.lua")
SmokeEmitter = StandardDeviceSmokeEmitter

Sprites =
{
	{
		Name = "thruster2",
		States =
		{
			Normal = { Frames = { { texture = path.. "/devices/thruster/thbase3.png" }, mipmap = true, }, },

		},
	},
	{
		Name = "thead3",
			States =
		{
			Normal = { Frames = { { texture = path.. "/devices/thruster/th5.png" }, mipmap = true, }, },
		},
	},

}


Root =
{
	Name = "thing",
	Angle = 180,
	Pivot = { 0, 0.29 },
	PivotOffset = { 0, 0 },
	Sprite = "thruster2",
}
