ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_construct.lua"
Scale = 1
SelectionWidth = 85.0
SelectionHeight = 180.0
SelectionOffset = { 0.0, -90 }
Mass = 800.0
HitPoints = 500
MaxRotationalSpeed = 0
IgnitePlatformOnDestruct = true

DeviceSplashDamage = 200
DeviceSplashDamageMaxRadius = 150
DeviceSplashDamageDelay = 0.2
IncendiaryRadius = 700
IncendiaryRadiusHeated = 500
StructureSplashDamage = 200
StructureSplashDamageMaxRadius = 300

dofile("effects/device_smoke.lua")
SmokeEmitter = StandardDeviceSmokeEmitter


Sprites =
{
	{
		Name = "tank_H",
		States =
		{
			Normal = { Frames = { { texture = path.. "/devices/tank/bigger.png" }, mipmap = true, }, },

		},
	},
}

Root =
{
	Name = "base",
	Angle = 0,
	Pivot = { 0, -0.245 },
	PivotOffset = { 0, 0 },
	Sprite = "tank_H",

}