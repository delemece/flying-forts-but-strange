-- fort wars device file

ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_complete.lua"
Scale = 1.0
SelectionWidth = 40.0
SelectionHeight = 40.0
SelectionOffset = { 0.0, -40.5 }
Mass = 1.0
HitPoints = 1.0


Sprites =
{
	{
		Name = "htf2",
		States =
		{
			Normal = { Frames = { { texture = path .. "/devices/htf/htf2.png" }, mipmap = true, }, },
		},
	},
}

Root =
{
	Name = "Battery",
	Angle = 0,
	Pivot = { 0, -0.7 },
	PivotOffset = { 0, 0 },
	Sprite = "htf2",
}
