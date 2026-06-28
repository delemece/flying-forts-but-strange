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
RetriggerFireEffect = true
Projectile = "dl520P"
BarrelLength = 100.0 
MinFireClearance = 500
FireClearanceOffsetInner = 20
FireClearanceOffsetOuter = 40
ReloadTime = 30
MinFireSpeed = 14000.0
MaxFireSpeed = 14000.1
MinFireRadius = 300.0
MaxFireRadius = 1500.0

MaxFireClamp = 0.95

MinFireAngle = -30
MaxFireAngle = 40
KickbackMean = 15
KickbackStdDev = 3
MouseSensitivityFactor = 0.5
PanDuration = 0
FireStdDev = 0.01
FireStdDevAuto = 0.01
Recoil = 1000000
EnergyFireCost = 6000.0
MetalFireCost = 20
ShowFireAngle = true
RoundsEachBurst = 1
RoundPeriod = 0.3
--UniformSpray = true
ReloadFramePeriod = (ReloadTime + RoundsEachBurst*RoundPeriod)/12
DoorCloseDelay = 1
AutofireCloseDoorTicks = DoorCloseDelay*25

MouseSensitivityFactor = 0.2

BarrelRecoilLimit = -0.2
BarrelRecoilSpeed = -2
BarrelReturnForce = 0.5

TriggerProjectileAgeAction = true
MinAgeTrigger = 0.4
MaxAgeTrigger = 2.8

--[[ReloadBank =
{
	Max = 2,
	ReloadTime = 1,
	BaseMult = 0.6,
	IndexMult = 0.4,
	EnergyMult = 0.8,
	MetalMult = 0.8,
}]]

TargetIcon =
{
	Persistent = true,
	Texture = "ui/textures/mouse_target.tga",
	Width = 32,
	Height = 32,
}

dofile("effects/device_smoke.lua")
SmokeEmitter = StandardDeviceSmokeEmitter



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
							Pivot = { -0.3, 0.0 },
							PivotOffset = { 0, 0 },
						},
					},
				},
			},
		},
	},
}
