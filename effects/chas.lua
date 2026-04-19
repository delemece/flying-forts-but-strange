--  age (in seconds) at which the explosion deletes itself
--  make sure this exceedes the age of all effects
LifeSpan = 9999999999



Effects =
{
	{
		Type = "sparks",
		TimeToTrigger = 0.0,
		SparkCount = 20,
		BurstPeriod = 0.01,
		SparksPerBurst = 1,
		LocalPosition = { x = 0, y = 20, z = -50 },	-- how to place the origin relative to effect position and direction (0, 0) 
		Sprite = path .. "/effects/media/pholder.png",

		Gravity = 0,						-- gravity applied to particle (981 is earth equivalent)

		NormalDistribution =					-- distribute sparks evenly between two angles with optional variation
		{
			Mean = 0,
			StdDev = 0,						-- standard deviation at each iteration in degrees (zero will make them space perfectly even)
		},
		
		Keyframes =							
		{
			{
				Angle = -180,					-- angle of keyframe in degrees (e.g. -180, 45, 0)
				RadialOffsetMin = 0,		-- minimum distance from effect origin
				RadialOffsetMax = 0,		-- maximum distance from effect origin
				ScaleMean = 1.0,			-- mean scale (normal distribution)
				ScaleStdDev = 0,			-- standard deviation of scale (0 will make them all the same size)
				SpeedStretch = 0,			-- factor of speed by which to elongate the spark in the direction of travel (avoid using with rotation)
				SpeedMean = 0,				-- mean speed of sparks at emission (normal distribution)
				SpeedStdDev = 0,			-- standard deviation of spark speed at emission
				Drag = 0,					-- drag of sparks (zero will make them continue at same speed)
				RotationMean = 0,			-- mean initial rotation in degrees (e.g. -180, 45, 0) (normal distribution)
				RotationStdDev = 0,		-- standard deviation of initial rotation in degrees (zero will make them start at the same angle)
				RotationalSpeedMean = 0,	-- mean rotational speed in degrees per second (e.g. -180, 45, 0) (normal distribution)
				RotationalSpeedStdDev = 0,	-- standard deviation of rotational speed in degrees per second (zero will make them rotate at the same rate)
				AgeMean = 0.05,				-- mean age in seconds (normal distribution)
				AgeStdDev = 0,			-- standard deviation of age in seconds (zero makes them last the same length of time)
				AlphaKeys = { -1, 1 },	-- fractions of life span between which the spark reaches full alpha (fade in -> full alpha -> fade out)
				ScaleKeys = { -1, 1 },		-- fractions of life span between which the spark reaches full scale (balloon in -> full scale -> shrink out)
				colour = { 255, 255, 255, 255 }, -- Colour used to modulate the sprite
			},
		},
	},
}
