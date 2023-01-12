--[[
    I dont really care if you use this src 
    This will be taken off github soon but
    I need the source on my phone to edit
    This is mainly for no scope arcade
    Sorry for bad code
    Thanks
]]

repeat task.wait() until game:IsLoaded()


local gmt = getrawmetatable(game)
local oldindex = gmt.__index
setreadonly(gmt, false)
gmt.__index = newcclosure(function(Self, Key)
    if tostring(Self) == "Humanoid" and tostring(Key) == "WalkSpeed" then
        return
    end
    if tostring(Self) == "Humanoid" and tostring(Key) == "JumpPower" then
        return
    end
	if tostring(Self) == "Humanoid" and tostring(Key) == "AutoRotate" then
		return
	end
	if tostring(Self) == "Humanoid" and tostring(Key) == "HipHeight" then
		return
	end
    if tostring(Key) == "Gravity" then
        return
    end
    return oldindex(Self, Key)
end)



function AddConfigSector(tab, library)
    local configlist = tab:Dropdown{
        Name = "Configs",
        Content = library:GetConfigs(), -- GetConfigs(true) if you want universal configs
        Flag = "Config Dropdown"
    }
    
    library:ConfigIgnore("Config Dropdown")
    
    local loadconfig = tab:Button{
        Name = "Load Config",
        Callback = function()
            library:LoadConfig(library.flags["Config Dropdown"]) -- LoadConfig(library.flags["Config Dropdown"], true)  if you want universal configs
        end
    }
    
    local delconfig = tab:Button{
        Name = "Delete Config",
        Callback = function()
            library:DeleteConfig(library.flags["Config Dropdown"]) -- DeleteConfig(library.flags["Config Dropdown"], true)  if you want universal configs
            configlist:Refresh(library:GetConfigs())
        end
    }
    
    
    local configbox = configsection:Box{
        Name = "Config Name",
        Placeholder = "Config Name",
        Flag = "Config Name"
    }
    
    library:ConfigIgnore("Config Name")
    
    local save = tab:Button{
        Name = "Save Config",
        Callback = function()
            library:SaveConfig(library.flags["Config Dropdown"] or library.flags["Config Name"]) -- SaveConfig(library.flags["Config Name"], true) if you want universal configs
            configlist:Refresh(library:GetConfigs())
        end
    }
    
    tab:Seperator("Themes")
    
    local themelist = tab:Dropdown{
        Name = "Theme",
        Default = library.currenttheme,
        Content = library:GetThemes(),
        Flag = "Theme Dropdown",
        Callback = function(option)
            if option then
                library:SetTheme(option)
    
                for option, picker in next, themepickers do
                    picker:Set(library.theme[option])
                end
            end
        end
    }
    
    library:ConfigIgnore("Theme Dropdown")
    
    local namebox = tab:Box{
        Name = "Custom Theme Name",
        Placeholder = "Custom Theme",
        Flag = "Custom Theme"
    }
    
    library:ConfigIgnore("Custom Theme")
    
    tab:Button{
        Name = "Save Custom Theme",
        Callback = function()
            if library:SaveCustomTheme(library.flags["Custom Theme"]) then
                themelist:Refresh(library:GetThemes())
                themelist:Set(library.flags["Custom Theme"])
                namebox:Set("")
            end
        end
    }
