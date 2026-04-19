

table.insert(Projectiles,
{
		SaveName = "dl150",

		ProjectileType = "mortar",
		ProjectileSprite = "weapons/media/bullet",
		DrawBlurredProjectile = true,
		ProjectileMass = 20.0,
		ProjectileDrag = 0,
		ProjectileIncendiary = false,
		DeflectedByShields = false,
		ExplodeOnTouch = false,
		ProjectileThickness = 6.0,
		ProjectileShootDownRadius = 60,
		Impact = 100000,
		DisableShields = false,
		BeamTileRate = 0.02,
		BeamScrollRate = 0.0,
		ProjectileDamage = 320.0,
		ProjectileSplashDamage = 20,
		ProjectileSplashDamageMaxRadius = 200.0,
		SpeedIndicatorFactor = 0.05,
		TrailEffect = "/effects/cannon_trail.lua",

		MinAge = 5,
		MaxAge = 6,


	Effects =
		{
			Impact =
			{
				["device"] = "effects/impact_heavy.lua",
				["foundations"] = "effects/impact_heavy_ground.lua",
				["rocks01"] = "effects/impact_heavy_ground.lua",
				["bracing"] = "effects/impact_heavy.lua",
				["armour"] = "effects/impact_heavy.lua",
				["door"] = "effects/impact_heavy.lua",
				["default"] = "effects/impact_heavy.lua",
			},	
			Deflect =
			{
				["armour"] = "effects/armor_ricochet.lua",
				["door"] = "effects/armor_ricochet.lua",
				["shield"] = "effects/energy_shield_ricochet.lua",
			},
		},
		MomentumThreshold =
		{
			["armour"] = { Reflect = 0, Penetrate = 4000 },
			["door"] = { Reflect = 0, Penetrate = 4000 },
		},
})

table.insert(Projectiles,
{
		SaveName = "dl500",

		ProjectileType = "mortar",
		ProjectileSprite = "weapons/media/bullet",
		DrawBlurredProjectile = true,
		ProjectileMass = 80.0,
		ProjectileDrag = 0,
		ProjectileIncendiary = false,
		DeflectedByShields = false,
		ExplodeOnTouch = false,
		ProjectileThickness = 12.0,
		ProjectileShootDownRadius = 60,
		Impact = 200000,
		BeamTileRate = 0.02,
		BeamScrollRate = 0.0,
		ProjectileDamage = 850.0,
		ProjectileSplashDamage = 20,
		ProjectileSplashDamageMaxRadius = 100.0,
		SpeedIndicatorFactor = 15,
		DestroyShields = true,


		TrailEffect = "/effects/cannon_trail.lua",

	Effects =
		{
			Impact =
			{
				["device"] = "effects/impact_heavy.lua",
				["foundations"] = "effects/impact_heavy_ground.lua",
				["rocks01"] = "effects/impact_heavy_ground.lua",
				["bracing"] = "effects/impact_heavy.lua",
				["armour"] = "effects/impact_heavy.lua",
				["door"] = "effects/impact_heavy.lua",
				["default"] = "effects/impact_heavy.lua",

			},	
			Deflect =
			{
				["armour"] = "effects/armor_ricochet.lua",
				["door"] = "effects/armor_ricochet.lua",
			},
			Penetrate =
			{
				["shield"] = {"effects/energy_shield_ricochet.lua", Terminate = false},
			},
		},
		MomentumThreshold =
		{
			["armour"] = { Reflect = 0, Penetrate = 4000 },
			["door"] = { Reflect = 0, Penetrate = 4000 },
		},
})

PDetonation = { Effect = "mods/weapon_pack/effects/fire_20mmcannon.lua", Projectile = { Count = 22, Type = "shrap", Speed = 4000, StdDev = 0.02, AngleOffset = 0.01 }, Offset = 0, Terminate = true, }

