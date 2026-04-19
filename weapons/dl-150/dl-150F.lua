Scale = 1
SelectionWidth = 49.0
SelectionHeight = 40
SelectionOffset = { 0, -41 }
RecessionBox =
{
	Size = { 200, 25 },
	Offset = { -300, -70 },
}

WeaponMass = 110.0
HitPoints = 200.0
EnergyProductionRate = 0.0
MetalProductionRate = 0.0
EnergyStorageCapacity = 0.0
MetalStorageCapacity = 0.0
MinWindEfficiency = 1
MaxWindHeight = 0
MaxRotationalSpeed = 0
DeviceSplashDamage = 150
DeviceSplashDamageMaxRadius = 200
DeviceSplashDamageDelay = 0.2
IncendiaryRadius = 120
IncendiaryRadiusHeated = 150
StructureSplashDamage = 150
StructureSplashDamageMaxRadius = 150

FireEffect = "effects/fire_cannon.lua"
ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_complete.lua"
DestroyEffect = "effects/cannon_explode.lua"
DestroyUnderwaterEffect = "mods/dlc2/effects/device_explode_submerged_large.lua"
ShellEffect = "effects/shell_eject_cannon.lua"
ReloadEffectOffset = 0
RetriggerFireEffect = false
Projectile = "dl150"
BarrelLength = 100.0 
MinFireClearance = 500
FireClearanceOffsetInner = 20
FireClearanceOffsetOuter = 40
ReloadTime = 0.6
MinFireSpeed = 6500.0
MaxFireSpeed = 6500.1
MinFireRadius = 600.0
MaxFireRadius = 1200.0
MinFireAngle = -80
MaxFireAngle = 5
KickbackMean = 15
KickbackStdDev = 3
MouseSensitivityFactor = 0.5
PanDuration = 0
FireStdDev = 0.02
FireStdDevAuto = 0.06
Recoil = 20000
EnergyFireCost = 1500.0
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

CanOverheat = true
HeatPeriod = 0.4
CoolPeriod = 999999
CoolPeriodOverheated = 20


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
		Name = "dl-150F-base",
		States =
		{
			Normal = { Frames = { { texture = path .. "/weapons/dl-150/baseflip.png" }, mipmap = true, }, },
			Idle = Normal,
		},
	},

}

--[[NodeEffects =
{
	{
		NodeName = "Hardpoint0",
		EffectPath = "effects/weapon_overheated.lua",
		Automatic = false,
	},
}]]

Root =
{
	Name = "base",
	Angle = 0,
	Pivot = { 0.0, 0.13 },
	PivotOffset = { 0, 0 },
	Sprite = "dl-150F-base",
	UserData = 0,
	
	ChildrenBehind =
	{
		{
			Name = "Head",
			Angle = 0,
			Pivot = { 0.1, 0.3 },
			PivotOffset = { 0.0, 0.0 },
			Sprite = "dl-150-head",
			UserData = 0,

			ChildrenBehind =
			{
				{
					Name = "Barrel",
					Angle = 0,
					Pivot = { 0.2, 0.0 },
					PivotOffset = { 0.0, 0.0 },
					Sprite = "dl-150-barrel",
					UserData = 0,

					ChildrenBehind =
			
					{
						{
							Name = "Hardpoint0",
							Angle = 90,
							Pivot = { 0.25, -0.1 },
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
