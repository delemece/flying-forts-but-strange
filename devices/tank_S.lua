ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_construct.lua"
Scale = 1
SelectionWidth = 80.0
SelectionHeight = 30.0
SelectionOffset = { 0.0, -40.5 }
Mass = 100.0
HitPoints = 60
EnergyStorageCapacity = 0.0
MetalStorageCapacity = 0.0
MinWindEfficiency = 0
MaxWindHeight = 0
MaxRotationalSpeed = 0
IgnitePlatformOnDestruct = true

DeviceSplashDamage = 50
DeviceSplashDamageMaxRadius = 100
DeviceSplashDamageDelay = 0.2
IncendiaryRadius = 200
IncendiaryRadiusHeated = 150
StructureSplashDamage = 180
StructureSplashDamageMaxRadius = 150

dofile("effects/device_smoke.lua")
SmokeEmitter = StandardDeviceSmokeEmitter


Sprites =
{
	{
		Name = "S_tank",
		States =
		{
			Normal = { Frames = { { texture = path.. "/devices/tank/small.png" }, mipmap = true, }, },

		},
	},
}

Root =
{
	Name = "base",
	Angle = 0,
	Pivot = { 0, -0.235 },
	PivotOffset = { 0, 0 },
	Sprite = "S_tank",

}