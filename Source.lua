repeat task.wait() until game:IsLoaded() -- Checking if the game is fully loaded.

--// Setting up variables for stuff that helps with the script.
local Loadtime, Sense, Utility =  tick(), loadstring(game:HttpGet("https://raw.githubusercontent.com/Streekaiz/Lunar/main/comps/esp.lua", true))(), loadstring(game:HttpGet("https://raw.githubusercontent.com/Streekaiz/Lunar/main/comps/utility.lua", true))(); Sense.Load()
local Library, Toggles, Options, Watermark = loadstring(game:HttpGet("https://raw.githubusercontent.com/Streekaiz/Lunar/main/comps/library.lua", true))()


do -- #SECT# Setting up ESP Toggles

	-- Options.esp_distance:OnChanged(function(Value) Sense.sharedSettings.maxDistance = Value; Sense.sharedSettings.limitDistance = true; end) Options.esp_text_font:OnChanged(function(Value) Sense.sharedSettings.textFont = Value end) Options.esp_text_size:OnChanged(function(Value) Sense.sharedSettings.textSize = Value; end) Toggles.esp_enemy_enabled:OnChanged(function(a)Sense.teamSettings.enemy.enabled=a end)Toggles.esp_enemy_box:OnChanged(function(a)Sense.teamSettings.enemy.box=a end)Options.esp_enemy_box_color:OnChanged(function(a)Sense.teamSettings.enemy.boxColor[1]=Options.esp_enemy_box_color.Value;Sense.teamSettings.enemy.boxColor[2]=1-Options.esp_enemy_box_color.Transparency end)Options.esp_enemy_boxoutline_color:OnChanged(function(a)Sense.teamSettings.enemy.boxOutlineColor[1]=Options.esp_enemy_boxoutline_color.Value;Sense.teamSettings.enemy.boxOutlineColor[2]=1-Options.esp_enemy_boxoutline_color.Transparency end)Toggles.esp_enemy_boxfill:OnChanged(function(a)Sense.teamSettings.enemy.boxFill=a end)Options.esp_enemy_boxfill_color:OnChanged(function(a)Sense.teamSettings.enemy.boxFillColor[1]=Options.esp_enemy_boxfill_color.Value;Sense.teamSettings.enemy.boxFillColor[2]=1-Options.esp_enemy_boxfill_color.Transparency end)Toggles.esp_enemy_health:OnChanged(function(a)Sense.teamSettings.enemy.healthBar=a end)Options.esp_enemy_healthhealthy_color:OnChanged(function(a)Sense.teamSettings.enemy.healthyColor=a end)Options.esp_enemy_healthdying_color:OnChanged(function(a)Sense.teamSettings.enemy.dyingColor=a end)Options.esp_enemy_healthoutline_color:OnChanged(function(a)Sense.teamSettings.enemy.healthBarOutlineColor[1]=Options.esp_enemy_healthoutline_color.Value;Sense.teamSettings.enemy.healthBarOutlineColor[2]=1-Options.esp_enemy_healthoutline_color.Transparency end)Toggles.esp_enemy_name:OnChanged(function(a)Sense.teamSettings.enemy.name=a end)Options.esp_enemy_name_color:OnChanged(function(a)Sense.teamSettings.enemy.nameColor[1]=Options.esp_enemy_name_color.Value;Sense.teamSettings.enemy.nameColor[2]=1-Options.esp_enemy_name_color.Transparency end)Options.esp_enemy_nameoutline_color:OnChanged(function(a)Sense.teamSettings.enemy.nameOutlineColor=a end)Toggles.esp_enemy_distance:OnChanged(function(a)Sense.teamSettings.enemy.distance=a end)Options.esp_enemy_distance_color:OnChanged(function(a)Sense.teamSettings.enemy.distanceColor[1]=Options.esp_enemy_distance_color.Value;Sense.teamSettings.enemy.distanceColor[2]=1-Options.esp_enemy_distance_color.Transparency end)Options.esp_enemy_distanceoutline_color:OnChanged(function(a)Sense.teamSettings.enemy.distanceOutlineColor=a end)Toggles.esp_enemy_healthtext:OnChanged(function(a)Sense.teamSettings.enemy.healthText=a end)Options.esp_enemy_healthtext_color:OnChanged(function(a)Sense.teamSettings.enemy.healthTextColor[1]=Options.esp_enemy_healthtext_color.Value;Sense.teamSettings.enemy.healthTextColor[2]=1-Options.esp_enemy_healthtext_color.Transparency end)Options.esp_enemy_healthtextoutline_color:OnChanged(function(a)Sense.teamSettings.enemy.healthTextOutlineColor=a end)Toggles.esp_enemy_weapon:OnChanged(function(a)Sense.teamSettings.enemy.weapon=a end)Options.esp_enemy_weapon_color:OnChanged(function(a)Sense.teamSettings.enemy.weaponColor[1]=Options.esp_enemy_weapon_color.Value;Sense.teamSettings.enemy.weaponColor[2]=1-Options.esp_enemy_weapon_color.Transparency end)Options.esp_enemy_weaponoutline_color:OnChanged(function(a)Sense.teamSettings.enemy.weaponOutlineColor=a end)Toggles.esp_enemy_chams:OnChanged(function(a)Sense.teamSettings.enemy.chams=a end)Options.esp_enemy_chams_color:OnChanged(function(a)Sense.teamSettings.enemy.chamsFillColor[1]=Options.esp_enemy_chams_color.Value;Sense.teamSettings.enemy.chamsFillColor[2]=Options.esp_enemy_chams_color.Transparency end)Options.esp_enemy_chamsoutline_color:OnChanged(function(a)Sense.teamSettings.enemy.chamsOutlineColor[1]=Options.esp_enemy_chamsoutline_color.Value;Sense.teamSettings.enemy.chamsOutlineColor[2]=Options.esp_enemy_chamsoutline_color.Transparency end)Options.esp_enemy_chams_type:OnChanged(function(a)if a=="AlwaysOnTop"then Sense.teamSettings.enemy.chamsVisibleOnly=false else Sense.teamSettings.enemy.chamsVisibleOnly=true end end)Toggles.esp_enemy_arrows:OnChanged(function(a)Sense.teamSettings.enemy.offScreenArrow=a end)Options.esp_enemy_arrow_color:OnChanged(function(a)Sense.teamSettings.enemy.offScreenArrowColor[1]=Options.esp_enemy_arrow_color.Value;Sense.teamSettings.enemy.offScreenArrowColor[2]=Options.esp_enemy_arrow_color.Transparency end)Options.esp_enemy_arrowoutline_color:OnChanged(function(a)Sense.teamSettings.enemy.offScreenArrowOutlineColor[1]=Options.esp_enemy_arrowoutline_color.Value;Sense.teamSettings.enemy.offScreenArrowOutlineColor[2]=Options.esp_enemy_arrowoutline_color.Transparency end)Options.esp_enemy_arrows_radius:OnChanged(function(a)Sense.teamSettings.enemy.offScreenArrowRadius=a end)Options.esp_enemy_arrows_size:OnChanged(function(a)Sense.teamSettings.enemy.offScreenArrowSize=a end)Toggles.esp_friendly_enabled:OnChanged(function(a)Sense.teamSettings.friendly.enabled=a end)Toggles.esp_friendly_box:OnChanged(function(a)Sense.teamSettings.friendly.box=a end)Options.esp_friendly_box_color:OnChanged(function(a)Sense.teamSettings.friendly.boxColor[1]=Options.esp_friendly_box_color.Value;Sense.teamSettings.friendly.boxColor[2]=1-Options.esp_friendly_box_color.Transparency end)Options.esp_friendly_boxoutline_color:OnChanged(function(a)Sense.teamSettings.friendly.boxOutlineColor[1]=Options.esp_friendly_boxoutline_color.Value;Sense.teamSettings.friendly.boxOutlineColor[2]=1-Options.esp_friendly_boxoutline_color.Transparency end)Toggles.esp_friendly_boxfill:OnChanged(function(a)Sense.teamSettings.friendly.boxFill=a end)Options.esp_friendly_boxfill_color:OnChanged(function(a)Sense.teamSettings.friendly.boxFillColor[1]=Options.esp_friendly_boxfill_color.Value;Sense.teamSettings.friendly.boxFillColor[2]=1-Options.esp_friendly_boxfill_color.Transparency end)Toggles.esp_friendly_health:OnChanged(function(a)Sense.teamSettings.friendly.healthBar=a end)Options.esp_friendly_healthhealthy_color:OnChanged(function(a)Sense.teamSettings.friendly.healthyColor=a end)Options.esp_friendly_healthdying_color:OnChanged(function(a)Sense.teamSettings.friendly.dyingColor=a end)Options.esp_friendly_healthoutline_color:OnChanged(function(a)Sense.teamSettings.friendly.healthBarOutlineColor[1]=Options.esp_friendly_healthoutline_color.Value;Sense.teamSettings.friendly.healthBarOutlineColor[2]=1-Options.esp_friendly_healthoutline_color.Transparency end)Toggles.esp_friendly_name:OnChanged(function(a)Sense.teamSettings.friendly.name=a end)Options.esp_friendly_name_color:OnChanged(function(a)Sense.teamSettings.friendly.nameColor[1]=Options.esp_friendly_name_color.Value;Sense.teamSettings.friendly.nameColor[2]=1-Options.esp_friendly_name_color.Transparency end)Options.esp_friendly_nameoutline_color:OnChanged(function(a)Sense.teamSettings.friendly.nameOutlineColor=a end)Toggles.esp_friendly_distance:OnChanged(function(a)Sense.teamSettings.friendly.distance=a end)Options.esp_friendly_distance_color:OnChanged(function(a)Sense.teamSettings.friendly.distanceColor[1]=Options.esp_friendly_distance_color.Value;Sense.teamSettings.friendly.distanceColor[2]=1-Options.esp_friendly_distance_color.Transparency end)Options.esp_friendly_distanceoutline_color:OnChanged(function(a)Sense.teamSettings.friendly.distanceOutlineColor=a end)Toggles.esp_friendly_healthtext:OnChanged(function(a)Sense.teamSettings.friendly.healthText=a end)Options.esp_friendly_healthtext_color:OnChanged(function(a)Sense.teamSettings.friendly.healthTextColor[1]=Options.esp_friendly_healthtext_color.Value;Sense.teamSettings.friendly.healthTextColor[2]=1-Options.esp_friendly_healthtext_color.Transparency end)Options.esp_friendly_healthtextoutline_color:OnChanged(function(a)Sense.teamSettings.friendly.healthTextOutlineColor=a end)Toggles.esp_friendly_weapon:OnChanged(function(a)Sense.teamSettings.friendly.weapon=a end)Options.esp_friendly_weapon_color:OnChanged(function(a)Sense.teamSettings.friendly.weaponColor[1]=Options.esp_friendly_weapon_color.Value;Sense.teamSettings.friendly.weaponColor[2]=1-Options.esp_friendly_weapon_color.Transparency end)Options.esp_friendly_weaponoutline_color:OnChanged(function(a)Sense.teamSettings.friendly.weaponOutlineColor=a end)Toggles.esp_friendly_chams:OnChanged(function(a)Sense.teamSettings.friendly.chams=a end)Options.esp_friendly_chams_color:OnChanged(function(a)Sense.teamSettings.friendly.chamsFillColor[1]=Options.esp_friendly_chams_color.Value;Sense.teamSettings.friendly.chamsFillColor[2]=Options.esp_friendly_chams_color.Transparency end)Options.esp_friendly_chamsoutline_color:OnChanged(function(a)Sense.teamSettings.friendly.chamsOutlineColor[1]=Options.esp_friendly_chamsoutline_color.Value;Sense.teamSettings.friendly.chamsOutlineColor[2]=Options.esp_friendly_chamsoutline_color.Transparency end)Options.esp_friendly_chams_type:OnChanged(function(a)if a=="AlwaysOnTop"then Sense.teamSettings.friendly.chamsVisibleOnly=false else Sense.teamSettings.friendly.chamsVisibleOnly=true end end)Toggles.esp_friendly_arrows:OnChanged(function(a)Sense.teamSettings.friendly.offScreenArrow=a end)Options.esp_friendly_arrow_color:OnChanged(function(a)Sense.teamSettings.friendly.offScreenArrowColor[1]=Options.esp_friendly_arrow_color.Value;Sense.teamSettings.friendly.offScreenArrowColor[2]=Options.esp_friendly_arrow_color.Transparency end)Options.esp_friendly_arrowoutline_color:OnChanged(function(a)Sense.teamSettings.friendly.offScreenArrowOutlineColor[1]=Options.esp_friendly_arrowoutline_color.Value;Sense.teamSettings.friendly.offScreenArrowOutlineColor[2]=Options.esp_friendly_arrowoutline_color.Transparency end)Options.esp_friendly_arrows_radius:OnChanged(function(a)Sense.teamSettings.friendly.offScreenArrowRadius=a end)Options.esp_friendly_arrows_size:OnChanged(function(a)Sense.teamSettings.friendly.offScreenArrowSize=a end)
	Sense.sharedSettings.limitDistance = true

	Options.esp_distance:OnChanged(
		function(Value)
			Sense.sharedSettings.maxDistance = Value
		end
	)
	Options.esp_text_font:OnChanged(
		function(Value)
			Sense.sharedSettings.textFont = Value
		end
	)
	Options.esp_text_size:OnChanged(
		function(Value)
			Sense.sharedSettings.textSize = Value
		end
	)
	Toggles.esp_enemy_enabled:OnChanged(
		function(a)
			Sense.teamSettings.enemy.enabled = a
		end
	)
	Toggles.esp_enemy_box:OnChanged(
		function(a)
			Sense.teamSettings.enemy.box = a
		end
	)
	Options.esp_enemy_box_color:OnChanged(
		function(a)
			Sense.teamSettings.enemy.boxColor[1] = Options.esp_enemy_box_color.Value
			Sense.teamSettings.enemy.boxColor[2] = 1 - Options.esp_enemy_box_color.Transparency
		end
	)
	Options.esp_enemy_boxoutline_color:OnChanged(
		function(a)
			Sense.teamSettings.enemy.boxOutlineColor[1] = Options.esp_enemy_boxoutline_color.Value
			Sense.teamSettings.enemy.boxOutlineColor[2] = 1 - Options.esp_enemy_boxoutline_color.Transparency
		end
	)
	Toggles.esp_enemy_boxfill:OnChanged(
		function(a)
			Sense.teamSettings.enemy.boxFill = a
		end
	)
	Options.esp_enemy_boxfill_color:OnChanged(
		function(a)
			Sense.teamSettings.enemy.boxFillColor[1] = Options.esp_enemy_boxfill_color.Value
			Sense.teamSettings.enemy.boxFillColor[2] = 1 - Options.esp_enemy_boxfill_color.Transparency
		end
	)
	Toggles.esp_enemy_health:OnChanged(
		function(a)
			Sense.teamSettings.enemy.healthBar = a
		end
	)
	Options.esp_enemy_healthhealthy_color:OnChanged(
		function(a)
			Sense.teamSettings.enemy.healthyColor = a
		end
	)
	Options.esp_enemy_healthdying_color:OnChanged(
		function(a)
			Sense.teamSettings.enemy.dyingColor = a
		end
	)
	Options.esp_enemy_healthoutline_color:OnChanged(
		function(a)
			Sense.teamSettings.enemy.healthBarOutlineColor[1] = Options.esp_enemy_healthoutline_color.Value
			Sense.teamSettings.enemy.healthBarOutlineColor[2] = 1 - Options.esp_enemy_healthoutline_color.Transparency
		end
	)
	Toggles.esp_enemy_name:OnChanged(
		function(a)
			Sense.teamSettings.enemy.name = a
		end
	)
	Options.esp_enemy_name_color:OnChanged(
		function(a)
			Sense.teamSettings.enemy.nameColor[1] = Options.esp_enemy_name_color.Value
			Sense.teamSettings.enemy.nameColor[2] = 1 - Options.esp_enemy_name_color.Transparency
		end
	)
	Options.esp_enemy_nameoutline_color:OnChanged(
		function(a)
			Sense.teamSettings.enemy.nameOutlineColor = a
		end
	)
	Toggles.esp_enemy_distance:OnChanged(
		function(a)
			Sense.teamSettings.enemy.distance = a
		end
	)
	Options.esp_enemy_distance_color:OnChanged(
		function(a)
			Sense.teamSettings.enemy.distanceColor[1] = Options.esp_enemy_distance_color.Value
			Sense.teamSettings.enemy.distanceColor[2] = 1 - Options.esp_enemy_distance_color.Transparency
		end
	)
	Options.esp_enemy_distanceoutline_color:OnChanged(
		function(a)
			Sense.teamSettings.enemy.distanceOutlineColor = a
		end
	)
	Toggles.esp_enemy_healthtext:OnChanged(
		function(a)
			Sense.teamSettings.enemy.healthText = a
		end
	)
	Options.esp_enemy_healthtext_color:OnChanged(
		function(a)
			Sense.teamSettings.enemy.healthTextColor[1] = Options.esp_enemy_healthtext_color.Value
			Sense.teamSettings.enemy.healthTextColor[2] = 1 - Options.esp_enemy_healthtext_color.Transparency
		end
	)
	Options.esp_enemy_healthtextoutline_color:OnChanged(
		function(a)
			Sense.teamSettings.enemy.healthTextOutlineColor = a
		end
	)
	Toggles.esp_enemy_weapon:OnChanged(
		function(a)
			Sense.teamSettings.enemy.weapon = a
		end
	)
	Options.esp_enemy_weapon_color:OnChanged(
		function(a)
			Sense.teamSettings.enemy.weaponColor[1] = Options.esp_enemy_weapon_color.Value
			Sense.teamSettings.enemy.weaponColor[2] = 1 - Options.esp_enemy_weapon_color.Transparency
		end
	)
	Options.esp_enemy_weaponoutline_color:OnChanged(
		function(a)
			Sense.teamSettings.enemy.weaponOutlineColor = a
		end
	)
	Toggles.esp_enemy_chams:OnChanged(
		function(a)
			Sense.teamSettings.enemy.chams = a
		end
	)
	Options.esp_enemy_chams_color:OnChanged(
		function(a)
			Sense.teamSettings.enemy.chamsFillColor[1] = Options.esp_enemy_chams_color.Value
			Sense.teamSettings.enemy.chamsFillColor[2] = Options.esp_enemy_chams_color.Transparency
		end
	)
	Options.esp_enemy_chamsoutline_color:OnChanged(
		function(a)
			Sense.teamSettings.enemy.chamsOutlineColor[1] = Options.esp_enemy_chamsoutline_color.Value
			Sense.teamSettings.enemy.chamsOutlineColor[2] = Options.esp_enemy_chamsoutline_color.Transparency
		end
	)
	Options.esp_enemy_chams_type:OnChanged(
		function(a)
			if a == "AlwaysOnTop" then
				Sense.teamSettings.enemy.chamsVisibleOnly = false
			else
				Sense.teamSettings.enemy.chamsVisibleOnly = true
			end
		end
	)
	Toggles.esp_enemy_arrows:OnChanged(
		function(a)
			Sense.teamSettings.enemy.offScreenArrow = a
		end
	)
	Options.esp_enemy_arrow_color:OnChanged(
		function(a)
			Sense.teamSettings.enemy.offScreenArrowColor[1] = Options.esp_enemy_arrow_color.Value
			Sense.teamSettings.enemy.offScreenArrowColor[2] = Options.esp_enemy_arrow_color.Transparency
		end
	)
	Options.esp_enemy_arrowoutline_color:OnChanged(
		function(a)
			Sense.teamSettings.enemy.offScreenArrowOutlineColor[1] = Options.esp_enemy_arrowoutline_color.Value
			Sense.teamSettings.enemy.offScreenArrowOutlineColor[2] = Options.esp_enemy_arrowoutline_color.Transparency
		end
	)
	Options.esp_enemy_arrows_radius:OnChanged(
		function(a)
			Sense.teamSettings.enemy.offScreenArrowRadius = a
		end
	)
	Options.esp_enemy_arrows_size:OnChanged(
		function(a)
			Sense.teamSettings.enemy.offScreenArrowSize = a
		end
	)
	Toggles.esp_friendly_enabled:OnChanged(
		function(a)
			Sense.teamSettings.friendly.enabled = a
		end
	)
	Toggles.esp_friendly_box:OnChanged(
		function(a)
			Sense.teamSettings.friendly.box = a
		end
	)
	Options.esp_friendly_box_color:OnChanged(
		function(a)
			Sense.teamSettings.friendly.boxColor[1] = Options.esp_friendly_box_color.Value
			Sense.teamSettings.friendly.boxColor[2] = 1 - Options.esp_friendly_box_color.Transparency
		end
	)
	Options.esp_friendly_boxoutline_color:OnChanged(
		function(a)
			Sense.teamSettings.friendly.boxOutlineColor[1] = Options.esp_friendly_boxoutline_color.Value
			Sense.teamSettings.friendly.boxOutlineColor[2] = 1 - Options.esp_friendly_boxoutline_color.Transparency
		end
	)
	Toggles.esp_friendly_boxfill:OnChanged(
		function(a)
			Sense.teamSettings.friendly.boxFill = a
		end
	)
	Options.esp_friendly_boxfill_color:OnChanged(
		function(a)
			Sense.teamSettings.friendly.boxFillColor[1] = Options.esp_friendly_boxfill_color.Value
			Sense.teamSettings.friendly.boxFillColor[2] = 1 - Options.esp_friendly_boxfill_color.Transparency
		end
	)
	Toggles.esp_friendly_health:OnChanged(
		function(a)
			Sense.teamSettings.friendly.healthBar = a
		end
	)
	Options.esp_friendly_healthhealthy_color:OnChanged(
		function(a)
			Sense.teamSettings.friendly.healthyColor = a
		end
	)
	Options.esp_friendly_healthdying_color:OnChanged(
		function(a)
			Sense.teamSettings.friendly.dyingColor = a
		end
	)
	Options.esp_friendly_healthoutline_color:OnChanged(
		function(a)
			Sense.teamSettings.friendly.healthBarOutlineColor[1] = Options.esp_friendly_healthoutline_color.Value
			Sense.teamSettings.friendly.healthBarOutlineColor[2] = 1 - Options.esp_friendly_healthoutline_color.Transparency
		end
	)
	Toggles.esp_friendly_name:OnChanged(
		function(a)
			Sense.teamSettings.friendly.name = a
		end
	)
	Options.esp_friendly_name_color:OnChanged(
		function(a)
			Sense.teamSettings.friendly.nameColor[1] = Options.esp_friendly_name_color.Value
			Sense.teamSettings.friendly.nameColor[2] = 1 - Options.esp_friendly_name_color.Transparency
		end
	)
	Options.esp_friendly_nameoutline_color:OnChanged(
		function(a)
			Sense.teamSettings.friendly.nameOutlineColor = a
		end
	)
	Toggles.esp_friendly_distance:OnChanged(
		function(a)
			Sense.teamSettings.friendly.distance = a
		end
	)
	Options.esp_friendly_distance_color:OnChanged(
		function(a)
			Sense.teamSettings.friendly.distanceColor[1] = Options.esp_friendly_distance_color.Value
			Sense.teamSettings.friendly.distanceColor[2] = 1 - Options.esp_friendly_distance_color.Transparency
		end
	)
	Options.esp_friendly_distanceoutline_color:OnChanged(
		function(a)
			Sense.teamSettings.friendly.distanceOutlineColor = a
		end
	)
	Toggles.esp_friendly_healthtext:OnChanged(
		function(a)
			Sense.teamSettings.friendly.healthText = a
		end
	)
	Options.esp_friendly_healthtext_color:OnChanged(
		function(a)
			Sense.teamSettings.friendly.healthTextColor[1] = Options.esp_friendly_healthtext_color.Value
			Sense.teamSettings.friendly.healthTextColor[2] = 1 - Options.esp_friendly_healthtext_color.Transparency
		end
	)
	Options.esp_friendly_healthtextoutline_color:OnChanged(
		function(a)
			Sense.teamSettings.friendly.healthTextOutlineColor = a
		end
	)
	Toggles.esp_friendly_weapon:OnChanged(
		function(a)
			Sense.teamSettings.friendly.weapon = a
		end
	)
	Options.esp_friendly_weapon_color:OnChanged(
		function(a)
			Sense.teamSettings.friendly.weaponColor[1] = Options.esp_friendly_weapon_color.Value
			Sense.teamSettings.friendly.weaponColor[2] = 1 - Options.esp_friendly_weapon_color.Transparency
		end
	)
	Options.esp_friendly_weaponoutline_color:OnChanged(
		function(a)
			Sense.teamSettings.friendly.weaponOutlineColor = a
		end
	)
	Toggles.esp_friendly_chams:OnChanged(
		function(a)
			Sense.teamSettings.friendly.chams = a
		end
	)
	Options.esp_friendly_chams_color:OnChanged(
		function(a)
			Sense.teamSettings.friendly.chamsFillColor[1] = Options.esp_friendly_chams_color.Value
			Sense.teamSettings.friendly.chamsFillColor[2] = Options.esp_friendly_chams_color.Transparency
		end
	)
	Options.esp_friendly_chamsoutline_color:OnChanged(
		function(a)
			Sense.teamSettings.friendly.chamsOutlineColor[1] = Options.esp_friendly_chamsoutline_color.Value
			Sense.teamSettings.friendly.chamsOutlineColor[2] = Options.esp_friendly_chamsoutline_color.Transparency
		end
	)
	Options.esp_friendly_chams_type:OnChanged(
		function(a)
			if a == "AlwaysOnTop" then
				Sense.teamSettings.friendly.chamsVisibleOnly = false
			else
				Sense.teamSettings.friendly.chamsVisibleOnly = true
			end
		end
	)
	Toggles.esp_friendly_arrows:OnChanged(
		function(a)
			Sense.teamSettings.friendly.offScreenArrow = a
		end
	)
	Options.esp_friendly_arrow_color:OnChanged(
		function(a)
			Sense.teamSettings.friendly.offScreenArrowColor[1] = Options.esp_friendly_arrow_color.Value
			Sense.teamSettings.friendly.offScreenArrowColor[2] = Options.esp_friendly_arrow_color.Transparency
		end
	)
	Options.esp_friendly_arrowoutline_color:OnChanged(
		function(a)
			Sense.teamSettings.friendly.offScreenArrowOutlineColor[1] = Options.esp_friendly_arrowoutline_color.Value
			Sense.teamSettings.friendly.offScreenArrowOutlineColor[2] = Options.esp_friendly_arrowoutline_color.Transparency
		end
	)
	Options.esp_friendly_arrows_radius:OnChanged(
		function(a)
			Sense.teamSettings.friendly.offScreenArrowRadius = a
		end
	)
	Options.esp_friendly_arrows_size:OnChanged(
		function(a)
			Sense.teamSettings.friendly.offScreenArrowSize = a
		end
	)	
