table.insert(Sprites, ButtonSprite("hud-group-infcontroller", "groups/Group-infcontroller", GroupButtonSpriteBottom, GroupButtonSpriteBottom, nil, nil, path))
table.insert(Sprites, ButtonSprite("hud-infcontroller-icon", "HUD/HUD-infcontroller", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Weapons, IndexOfWeapon("machinegun"),
{
		Enabled = true,
		SaveName = "infcontroller",
		FileName = path .. "/weapons/controller.lua",
		Icon = "hud-infcontroller-icon",
		GroupButton = "hud-group-infcontroller",
		Detail = "hud-detail-cannon",
		BuildTimeIntermediate = 3.0,
		BuildTimeComplete = 4.0,
		ScrapPeriod = 2,
		MetalCost = 200,
		EnergyCost = 3000,
		MetalRepairCost = 15,
		EnergyRepairCost = 250,
		MetalReclaimMin = 0.25,
		MetalReclaimMax = 0.5,
		EnergyReclaimMin = 0.1,
		EnergyReclaimMax = 0.5,
		MaxSpotterAssistance = 0, -- machinegun doesn't benefit from spotters
		MaxUpAngle = 30,
		BuildOnGroundOnly = false,
		SelectEffect = "ui/hud/weapons/ui_weapons",
})

table.insert(Sprites, DetailSprite("hud-detail-cannon", "dl-520", path))
table.insert(Sprites, ButtonSprite("hud-group-cannon", "groups/Group-cannon", GroupButtonSpriteBottom, GroupButtonSpriteBottom, nil, nil, path))
table.insert(Sprites, ButtonSprite("hud-dl-520-icon", "HUD/HUD-dl-520", nil, ButtonSpriteBottom, nil, nil, path))

table.insert(Weapons, IndexOfWeapon("cannon"),
{
		Enabled = true,
		SaveName = "dl_520",
		FileName = path .. "/weapons/dl-520/dl-520.lua",
		Icon = "hud-dl-520-icon",
		GroupButton = "hud-group-cannon",
		Detail = "hud-detail-cannon",
		BuildTimeIntermediate = 10.0,
		BuildTimeComplete = 35.0,
		ScrapPeriod = 3,
		MetalCost = 900,
		EnergyCost = 8000,
		MetalRepairCost = 15,
		EnergyRepairCost = 250,
		MetalReclaimMin = 0.25,
		MetalReclaimMax = 0.5,
		EnergyReclaimMin = 0.1,
		EnergyReclaimMax = 0.5,
		MaxSpotterAssistance = 0, -- machinegun doesn't benefit from spotters
		MaxUpAngle = 30,
		BuildOnGroundOnly = false,
		SelectEffect = "ui/hud/weapons/ui_weapons",
		Prerequisite = "munitions",
		Upgrades =
		{
			{
				Enabled = true,
				SaveName = "dl_520P",
				MetalCost = 100,
				EnergyCost = 6000,
			},
		},
			CompatibleGroupTypes =
	{
		"dl_520P",
	},
})

table.insert(Weapons, IndexOfWeapon("cannon"),
{
		Enabled = false,
		SaveName = "dl_520P",
		FileName = path .. "/weapons/dl-520/dl-520P.lua",
		Icon = "hud-dl-520-icon",
		GroupButton = "hud-group-cannon",
		Detail = "hud-detail-cannon",
		BuildTimeIntermediate = 10.0,
		BuildTimeComplete = 20.0,
		ScrapPeriod = 3,
		MetalCost = 700,
		EnergyCost = 4500,
		MetalRepairCost = 15,
		EnergyRepairCost = 250,
		MetalReclaimMin = 0.25,
		MetalReclaimMax = 0.5,
		EnergyReclaimMin = 0.1,
		EnergyReclaimMax = 0.5,
		MaxSpotterAssistance = 0, -- machinegun doesn't benefit from spotters
		MaxUpAngle = 30,
		BuildOnGroundOnly = false,
		SelectEffect = "ui/hud/weapons/ui_weapons",
		Prerequisite = "munitions" and "upgrade",
		Upgrades =
		{
			{
				Enabled = true,
				SaveName = "dl_520",
				MetalCost = 100,
				EnergyCost = 6000,
			},
		},
			CompatibleGroupTypes =
	{
		"dl_520",
	},
})