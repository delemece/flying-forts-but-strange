--  age (in seconds) at which the explosion actor deletes itself
--  make sure this exceedes the age of all effects
LifeSpan = 10.0

Sprites =
{
	{
		Name = "pdet",

		States =
		{
			Normal =
			{
				Frames =
				{
					{ texture = path .. "/effects/media/ex1.png"},
					{ texture = path .. "/effects/media/ex2.png", colour = { 1, 1, 1, 0.0 }, duration = 2.5 }, -- just makes a blank frame long enough to last the rest of the effect

					duration = 0.2,
					blendColour = false,
					blendCoordinates = false,
				},
				--RandomPlayLength = 2,
				NextState = "Normal",
			},
		},
	},
}

Effects =
{
	{
		Type = "sound",
		TimeToTrigger = 0,
		TimeToTriggerStdDev = 0.00,
		FadeInPeriod = 0.0,
		LocalPosition = { x = 0, y = 0, z = 0 },
		Sound = path .. "/effects/media/pdet.mp3",
		Volume = 0.7,
		Priority = 192,
		Repeat = false,
		RandomiseStart = false,
	},
	

	{
		Type = "sprite",
		TimeToTrigger = 0,
		LocalPosition = { x = 0, y = 0, z = -100},
		LocalVelocity = { x = 0, y = 0, z = 0 },
		Acceleration = { x = 0, y = 0, z = 0 },
		Drag = 0.0,
		Sprite = "pdet",
		Additive = false,
		TimeToLive = .2,
		Angle = -90,
		InitialSize = 2.2,
		ExpansionRate = 4000,
		AngularVelocity = 0,
		RandomAngularVelocityMagnitude = 0,
		Colour1 = { 255, 255, 255, 255 },
		Colour2 = { 255, 255, 255, 255 },
	},
	
	
	{
		Type = "shake",
		PlayForEnemy = true,
		FalloffStart = 1500,
		FalloffEnd = 6000,
		TimeToTrigger = 0,
		TimeToLive = 0.7,
		Magnitude = 16,
	},
	
	
	{
	--DUST CLOUDS
		Type = "sparks",
		TimeToTrigger = 0,
		SparkCount = 24,
		LocalPosition = { x = 0, y = 0 },	-- how to place the origin relative to effect position and direction (0, 0) 
		Texture = path ..  "/effects/media/ex2",

		Gravity = 0,						-- gravity applied to particle (981 is earth equivalent)
		
		EvenDistribution =					-- distribute sparks evenly between two angles with optional variation
		{
			Min = -180,						-- minimum angle in degrees (e.g. -180, 45, 0)
			Max = 180,						-- maximum angle in degrees (e.g. -180, 45, 0)
			StdDev = 10,						-- standard deviation at each iteration in degrees (zero will make them space perfectly even)
		},

		Keyframes =							
		{
			{
				Angle = 0,
				RadialOffsetMin = 0,
				RadialOffsetMax = 360,
				ScaleMean = 2,
				ScaleStdDev = 0.5,
				SpeedStretch = 0,
				SpeedMean = 4000,	
				SpeedStdDev = 2000,
				Drag = 30,
				RotationMean = 0,
				RotationStdDev = 45,
				RotationalSpeedMean = 5,
				RotationalSpeedStdDev = 0,
				AgeMean = 5.5,
				AgeStdDev = 0.5,
				AlphaKeys = { 0, 3.5 },
				ScaleKeys = { 0, 0.2 },
			},
		},
	},
	{
	--DUST CLOUDS
		Type = "sparks",
		TimeToTrigger = 0,
		SparkCount = 9,
		LocalPosition = { x = 0, y = 0 },	-- how to place the origin relative to effect position and direction (0, 0) 
		Texture = path ..  "/effects/media/ex2",

		Gravity = 0,						-- gravity applied to particle (981 is earth equivalent)
		
		EvenDistribution =					-- distribute sparks evenly between two angles with optional variation
		{
			Min = -180,						-- minimum angle in degrees (e.g. -180, 45, 0)
			Max = 180,						-- maximum angle in degrees (e.g. -180, 45, 0)
			StdDev = 10,						-- standard deviation at each iteration in degrees (zero will make them space perfectly even)
		},

		Keyframes =							
		{
			{
				Angle = 0,
				RadialOffsetMin = 0,
				RadialOffsetMax = 360,
				ScaleMean = 4,
				ScaleStdDev = 0.5,
				SpeedStretch = 0,
				SpeedMean = 100,	
				SpeedStdDev = 100,
				Drag = 10,
				RotationMean = 0,
				RotationStdDev = 45,
				RotationalSpeedMean = 5,
				RotationalSpeedStdDev = 0,
				AgeMean = 5.5,
				AgeStdDev = 0.5,
				AlphaKeys = { 0, 3.5 },
				ScaleKeys = { 0, 0.2 },
			},
		},
	},
}