end
function AddThemeSector(theme, library) --[[
    im too lazy to just change the variables
    ]]
    themepickers["Accent"] = customtheme:ColorPicker{
        Name = "Accent",
        Default = library.theme["Accent"],
        Flag = "Accent",
        Callback = function(color)
            library:ChangeThemeOption("Accent", color)
        end
    }
    
    library:ConfigIgnore("Accent")
    
    themepickers["Window Background"] = customtheme:ColorPicker{
        Name = "Window Background",
        Default = library.theme["Window Background"],
        Flag = "Window Background",
        Callback = function(color)
            library:ChangeThemeOption("Window Background", color)
        end
    }
    
    library:ConfigIgnore("Window Background")
    
    themepickers["Window Border"] = customtheme:ColorPicker{
        Name = "Window Border",
        Default = library.theme["Window Border"],
        Flag = "Window Border",
        Callback = function(color)
            library:ChangeThemeOption("Window Border", color)
        end
    }
    
    library:ConfigIgnore("Window Border")
    
    themepickers["Tab Background"] = customtheme:ColorPicker{
        Name = "Tab Background",
        Default = library.theme["Tab Background"],
        Flag = "Tab Background",
        Callback = function(color)
            library:ChangeThemeOption("Tab Background", color)
        end
    }
    
    library:ConfigIgnore("Tab Background")
    
    themepickers["Tab Border"] = customtheme:ColorPicker{
        Name = "Tab Border",
        Default = library.theme["Tab Border"],
        Flag = "Tab Border",
        Callback = function(color)
            library:ChangeThemeOption("Tab Border", color)
        end
    }
    
    library:ConfigIgnore("Tab Border")
    
    themepickers["Tab Toggle Background"] = customtheme:ColorPicker{
        Name = "Tab Toggle Background",
        Default = library.theme["Tab Toggle Background"],
        Flag = "Tab Toggle Background",
        Callback = function(color)
            library:ChangeThemeOption("Tab Toggle Background", color)
        end
    }
    
    library:ConfigIgnore("Tab Toggle Background")
    
    themepickers["Section Background"] = customtheme:ColorPicker{
        Name = "Section Background",
        Default = library.theme["Section Background"],
        Flag = "Section Background",
        Callback = function(color)
            library:ChangeThemeOption("Section Background", color)
        end
    }
    
    library:ConfigIgnore("Section Background")
    
    themepickers["Section Border"] = customtheme:ColorPicker{
        Name = "Section Border",
        Default = library.theme["Section Border"],
        Flag = "Section Border",
        Callback = function(color)
            library:ChangeThemeOption("Section Border", color)
        end
    }
    
    library:ConfigIgnore("Section Border")
    
    themepickers["Text"] = customtheme:ColorPicker{
        Name = "Text",
        Default = library.theme["Text"],
        Flag = "Text",
        Callback = function(color)
            library:ChangeThemeOption("Text", color)
        end
    }
    
    library:ConfigIgnore("Text")
    
    themepickers["Disabled Text"] = customtheme:ColorPicker{
        Name = "Disabled Text",
        Default = library.theme["Disabled Text"],
        Flag = "Disabled Text",
        Callback = function(color)
            library:ChangeThemeOption("Disabled Text", color)
        end
    }
    
    library:ConfigIgnore("Disabled Text")
    
    themepickers["Object Background"] = customtheme:ColorPicker{
        Name = "Object Background",
        Default = library.theme["Object Background"],
        Flag = "Object Background",
        Callback = function(color)
            library:ChangeThemeOption("Object Background", color)
        end
    }
    
    library:ConfigIgnore("Object Background")
    
    themepickers["Object Border"] = customtheme:ColorPicker{
        Name = "Object Border",
        Default = library.theme["Object Border"],
        Flag = "Object Border",
        Callback = function(color)
            library:ChangeThemeOption("Object Border", color)
        end
    }
    
    library:ConfigIgnore("Object Border")
    
    themepickers["Dropdown Option Background"] = customtheme:ColorPicker{
        Name = "Dropdown Option Background",
        Default = library.theme["Dropdown Option Background"],
        Flag = "Dropdown Option Background",
        Callback = function(color)
            library:ChangeThemeOption("Dropdown Option Background", color)
        end
    }
    
    library:ConfigIgnore("Dropdown Option Background")
    
