table.insert(Sprites, ButtonSprite("hud-th1-icon", "HUD/HUD-th1", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Devices, IndexOfDevice("sandbags") + 1,
{
	SaveName = "thruster1",
	FileName = path .. "/devices/thruster1.lua",
	Icon = "hud-th1-icon",
	Detail = "hud-detail-repairstation",
	BuildTimeComplete = 2,
	ScrapPeriod = 1,
	MetalCost = 500,
	EnergyCost = 2000,
	MetalRepairCost = 100,
	EnergyRepairCost = 750,
	MaxUpAngle = StandardMaxUpAngle,
	BuildOnGroundOnly = false,
})

table.insert(Sprites, ButtonSprite("hud-th2-icon", "HUD/HUD-th2", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Devices, IndexOfDevice("sandbags") + 2,
{
	SaveName = "thruster2",
	FileName = path .. "/devices/thruster2.lua",
	Icon = "hud-th2-icon",
	Detail = "hud-detail-repairstation",
	BuildTimeComplete = 2,
	ScrapPeriod = 1,
	MetalCost = 700,
	EnergyCost = 3000,
	MetalRepairCost = 100,
	EnergyRepairCost = 750,
	MaxUpAngle = StandardMaxUpAngle,
	BuildOnGroundOnly = false,
})

table.insert(Sprites, ButtonSprite("hud-tank_S-icon", "HUD/HUD-tank_S", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Devices, IndexOfDevice("sandbags") + 3,
{
	SaveName = "tank_S",
	FileName = path .. "/devices/tank_S.lua",
	Icon = "hud-tank_S-icon",
	Detail = "hud-detail-repairstation",
	BuildTimeComplete = 2,
	ScrapPeriod = 1,
	MetalCost = 200,
	EnergyCost = 2000,
	MetalRepairCost = 100,
	EnergyRepairCost = 750,
	MaxUpAngle = StandardMaxUpAngle,
	BuildOnGroundOnly = false,
})

table.insert(Sprites, ButtonSprite("hud-tank_B-icon", "HUD/HUD-tank_B", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Devices, IndexOfDevice("sandbags") + 4,
{
	SaveName = "Tank_B",
	FileName = path .. "/devices/tank_B.lua",
	Icon = "hud-tank_B-icon",
	Detail = "hud-detail-repairstation",
	BuildTimeComplete = 5,
	ScrapPeriod = 1,
	MetalCost = 500,
	EnergyCost = 4000,
	MetalRepairCost = 100,
	EnergyRepairCost = 750,
	MaxUpAngle = StandardMaxUpAngle,
	BuildOnGroundOnly = false,
})

table.insert(Sprites, ButtonSprite("hud-refuel-icon", "HUD/HUD-refuel", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Devices, IndexOfDevice("mine") + 1,
{
	SaveName = "refuel",
	FileName = path .. "/devices/refuel.lua",
	Icon = "hud-refuel-icon",
	Detail = "hud-detail-mine",
	BuildTimeComplete = 5,
	ScrapPeriod = 1,
	MetalCost = 500,
	EnergyCost = 5000,
	MetalRepairCost = 100,
	EnergyRepairCost = 750,
	MaxUpAngle = StandardMaxUpAngle,
	BuildOnGroundOnly = true,
})

table.insert(Sprites, ButtonSprite("hud-htf-icon", "HUD/HUD-htf", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Devices, IndexOfDevice("factory") + 1,
{
		Enabled = false,
		SaveName = "htf2",
		FileName = path .. "/devices/htf2.lua",
		Icon = "hud-htf-icon",
		Detail = "hud-detail-factory",
		BuildTimeIntermediate = 0.1,
		BuildTimeComplete = 0.0,
		ScrapPeriod = 0,
		MetalCost = 1,
		EnergyCost = 1,
		MetalRepairCost = 0,
		EnergyRepairCost = 0,
		MetalReclaimMin = 0.0,
		MetalReclaimMax = 0.0,
		EnergyReclaimMin = 0.0,
		EnergyReclaimMax = 0.0,
		MaxUpAngle = 30,
		BuildOnGroundOnly = false,
		SelectEffect = "ui/hud/devices/ui_devices",
		Tech = true,
		PopulationCap = 1,
})

table.insert(Sprites, ButtonSprite("hud-chas-icon", "HUD/HUD-chas", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Devices, IndexOfDevice("mine") + 2,
{
	SaveName = "chasics1",
	FileName = path .. "/devices/chasics.lua",
	Icon = "hud-chas-icon",
	Detail = "hud-detail-battery",
	BuildTimeComplete = 5,
	ScrapPeriod = 1,
	MetalCost = 200,
	EnergyCost = 2000,
	MetalRepairCost = 100,
	EnergyRepairCost = 750,
	MaxUpAngle = 55,
})