end

do --#SECT# Setting up connections
	do -- #TABSECT# Setting up visual tab
		do -- #SUBSECT# Toggle & Option UI connections
			
			Options.visual_ambient_1:OnChanged(function(v)
				game:GetService("Lighting").Ambient = Options.visual_ambient_1.Value
			end)
			
			Options.visual_ambient_2:OnChanged(function()
				game:GetService("Lighting").OutdoorAmbient = Options.visual_ambient_2.Value
			end)
			
			Options.visual_fogend:OnChanged(function()
				game:GetService("Lighting").FogEnd = Options.visual_fogend.Value
			end)
			
			Options.visual_fogstart:OnChanged(function()
				game:GetService("Lighting").FogStart = Options.visual_fogstart.Value
			end)
			
			Options.visual_fogcolor:OnChanged(function() 
				game:GetService("Lighting").FogColor = Options.visual_fogcolor.Value
			end)
			
			Toggles.visual_fov_enabled:OnChanged(function()
				workspace.CurrentCamera.FieldOfView = Toggles.visual_fov_enabled.Value and Options.visual_fov_value.Value or 70
			end)

			Options.visual_fov_value:OnChanged(function() 
				workspace.CurrentCamera.FieldOfView = Toggles.visual_fov_enabled.Value and Options.visual_fov_value.Value
			end)

			Toggles.visual_streched_enabled:OnChanged(function(v)
				workspace.CurrentCamera.CFrame = not v and workspace.CurrentCamera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
			end)

			Options.visual_camerazoom:OnChanged(function()
				game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = Options.visual_camerazoom.Value
			end)
		end
		do -- #SUBSECT# Visual connections
			Utility:Connect(game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"), function(v)
				if v ~= Options.visual_ambient_1.Value and Toggles.visual_ambient_enabled.Value then
					game:GetService("Lighting").Ambient = Options.visual_ambient_1.Value
				end
			end)
	
			Utility:Connect(game:GetService("Lighting"):GetPropertyChangedSignal("OutdoorAmbient"), function(v)
				if v ~= Options.visual_ambient_1.Value and Toggles.visual_ambient_enabled.Value then
					game:GetService("Lighting").Ambient = Options.visual_ambient_1.Value
				end
			end)

			Utility:Connect(game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"), function(v)
				game:GetService("Lighting").FogEnd = Options.visual_fogend.Value
			end)
	
			Utility:Connect(game:GetService("Lighting"):GetPropertyChangedSignal("FogStart"), function(v)
				game:GetService("Lighting").FogStart = Options.visual_fogstart.Value
			end)

			Utility:Connect(game:GetService("Lighting"):GetPropertyChangedSignal("FogColor"), function(v)
				game:GetService("Lighting").FogColor = Options.visual_fogcolor.Value
			end)

			Utility:Connect(workspace.CurrentCamera:GetPropertyChangedSignal("FieldOfView"), function(v)
				if v ~= Options.visual_fov_value.Value and Toggles.visual_fov_enabled then
					workspace.CurrentCamera.FieldOfView = Toggles.visual_fov_enabled.Value and Options.visual_fov_value.Value
				end
			end)

			Utility:Connect(game:GetService("Players").LocalPlayer:GetPropertyChangedSignal("CameraMaxZoomDistance"), function(v)
				if v ~= Options.visual_camerazoom.Value then
					v = Options.visual_camerazoom.Value
				end
			end)
		end
	end