end


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vozoid/ui-libraries/main/drawing/void/source.lua"))()
getgenv().Config = {
    Window = {
        Rainbow = false, -- this shit is so cool lol
        Speed = 5,
    },
    Player = {
        Toggles = {
            [1] = false,
            [2] = false,
            [3] = false,
            [4] = false
        },
        Sliders = {
            [1] = 150,
            [2] = 150,
            [3] = 5,
            [4] = 93
        }
    },
    Misc = {
        ThirdPerson = {
            Enabled = false,
            Distance = math.random(math.random(math.random(0, 100), 100), math.random(math.random(0, 100), 100))
        },
        SelfChams = {
            Enabled = false,
            Material = "ForceField",
            Color = Color3.fromRGB(0, 0, 0)
        }
    },
    Combat = {
        AntiAim = {
        },
        SilentAim = {
            Enabled = false,
            AimPart = "Head",
            FOV = {
                Enabled = false,
                Radius = 125,
                Thickness = 1,
                Transparency = 0,
                Filled = false,
                Color = Color3.fromRGB(0, 0, 0)
            }
        },
    }
}
local Watermark = Library:Watermark("Lunar | 60 fps | v1 | dev")


local Main = Library:Load{
    Name = "                                           Lunar | dev | v1 | " .. os.date("%b %a %d"),
    SizeX = 800,
    SizeY = 550,
    Theme = "Midnight",
    Extension = "txt",
    Folder = "Lunar"
}


