ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_construct.lua"
Scale = 1
SelectionWidth = 40.0
SelectionHeight = 40.0
SelectionOffset = { 0.0, -40.5 }
Mass = 40.0
HitPoints = 100
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

NodeEffects =
{
	--[[{
		NodeName = "tht2",
		EffectPath = path .. "/effects/th_thruster2.lua",
		Automatic = true,
	},]]
}

Root =
{
	Name = "thing",
	Angle = 0,
	Pivot = { 0, -0.29 },
	PivotOffset = { 0, 0 },
	Sprite = "thruster",
	--[[ChildrenBehind =
	{
		{
			Name = "th2",
			Angle = 0,
			Pivot = { 0, 0 },
			PivotOffset = { 0, 0 },
			Sprite = "thead2",
		},
		{
			Name = "tht2",
			Angle = 180,
			Pivot = { 0, 0 },
			PivotOffset = { 0, 0 },
		},
	},]]
}
