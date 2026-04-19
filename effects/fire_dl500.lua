--  age (in seconds) at which the explosion actor deletes itself
--  make sure this exceedes the age of all effects
LifeSpan = 9.0

Sprites =
{
	{
		Name = "cannon_fire",

		States =
		{
			Normal =
			{
				Frames =
				{
					{ texture = "effects/media/cannon effect01.dds" },
					{ texture = "effects/media/cannon effect02.dds" },
					{ texture = "effects/media/cannon effect03.dds" },
					{ texture = "effects/media/cannon effect04.dds" },
					{ texture = "effects/media/cannon effect05.dds" },
					{ texture = "effects/media/cannon effect06.dds" },
					{ texture = "effects/media/cannon effect07.dds" },
					{ texture = "effects/media/cannon effect07.dds" },
					{ texture = "effects/media/cannon effect07.dds", colour = { 1, 1, 1, 0.0 }, duration = 2 }, -- just makes a blank frame long enough to last the rest of the effect

					duration = 0.05,
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
		Sound = path .. "/effects/media/dl-500.mp3",
		Volume = 0.45,
		Priority = 192,
		Repeat = false,
		RandomiseStart = false,
	},
	

	{
		Type = "sprite",
		TimeToTrigger = 0,
		LocalPosition = { x = 0, y = 200, z = 0 },
		LocalVelocity = { x = 0, y = 0, z = 0 },
		Acceleration = { x = 0, y = 0, z = 0 },
		Drag = 0.0,
		Sprite = "cannon_fire",
		Additive = false,
		TimeToLive = 2,
		Angle = -90,
		InitialSize = 3,
		ExpansionRate = 0,
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
		SparkCount = 12,
		LocalPosition = { x = 0, y = 0 },	-- how to place the origin relative to effect position and direction (0, 0) 
		Texture = path ..  "/effects/media/smoke",

		Gravity = 0,						-- gravity applied to particle (981 is earth equivalent)
		
		EvenDistribution =					-- distribute sparks evenly between two angles with optional variation
		{
			Min = -10,						-- minimum angle in degrees (e.g. -180, 45, 0)
			Max = 10,						-- maximum angle in degrees (e.g. -180, 45, 0)
			StdDev = 5,						-- standard deviation at each iteration in degrees (zero will make them space perfectly even)
		},

		Keyframes =							
		{
			{
				Angle = 0,
				RadialOffsetMin = 0,
				RadialOffsetMax = 20,
				ScaleMean = 6,
				ScaleStdDev = 0.5,
				SpeedStretch = 0,
				SpeedMean = 600,	
				SpeedStdDev = 200,
				Drag = 1,
				RotationMean = 0,
				RotationStdDev = 45,
				RotationalSpeedMean = 5,
				RotationalSpeedStdDev = 0,
				AgeMean = 1.5,
				AgeStdDev = 0.5,
				AlphaKeys = { 0.5, 0.5 },
				ScaleKeys = { 0.1, 0.5 },
			},
		},
	},
}


