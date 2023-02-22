
--// Cache

local loadstring, getgenv, setclipboard, tablefind, UserInputService = loadstring, getgenv, setclipboard, table.find, game:GetService("UserInputService")

--// Loaded check

if getgenv().SympleHub then return end
getgenv().SympleHub = {}

--// Load Aimbot V1.1, Load Esp v1


loadstring(game:HttpGet("https://raw.githubusercontent.com/HelpWizz/AimbotV1.15/main/Modules/Aimbot.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/HelpWizz/AimbotV1.15/main/Modules/Esp.lua"))()

--// Variables


local Aimbot, Esp = getgenv().SympleHub.Aimbot, getgenv().SympleHub.Esp

local Library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)() -- Pepsi's UI Library

local Parts, Fonts, TracersType = {"Head", "HumanoidRootPart", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg", "UpperTorso", "LeftUpperLeg", "RightFoot", "RightLowerLeg", "LowerTorso", "RightUpperLeg"}, {"UI", "System", "Plex", "Monospace"}, {"Bottom", "Center", "Mouse"}

--// Frame

Library.UnloadCallback = function()
	Aimbot.Functions:Exit()
	Esp.Functions:Exit()
	getgenv().SympleHub = nil
end

local MainFrame = Library:CreateWindow({
	Name = "SympleHub",
	Themeable = {
		Image = "7059346386",
		Info = "Made by Symple ur fav dev",
		Credit = false
	},
	Background = "",
	Theme = [[{"__Designer.Colors.section":"B0AFB0","__Designer.Colors.topGradient":"232323","__Designer.Settings.ShowHideKey":"Enum.KeyCode.RightShift","__Designer.Colors.otherElementText":"817F81","__Designer.Colors.hoveredOptionBottom":"2D2D2D","__Designer.Background.ImageAssetID":"","__Designer.Colors.unhoveredOptionTop":"323232","__Designer.Colors.innerBorder":"493E49","__Designer.Colors.unselectedOption":"282828","__Designer.Background.UseBackgroundImage":false,"__Designer.Files.WorkspaceFile":"Aimbot V1","__Designer.Colors.main":"FF2626","__Designer.Colors.outerBorder":"0F0F0F","__Designer.Background.ImageColor":"FFFFFF","__Designer.Colors.tabText":"C9DFF1","__Designer.Colors.elementBorder":"141414","__Designer.Colors.sectionBackground":"232222","__Designer.Colors.selectedOption":"373737","__Designer.Colors.background":"282828","__Designer.Colors.bottomGradient":"1D1D1D","__Designer.Background.ImageTransparency":95,"__Designer.Colors.hoveredOptionTop":"414141","__Designer.Colors.elementText":"939193","__Designer.Colors.unhoveredOptionBottom":"232323"}]]
})

--// Tabs
local AimbotTab = MainFrame:CreateTab({
	Name = "Aimbot"
})

local VisualsTab = MainFrame:CreateTab({
	Name = "Visuals"
})

local CrosshairTab = MainFrame:CreateTab({
	Name = "Crosshair"
})

local FunctionsTab = MainFrame:CreateTab({
	Name = "Functions"
})

--// Aimbot Sections

local Values = AimbotTab:CreateSection({
	Name = "Values"
})

local Checks = AimbotTab:CreateSection({
	Name = "Checks"
})

local ThirdPerson = AimbotTab:CreateSection({
	Name = "Third Person"
})

local FOV_Values = AimbotTab:CreateSection({
	Name = "Field Of View",
	Side = "Right"
})

local FOV_Appearance = AimbotTab:CreateSection({
	Name = "FOV Circle Appearance",
	Side = "Right"
})

--// Visuals Sections

local EspChecks = VisualsTab:CreateSection({
	Name = "Checks"
})

local ESPSettings = VisualsTab:CreateSection({
	Name = "ESP Settings"
})

local BoxesSettings = VisualsTab:CreateSection({
	Name = "Boxes Settings"
})

local ChamsSettings = VisualsTab:CreateSection({
	Name = "Chams Settings"
})

local TracersSettings = VisualsTab:CreateSection({
	Name = "Tracers Settings",
	Side = "Right"
})

local HeadDotsSettings = VisualsTab:CreateSection({
	Name = "Head Dots Settings",
	Side = "Right"
})

local HealthBarSettings = VisualsTab:CreateSection({
	Name = "Health Bar Settings",
	Side = "Right"
})

--// Crosshair Sections

local CrosshairSettings = CrosshairTab:CreateSection({
	Name = "Settings"
})

local CrosshairSettings_CenterDot = CrosshairTab:CreateSection({
	Name = "Center Dot Settings",
	Side = "Right"
})

--// Functions Sections

local FunctionsSection = FunctionsTab:CreateSection({
	Name = "Functions"
})

--// Aimbot Values

Values:AddToggle({
	Name = "Enabled",
	Value = Aimbot.Settings.Enabled,
	Callback = function(New, Old)
		Aimbot.Settings.Enabled = New
	end
}).Default = Aimbot.Settings.Enabled

Values:AddToggle({
	Name = "Toggle",
	Value = Aimbot.Settings.Toggle,
	Callback = function(New, Old)
		Aimbot.Settings.Toggle = New
	end
}).Default = Aimbot.Settings.Toggle

Aimbot.Settings.LockPart = Parts[1]; Values:AddDropdown({
	Name = "Lock Part",
	Value = Parts[1],
	Callback = function(New, Old)
		Aimbot.Settings.LockPart = New
	end,
	List = Parts,
	Nothing = "Head"
}).Default = Parts[1]

Values:AddTextbox({ -- Using a Textbox instead of a Keybind because the UI Library doesn't support Mouse inputs like Left Click / Right Click...
	Name = "Hotkey",
	Value = Aimbot.Settings.TriggerKey,
	Callback = function(New, Old)
		Aimbot.Settings.TriggerKey = New
	end
}).Default = Aimbot.Settings.TriggerKey

--[[
Values:AddKeybind({
	Name = "Hotkey",
	Value = Aimbot.Settings.TriggerKey,
	Callback = function(New, Old)
		Aimbot.Settings.TriggerKey = stringmatch(tostring(New), "Enum%.[UserInputType]*[KeyCode]*%.(.+)")
	end,
}).Default = Aimbot.Settings.TriggerKey
]]

Values:AddSlider({
	Name = "Sensitivity",
	Value = Aimbot.Settings.Sensitivity,
	Callback = function(New, Old)
		Aimbot.Settings.Sensitivity = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = Aimbot.Settings.Sensitivity

--// Aimbot Checks

Checks:AddToggle({
	Name = "Team Check",
	Value = Aimbot.Settings.TeamCheck,
	Callback = function(New, Old)
		Aimbot.Settings.TeamCheck = New
	end
}).Default = Aimbot.Settings.TeamCheck

Checks:AddToggle({
	Name = "Wall Check",
	Value = Aimbot.Settings.WallCheck,
	Callback = function(New, Old)
		Aimbot.Settings.WallCheck = New
	end
}).Default = Aimbot.Settings.WallCheck

Checks:AddToggle({
	Name = "Alive Check",
	Value = Aimbot.Settings.AliveCheck,
	Callback = function(New, Old)
		Aimbot.Settings.AliveCheck = New
	end
}).Default = Aimbot.Settings.AliveCheck

--// Aimbot ThirdPerson

ThirdPerson:AddToggle({
	Name = "Enable Third Person",
	Value = Aimbot.Settings.ThirdPerson,
	Callback = function(New, Old)
		Aimbot.Settings.ThirdPerson = New
	end
}).Default = Aimbot.Settings.ThirdPerson

ThirdPerson:AddSlider({
	Name = "Sensitivity",
	Value = Aimbot.Settings.ThirdPersonSensitivity,
	Callback = function(New, Old)
		Aimbot.Settings.ThirdPersonSensitivity = New
	end,
	Min = 0.1,
	Max = 5,
	Decimals = 1
}).Default = Aimbot.Settings.ThirdPersonSensitivity

--// FOV Settings Values

FOV_Values:AddToggle({
	Name = "Enabled",
	Value = Aimbot.FOVSettings.Enabled,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Enabled = New
	end
}).Default = Aimbot.FOVSettings.Enabled

FOV_Values:AddToggle({
	Name = "Visible",
	Value = Aimbot.FOVSettings.Visible,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Visible = New
	end
}).Default = Aimbot.FOVSettings.Visible

FOV_Values:AddSlider({
	Name = "Amount",
	Value = Aimbot.FOVSettings.Amount,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Amount = New
	end,
	Min = 10,
	Max = 300
}).Default = Aimbot.FOVSettings.Amount

--// FOV Settings Appearance

FOV_Appearance:AddToggle({
	Name = "Filled",
	Value = Aimbot.FOVSettings.Filled,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Filled = New
	end
}).Default = Aimbot.FOVSettings.Filled

FOV_Appearance:AddSlider({
	Name = "Transparency",
	Value = Aimbot.FOVSettings.Transparency,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Transparency = New
	end,
	Min = 0,
	Max = 1,
	Decimal = 1
}).Default = Aimbot.FOVSettings.Transparency

FOV_Appearance:AddSlider({
	Name = "Sides",
	Value = Aimbot.FOVSettings.Sides,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Sides = New
	end,
	Min = 3,
	Max = 60
}).Default = Aimbot.FOVSettings.Sides

FOV_Appearance:AddSlider({
	Name = "Thickness",
	Value = Aimbot.FOVSettings.Thickness,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Thickness = New
	end,
	Min = 1,
	Max = 50
}).Default = Aimbot.FOVSettings.Thickness

FOV_Appearance:AddColorpicker({
	Name = "Color",
	Value = Aimbot.FOVSettings.Color,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Color = New
	end
}).Default = Aimbot.FOVSettings.Color

FOV_Appearance:AddColorpicker({
	Name = "Locked Color",
	Value = Aimbot.FOVSettings.LockedColor,
	Callback = function(New, Old)
		Aimbot.FOVSettings.LockedColor = New
	end
}).Default = Aimbot.FOVSettings.LockedColor

--// Wall Hack Settings

EspChecks:AddToggle({
	Name = "Enabled",
	Value = Esp.Settings.Enabled,
	Callback = function(New, Old)
		Esp.Settings.Enabled = New
	end
}).Default = Esp.Settings.Enabled

EspChecks:AddToggle({
	Name = "Team Check",
	Value = Esp.Settings.TeamCheck,
	Callback = function(New, Old)
		Esp.Settings.TeamCheck = New
	end
}).Default = Esp.Settings.TeamCheck

EspChecks:AddToggle({
	Name = "Alive Check",
	Value = Esp.Settings.AliveCheck,
	Callback = function(New, Old)
		Esp.Settings.AliveCheck = New
	end
}).Default = Esp.Settings.AliveCheck

--// Visuals Settings

ESPSettings:AddToggle({
	Name = "Enabled",
	Value = Esp.Visuals.ESPSettings.Enabled,
	Callback = function(New, Old)
		Esp.Visuals.ESPSettings.Enabled = New
	end
}).Default = Esp.Visuals.ESPSettings.Enabled

ESPSettings:AddToggle({
	Name = "Outline",
	Value = Esp.Visuals.ESPSettings.Outline,
	Callback = function(New, Old)
		Esp.Visuals.ESPSettings.Outline = New
	end
}).Default = Esp.Visuals.ESPSettings.Outline

ESPSettings:AddToggle({
	Name = "Display Distance",
	Value = Esp.Visuals.ESPSettings.DisplayDistance,
	Callback = function(New, Old)
		Esp.Visuals.ESPSettings.DisplayDistance = New
	end
}).Default = Esp.Visuals.ESPSettings.DisplayDistance

ESPSettings:AddToggle({
	Name = "Display Health",
	Value = Esp.Visuals.ESPSettings.DisplayHealth,
	Callback = function(New, Old)
		Esp.Visuals.ESPSettings.DisplayHealth = New
	end
}).Default = Esp.Visuals.ESPSettings.DisplayHealth

ESPSettings:AddToggle({
	Name = "Display Name",
	Value = Esp.Visuals.ESPSettings.DisplayName,
	Callback = function(New, Old)
		Esp.Visuals.ESPSettings.DisplayName = New
	end
}).Default = Esp.Visuals.ESPSettings.DisplayName

ESPSettings:AddSlider({
	Name = "Offset",
	Value = Esp.Visuals.ESPSettings.Offset,
	Callback = function(New, Old)
		Esp.Visuals.ESPSettings.Offset = New
	end,
	Min = -30,
	Max = 30
}).Default = Esp.Visuals.ESPSettings.Offset

ESPSettings:AddColorpicker({
	Name = "Text Color",
	Value = Esp.Visuals.ESPSettings.TextColor,
	Callback = function(New, Old)
		Esp.Visuals.ESPSettings.TextColor = New
	end
}).Default = Esp.Visuals.ESPSettings.TextColor

ESPSettings:AddColorpicker({
	Name = "Outline Color",
	Value = Esp.Visuals.ESPSettings.OutlineColor,
	Callback = function(New, Old)
		Esp.Visuals.ESPSettings.OutlineColor = New
	end
}).Default = Esp.Visuals.ESPSettings.OutlineColor

ESPSettings:AddSlider({
	Name = "Text Transparency",
	Value = Esp.Visuals.ESPSettings.TextTransparency,
	Callback = function(New, Old)
		Esp.Visuals.ESPSettings.TextTransparency = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = Esp.Visuals.ESPSettings.TextTransparency

ESPSettings:AddSlider({
	Name = "Text Size",
	Value = Esp.Visuals.ESPSettings.TextSize,
	Callback = function(New, Old)
		Esp.Visuals.ESPSettings.TextSize = New
	end,
	Min = 8,
	Max = 24
}).Default = Esp.Visuals.ESPSettings.TextSize

ESPSettings:AddDropdown({
	Name = "Text Font",
	Value = Fonts[Esp.Visuals.ESPSettings.TextFont + 1],
	Callback = function(New, Old)
		Esp.Visuals.ESPSettings.TextFont = Drawing.Fonts[New]
	end,
	List = Fonts,
	Nothing = "UI"
}).Default = Fonts[Esp.Visuals.ESPSettings.TextFont + 1]

BoxesSettings:AddToggle({
	Name = "Enabled",
	Value = Esp.Visuals.BoxSettings.Enabled,
	Callback = function(New, Old)
		Esp.Visuals.BoxSettings.Enabled = New
	end
}).Default = Esp.Visuals.BoxSettings.Enabled

BoxesSettings:AddSlider({
	Name = "Transparency",
	Value = Esp.Visuals.BoxSettings.Transparency,
	Callback = function(New, Old)
		Esp.Visuals.BoxSettings.Transparency = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = Esp.Visuals.BoxSettings.Transparency

BoxesSettings:AddSlider({
	Name = "Thickness",
	Value = Esp.Visuals.BoxSettings.Thickness,
	Callback = function(New, Old)
		Esp.Visuals.BoxSettings.Thickness = New
	end,
	Min = 1,
	Max = 5
}).Default = Esp.Visuals.BoxSettings.Thickness

BoxesSettings:AddSlider({
	Name = "Scale Increase (For 3D)",
	Value = Esp.Visuals.BoxSettings.Increase,
	Callback = function(New, Old)
		Esp.Visuals.BoxSettings.Increase = New
	end,
	Min = 1,
	Max = 5
}).Default = Esp.Visuals.BoxSettings.Increase

BoxesSettings:AddColorpicker({
	Name = "Color",
	Value = Esp.Visuals.BoxSettings.Color,
	Callback = function(New, Old)
		Esp.Visuals.BoxSettings.Color = New
	end
}).Default = Esp.Visuals.BoxSettings.Color

BoxesSettings:AddDropdown({
	Name = "Type",
	Value = Esp.Visuals.BoxSettings.Type == 1 and "3D" or "2D",
	Callback = function(New, Old)
		Esp.Visuals.BoxSettings.Type = New == "3D" and 1 or 2
	end,
	List = {"3D", "2D"},
	Nothing = "3D"
}).Default = Esp.Visuals.BoxSettings.Type == 1 and "3D" or "2D"

BoxesSettings:AddToggle({
	Name = "Filled (2D Square)",
	Value = Esp.Visuals.BoxSettings.Filled,
	Callback = function(New, Old)
		Esp.Visuals.BoxSettings.Filled = New
	end
}).Default = Esp.Visuals.BoxSettings.Filled

ChamsSettings:AddToggle({
	Name = "Enabled",
	Value = Esp.Visuals.ChamsSettings.Enabled,
	Callback = function(New, Old)
		Esp.Visuals.ChamsSettings.Enabled = New
	end
}).Default = Esp.Visuals.ChamsSettings.Enabled

ChamsSettings:AddToggle({
	Name = "Filled",
	Value = Esp.Visuals.ChamsSettings.Filled,
	Callback = function(New, Old)
		Esp.Visuals.ChamsSettings.Filled = New
	end
}).Default = Esp.Visuals.ChamsSettings.Filled

ChamsSettings:AddToggle({
	Name = "Entire Body (For R15 Rigs)",
	Value = Esp.Visuals.ChamsSettings.EntireBody,
	Callback = function(New, Old)
		Esp.Visuals.ChamsSettings.EntireBody = New
	end
}).Default = Esp.Visuals.ChamsSettings.EntireBody

ChamsSettings:AddSlider({
	Name = "Transparency",
	Value = Esp.Visuals.ChamsSettings.Transparency,
	Callback = function(New, Old)
		Esp.Visuals.ChamsSettings.Transparency = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = Esp.Visuals.ChamsSettings.Transparency

ChamsSettings:AddSlider({
	Name = "Thickness",
	Value = Esp.Visuals.ChamsSettings.Thickness,
	Callback = function(New, Old)
		Esp.Visuals.ChamsSettings.Thickness = New
	end,
	Min = 0,
	Max = 3
}).Default = Esp.Visuals.ChamsSettings.Thickness

ChamsSettings:AddColorpicker({
	Name = "Color",
	Value = Esp.Visuals.ChamsSettings.Color,
	Callback = function(New, Old)
		Esp.Visuals.ChamsSettings.Color = New
	end
}).Default = Esp.Visuals.ChamsSettings.Color

TracersSettings:AddToggle({
	Name = "Enabled",
	Value = Esp.Visuals.TracersSettings.Enabled,
	Callback = function(New, Old)
		Esp.Visuals.TracersSettings.Enabled = New
	end
}).Default = Esp.Visuals.TracersSettings.Enabled

TracersSettings:AddSlider({
	Name = "Transparency",
	Value = Esp.Visuals.TracersSettings.Transparency,
	Callback = function(New, Old)
		Esp.Visuals.TracersSettings.Transparency = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = Esp.Visuals.TracersSettings.Transparency

TracersSettings:AddSlider({
	Name = "Thickness",
	Value = Esp.Visuals.TracersSettings.Thickness,
	Callback = function(New, Old)
		Esp.Visuals.TracersSettings.Thickness = New
	end,
	Min = 1,
	Max = 5
}).Default = Esp.Visuals.TracersSettings.Thickness

TracersSettings:AddColorpicker({
	Name = "Color",
	Value = Esp.Visuals.TracersSettings.Color,
	Callback = function(New, Old)
		Esp.Visuals.TracersSettings.Color = New
	end
}).Default = Esp.Visuals.TracersSettings.Color

TracersSettings:AddDropdown({
	Name = "Start From",
	Value = TracersType[Esp.Visuals.TracersSettings.Type],
	Callback = function(New, Old)
		Esp.Visuals.TracersSettings.Type = tablefind(TracersType, New)
	end,
	List = TracersType,
	Nothing = "Bottom"
}).Default = Fonts[Esp.Visuals.TracersSettings.Type + 1]

HeadDotsSettings:AddToggle({
	Name = "Enabled",
	Value = Esp.Visuals.HeadDotSettings.Enabled,
	Callback = function(New, Old)
		Esp.Visuals.HeadDotSettings.Enabled = New
	end
}).Default = Esp.Visuals.HeadDotSettings.Enabled

HeadDotsSettings:AddToggle({
	Name = "Filled",
	Value = Esp.Visuals.HeadDotSettings.Filled,
	Callback = function(New, Old)
		Esp.Visuals.HeadDotSettings.Filled = New
	end
}).Default = Esp.Visuals.HeadDotSettings.Filled

HeadDotsSettings:AddSlider({
	Name = "Transparency",
	Value = Esp.Visuals.HeadDotSettings.Transparency,
	Callback = function(New, Old)
		Esp.Visuals.HeadDotSettings.Transparency = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = Esp.Visuals.HeadDotSettings.Transparency

HeadDotsSettings:AddSlider({
	Name = "Thickness",
	Value = Esp.Visuals.HeadDotSettings.Thickness,
	Callback = function(New, Old)
		Esp.Visuals.HeadDotSettings.Thickness = New
	end,
	Min = 1,
	Max = 5
}).Default = Esp.Visuals.HeadDotSettings.Thickness

HeadDotsSettings:AddSlider({
	Name = "Sides",
	Value = Esp.Visuals.HeadDotSettings.Sides,
	Callback = function(New, Old)
		Esp.Visuals.HeadDotSettings.Sides = New
	end,
	Min = 3,
	Max = 60
}).Default = Esp.Visuals.HeadDotSettings.Sides

HeadDotsSettings:AddColorpicker({
	Name = "Color",
	Value = Esp.Visuals.HeadDotSettings.Color,
	Callback = function(New, Old)
		Esp.Visuals.HeadDotSettings.Color = New
	end
}).Default = Esp.Visuals.HeadDotSettings.Color

HealthBarSettings:AddToggle({
	Name = "Enabled",
	Value = Esp.Visuals.HealthBarSettings.Enabled,
	Callback = function(New, Old)
		Esp.Visuals.HealthBarSettings.Enabled = New
	end
}).Default = Esp.Visuals.HealthBarSettings.Enabled

HealthBarSettings:AddDropdown({
	Name = "Position",
	Value = Esp.Visuals.HealthBarSettings.Type == 1 and "Top" or Esp.Visuals.HealthBarSettings.Type == 2 and "Bottom" or Esp.Visuals.HealthBarSettings.Type == 3 and "Left" or "Right",
	Callback = function(New, Old)
		Esp.Visuals.HealthBarSettings.Type = New == "Top" and 1 or New == "Bottom" and 2 or New == "Left" and 3 or 4
	end,
	List = {"Top", "Bottom", "Left", "Right"},
	Nothing = "Left"
}).Default = Esp.Visuals.HealthBarSettings.Type == 1 and "Top" or Esp.Visuals.HealthBarSettings.Type == 2 and "Bottom" or Esp.Visuals.HealthBarSettings.Type == 3 and "Left" or "Right"

HealthBarSettings:AddSlider({
	Name = "Transparency",
	Value = Esp.Visuals.HealthBarSettings.Transparency,
	Callback = function(New, Old)
		Esp.Visuals.HealthBarSettings.Transparency = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = Esp.Visuals.HealthBarSettings.Transparency

HealthBarSettings:AddSlider({
	Name = "Size",
	Value = Esp.Visuals.HealthBarSettings.Size,
	Callback = function(New, Old)
		Esp.Visuals.HealthBarSettings.Size = New
	end,
	Min = 2,
	Max = 10
}).Default = Esp.Visuals.HealthBarSettings.Size

HealthBarSettings:AddSlider({
	Name = "Blue",
	Value = Esp.Visuals.HealthBarSettings.Blue,
	Callback = function(New, Old)
		Esp.Visuals.HealthBarSettings.Blue = New
	end,
	Min = 0,
	Max = 255
}).Default = Esp.Visuals.HealthBarSettings.Blue

HealthBarSettings:AddSlider({
	Name = "Offset",
	Value = Esp.Visuals.HealthBarSettings.Offset,
	Callback = function(New, Old)
		Esp.Visuals.HealthBarSettings.Offset = New
	end,
	Min = -30,
	Max = 30
}).Default = Esp.Visuals.HealthBarSettings.Offset

HealthBarSettings:AddColorpicker({
	Name = "Outline Color",
	Value = Esp.Visuals.HealthBarSettings.OutlineColor,
	Callback = function(New, Old)
		Esp.Visuals.HealthBarSettings.OutlineColor = New
	end
}).Default = Esp.Visuals.HealthBarSettings.OutlineColor

--// Crosshair Settings

CrosshairSettings:AddToggle({
	Name = "Mouse Cursor",
	Value = UserInputService.MouseIconEnabled,
	Callback = function(New, Old)
		UserInputService.MouseIconEnabled = New
	end
}).Default = UserInputService.MouseIconEnabled

CrosshairSettings:AddToggle({
	Name = "Enabled",
	Value = Esp.Crosshair.Settings.Enabled,
	Callback = function(New, Old)
		Esp.Crosshair.Settings.Enabled = New
	end
}).Default = Esp.Crosshair.Settings.Enabled

CrosshairSettings:AddColorpicker({
	Name = "Color",
	Value = Esp.Crosshair.Settings.Color,
	Callback = function(New, Old)
		Esp.Crosshair.Settings.Color = New
	end
}).Default = Esp.Crosshair.Settings.Color

CrosshairSettings:AddSlider({
	Name = "Transparency",
	Value = Esp.Crosshair.Settings.Transparency,
	Callback = function(New, Old)
		Esp.Crosshair.Settings.Transparency = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = Esp.Crosshair.Settings.Transparency

CrosshairSettings:AddSlider({
	Name = "Size",
	Value = Esp.Crosshair.Settings.Size,
	Callback = function(New, Old)
		Esp.Crosshair.Settings.Size = New
	end,
	Min = 8,
	Max = 24
}).Default = Esp.Crosshair.Settings.Size

CrosshairSettings:AddSlider({
	Name = "Thickness",
	Value = Esp.Crosshair.Settings.Thickness,
	Callback = function(New, Old)
		Esp.Crosshair.Settings.Thickness = New
	end,
	Min = 1,
	Max = 5
}).Default = Esp.Crosshair.Settings.Thickness

CrosshairSettings:AddSlider({
	Name = "Gap Size",
	Value = Esp.Crosshair.Settings.GapSize,
	Callback = function(New, Old)
		Esp.Crosshair.Settings.GapSize = New
	end,
	Min = 0,
	Max = 20
}).Default = Esp.Crosshair.Settings.GapSize

CrosshairSettings:AddSlider({
	Name = "Rotation (Degrees)",
	Value = Esp.Crosshair.Settings.Rotation,
	Callback = function(New, Old)
		Esp.Crosshair.Settings.Rotation = New
	end,
	Min = -180,
	Max = 180
}).Default = Esp.Crosshair.Settings.Rotation

CrosshairSettings:AddDropdown({
	Name = "Position",
	Value = Esp.Crosshair.Settings.Type == 1 and "Mouse" or "Center",
	Callback = function(New, Old)
		Esp.Crosshair.Settings.Type = New == "Mouse" and 1 or 2
	end,
	List = {"Mouse", "Center"},
	Nothing = "Mouse"
}).Default = Esp.Crosshair.Settings.Type == 1 and "Mouse" or "Center"

CrosshairSettings_CenterDot:AddToggle({
	Name = "Center Dot",
	Value = Esp.Crosshair.Settings.CenterDot,
	Callback = function(New, Old)
		Esp.Crosshair.Settings.CenterDot = New
	end
}).Default = Esp.Crosshair.Settings.CenterDot

CrosshairSettings_CenterDot:AddColorpicker({
	Name = "Center Dot Color",
	Value = Esp.Crosshair.Settings.CenterDotColor,
	Callback = function(New, Old)
		Esp.Crosshair.Settings.CenterDotColor = New
	end
}).Default = Esp.Crosshair.Settings.CenterDotColor

CrosshairSettings_CenterDot:AddSlider({
	Name = "Center Dot Size",
	Value = Esp.Crosshair.Settings.CenterDotSize,
	Callback = function(New, Old)
		Esp.Crosshair.Settings.CenterDotSize = New
	end,
	Min = 1,
	Max = 6
}).Default = Esp.Crosshair.Settings.CenterDotSize

CrosshairSettings_CenterDot:AddSlider({
	Name = "Center Dot Transparency",
	Value = Esp.Crosshair.Settings.CenterDotTransparency,
	Callback = function(New, Old)
		Esp.Crosshair.Settings.CenterDotTransparency = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = Esp.Crosshair.Settings.CenterDotTransparency

CrosshairSettings_CenterDot:AddToggle({
	Name = "Center Dot Filled",
	Value = Esp.Crosshair.Settings.CenterDotFilled,
	Callback = function(New, Old)
		Esp.Crosshair.Settings.CenterDotFilled = New
	end
}).Default = Esp.Crosshair.Settings.CenterDotFilled

--// Functions / Functions

FunctionsSection:AddButton({
	Name = "Reset Settings",
	Callback = function()
		Aimbot.Functions:ResetSettings()
		Esp.Functions:ResetSettings()
		Library.ResetAll()
	end
})

FunctionsSection:AddButton({
	Name = "Restart",
	Callback = function()
		Aimbot.Functions:Restart()
		Esp.Functions:Restart()
	end
})

FunctionsSection:AddButton({
	Name = "Exit",
	Callback = Library.Unload,
})


FunctionsSection:AddButton({
	Name = "Join Discord Server",
	Callback = function()
		setclipboard("https://discord.gg/aUqyytCq4c")
	end
})
