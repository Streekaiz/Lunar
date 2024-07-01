--// UI Library (Linoria)
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua'))()
local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/Streekaiz/linoria-fork/main/addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/Streekaiz/linoria-fork/main/addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Lunar | Jailbird | dev',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

--// Setting up Tabs

Window:AddTab("Combat")
Window:AddTab("Visual")
Window:AddTab("Player")
Window:AddTab("Miscallaenous")
Window:AddTab("Settings")

--// Combat

local Hitbox = Window.Tabs.Combat:AddLeftGroupbox('Hitbox Expander') do
	Hitbox:AddToggle('hitbox_enabled', { Text = 'Enabled', Tooltip = "Expands other enemies hitboxes.", Risky = true }):AddKeyPicker('hitbox_key', {SyncToggleState = true, Mode = 'Toggle', Default = "PageUp", Text = 'Hitbox Expander', NoUI = false})

	local Depbox = Hitbox:AddDependencyBox()

	Depbox:AddDropdown('hitbox_part', {
		Values = {"Head", "Body"}, Default = 1,
	
		Text = 'Hitbox Target',
		Tooltip = 'Expands the selected hitbox',
	})
	
	Depbox:AddSlider('hitbox_amount', {
		Text = 'Expansion Value', Default = 3, Min = 0, Max = 10, Rounding = 2, Tooltip = "Affects how expanded the hitbox is."
	})

	Depbox:AddToggle('hitbox_ffa', { Text = 'FFA Mode', Tooltip = "Expand other players hitboxes.", Risky = false });


	Depbox:AddInput('hitbox_ignore', {
		Default = game:GetService("Players").LocalPlayer.Name, Numeric = false, Finished = true,
		
		Text = 'Ignore Player',
		Tooltip = 'Ignores the selected player\nInput the username again to remove them.', -- Information shown when you hover over the textbox
	
		Placeholder = 'username'
	})

	Depbox:SetupDependencies({
		{ Toggles.hitbox_enabled, true }
	})
end

--// Visuals