local Tab1 = Main:Tab("") 
    local PlayerSector = Tab1:Section{Name = "Player", Side = "Left"} 
        PlayerSector:Dropdown{
            Name = "Player Modifications",
            Max = 4,
            Content = {
                "WalkSpeed",
                "JumpPower",
                "HipHeight",
                "Gravity"
            },
            Flag = "PlayerMultiDropdown",
            Callback = function(table)
                getgenv().Config.Player.Toggles[1] = false
                getgenv().Config.Player.Toggles[2] = false
                getgenv().Config.Player.Toggles[3] = false
                getgenv().Config.Player.Toggles[4] = false
                for i, v in next, table do
                    if v == "WalkSpeed" then
                        getgenv().Config.Player.Toggles[1] = true
                    end
                    if v == "JumpPower" then
                        getgenv().Config.Player.Toggles[2] = true
                    end
                    if v == "HipHeight" then
                        getgenv().Config.Player.Toggles[3] = true
                    end
                    if v == "Gravity" then
                        getgenv().Config.Player.Toggles[4] = true
                    end
                end
                if getgenv().Config.Player.Toggles[2] ~= true then
                    game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = 50
                end
                if getgenv().Config.Player.Toggles[3] ~= true then
                    game:GetService("Players").LocalPlayer.Character.Humanoid.HipHeight = 2
                end
                if getgenv().Config.Player.Toggles[4] ~= true then
                    workspace.Gravity = 196
                end
            end
        }
        PlayerSector:Slider{
            Name = "Walk Speed",
            Text = "[value]%",
            Default = 150,
            Min = 0,
            Max = 10,
            Float = 0.025,
            Flag = "WalkSpeed",
            Callback = function(Value)
                getgenv().Config.Player.Sliders[1] = Value
            end
        }
        PlayerSector:Slider{
            Name = "Jump Power",
            Text = "[value]%",
            Default = 150,
            Min = 0,
            Max = 300,
            Float = 0.025,
            Flag = "JumpPower",
            Callback = function(Value)
                getgenv().Config.Player.Sliders[2] = Value
            end
        }
        PlayerSector:Slider{
            Name = "Gravity",
            Text = "[value]%",
            Default = 93,
            Min = 0,
            Max = 196,
            Float = 0.025,
            Flag = "Gravity",
            Callback = function(Value)
                getgenv().Config.Player.Sliders[4] = Value
            end
        }
        PlayerSector:Slider{
            Name = "Hip Height",
            Text = "[value]%",
            Default = 5,
            Min = 0,
            Max = 10,
            Float = 0.025,
            Flag = "HipHeight",
            Callback = function(Value)
                getgenv().Config.Player.Sliders[3] = Value
            end
        }
    local AntiAim = Tab1:Section{Name = "Anti-Aim", Side = "Right"} 
        local AntiAimToggle = AntiAim:Toggle{
            Name = "Enable Anti-Aim",
            Flag = "AntiAimToggle",
            Default = false,
            Callback  = function(Value)
            end
        }
        AntiAimToggle:Keybind{
            Blacklist = {Enum.UserInputType.MouseButton1},
            Flag = "AntiAimToggle Keybind",
            Mode = "Toggle",
            Callback = function()
            end
        }
        AntiAim:Dropdown{
            Name = "Yaw Base",
            Default = "Camera",
            Content = {
                "Camera",
                "Random",
                "Spin"
            },
            Flag = "AntiAimYawBase",
            Callback = function(Value)
            end
        }
        AntiAim:Slider{
            Name = "Yaw Offset",
            Text = "[value]%",
            Default = 0,
            Min = -180,
            Max = 180,
            Float = 0.025,
            Flag = "AntiAimYawOffset",
            Callback = function(Value)
            end
        }
        AntiAim:Dropdown{
            Name = "Yaw Modifier",
            Default = "None",
            Content = {
                "None",
                "Jitter",
                "Offset Jitter"
            },
            Flag = "AntiAimYawModifier",
            Callback = function(Value)
            end
        }
        AntiAim:Slider{
            Name = "Yaw Modifier Offset",
            Text = "[value]%",
            Default = 0,
            Min = -180,
            Max = 180,
            Float = 0.025,
            Flag = "AntiAimYawOffsetModifier",
            Callback = function(Value)
            end
        }
    local SilentAim = Tab1:Section{Name = "Silent Aim", Side = "Right"}
        local SilentAimToggle = SilentAim:Toggle{
            Name = "Enable Silent Aim",
            Flag = "SilentAimToggle",
            Default = false,
            Callback  = function(Value)
            end
        }
        SilentAim:Toggle{
            Name = "Wall Check",
            Flag = "WallCheckToggle",
            Default = false,
            Callback  = function(Value)
            end
        }
        SilentAimToggle:Keybind{
            Blacklist = {Enum.UserInputType.MouseButton1},
            Flag = "SilentAimToggle Keybind",
            Mode = "Toggle",
            Callback = function()
            end
        }
        local SilentBAimToggle = SilentAim:Toggle{
            Name = "Force BAim / Body Aim",
            Flag = "SilentBAimToggle",
            Default = false,
            Callback  = function(Value)
            end
        }
        SilentBAimToggle:Keybind{
            Blacklist = {Enum.UserInputType.MouseButton1},
            Flag = "SilentBAimToggle Keybind",
            Mode = "Toggle",
            Callback = function()
            end
        }
        SilentAim:Seperator("FOV Circle") 
            local SilentAimFOV = SilentAim:Toggle{
                Name = "FOV Circle Enabled",
                Flag = "SilentAimFOVToggle",
                Default = false,
                Callback  = function(Value)
                end
            }
            SilentAimFOV:ColorPicker{
                Default = Color3.fromRGB(100, 59, 154), 
                Flag = "SilentAimFOVToggle Color", 
                Callback = function(Value)
                end
            }
            SilentAim:Slider{
                Name = "Radius",
                Text = "[value]%",
                Default = 0,
                Min = 0,
                Max = 600,
                Float = 0.025,
                Flag = "SilentAimFovRadius",
                Callback = function(Value)
                end
            }
    local KnifeBot = Tab1:Section{Name = "Knife Bot", Side = "Right"} 
        local KnifeBotToggle = KnifeBot:Toggle{
            Name = "Enable Knife Bot",
            Flag = "KnifeBotToggle",
            Default = false,
            Callback  = function(Value)
            end
        }
        KnifeBotToggle:Toggle{
            Name = "Wall Check",
            Flag = "KnifeBotToggle Keybind",
            Default = false,
            Callback  = function(Value)
            end
        }
        KnifeBot:Dropdown{
            Name = "Knife Part",
            Default = "Head",
            Content = {
                "Head",
                "HumanoidRootPart"
            },
            Flag = "KnifeBotPart",
            Callback = function(Value)
            end
        }
        KnifeBot:Slider{
            Name = "Knife Bot Distance",
            Text = "[value]%",
            Default = 0,
            Min = 0,
            Max = 10,
            Float = 0.025,
            Flag = "KnifeBotRadius",
            Callback = function(Value)
            end
        }
