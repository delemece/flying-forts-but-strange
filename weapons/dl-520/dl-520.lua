Scale = 1
SelectionWidth = 70.0
SelectionHeight = 50
SelectionOffset = { 0.0, -68 }
RecessionBox =
{
	Size = { 200, 25 },
	Offset = { -300, -70 },
}

WeaponMass = 180.0
HitPoints = 420.0
EnergyProductionRate = 0.0
MetalProductionRate = 0.0
EnergyStorageCapacity = 0.0
MetalStorageCapacity = 0.0
MinWindEfficiency = 1
MaxWindHeight = 0
MaxRotationalSpeed = 0
DeviceSplashDamage = 150
DeviceSplashDamageMaxRadius = 400
DeviceSplashDamageDelay = 0.2
IncendiaryRadius = 120
IncendiaryRadiusHeated = 150
StructureSplashDamage = 200
StructureSplashDamageMaxRadius = 150

FireEffect = path ..  "/effects/fire_dl500.lua"
ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_complete.lua"
DestroyEffect = "effects/cannon_explode.lua"
DestroyUnderwaterEffect = "mods/dlc2/effects/device_explode_submerged_large.lua"
ShellEffect = "effects/shell_eject_cannon.lua"
ReloadEffectOffset = 0
RetriggerFireEffect = false
Projectile = "dl500"
BarrelLength = 100.0 
MinFireClearance = 500
FireClearanceOffsetInner = 20
FireClearanceOffsetOuter = 40
ReloadTime = 26
MinFireSpeed = 8000.0
MaxFireSpeed = 8000.1
MinFireRadius = 600.0
MaxFireRadius = 1200.0
MinFireAngle = -20
MaxFireAngle = 25
KickbackMean = 15
KickbackStdDev = 3
MouseSensitivityFactor = 0.5
PanDuration = 0
FireStdDev = 0.01
FireStdDevAuto = 0.01
Recoil = 1000000
EnergyFireCost = 5000.0
MetalFireCost = 20
ShowFireAngle = true
RoundsEachBurst = 1
RoundPeriod = 0.2
--UniformSpray = true
ReloadFramePeriod = (ReloadTime + RoundsEachBurst*RoundPeriod)/12
DoorCloseDelay = 1
AutofireCloseDoorTicks = DoorCloseDelay*25

BarrelRecoilLimit = -0.2
BarrelRecoilSpeed = -2
BarrelReturnForce = 0.5




TargetIcon =
{
	Persistent = true,
	Texture = "ui/textures/mouse_target.tga",
	Width = 32,
	Height = 32,
}

dofile("effects/device_smoke.lua")
SmokeEmitter = StandardDeviceSmokeEmitter

Sprites =
{
	{
		Name = "dl-520-base",
		States =
		{
			Normal = { Frames = { { texture = path .. "/weapons/dl-520/base.png" }, mipmap = true, }, },
			Idle = Normal,
		},
	},
	{
		Name = "dl-520-head",
		States =
		{
			Normal = { Frames = { { texture = path .. "/weapons/dl-520/head.png" }, mipmap = true, }, },
			Idle = Normal,
		},
	},
	{
		Name = "dl-520-barrel",
		States =
		{
			Normal = { Frames = { { texture = path .. "/weapons/dl-520/barrel.png" }, mipmap = true, }, },
			Idle = Normal,
		},
	},
}

NodeEffects =
{
	{
		NodeName = "Hardpoint0",
		EffectPath = "effects/weapon_overheated.lua",
		Automatic = false,
	},
}

Root =
{
	Name = "base",
	Angle = 0,
	Pivot = { 0.23, -0.55 },
	PivotOffset = { 0, 0 },
	Sprite = "dl-520-base",
	UserData = 0,
	
	ChildrenBehind =
	{
		{
			Name = "Head",
			Angle = 0,
			Pivot = { -0.18, -0.1 },
			PivotOffset = { 0.18, 0.1 },
			Sprite = "dl-520-head",
			UserData = 0,

			ChildrenBehind =
			{
				{
					Name = "Barrel",
					Angle = 0,
					Pivot = { 0.0, 0.0 },
					PivotOffset = { 0.0, 0.0 },
					Sprite = "dl-520-barrel",
					UserData = 0,

					ChildrenBehind =
			
					{
						{
							Name = "Hardpoint0",
							Angle = 90,
							Pivot = { 0.3, -0.1 },
							PivotOffset = { 0, 0 },
						},
						{
							Name = "Chamber",
							Angle = 0,
							Pivot = { -0.5, 0.0 },
							PivotOffset = { 0, 0 },
						},
					},
				},
			},
		},
	},
}
