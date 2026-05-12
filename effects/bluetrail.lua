
--  age (in seconds) at which the explosion actor deletes itself
--  make sure this exceedes the age of all effects
LifeSpan = 5.0

Effects =
{
	{
		Type = "trail",
		Texture = path .. "/effects/media/trail.dds",
		LocalPosition = { x = 0, y = 0, z = 9.0 },
		Colour = { 17, 39, 242, 254 },
		Width = 40,
		Length = 0.2,
		Keyframes = 20,
		KeyframePeriod = 0.01,
		RepeatRate = 0.001,
		ScrollRate = 0,
		FattenRate = 0,
	},
}