local Tab2 = Main:Tab("")
local Misc = Tab2:Section{Name = "Miscallaenous", Side = "Left"} 
local ThirdPerson = Tab2:Section{Name = "Third Person", Side = "Right"};ThirdPerson:Toggle{Name = "Enable Third Person",Flag = "ThirdPersonToggle",Default = false,Callback  = function(Value)getgenv().Config.Misc.ThirdPerson.Enabled = Valueend} ThirdPerson:Slider{Name = "Distance",Text = "[value]%",Default = 0,Min = 0,Max = 10,Float = 0.025,Flag = "ThirdPersonDistanceX",Callback = function(Value)getgenv().Config.Misc.ThirdPerson.Distance = Valueend}

local SelfChams = Tab2:Section{Name = "Self Chams", Side = "Right"}
        local SelfChamsToggle = SelfChams:Toggle{
            Name = "Enable Self Chams",
            Flag = "SelfChamsToggle",
            Default = false,
            Callback  = function(Value)
                getgenv().Config.Misc.SelfChams.Enabled = Value
                for _, v in next, game:GetService("Players").LocalPlayer.Character:GetChildren() do
                    if v:IsA("BasePart")
                end
            end
        }
        SelfChamsToggle:ColorPicker{
            Default = Color3.fromRGB(100, 59, 154), 
            Flag = "SelfChamsToggle Color", 
            Callback = function(Value)
                getgenv().Config.Misc.SelfChams.Color = Value
            end
        }
        SelfChams:Dropdown{
            Name = "Material",
            Default = "ForceField",
            Content = {
                "Glass",
                "ForceField",
                "Neon"
            },
            Flag = "SelfChamsMaterial",
            Callback = function(Value)
                getgenv().Config.Misc.SelfChams.Material = Value
            end
        }
local UISettings = Tab1:Section{Name = "UI Settings", Side = "Left"}; UISettings:Keybind{ Name = "UI Toggle", Flag = "UI Toggle", Default = Enum.KeyCode.RightShift, Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3}, Callback = function(_, fromsetting) if not fromsetting then Library:Close() end end } UISettings:Button{ Name = "Unload UI", Callback = function() Library:Unload() end } local WindowAccent = UISettings:ColorPicker{ Name = "Accent", Default = Library.theme["Accent"], Default = Color3.fromRGB(57, 124, 247), Flag = "Accent", Callback = function(Value) Library:ChangeThemeOption("Accent", Value) end }; UISettings:Toggle{ Name = "Rainbow Accent", Flag = "RainbowAccent", Default = false, Callback  = function(Value) getgenv().Config.Window.Rainbow = Value end } UISettings:Slider{ Name = "Rainbow Speed", Text = "[value]%", Default = 0, Min = 0, Max = 25, Float = 0.025, Flag = "RainbowSpeed", Callback = function(Value) getgenv().Config.Window.Speed = Value end }
game:GetService("RunService").RenderStepped:Connect(function(FPS)
    Watermark:Set("Lunar | " .. math.round(1 / FPS) .. " fps | v1 | dev")
    if getgenv().Config.Player.Toggles[1] then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame + (game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * getgenv().Config.Player.Sliders[1])
    end
    if getgenv().Config.Player.Toggles[2] then
        cloneref(game:GetService("Players").LocalPlayer.Character.Humanoid).JumpPower = getgenv().Config.Player.Sliders[2]
    end
    if getgenv().Config.Player.Toggles[3] then
        cloneref(game:GetService("Players").LocalPlayer.Character.Humanoid).HipHeight = getgenv().Config.Player.Sliders[3]
    end
    if getgenv().Config.Player.Toggles[4] then
        cloneref(workspace).Gravity = getgenv().Config.Player.Sliders[4]
    end
    if getgenv().Config.Window.Rainbow then
        local Hue = tick() % getgenv().Config.Window.Speed / getgenv().Config.Window.Speed
        local Color = Color3.fromHSV(Hue, 1, 1)
        WindowAccent:Set(Color)
    end
    if getgenv().Config.Misc.ThirdPerson.Enabled then
        workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame + workspace.CurrentCamera.CFrame.LookVector * getgenv().Config.Misc.ThirdPerson.Distance
    end
end)





