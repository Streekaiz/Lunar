--// Setting up variables & libraries
local Build = Debug and "Developer" or "User"
local Game = game.PlaceId == 1 and "Jailbird" or "Universal"
local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local Library, ThemeManager, SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua'))(), loadstring(game:HttpGet('https://raw.githubusercontent.com/Streekaiz/linoria-fork/main/addons/ThemeManager.lua'))(), loadstring(game:HttpGet('https://raw.githubusercontent.com/Streekaiz/linoria-fork/main/addons/SaveManager.lua'))()

--// Setting up window
local Window = Library:CreateWindow({ Title = 'Lunar | ' .. Build .. ' | ' .. Game .. ' | ' .. identifyexecutor(), Center = true, AutoShow = false, Size = UDim2.fromOffset(554, 600), TabPadding = 4, MenuFadeTime = 0.2 })

do --// Setting up tabs
    Window:AddTab("   Combat   ")
    Window:AddTab("   Visual   ")
    Window:AddTab("   Miscallaenous   ")
    Window:AddTab("   Settings   ")
end

do --// Setting up combat tab
    local Legitbot = Window.Tabs['   Combat   ']:AddLeftGroupbox("Legitbot") do

        Legitbot:AddToggle("Legitbot_Aimbot", {
            Text = "Aim Assist",
            Default = false,
            Tooltip = "Enables aim assist & its features."
        }):AddKeyPicker('Legitbot_Aimbot_Key', {
            Default = 'PageUp',
            SyncToggleState = false,
            Mode = 'Hold',
            Text = 'Legitbot - Aim Assist',
            NoUI = false
        }) do -- Setting up aimbot features
            Legitbot:AddDropdown('Legitbot_Aimbot_Target', {
                Values = {"Head", "Body", "Nearest"}, Default = 1,
                Text = '> Aim Assist Target',
                Tooltip = "Configures the Aim Assist's target"
            })
        
            Legitbot:AddDropdown('Legitbot_Aimbot_Method', {
                Values = {"CFrame", "Mousemoverel"}, Default = 1,
                Tooltip = "Configures the Aim Assist's method",
                Text = '> Aim Assist Method',
            })
        
            Legitbot:AddDropdown('Legitbot_Aimbot_Checks', {
                Values = {"Friendly", "Visibility"}, Multi = true, Default = 2,
                Tooltip = "Configures the Aim Assist's checks",
                Text = '> Aim Assist Validation Checks'
            })
            
            Legitbot:AddSlider('Legitbot_Aimbot_Sensitivity', {
                Text = '> Aim Assist Sensitivity', Default = 100, Min = 0, Max = 100, Suffix = "%", HideMax = true, Rounding = 1, Tooltip = "Configures the Aim Assist's sensitivity"
            })
        
            Legitbot:AddSlider('Legitbot_Aimbot_Distance', {
                Text = '> Aim Assist Distance', Default = 1000, Min = 0, Max = 5000, Suffix = " studs", HideMax = true, Rounding = 1, Tooltip = "Configures the Aim Assist's maximum distance"
            })
    
            Legitbot:AddToggle("Legitbot_Aimbot_FOV", {
                Text = "> Show FOV",
                Default = false,
                Tooltip = "Shows the visibility of the FOV Radius"
            }):AddColorPicker('Legitbot_Aimbot_FOV_Picker1', {
                Default = Color3.fromRGB(0, 150, 255),
                Title = 'Main Color',
                Transparency = 0
            }):AddColorPicker('Legitbot_Aimbot_FOV_Picker2', {
                Default = Color3.fromRGB(255, 255, 255),
                Title = 'Outline Color',
                Transparency = nil
            })
    
            local FOV = Legitbot:AddDependencyBox() do
                FOV:AddSlider('Legitbot_Aimbot_FOV_Radius', {
                    Text = '>> Radius', Default = 180, Min = 0, Max = 360, HideMax = true, Rounding = 1, Tooltip = "Configures the Aim Assist FOV's radius"
                })
    
                FOV:AddSlider('Legitbot_Aimbot_FOV_Sides', {
                    Text = '>> Sides', Default = 64, Min = 3, Max = 128, HideMax = true, Rounding = 1, Tooltip = "Configures the Aim Assist FOV's side count"
                })
    
                FOV:SetupDependencies({
                    { Toggles.Legitbot_Aimbot_FOV, true }
                });
            end
        end

        Legitbot:AddDivider()
        
        Legitbot:AddToggle("Legitbot_Silent", {
            Text = "Silent Aim",
            Default = false, Risky = true,
            Tooltip = "Enables silent aim & its features."
        }):AddKeyPicker('Legitbot_Silent_Key', {
            Default = 'PageUp',
            SyncToggleState = false,
            Mode = 'Toggle',
            Text = 'Legitbot - Bullet Manipulation',
            NoUI = false
        }) do -- Setting up silent aim features
            Legitbot:AddDropdown('Legitbot_Silent_Target', {
                Values = {"Head", "Body", "Nearest"}, Default = 1,
                Text = '> Silent Aim Target',
                Tooltip = "Configures the Silent Aim's target"
            })

            Legitbot:AddDropdown('Legitbot_Silent_Method', {
                Values = {"Raycast","FindPartOnRay", "FindPartOnRayWithWhitelist", "FindPartOnRayWithIgnoreList", "Mouse.Hit/Target"}, Default = 1,
                Tooltip = "Configures the Silent Aim's method",
                Text = '> Silent Aim Method',
            })
        
            Legitbot:AddDropdown('Legitbot_Silent_Checks', {
                Values = {"Friendly", "Visibility"}, Multi = true, Default = 2,
                Tooltip = "Configures the Silent Aim's checks",
                Text = '> Silent Aim Validation Checks'
            })
        
            Legitbot:AddSlider('Legitbot_Silent_Chance', {
                Text = '> Silent Aim Chance', Default = 100, Min = 0, Max = 100, Suffix = "%", HideMax = true, Rounding = 0, Tooltip = "Configures the Silent Aim's hit chance"
            })

            Legitbot:AddSlider('Legitbot_Silent_Distance', {
                Text = '> Silent Aim Distance', Default = 1000, Min = 0, Max = 5000, Suffix = " studs", HideMax = true, Rounding = 1, Tooltip = "Configures the Silent Aim's maximum distance"
            })

            Legitbot:AddToggle("Legitbot_Silent_FOV", {
                Text = "> Show FOV",
                Default = false,
                Tooltip = "Shows the visibility of the FOV Radius"
            }):AddColorPicker('Legitbot_Silent_FOV_Picker1', {
                Default = Color3.fromRGB(255, 145, 0),
                Title = 'Main Color',
                Transparency = 0
            }):AddColorPicker('Legitbot_Silent_FOV_Picker2', {
                Default = Color3.fromRGB(0, 0, 0),
                Title = 'Outline Color',
                Transparency = nil
            })

            local FOV = Legitbot:AddDependencyBox() do
                FOV:AddSlider('Legitbot_Silent_FOV_Radius', {
                    Text = '>> Radius', Default = 180, Min = 0, Max = 360, HideMax = true, " px", Rounding = 1, Tooltip = "Configures the Aim Assist FOV's radius"
                })

                FOV:AddSlider('Legitbot_Silent_FOV_Sides', {
                    Text = '>> Sides', Default = 64, Min = 3, Max = 128, Suffix = " sides", HideMax = true, Rounding = 1, Tooltip = "Configures the Aim Assist FOV's side count"
                })

                FOV:SetupDependencies({
                    { Toggles.Legitbot_Silent_FOV, true }
                });
            end
        end
        
        Legitbot:AddDivider()

        Legitbot:AddToggle("Legitbot_Hitbox", {
            Text = "Hitbox Expander",
            Default = false, Risky = true,
            Tooltip = "Enables hitbox expander & its features."
        }):AddKeyPicker('Legitbot_Hitbox_Key', {
            Default = 'PageUp',
            SyncToggleState = false,
            Mode = 'Toggle',
            Text = 'Legitbot - Hitbox Expander',
            NoUI = false
        }):AddColorPicker('Legitbot_Hitbox_Picker', {
            Default = Color3.fromRGB(255, 0, 0),
            Title = 'Hitbox Color',
            Transparency = 0
        }) do -- Setting up hitbox features
            Legitbot:AddDropdown('Legitbot_Hitbox_Target', {
                Values = {"Head", "Torso",}, Default = 1,
            
                Text = '> Hitbox Target',
            })
            
            Legitbot:AddDropdown('Legitbot_Hitbox_Checks', {
                Values = {"Friendly", "Visibility",}, Default = 1, Multi = false,
            
                Text = '> Hitbox Checks',
            })

            Legitbot:AddSlider('Legitbot_Hitbox_Scale_X', {
                Text = '> Expansion X Value', Default = 2.5, Min = 0, Max = 5, Rounding = 2, HideMax = true
            })
        
            Legitbot:AddSlider('Legitbot_Hitbox_Scale_Y', {
                Text = '> Expansion Y Value', Default = 2.5, Min = 0, Max = 5, Rounding = 2,  HideMax = true
            })
        
            Legitbot:AddSlider('Legitbot_Hitbox_Scale_Z', {
                Text = '> Expansion Z Value', Default = 2.5, Min = 0, Max = 5, Rounding = 2,  HideMax = true
            })
        end

        Legitbot:AddDivider()

        Legitbot:AddToggle("Legitbot_Triggerbot", {
            Text = "Triggerbot",
            Default = false,
            Tooltip = "Enables triggerbot & its features."
        }):AddKeyPicker('Legitbot_Triggerbot_Key', {
            Default = 'PageUp',
            SyncToggleState = false,
            Mode = 'Toggle',
            Text = 'Legitbot - Triggerbot',
            NoUI = false
        }) do -- Setting up hitbox dependency
            Legitbot:AddSlider('Legitbot_Triggerbot_Delay', {
                Text = '> Delay', Default = 2.5, Min = 0, Max = 5, Rounding = 2
            })
        end
    end
    
    local Ragebot = Window.Tabs['   Combat   ']:AddRightGroupbox("Ragebot") do
        Ragebot:AddToggle('Ragebot', {
            Text = 'Enabled',
            Default = false,
            Tooltip = 'Enables ragebot & its features.',
            Risky = true
        })
        Ragebot:AddDropdown('Ragebot_Target', {
            Values = {"Head", "Body", "Arms", "Legs"}, Default = 1, Multi = true,
            Text = '> Target'
        })
    
        Ragebot:AddDropdown('Ragebot_Fire', {
            Values = {"Manual", "Mouseclick"}, Default = 1,
            Tooltip = "Configures the Ragebot's firing method",
            Text = '> Firing Method',
        })

        Ragebot:AddDropdown('Ragebot_Method', {
            Values = {"Raycast","FindPartOnRay", "FindPartOnRayWithWhitelist", "FindPartOnRayWithIgnoreList", "Mouse.Hit/Target"}, Default = 1,
            Tooltip = "Configures the Ragebot's method",
            Text = '> Method',
        })
        
        Ragebot:AddDropdown('Ragebot_Prioritize', {
            Values = {"Health", "Distance"}, Default = 1,
            Tooltip = "Configures the Ragebot's prioritization",
            Text = '> Prioritization',
        })

        Ragebot:AddSlider('Ragbot_Distance', {
            Text = '> Maximum Distance', Default = 2500, Min = 0, Max = 5000, Rounding = 1, Tooltip = "Configures the Ragebot's maximum distance"
        })
        Ragebot:AddToggle('Ragebot_Peek', {
            Text = 'Quick Peek',
            Default = false,
            Tooltip = 'Teleports you to a binded spot after shooting',
            Risky = true
        }):AddKeyPicker('Ragebot_Peek_Key', {
            Default = 'PageUp',
            SyncToggleState = false,
            Mode = 'Toggle',
            Text = 'Ragebot - Quick Peek',
            NoUI = false
        }):AddColorPicker('Ragebot_Peek_Picker1', {
            Default = Color3.fromRGB(255, 0, 0),
            Transparency = 0
        }) do
            local a = Ragebot:AddDependencyBox()

            a:AddSlider('Ragebot_Peek_Delay', {
                Text = '> Quick Peek Delay', Default = 0, Min = 0, Max = 1, Suffix = "ms", Rounding = 3, Tooltip = "Configures the Ragebot's maximum distance"
            })

            a:SetupDependencies({
                {Toggles.Ragebot_Peek, true}
            })
        end
    end

    local Antiaim = Window.Tabs['   Combat   ']:AddRightGroupbox("Anti-Aim") do
        Antiaim:AddToggle('Anti', {
            Text = 'Enabled',
            Default = false,
            Tooltip = 'Enables anti-aim & its features.',
            Risky = true
        })
        Antiaim:AddDropdown('Anti_Base', {
                Values = {"Camera", "Random", "Spin"}, Default = 1,
                Tooltip = "Configures the anti-aim's yaw base",
                Text = '> Yaw Base',
            })
            
            Antiaim:AddSlider('Anti_Yaw', {
                Text = '> Yaw Offset', Default = 0, Min = -180, Max = 180, Suffix = "°", Rounding = 1, Tooltip = "Configures the anti-aim's yaw"
            })

            Antiaim:AddDropdown('Anti_Modifier', {
                Values = {"None", "Jiter", "Jiter Offset"}, Default = 1,
                Tooltip = "Configures the anti-aim's yaw modifier",
                Text = '> Yaw Modifier',
            })

            Antiaim:AddSlider('Anti_Modifier_Yaw', {
            Text = '> Modified Yaw Offset', Default = 0, Min = -180, Max = 180, Suffix = "°", Rounding = 1, Tooltip = "Configures the anti-aim's yaw offset"
        })

        Antiaim:AddToggle('Anti_Lag', {
            Text = 'Fake Lag',
            Default = false,
            Tooltip = 'Enables fake lag & its features.',
            Risky = true
        })
        Antiaim:AddDropdown('Anti_Lag_Method', {
                Values = {"Static", "Random"}, Default = 1,
                Tooltip = "Configures fake lag's method",
                Text = '> Method',
            })
            
            Antiaim:AddSlider('Anti_Lag_Limit', {
                Text = '> Limit', Default = 6, Min = 1, Max = 16, Rounding = 1, Tooltip = "Configures the fake lag's limit"
            })

            Antiaim:AddToggle('Anti_Lag_Visual', {
                Text = 'Visualize',
                Default = true,
                Tooltip = 'Visualizes your fake lag.',
                Risky = true
            }):AddColorPicker('Anti_Lag_Visual_Picker', {
                Default = Color3.fromRGB(255, 0, 0),
                Transparency = 0
            })

            Antiaim:AddToggle('Anti_Lag_Freeze', {
                Text = 'Freeze World',
                Default = false,
                Tooltip = 'Freezes all packets sent',
                Risky = true
            }):AddKeyPicker('Anti_Lag_Freeze_Key', {
                Default = 'PageUp',
                SyncToggleState = true,
                Mode = 'Toggle',
                Text = 'Anti-Aim - Freeze World',
                NoUI = false
            })
    end