end

-- Creating a renderstepped loop

Utility:Connect(game:GetService("RunService").RenderStepped, function()
	workspace.CurrentCamera.CFrame = Toggles.visual_streched_enabled.Value and workspace.CurrentCamera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, 0.Options.visual_streched_value, 0, 0, 0, 1)


	for _, v in next, game:GetService("Players"):GetPlayers() do -- #SUBSECT# Player Modifications
		if v == game:GetService("Players").LocalPlayer then return end -- Checks if v is the local player, & returns if they are to prevent modifications
		if not Utility:isAlive(v) then return end -- Checks if v has a humanoid with health > 0
		if Toggles.hitbox_enabled.Value then -- Checks if the toggle is enabled
			if not table.find(Options.hitbox_whitelist, v.Name) then -- Checks if the player's name isn't in the whitelist
				local part = Options.hitbox_part.Value == "Head" and v.Character.Head or v.Character.Torso or v.Character.UpperTorso
				part.Size = Vector3.new(Options.hitbox_amount_x.Value, Options.hitbox_amount_y.Value, Options.hitbox_amount_z.Value)
				part.Color = Options.hitbox_color.Value
				part.Material = Options.hitbox_material.Value 
				part.Transparency = Options.hitbox_transparency.Value
			end
		end
	end
end)

-- Setting up unload function

Library:OnUnload(function()
	Sense.Unload()
	Watermark:Disconnect()
	Library.Unloaded = true
	Utility:Unload()
end)
