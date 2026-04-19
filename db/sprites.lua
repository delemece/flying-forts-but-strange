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