end

do --// Setting up visual tab
    local ESP = Window.Tabs['   Visual   ']:AddLeftTabbox() do
        local Enemy, Friendly = ESP:AddTab("Enemy"), ESP:AddTab("Friendly")	
        Enemy:AddSlider('ESP_Text_Size', { Text = 'Text Size', Default = 13, Min = 0, Max = 30, Rounding = 2})
        Enemy:AddSlider('ESP_Distance', { Text = 'Maximum Distance', Default = 5000, Min = 0, Max = 10000, Rounding = 2})
        Enemy:AddDropdown('ESP_Text_Font', { Values = { "1", "2", "3", "4" }, Default = 2, Multi = false, Text = 'Text Font', Tooltip = 'Changes the text font'})
        Enemy:AddDivider()
    
        Enemy:AddToggle('ESP_Enemy_Enabled', { Text = 'Enabled', Default = false, Tooltip = 'Enables ESP for Enemy players.'})
        Enemy:AddToggle('ESP_Enemy_Box', { Text = 'Boxes', Default = false, Tooltip = 'Enables boxes for Enemy players.', Callback = function() end}):AddColorPicker('ESP_Enemy_Box_Picker1', { Default = Color3.fromRGB(255, 255, 255), Title = 'Box Color', Transparency = 0, Callback = function() end}):AddColorPicker('ESP_Enemy_Box_Picker2', { Default = Color3.fromRGB(0, 0, 0), Title = 'Box Outline Color', Transparency = 0 })
        Enemy:AddToggle('ESP_Enemy_Boxfill', { Text = 'Box Fillings', Default = false, Tooltip = 'Enables box fillings for Enemy players.' }):AddColorPicker('ESP_Enemy_Boxfill_Picker1', { Default = Color3.fromRGB(0, 0, 0), Title = 'Box Fill Color', Transparency = 0.5 })
        Enemy:AddToggle('ESP_Enemy_Health', { Text = 'Health Bars', Default = false, Tooltip = 'Enables health bars for Enemy players.' }):AddColorPicker('ESP_Enemy_Health_Picker1', { Default = Color3.fromRGB(0, 255, 0), Title = 'Health Bar Healthy Color', Transparency = nil }):AddColorPicker('ESP_Enemy_Health_Picker2', { Default = Color3.fromRGB(255, 0, 0), Title = 'Health Bar Dying Color', Transparency = nil }):AddColorPicker('ESP_Enemy_Health_Picker3', { Default = Color3.fromRGB(0, 0, 0), Title = 'Health Bar Outline Color', Transparency = 0 })
        Enemy:AddToggle('ESP_Enemy_Name', { Text = 'Names', Default = false, Tooltip = 'Enables names for Enemy players.' }):AddColorPicker('ESP_Enemy_Name_Picker1', { Default = Color3.fromRGB(255, 255, 255), Title = 'Name Color', Transparency = 0 }):AddColorPicker('ESP_Enemy_Name_Picker2', { Default = Color3.fromRGB(0, 0, 0), Title = 'Name Outline Color', Transparency = 0 })
        Enemy:AddToggle('ESP_Enemy_Distance', { Text = 'Distances', Default = false, Tooltip = 'Enables distances for Enemy players.' }):AddColorPicker('ESP_Enemy_Distance_Picker1', { Default = Color3.fromRGB(255, 255, 255), Title = 'Distance Color', Transparency = 0 }):AddColorPicker('ESP_Enemy_Distance_Picker2', { Default = Color3.fromRGB(0, 0, 0), Title = 'Distance Outline Color', Transparency = 0 })
        Enemy:AddToggle('ESP_Enemy_HealthText', { Text = 'Health', Default = false, Tooltip = 'Enables health text for Enemy players.' }):AddColorPicker('ESP_Enemy_HealthText_Picker1', { Default = Color3.fromRGB(255, 255, 255), Title = 'Health Text Color', Transparency = 0 }):AddColorPicker('ESP_Enemy_HealthText_Picker2', { Default = Color3.fromRGB(0, 0, 0), Title = 'Health Text Outline Color', Transparency = 0 })
        Enemy:AddToggle('ESP_Enemy_Weapon', { Text = 'Weapons', Default = false, Tooltip = 'Enables weapons for Enemy players.' }):AddColorPicker('ESP_Enemy_Weapon_Picker1', { Default = Color3.fromRGB(255, 255, 255), Title = 'Weapons Color', Transparency = 0 }):AddColorPicker('ESP_Enemy_Weapon_Picker2', { Default = Color3.fromRGB(0, 0, 0), Title = 'Weapon Outline Color', Transparency = 0 })
        Enemy:AddToggle('ESP_Enemy_Chams', { Text = 'Chams', Default = false, Tooltip = 'Enables chams for Enemy players.' }):AddColorPicker('ESP_Enemy_Chams_Picker1', { Default = Color3.fromRGB(0, 200, 0), Title = 'Chams Fill Color', Transparency = 0 }):AddColorPicker('ESP_Enemy_Chams_Picker2', { Default = Color3.fromRGB(255, 255, 255), Title = 'Chams Outline Color', Transparency = 0 })
        Enemy:AddToggle('ESP_Enemy_Arrows', { Text = 'Arrows', Default = false, Tooltip = 'Enables off-screen arrows for Enemy players.' }):AddColorPicker('ESP_Enemy_Arrow_Picker1', { Default = Color3.fromRGB(255, 255, 255), Title = 'Arrow Color', Transparency = 0 }):AddColorPicker('ESP_Enemy_Arrow_Picker2', { Default = Color3.fromRGB(0, 0, 0), Title = 'Arrow Outline Color', Transparency = 0 })
        Enemy:AddDivider()
        Enemy:AddSlider('ESP_Enemy_Arrows_Radius', { Text = 'Arrow Radius', Default = 150, Min = 0, Max = 300, Rounding = 2})
        Enemy:AddSlider('ESP_Enemy_Arrows_Size', { Text = 'Arrow Size', Default = 15, Min = 0, Max = 30, Rounding = 2})
        Enemy:AddDropdown('ESP_Enemy_Chams_Type', { Values = { 'AlwaysOnTop', "Occluded" }, Default = 1, Multi = false, Text = 'Chams Type', Tooltip = 'Changes how you see Enemy chams.' })
    
        Friendly:AddToggle('ESP_Friendly_Enabled', { Text = 'Enabled', Default = false, Tooltip = 'Enables ESP for friendly players.' })
        Friendly:AddToggle('ESP_Friendly_Box', { Text = 'Boxes', Default = false, Tooltip = 'Enables boxes for friendly players.' }):AddColorPicker('ESP_Friendly_Box_Picker1', { Default = Color3.fromRGB(255, 255, 255), Title = 'Box Color', Transparency = 0 }):AddColorPicker('ESP_Friendly_Box_Picker2', { Default = Color3.fromRGB(0, 0, 0), Title = 'Box Outline Color', Transparency = 0 })
        Friendly:AddToggle('ESP_Friendly_Boxfill', { Text = 'Box Fillings', Default = false, Tooltip = 'Enables box fillings for friendly players.' }):AddColorPicker('ESP_Friendly_Boxfill_Picker1', { Default = Color3.fromRGB(0, 0, 0), Title = 'Box Fill Color', Transparency = 0.5 })
        Friendly:AddToggle('ESP_Friendly_Health', { Text = 'Health Bars', Default = false, Tooltip = 'Enables health bars for friendly players.' }):AddColorPicker('ESP_Friendly_Health_Picker1', { Default = Color3.fromRGB(0, 255, 0), Title = 'Health Bar Healthy Color', Transparency = nil }):AddColorPicker('ESP_Friendly_Health_Picker2', { Default = Color3.fromRGB(255, 0, 0), Title = 'Health Bar Dying Color', Transparency = nil }):AddColorPicker('ESP_Friendly_Health_Picker3', { Default = Color3.fromRGB(0, 0, 0), Title = 'Health Bar Outline Color', Transparency = 0 })
        Friendly:AddToggle('ESP_Friendly_Name', { Text = 'Names', Default = false, Tooltip = 'Enables names for friendly players.' }):AddColorPicker('ESP_Friendly_Name_Picker1', { Default = Color3.fromRGB(255, 255, 255), Title = 'Name Color', Transparency = 0 }):AddColorPicker('ESP_Friendly_Name_Picker2', { Default = Color3.fromRGB(0, 0, 0), Title = 'Name Outline Color', Transparency = 0 })
        Friendly:AddToggle('ESP_Friendly_Distance', { Text = 'Distances', Default = false, Tooltip = 'Enables distances for friendly players.' }):AddColorPicker('ESP_Friendly_Distance_Picker1', { Default = Color3.fromRGB(255, 255, 255), Title = 'Distance Color', Transparency = 0 }):AddColorPicker('ESP_Friendly_Distance_Picker2', { Default = Color3.fromRGB(0, 0, 0), Title = 'Distance Outline Color', Transparency = 0 })
        Friendly:AddToggle('ESP_Friendly_HealthText', { Text = 'Health', Default = false, Tooltip = 'Enables health text for friendly players.' }):AddColorPicker('ESP_Friendly_HealthText_Picker1', { Default = Color3.fromRGB(255, 255, 255), Title = 'Health Text Color', Transparency = 0 }):AddColorPicker('ESP_Friendly_HealthText_Picker2', { Default = Color3.fromRGB(0, 0, 0), Title = 'Health Text Outline Color', Transparency = 0 })
        Friendly:AddToggle('ESP_Friendly_Weapon', { Text = 'Weapons', Default = false, Tooltip = 'Enables weapons for friendly players.' }):AddColorPicker('ESP_Friendly_Weapon_Picker1', { Default = Color3.fromRGB(255, 255, 255), Title = 'Weapons Color', Transparency = 0 }):AddColorPicker('ESP_Friendly_Weapon_Picker2', { Default = Color3.fromRGB(0, 0, 0), Title = 'Weapon Outline Color', Transparency = 0 })
        Friendly:AddToggle('ESP_Friendly_Chams', { Text = 'Chams', Default = false, Tooltip = 'Enables chams for friendly players.' }):AddColorPicker('ESP_Friendly_Chams_Picker1', { Default = Color3.fromRGB(0, 200, 0), Title = 'Chams Fill Color', Transparency = 0 }):AddColorPicker('ESP_Friendly_Chams_Picker2', { Default = Color3.fromRGB(255, 255, 255), Title = 'Chams Outline Color', Transparency = 0 })
        Friendly:AddToggle('ESP_Friendly_Arrows', { Text = 'Arrows', Default = false, Tooltip = 'Enables off-screen arrows for friendly players.' }):AddColorPicker('ESP_Friendly_Arrow_Picker1', { Default = Color3.fromRGB(255, 255, 255), Title = 'Arrow Color', Transparency = 0 }):AddColorPicker('ESP_Friendly_Arrow_Picker2', { Default = Color3.fromRGB(0, 0, 0), Title = 'Arrow Outline Color', Transparency = 0 })
        Friendly:AddDivider()
        Friendly:AddSlider('ESP_Friendly_Arrows_Radius', { Text = 'Arrow Radius', Default = 150, Min = 0, Max = 300, Rounding = 2})
        Friendly:AddSlider('ESP_Friendly_Arrows_Size', { Text = 'Arrow Size', Default = 15, Min = 0, Max = 30, Rounding = 2})
        Friendly:AddDropdown('ESP_Friendly_Chams_Type', { Values = { 'AlwaysOnTop', "Occluded" }, Default = 1, Multi = false, Text = 'Chams Type', Tooltip = 'Changes how you see friendly chams.' })
    end

    local Crosshair = Window.Tabs['   Visual   ']:AddRightGroupbox("Crosshair") do
        Crosshair:AddToggle('Crosshair', {
            Text = 'Crosshair',
            Default = false,
            Tooltip = 'Enables a crosshair'
        }):AddColorPicker('Crosshair_Picker1', {
            Default = Color3.fromRGB(255, 255, 255),
            Title = 'Main Color',
            Transparency = 0
        }):AddColorPicker('Crosshair_Picker2', {
            Default = Color3.fromRGB(0, 0, 0),
            Title = 'Outline Color',
            Transparency = nil
        })

        Crosshair:AddDropdown('Crosshair_Position', {
            Values = {"Mouse", "Centered"}, Default = 1,
            Text = 'Crosshair Position',
        })

        Crosshair:AddSlider('Crosshair_Gap', {
            Text = 'Gap', Default = 1, Min = 0, Max = 100, Rounding = 1, Suffix = "px", HideMax = true
        })

        Crosshair:AddSlider('Crosshair_Length', {
            Text = 'Length', Default = 8, Min = 0, Max = 100, Rounding = 1, Suffix = "px", HideMax = true
        })
    end

    local Main = Window.Tabs['   Visual   ']:AddRightTabbox() do
        local Render, World = Main:AddTab("Render"), Main:AddTab("World")	
        do
            Render:AddToggle('Render_Bloom', {
                Text = 'Bloom',
                Default = false,
                Tooltip = 'Enables bloom'
            })
            Render:AddSlider('Render_Bloom_Slider1', {
                Text = '> Intensity', Default = 2.5, Min = 0, Max = 5, Rounding = 2, HideMax = true
            })
        
            Render:AddSlider('Render_Bloom_Slider2', {
                Text = '> Size', Default = 2.5, Min = 0, Max = 5, Rounding = 2,  HideMax = true
            })
        
            Render:AddSlider('Render_Bloom_Slider3', {
                Text = '> Threshold', Default = 2.5, Min = 0, Max = 5, Rounding = 2,  HideMax = true
            })
            Render:AddToggle('Render_Resolution', {
                Text = 'Resolution Changer',
                Default = false,
                Tooltip = 'Changes your resolution; you can have streched resolution with this'
            })
            Render:AddSlider('Render_Resolution_Mod', {
                Text = '> Resolution Modifier', Default = 1, Min = -1, Max = 2, Rounding = 2, HideMax = true
            })
            Render:AddToggle('Render_FOV', {
                Text = 'Field Of View',
                Default = false,
                Tooltip = 'Changes your field of view'
            })
            Render:AddSlider('Render_FOV_Slider', {
                Text = '> Value', Default = workspace.CurrentCamera.FieldOfView, Min = 0, Max = 120, Rounding = 1, HideMax = true
            })
        end
    end
