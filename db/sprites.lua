		table.insert(
Sprites,
{
	Name = "firet",
	States =
	{
		Normal =
		{
			Frames =
			{
				{ texture = path .. "/effects/media/fire" },
				duration = 0.5,
				blendColour = false,
				blendCoordinates = false,
			},
			NextState = "Normal",
		},
	},
})	


		table.insert(
Sprites,
{

		Name = "smoket",
	States =
	{
		Normal =
		{
			Frames =
			{
				{ texture = path .. "/effects/media/smoke", colour = { 1, 1, 1, 0.0 }, duration = 0.5 },
				duration = 0.5,
				blendColour = false,
				blendCoordinates = false,
			},
			NextState = "Normal",
		},
	},
})

		table.insert(
Sprites,
{

		Name = "smoke2",
	States =
	{
		Normal =
		{
			Frames =
			{
				{ texture = path .. "/effects/media/ex2", colour = { 1, 1, 1, 0.0 }, duration = 1.5 },
				duration = 1.0,
				blendColour = false,
				blendCoordinates = false,
			},
			NextState = "Normal",
		},
	},
})

		table.insert(
Sprites,
{

	Name = "pdetonation",
	States =
	{
		Normal =
		{
			Frames =
			{
				{ texture = path .. "/effects/media/ex1", colour = { 1, 1, 1, 0.0 }, duration = 1 },			
				{ texture = path .. "/effects/media/ex2", colour = { 1, 1, 1, 0.0 }, duration = 1.5 },
				duration = 3,
				blendColour = false,
				blendCoordinates = false,
			},
			NextState = "Normal",
		},
	},
})

		table.insert(
Sprites,
{

	Name = "pdetonation2",
	States =
	{
		Normal =
		{
			Frames =
			{
				{ texture = path .. "/effects/media/ex1", colour = { 1, 1, 1, 0.0 }, duration = 0.5 },			
				duration = 0.5,
				blendColour = false,
				blendCoordinates = false,
			},
			NextState = "Normal",
		},
	},
})