local ESP = Window.Tabs.Visual:AddLeftTabbox() do
	local Enemy, Friendly = ESP:AddTab("Enemy"), ESP:AddTab("Friendly")	
	Enemy:AddSlider('esp_text_size', { Text = 'Text Size', Default = 13, Min = 0, Max = 30, Rounding = 2, Callback = function(v) Sense.sharedSettings.textSize = v; end})
	Enemy:AddSlider('esp_distance', { Text = 'Maximum Distance', Default = 5000, Min = 0, Max = 10000, Rounding = 2, Callback = function(v) Sense.sharedSettings.maxDistance = v; Sense.sharedSettings.limitDistance = true end})
	Enemy:AddDropdown('esp_text_font', { Values = { "1", "2", "3", "4" }, Default = 2, Multi = false, Text = 'Text Font', Tooltip = 'Changes the text font', Callback = function(v) Sense.sharedSettings.textFont = v; end})
	Enemy:AddDivider()
	
	Enemy:AddToggle('esp_enemy_enabled', { Text = 'Enabled', Default = false, Tooltip = 'Enables ESP for enemy players.', Callback = function(v) Sense.teamSettings.enemy.enabled = v end})
	Enemy:AddToggle('esp_enemy_box', { Text = 'Boxes', Default = false, Tooltip = 'Enables boxes for enemy players.', Callback = function() end}):AddColorPicker('esp_enemy_box_color', { Default = Color3.fromRGB(255, 255, 255), Title = 'Box Color', Transparency = 0, Callback = function() end}):AddColorPicker('esp_enemy_boxoutline_color', { Default = Color3.fromRGB(0, 0, 0), Title = 'Box Outline Color', Transparency = 0 })
	Enemy:AddToggle('esp_enemy_boxfill', { Text = 'Box Fillings', Default = false, Tooltip = 'Enables box fillings for enemy players.' }):AddColorPicker('esp_enemy_boxfill_color', { Default = Color3.fromRGB(0, 0, 0), Title = 'Box Fill Color', Transparency = 0.5 })
	Enemy:AddToggle('esp_enemy_health', { Text = 'Health Bars', Default = false, Tooltip = 'Enables health bars for enemy players.' }):AddColorPicker('esp_enemy_healthhealthy_color', { Default = Color3.fromRGB(0, 255, 0), Title = 'Health Bar Healthy Color', Transparency = nil }):AddColorPicker('esp_enemy_healthdying_color', { Default = Color3.fromRGB(255, 0, 0), Title = 'Health Bar Dying Color', Transparency = nil }):AddColorPicker('esp_enemy_healthoutline_color', { Default = Color3.fromRGB(0, 0, 0), Title = 'Health Bar Outline Color', Transparency = 0 })
	Enemy:AddToggle('esp_enemy_name', { Text = 'Names', Default = false, Tooltip = 'Enables names for enemy players.' }):AddColorPicker('esp_enemy_name_color', { Default = Color3.fromRGB(255, 255, 255), Title = 'Name Color', Transparency = 0 }):AddColorPicker('esp_enemy_nameoutline_color', { Default = Color3.fromRGB(0, 0, 0), Title = 'Name Outline Color', Transparency = 0 })
	Enemy:AddToggle('esp_enemy_distance', { Text = 'Distances', Default = false, Tooltip = 'Enables distances for enemy players.' }):AddColorPicker('esp_enemy_distance_color', { Default = Color3.fromRGB(255, 255, 255), Title = 'Distance Color', Transparency = 0 }):AddColorPicker('esp_enemy_distanceoutline_color', { Default = Color3.fromRGB(0, 0, 0), Title = 'Distance Outline Color', Transparency = 0 })
	Enemy:AddToggle('esp_enemy_healthtext', { Text = 'Health', Default = false, Tooltip = 'Enables health text for enemy players.' }):AddColorPicker('esp_enemy_healthtext_color', { Default = Color3.fromRGB(255, 255, 255), Title = 'Health Text Color', Transparency = 0 }):AddColorPicker('esp_enemy_healthtextoutline_color', { Default = Color3.fromRGB(0, 0, 0), Title = 'Health Text Outline Color', Transparency = 0 })
	Enemy:AddToggle('esp_enemy_weapon', { Text = 'Weapons', Default = false, Tooltip = 'Enables weapons for enemy players.' }):AddColorPicker('esp_enemy_weapon_color', { Default = Color3.fromRGB(255, 255, 255), Title = 'Weapons Color', Transparency = 0 }):AddColorPicker('esp_enemy_weaponoutline_color', { Default = Color3.fromRGB(0, 0, 0), Title = 'Weapon Outline Color', Transparency = 0 })
	Enemy:AddToggle('esp_enemy_chams', { Text = 'Chams', Default = false, Tooltip = 'Enables chams for enemy players.' }):AddColorPicker('esp_enemy_chams_color', { Default = Color3.fromRGB(0, 200, 0), Title = 'Chams Fill Color', Transparency = 0 }):AddColorPicker('esp_enemy_chamsoutline_color', { Default = Color3.fromRGB(255, 255, 255), Title = 'Chams Outline Color', Transparency = 0 })
	Enemy:AddToggle('esp_enemy_arrows', { Text = 'Arrows', Default = false, Tooltip = 'Enables off-screen arrows for enemy players.' }):AddColorPicker('esp_enemy_arrow_color', { Default = Color3.fromRGB(255, 255, 255), Title = 'Arrow Color', Transparency = 0 }):AddColorPicker('esp_enemy_arrowoutline_color', { Default = Color3.fromRGB(0, 0, 0), Title = 'Arrow Outline Color', Transparency = 0 })
	Enemy:AddDivider()
	Enemy:AddSlider('esp_enemy_arrows_radius', { Text = 'Arrow Radius', Default = 150, Min = 0, Max = 300, Rounding = 2})
	Enemy:AddSlider('esp_enemy_arrows_size', { Text = 'Arrow Size', Default = 15, Min = 0, Max = 30, Rounding = 2})
	Enemy:AddDropdown('esp_enemy_chams_type', { Values = { 'AlwaysOnTop', "Occluded" }, Default = 1, Multi = false, Text = 'Chams Type', Tooltip = 'Changes how you see enemy chams.' })

	Friendly:AddToggle('esp_friendly_enabled', { Text = 'Enabled', Default = false, Tooltip = 'Enables ESP for friendly players.' })
	Friendly:AddToggle('esp_friendly_box', { Text = 'Boxes', Default = false, Tooltip = 'Enables boxes for friendly players.' }):AddColorPicker('esp_friendly_box_color', { Default = Color3.fromRGB(255, 255, 255), Title = 'Box Color', Transparency = 0 }):AddColorPicker('esp_friendly_boxoutline_color', { Default = Color3.fromRGB(0, 0, 0), Title = 'Box Outline Color', Transparency = 0 })
	Friendly:AddToggle('esp_friendly_boxfill', { Text = 'Box Fillings', Default = false, Tooltip = 'Enables box fillings for friendly players.' }):AddColorPicker('esp_friendly_boxfill_color', { Default = Color3.fromRGB(0, 0, 0), Title = 'Box Fill Color', Transparency = 0.5 })
	Friendly:AddToggle('esp_friendly_health', { Text = 'Health Bars', Default = false, Tooltip = 'Enables health bars for friendly players.' }):AddColorPicker('esp_friendly_healthhealthy_color', { Default = Color3.fromRGB(0, 255, 0), Title = 'Health Bar Healthy Color', Transparency = nil }):AddColorPicker('esp_friendly_healthdying_color', { Default = Color3.fromRGB(255, 0, 0), Title = 'Health Bar Dying Color', Transparency = nil }):AddColorPicker('esp_friendly_healthoutline_color', { Default = Color3.fromRGB(0, 0, 0), Title = 'Health Bar Outline Color', Transparency = 0 })
	Friendly:AddToggle('esp_friendly_name', { Text = 'Names', Default = false, Tooltip = 'Enables names for friendly players.' }):AddColorPicker('esp_friendly_name_color', { Default = Color3.fromRGB(255, 255, 255), Title = 'Name Color', Transparency = 0 }):AddColorPicker('esp_friendly_nameoutline_color', { Default = Color3.fromRGB(0, 0, 0), Title = 'Name Outline Color', Transparency = 0 })
	Friendly:AddToggle('esp_friendly_distance', { Text = 'Distances', Default = false, Tooltip = 'Enables distances for friendly players.' }):AddColorPicker('esp_friendly_distance_color', { Default = Color3.fromRGB(255, 255, 255), Title = 'Distance Color', Transparency = 0 }):AddColorPicker('esp_friendly_distanceoutline_color', { Default = Color3.fromRGB(0, 0, 0), Title = 'Distance Outline Color', Transparency = 0 })
	Friendly:AddToggle('esp_friendly_healthtext', { Text = 'Health', Default = false, Tooltip = 'Enables health text for friendly players.' }):AddColorPicker('esp_friendly_healthtext_color', { Default = Color3.fromRGB(255, 255, 255), Title = 'Health Text Color', Transparency = 0 }):AddColorPicker('esp_friendly_healthtextoutline_color', { Default = Color3.fromRGB(0, 0, 0), Title = 'Health Text Outline Color', Transparency = 0 })
	Friendly:AddToggle('esp_friendly_weapon', { Text = 'Weapons', Default = false, Tooltip = 'Enables weapons for friendly players.' }):AddColorPicker('esp_friendly_weapon_color', { Default = Color3.fromRGB(255, 255, 255), Title = 'Weapons Color', Transparency = 0 }):AddColorPicker('esp_friendly_weaponoutline_color', { Default = Color3.fromRGB(0, 0, 0), Title = 'Weapon Outline Color', Transparency = 0 })
	Friendly:AddToggle('esp_friendly_chams', { Text = 'Chams', Default = false, Tooltip = 'Enables chams for friendly players.' }):AddColorPicker('esp_friendly_chams_color', { Default = Color3.fromRGB(0, 200, 0), Title = 'Chams Fill Color', Transparency = 0 }):AddColorPicker('esp_friendly_chamsoutline_color', { Default = Color3.fromRGB(255, 255, 255), Title = 'Chams Outline Color', Transparency = 0 })
	Friendly:AddToggle('esp_friendly_arrows', { Text = 'Arrows', Default = false, Tooltip = 'Enables off-screen arrows for friendly players.' }):AddColorPicker('esp_friendly_arrow_color', { Default = Color3.fromRGB(255, 255, 255), Title = 'Arrow Color', Transparency = 0 }):AddColorPicker('esp_friendly_arrowoutline_color', { Default = Color3.fromRGB(0, 0, 0), Title = 'Arrow Outline Color', Transparency = 0 })
	Friendly:AddDivider()
	Friendly:AddSlider('esp_friendly_arrows_radius', { Text = 'Arrow Radius', Default = 150, Min = 0, Max = 300, Rounding = 2})
	Friendly:AddSlider('esp_friendly_arrows_size', { Text = 'Arrow Size', Default = 15, Min = 0, Max = 30, Rounding = 2})
	Friendly:AddDropdown('esp_friendly_chams_type', { Values = { 'AlwaysOnTop', "Occluded" }, Default = 1, Multi = false, Text = 'Chams Type', Tooltip = 'Changes how you see friendly chams.' })

end

--// Settings

local Settings = Window.Tabs.Settings:AddRightGroupbox("Settings") do
	Settings:AddToggle('settings_list', { Text = 'Keybind List', Default = false, Tooltip = 'Enables a list showing active keybinds.', Callback = function(v) Library.KeybindFrame.Visible = v end})
	Settings:AddToggle('settings_watermark', { Text = 'Watermark', Default = true, Tooltip = 'Enables a watermark', Callback = function(v) Library:SetWatermarkVisibility(v) end})
	Settings:AddButton('Unload', function() Library:Unload() end)
	Settings:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })
	Library.ToggleKeybind = Options.MenuKeybind
end

--// Watermark

Library:SetWatermarkVisibility(true)


local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function(delta)

    Library:SetWatermark(('Lunar.dev | Jailbird | %s fps | %s ms'):format(
        math.floor(1 / delta),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);

--// Setting up ui settings
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
ThemeManager:SetFolder('Lunar')
SaveManager:SetFolder('Lunar')
ThemeManager:ApplyToTab(Window.Tabs.Settings)
SaveManager:BuildConfigSection(Window.Tabs.Settings)
SaveManager:LoadAutoloadConfig()
SaveManager:IgnoreThemeSettings()

return Library, WatermarkConnection