table.insert(Projectiles,
{
		SaveName = "dl500P",

		ProjectileType = "mortar",
		ProjectileSprite = "weapons/media/bullet",
		DrawBlurredProjectile = true,
		ProjectileMass = 80.0,
		ProjectileDrag = 0,
		ProjectileIncendiary = false,
		DeflectedByShields = false,
		ExplodeOnTouch = true,
		ProjectileThickness = 14.0,
		ProjectileShootDownRadius = 150,
		ProjectileShootDownRadiusBeamWidth = 15,
		Impact = 100000,
		BeamTileRate = 0.02,
		BeamScrollRate = 0.0,
		ProjectileDamage = 100.0,
		ProjectileSplashDamage = 5,
		ProjectileSplashDamageMaxRadius = 250.0,
		SpeedIndicatorFactor = 15,
		DestroyShields = true,
		ExplodeOnTouch = true,
		CollisionLookaheadDist = 700,
		AntiAirHitpoints = 60,

		TrailEffect = "/effects/cannon_trail.lua",

	Effects =
		{
		Impact =
		{
			["device"] = PDetonation,
			["foundations"] = PDetonation,
			["rocks01"] = PDetonation,
			["bracing"] = PDetonation,
			["backbracing"] = PDetonation,
			["armour"] = PDetonation,
			["door"] = PDetonation,
			["shield"] = PDetonation,
			["default"] = PDetonation,
		},
			Deflect =
			{
				["armour"] = "effects/armor_ricochet.lua",
				["door"] = "effects/armor_ricochet.lua",
			},
			Penetrate =
			{
				["shield"] = {"effects/energy_shield_ricochet.lua", Terminate = false},
			},
		},
		MomentumThreshold =
		{
			["armour"] = { Reflect = 0, Penetrate = 4000 },
			["door"] = { Reflect = 0, Penetrate = 4000 },
		},
				Age =
		{
			t200 = PDetonation,
		},
})

table.insert(Projectiles,
{
		SaveName = "shrap",

		ProjectileType = "bullet",
		ProjectileSprite = "weapons/media/bullet",
		DrawBlurredProjectile = true,
		ProjectileMass = 1.0,
		ProjectileDrag = 0,
		ProjectileIncendiary = false,
		DeflectedByShields = false,
		ExplodeOnTouch = false,
		ProjectileThickness = 3.0,
		ProjectileShootDownRadius = 60,
		Impact = 20000,
		DisableShields = false,
		BeamTileRate = 0.02,
		BeamScrollRate = 0.0,
		ProjectileDamage = 50.0,
		SpeedIndicatorFactor = 9,
		MinAge = 0.2,
		MaxAge = 1,
		TrailEffect = "/effects/cannon_trail.lua",

	Effects =
		{
			Impact =
			{
				["device"] = "effects/impact_light.lua",
				["foundations"] = "effects/impact_light_ground.lua",
				["rocks01"] = "effects/impact_light_ground.lua",
				["bracing"] = "effects/impact_light.lua",
				["armour"] = "effects/impact_light.lua",
				["door"] = "effects/impact_lingt.lua",
				["default"] = "effects/impact_light.lua",
			},	
			Deflect =
			{
				["armour"] = "effects/armor_ricochet.lua",
				["door"] = "effects/armor_ricochet.lua",
				["shield"] = "effects/energy_shield_ricochet.lua",
			},
		},
		MomentumThreshold =
		{
			["armour"] = { Reflect = 0, Penetrate = 4000 },
			["door"] = { Reflect = 0, Penetrate = 4000 },
		},
})

table.insert(Sprites,
{
				Name = "sn",
						
				States =
				{
					Normal =  
					{  
						Frames =
						{
							{ texture = path .. "/weapons/dl-520/snar.png" },
							duration = 0.03,
							mipmap = true,
						},
						NextState = "Normal",
					},
					
				},
})