end

do
    ThemeManager:SetLibrary(Library)
    SaveManager:SetLibrary(Library)
    SaveManager:IgnoreThemeSettings()
    ThemeManager:SetFolder('Lunar')
    SaveManager:SetFolder('Lunar/' .. game.PlaceId)
    SaveManager:BuildConfigSection(Window.Tabs['   Settings   '])
    ThemeManager:ApplyToTab(Window.Tabs['   Settings   '])
    SaveManager:LoadAutoloadConfig()

    local Main = Window.Tabs['   Settings   ']:AddRightGroupbox("Main Settings") do
        Main:AddToggle('Library_Watermark', {
            Text = 'Watermark',
            Default = true, -- Default value (true / false)
            Tooltip = 'Sets the visibility of a watermark',
            Callback = Library:SetWatermarkVisibility()
        })

        Main:AddToggle('Library_List', {
            Text = 'Keybind List',
            Default = false, -- Default value (true / false)
            Tooltip = 'Sets the visibility of a keybind list',
            Callback = function()
                Library.KeybindFrame.Visible = Toggles.Library_List.Value
            end
        })

        Main:AddToggle('Library_Unsafe', {
            Text = 'Allow Risky Features',
            Default = false, -- Default value (true / false)
            Tooltip = 'Sets the visibility of risky features',
            Risky = true
        })


        Main:AddLabel('Panic Unload'):AddKeyPicker('KeyPicker', {
            Default = 'PageUp', 
            SyncToggleState = false,
            Mode = 'Toggle',
            Text = 'Panic', 
            NoUI = true, 
        })

        Main:AddButton({
            Text = 'Unload',
            DoubleClick = true,
            Tooltip = 'Unloads libraries, drawings, and connections',
            Func = function() Library:Unload() end
        })

        Main:AddDivider()

        Main:AddButton({
            Text = 'Rejoin',
            DoubleClick = true,
            Tooltip = 'Rejoins your server; wont work if its a second instance',
            Func = function() end
        })

        Main:AddButton({
            Text = 'Server hop',
            DoubleClick = true,
            Tooltip = 'Joins a different server; not reccomended if you care about ping',
            Func = function() end
        })

        Main:AddButton({
            Text = 'Self Kick',
            DoubleClick = true,
            Tooltip = 'self explanatory',
            Func = function() end
        })
    end

    local Main = Window.Tabs['   Settings   ']:AddLeftGroupbox("LUAs") do
        Main:AddDropdown('LUA_Select', {
            Values = {""}, Default = 1,
            Tooltip = "To use lua files, put them in the script's lua folder",
            Text = 'Custom LUA',
        })

        Main:AddButton({
            Text = 'Execute',
            Func = function() end
        })

        Main:AddButton({
            Text = 'Delete',
            Func = function() end
        })

        Main:AddButton({
            Text = 'Refresh',
            Func = function() end
        })

        Main:AddButton({
            Text = 'Copy API Link',
            Func = function() end
        })
        
    end
end


Library:Notify("Lunar - Library loaded in " .. tick() - FrameTimer .. " ms")

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1;

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    Library:SetWatermark(('Lunar | %s build | %s fps | %s ms'):format(
        Build,
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));

end)

Library:OnUnload(function()
    WatermarkConnection:Disconnect()
    Library.Unloaded = true
end)

return Library, Toggles, Options, WatermarkConnection
