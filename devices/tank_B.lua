ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_construct.lua"
Scale = 1
SelectionWidth = 75.0
SelectionHeight = 100.0
SelectionOffset = { 0.0, 0 }
Mass = 450.0
HitPoints = 700
MaxRotationalSpeed = 0
IgnitePlatformOnDestruct = true

DeviceSplashDamage = 200
DeviceSplashDamageMaxRadius = 150
DeviceSplashDamageDelay = 0.2
IncendiaryRadius = 500
IncendiaryRadiusHeated = 300
StructureSplashDamage = 200
StructureSplashDamageMaxRadius = 300

dofile("effects/device_smoke.lua")
SmokeEmitter = StandardDeviceSmokeEmitter


Sprites =
{
	{
		Name = "tank_B",
		States =
		{
			Normal = { Frames = { { texture = path.. "/devices/tank/big.png" }, mipmap = true, }, },

		},
	},
}

Root =
{
	Name = "base",
	Angle = 0,
	Pivot = { 0, 0 },
	PivotOffset = { 0, 0 },
	Sprite = "tank_B",

}