--[[table.insert(Projectiles,
{
	SaveName = "33",

	ProjectileType = "mortar",
	ProjectileSprite = "sn",
	ProjectileSpriteMipMap = false,
	DrawBlurredProjectile = true,
	ProjectileMass = 40,
	ProjectileDrag = 0,
	Impact = 10000,
	DisableShields = false,
	DeflectedByShields = false,
	PassesThroughMaterials = false,
	ExplodeOnTouch = false,
	ProjectileThickness = 3.0,
	ProjectileShootDownRadius = 60,
	BeamTileRate = 0.02,
	BeamScrollRate = 0.0,
	ProjectileDamage = 15.0,
	AntiAirHitpoints = 37,
	SpeedIndicatorFactor = 0.25,
		MinAge = 2.7,
		MaxAge = 3,
	TrailEffect = "20mmcannon_trail",

	Effects =
	{
		Impact =
		{
			["default"] = "effects/impact_medium.lua",
		},	
		Deflect =
		{
			["armour"] = { Effect = "effects/armor_ricochet.lua" },
		},
	},


	DamageMultiplier =
	{
		{ SaveName = "sandbags", Direct = 1, Splash = 0.3 },
		{ SaveName = "armor", Direct = 1.5, Splash = 1.2 },
	},
})

table.insert(Projectiles,
{
	SaveName = "r-50",

	ProjectileType = "missile",
	DrawBlurredProjectile = false,
	ProjectileMass = 5.0,
	ProjectileDrag = 13,
	DisableShields = true,
	DeflectedByShields = false,
	ExplodeOnTouch = true,
	ProjectileThickness = 4.0,
	ProjectileShootDownRadius = 15,
	Impact = 100000,
	BeamTileRate = 0.02,
	BeamScrollRate = 0.0,
	ProjectileDamage = 450.0,
	ProjectileSplashDamage = 120.0,
	ProjectileSplashDamageMaxRadius = 200.0,
	ProjectileSplashMaxForce = 75000,
	SpeedIndicatorFactor = 0.05,
	IgnitesBackgroundMaterials = true,
	IgnitesBackgroundMaterialsPassing = true,
	IgnitesBackgroundMaterialsPassingSource = false,
	EMPSensitivity = 0,
	Gravity = 0,
	AntiAirDamage = 60,

	Projectile =
	{
		Root =
		{
			Name = "Root",
			Angle = 0,
			Sprite = path .. "/weapons/dlr-50/rocket",
			Pivot = { 0, 0.35 },

			ChildrenInFront =
			{
				{
					Name = "Flame",
					Angle = 0,
					Offset = { 0, 0.8 },
					Pivot = { 0, 0.1 },
					PivotOffset = { 0, 0 },
					Sprite = "missile_tail",
				},
			},
		}
	},

	TrailEffect = "mods/weapon_pack/effects/rocket_trail.lua",

	Missile =
	{
		ThrustAngleExtent = 15,
		ErraticAngleExtentStdDev = 0.1,
		ErraticAngleExtentMax = 0.4,
		MaxSteerPerSecond = 50,
		MaxSteerPerSecondErratic = 50,
		ErraticAnglePeriodMean = 0.1,
		ErraticAnglePeriodStdDev = 0.01,
		RocketThrust = 60000,
		RocketThrustChange = 8000,
		ErraticThrust = 1.4,
		CruiseTargetDistance = 300,
		CruiseTargetDuration = .5,
		TargetRearOffsetDistance = 1000,
		MinTargetUpdateDistance = 2000,
	},

	Effects =
	{
		Impact =
		{
				["device"] = "effects/impact_heavy.lua",
				["foundations"] = "effects/impact_heavy_ground.lua",
				["rocks01"] = "effects/impact_heavy_ground.lua",
				["bracing"] = "effects/impact_heavy.lua",
				["armour"] = "effects/impact_heavy.lua",
				["door"] = "effects/impact_heavy.lua",
				["default"] = "effects/impact_heavy.lua",
		},
		Deflect =
		{
		},
	},

})

]]