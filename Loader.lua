local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Streekaiz/Lunar/main/Modules/Library.lua"))()
local Math = loadstring(game:HttpGet("https://raw.githubusercontent.com/Streekaiz/Lunar/main/Modules/Math.lua"))()
local Utility = loadstring(game:HttpGet("https://pastebin.com/raw/1nKp2Htt"))()
local Watermark = Library:Watermark("Lunar | Project Delta | FPS: 60 | Ping: 100 | Status: Developer | Username")
local Loader = Library:Loader({
    Title = "Lunar | Project Delta",
    Description = "Loading . . .",
    Percentage = 0,
    Date = os.date("%x"),
    Added = {"Released!"},
    Removed = {},
    Changed = {},
    Callback = function()
        Utility.Loaded = true
    end
})

for i = 1, 99, 1 do 
    Loader:Set("Loading . . .", i)
    task.wait()
end; task.wait(1); Loader:Set("Loaded! Enjoy your experience.", 100)

repeat task.wait() until Utility.Loaded

local Window = Library:Load({
    Title = "Lunar",
    Folder = "Lunar",
    Extension = "json",
    Game = "Project_Delta",
    PlayerList = true,
    PerformanceDrag = false
})

local Tab = {
    Combat = Window:Tab(" Combat "),
    Visuals = Window:Tab(" Visual "),
    Misc = Window:Tab(" Miscallaenous "),
    Settings = Window:SettingsTab(Watermark)
}

local Section = {
    Combat = {
        Aimbot = Tab.Combat:Section({Name = "Aimbot", Side = "Left"}),
        Settings = Tab.Combat:Section({Name = "Settings", Side = "Left"}),
        Silent = Tab.Combat:Section({Name = "Bullet Manipulation", Side = "Middle"}),
        Mods = Tab.Combat:Section({Name = "Weapon Modifications", Side = "Middle"}),
        Anti = Tab.Combat:Section({Name = "Anti Aim", Side = "Right"})
    },
    Visuals = {
        ESP = {
            [1] = "Player ESP",
            [2] = "Monuments",
            [3] = "Extracts"
        },
        Viewmodel = {
            [1] = "Arms",
            [2] = "Weapons",
            [3] = "Character"
        },
        Misc = {
            [1] = "Render",
            [2] = "World",
            [3] = "Misc"
        }
    },
    Misc = {
        Inflict = {
            [1] = "Markers",
            [2] = "Logs",
            [3] = "Sounds"
        }
    },
    Elements = {} -- variables in here incase i need to add or remove
}

Section.Visuals.ESP[1], Section.Visuals.ESP[2], Section.Visuals.ESP[3] = Tab.Visuals:MultiSection({Side = "Left", Sections = {"Players ", "Monuments ", "Extracts "}})
Section.Visuals.Viewmodel[1], Section.Visuals.Viewmodel[2], Section.Visuals.Viewmodel[3] = Tab.Visuals:MultiSection({Side = "Middle", Sections = {"Arms ", "Weapons ", "Character "}})
Section.Visuals.Misc[1], Section.Visuals.Misc[2], Section.Visuals.Misc[3] = Tab.Visuals:MultiSection({Side = "Right", Sections = {"Render ", "World ", "Misc "}})
Section.Misc.Inflict[1], Section.Misc.Inflict[2], Section.Misc.Inflict[3] = Tab.Misc:MultiSection({Side = "Right", Sections = {"Markers ", "Logs ", "Sounds "}})
Section.Combat.Aimbot:Toggle({Name = "Enabled", Default = false, Flag = "Aimbot_Enabled"}):Keybind({Name = "Aimbot", Mode = "normal", Flag = "Aimbot_Keybind"})
Section.Combat.Aimbot:Dropdown({Name = "Aimbot Method", Content = {"Mousemoverel", "TweenService"}, Default = "TweenService", Flag = "Aimbot_Method", ToolTip = "The method used to move your cursor."})
Section.Combat.Aimbot:Dropdown({Name = "Target Area", Content = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso"}, Default = "Head", Flag = "Aimbot_Target"})
Section.Combat.Aimbot:Slider({Name = "Smoothing", Min = 0, Max = 1, Default = 0.5, Flag = "Aimbot_Smoothing"})
Section.Combat.Aimbot:Separator("FOV Circle")
Section.Combat.Aimbot:Toggle({Name = "Visible", Default = true, Flag = "Aimbot_FOV_Enabled"}):Colorpicker({Name = "Circle Color", Default = Color3.fromRGB(200, 0, 0), Flag = "Aimbot_FOV_Color"})
Section.Combat.Aimbot:Slider({Name = "Radius:", Min = 60, Max = 360, Default = 180, Flag = "Aimbot_FOV_Radius"})

Section.Combat.Silent:Toggle({Name = "Enabled", Default = false, Flag = "Silent_Enabled"}):Keybind({Name = "Silent Aim", Mode = "normal", Flag = "Silent_Keybind"})
Section.Combat.Silent:Toggle({Name = "Prediction", Default = true, Flag = "Silent_Prediction"})
Section.Combat.Silent:Dropdown({Name = "Target Area", Content = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso"}, Default = "Head", Flag = "Silent_Target"})
Section.Combat.Silent:Separator("Hit Chance")
Section.Combat.Silent:Toggle({Name = "Enabled", Default = false, Flag = "Silentt_Hit_Enabled"})
Section.Combat.Silent:Slider({Name = "Hit Chance:", Min = 0, Max = 100, Default = 100, Suffix = "%", Flag = "Silent_Hit_Chance"})
Section.Combat.Silent:Separator("FOV Circle")
Section.Combat.Silent:Toggle({Name = "Visible", Default = true, Flag = "Silentt_FOV_Enabled"}):Colorpicker({Name = "Circle Color", Default = Color3.fromRGB(0, 0, 200), Flag = "Silent_FOV_Color"})
Section.Combat.Silent:Slider({Name = "Radius:", Min = 60, Max = 360, Default = 180, Flag = "Silent_FOV_Radius"})

Section.Combat.Settings:Separator("Distance Checks")
Section.Combat.Settings:Toggle({Name = "Enabled", Default = false, Flag = "Combat_Distance_Enabled"})
Section.Combat.Settings:Slider({Name = "Maximum Distance:", Min = 250, Max = 2000, Default = 1000, Suffix = " meters", Flag = "Combat_Distance_Value"})
Section.Combat.Settings:Separator("Target Whitelisting")
Section.Combat.Settings:Toggle({Name = "Target AI / NPCS", Default = true, Flag = "Combat_AI"})
Section.Combat.Settings:Toggle({Name = "Target friends", Flag = "Combat_WL_Friends"})
Section.Combat.Settings:Toggle({Name = "Target whitelisted", ToolTip = "Whitelist people via the player list.", Flag = "Combat_WL_List"})

Section.Combat.Mods:Toggle({Name = "Quick Aim", Flag = "Mods_Aim"})
Section.Combat.Mods:Slider({Name = "Aim In Speed", Min = 0, Max = 2.5, Float = 0.1, Flag = "Mods_Aim_In", Suffix = " milliseconds"})
Section.Combat.Mods:Slider({Name = "Aim Out Speed", Min = 0, Max = 2.5, Float = 0.1, Flag = "Mods_Aim_Out", Suffix = " milliseconds"})
Section.Combat.Mods:Toggle({Name = "No Recoil", Flag = "Mods_Recoil"})
Section.Combat.Mods:Toggle({Name = "Fire Rate", Flag = "Mods_Fire"})
Section.Combat.Mods:Slider({Name = "Rate:", Min = 0, Max = 1, Default = 0.5, Flag = "Mods_Fire_Value"})

Section.Misc.Inflict[1]:Toggle({Name = "Enabled", Flag = "Hit_Marker"}):Colorpicker({Name = "Hit Marker Color", Default = Color3.fromRGB(255,0,0), Flag = "Hit_Marker_Color"})
Section.Misc.Inflict[1]:Dropdown({Name = "Only display if hit is:", Content = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso"}, Multi = true, Default = {"Head"}, Flag = "Hit_Marker_Targets"})
Section.Misc.Inflict[1]:Slider({Name = "Delay:", Min = 0, Max = 1.5, Default = 0, Float = 0.1, Flag = "Hit_Marker_Delay"})
Section.Misc.Inflict[1]:Slider({Name = "Lifetime:", Min = 0.25, Max = 3, Default = 1, Float = 0.05, Flag = "Hit_Marker_Life"})

Section.Misc.Inflict[2]:Toggle({Name = "Enabled", Flag = "Hit_Log"}):Colorpicker({Name = "Hit Log Color", Default = Color3.fromRGB(255,0,0), Flag = "Hit_Log_Color"})
Section.Misc.Inflict[2]:Box({Name = "Title Format"})
Section.Misc.Inflict[2]:Box({Name = "Description Format", ToolTip = "{Username}, {Area}"})
Section.Misc.Inflict[2]:Slider({Name = "Lifetime:", Min = 0.25, Max = 3, Default = 2.5, Float = 0.05, Flag = "Hit_Log_Life"})

Section.Misc.Inflict[3]:Toggle({Name = "Enabled", Flag = "Hit_Sound"})
Section.Misc.Inflict[3]:Dropdown({Name = "Sound:", Content = {"Skeet", "NeverLose", "Rust", "Osu"}, Default = "Head", Flag = "Hit_Sound_Type"})
Section.Misc.Inflict[3]:Slider({Name = "Volume:", Min = 0, Max = 1.5, Default = 0, Float = 0.1, Flag = "Hit_Sound_Volume"})
Section.Misc.Inflict[3]:Slider({Name = "Pitch:", Min = 0.25, Max = 3, Default = 1, Float = 0.05, Flag = "Hit_Sound_Pitch"})
Section.Misc.Inflict[3]:Button({Name = "Sound Preview", Callback = function()

end})

Section.Visuals.ESP[1]:Toggle({Name = "Enabled", Default = false, Flag = "ESP_Enabled"}):Keybind({Name = "ESP", Flag = "ESP_Key", Mode = "normal"})
local TogBox = Section.Visuals.ESP[1]:Toggle({Name = "Box", Default = false, Flag = "ESP_Box"})
TogBox:Colorpicker({Name = "Box Color", Default = Color3.fromRGB(255, 255, 255), Flag = "ESP_Box_Color"})
TogBox:Colorpicker({Name = "Box Outline Color", Default = Color3.fromRGB(255, 255, 255), Flag = "ESP_Box_Outline_Color"})

local TogHealth = Section.Visuals.ESP[1]:Toggle({Name = "Health", Default = false, Flag = "ESP_Health"})
TogHealth:Colorpicker({Name = "Health Color", Default = Color3.fromRGB(0, 0, 0), Flag = "ESP_Health_Color"})
TogHealth:Colorpicker({Name = "Health Outline Color", Default = Color3.fromRGB(0, 0, 0), Flag = "ESP_Health_Outline_Color"})
Section.Visuals.ESP[1]:Toggle({Name = "Name", Default = false, Flag = "ESP_Name"}):Colorpicker({Name = "Name Color", Default = Color3.fromRGB(255, 255, 255), Flag = "ESP_Name_Color"})
Section.Visuals.ESP[1]:Toggle({Name = "Distance", Default = false, Flag = "ESP_Distance"}):Colorpicker({Name = "Distance Color", Default = Color3.fromRGB(255, 255, 255), Flag = "ESP_Distance_Color"})
Section.Visuals.ESP[1]:Toggle({Name = "Weapon", Default = false, Flag = "ESP_Weapon"}):Colorpicker({Name = "Weapon Color", Default = Color3.fromRGB(255, 255, 255), Flag = "ESP_Weapon_Color"})
Section.Visuals.ESP[1]:Toggle({Name = "Chams", Default = false, Flag = "ESP_Cham"}):Colorpicker({Name = "Chams Color", Default = Color3.fromRGB(255, 0, 0), Flag = "ESP_Cham_Color"})
Section.Visuals.ESP[1]:Toggle({Name = "Chams Outline", Default = false, Flag = "ESP_Cham_Outline"}):Colorpicker({Name = "Outline Color", Default = Color3.fromRGB(0, 0, 0), Flag = "ESP_Cham_Outline_Color"})
Section.Visuals.ESP[1]:Slider({Name = "Maximum Distance", Default = false, Flag = "ESP_MaxDistance", Min = 250, Max = 2500, Default = 1000, Suffix = " meters"})
Section.Visuals.ESP[1]:Separator("Text Settings")
Section.Visuals.ESP[1]:Dropdown({Name = "Name Type", Content = {"Username", "Display"}, Flag = "ESP_Name_Type", Default = "Username"})
Section.Visuals.ESP[1]:Dropdown({Name = "Distance Type", Content = {"Meters", "Studs"}, Flag = "ESP_Distance_Type", Default = "Meters"})
Section.Visuals.ESP[1]:Separator("Player Whitelisting")
Section.Visuals.ESP[1]:Toggle({Name = "Show AI / NPCS", Default = true, Flag = "ESP_AI"})
Section.Visuals.ESP[1]:Toggle({Name = "Show friends", Default = false, Flag = "ESP_Friends"})
Section.Visuals.ESP[1]:Toggle({Name = "Show whitelisted", Default = false, Flag = "ESP_Whitelist"}) 

Section.Visuals.Viewmodel[1]:Toggle({Name = "Enabled", Flag = "Viewmodel_Arms", Callback = function()
    
end}):Colorpicker({Name = "Arms Color", Default = Color3.fromRGB(126, 33, 255), Flag = "Viewmodel_Arms_Color"})
Section.Visuals.Viewmodel[1]:Dropdown({Name = "Material", Content = {"Forcefield", "Neon", "Plastic"}})
Section.Visuals.Viewmodel[2]:Toggle({Name = "Enabled", Flag = "Viewmodel_Arms", Callback = function()
    
end}):Colorpicker({Name = "Arms Color", Default = Color3.fromRGB(126, 33, 255), Flag = "Viewmodel_Arms_Color"})
Section.Visuals.Viewmodel[2]:Dropdown({Name = "Material", Content = {"Forcefield", "Neon", "Plastic"}})
Section.Visuals.Viewmodel[3]:Toggle({Name = "Enabled", Flag = "Viewmodel_Arms", Callback = function()
    
end}):Colorpicker({Name = "Arms Color", Default = Color3.fromRGB(126, 33, 255), Flag = "Viewmodel_Arms_Color"})
Section.Visuals.Viewmodel[3]:Dropdown({Name = "Material", Content = {"Forcefield", "Neon", "Plastic"}})
Library:Init()

Utility:Connect(game:GetService("RunService").Heartbeat, function()
    if workspace.Camera:FindFirstChild("ViewModel") then
        Utility:ChangeArms{{
            
        }}
        Utility:ChangeArms{{
            Type = "Color",
            Color = Library.flags["Viewmodel_Arms_Color"]
        }}
        Utility:ChangeArms{{
            Type = "Material",
            Material = Library.flags["Viewmodel_Arms_Material"]
        }}
    end
end)

Utility:Connect(game:GetService("RunService").RenderStepped, function(Delta)
    Watermark:Set("Lunar | Project Delta | FPS: " .. math.round(1 / Delta) .. " | Ping: " .. game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(math.round(2 / Delta)) .. " | Status: Developer | " .. tostring(game:GetService("Players").LocalPlayer.Name))
    for _, plr in pairs(game.Players:GetPlayers()) do
        if Library.flags["ESP_Enabled"] and Utility:IsAlive(plr) and Utility.ESP[plr] and plr.Name ~= game:GetService("Players").LocalPlayer.Name then
            local player_table = Utility.ESP[plr]

            local bbox_orintation, bbox_size = plr.Character:GetBoundingBox()

            local width = (workspace.CurrentCamera.CFrame - workspace.CurrentCamera.CFrame.p) * Vector3.new((math.clamp(bbox_size.X, 1, 10) + 0.5) / 2, 0, 0)
            local height = (workspace.CurrentCamera.CFrame - workspace.CurrentCamera.CFrame.p) * Vector3.new(0, (math.clamp(bbox_size.X, 1, 10) + 2) / 2, 0)

            width = math.abs(workspace.CurrentCamera:WorldToViewportPoint(bbox_orintation.Position + width).X - workspace.CurrentCamera:WorldToViewportPoint(bbox_orintation.Position - width).X)
            height = math.abs(workspace.CurrentCamera:WorldToViewportPoint(bbox_orintation.Position + height).Y - workspace.CurrentCamera:WorldToViewportPoint(bbox_orintation.Position - height).Y)
            
            local size = Vector2.new(math.floor(width), math.floor(height))

            size = Vector2.new(size.X % 2 == 0 and size.X or size.X + 1, size.Y % 2 == 0 and size.Y or size.Y + 1)

            local rootPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)

            if onScreen then
                if Library.flags["ESP_Box"] then
                    player_table.Box.Visible = onScreen
                    player_table.Box.Size = size
                    player_table.Box.Position = Vector2.new(math.floor(rootPos.X), math.floor(rootPos.Y)) - (player_table.Box.Size / 2)
                    player_table.Box.Color = Library.flags["ESP_Box_Color"]

                    player_table.BoxOutline.Visible = onScreen
                    player_table.BoxOutline.Size = size
                    player_table.BoxOutline.Position = Vector2.new(math.floor(rootPos.X), math.floor(rootPos.Y)) - (player_table.Box.Size / 2)
                else
                    player_table.Box.Visible = false
                    player_table.BoxOutline.Visible = false
                end

                if Library.flags["ESP_Health"] then
                    player_table.Health.Visible = onScreen
                    player_table.Health.Size = Vector2.new(2, size.Y * (1-((plr.Character.Humanoid.MaxHealth - plr.Character.Humanoid.Health) / plr.Character.Humanoid.MaxHealth)))
                    player_table.Health.Position = Vector2.new(math.floor(rootPos.X) - 6, math.floor(rootPos.Y) + (size.Y - math.floor(player_table.Health.Size.Y))) - size / 2
                    player_table.Health.Color = Library.flags["ESP_Health_Color"]

                    player_table.HealthOutline.Visible = onScreen
                    player_table.HealthOutline.Size = Vector2.new(4, size.Y + 2)
                    player_table.HealthOutline.Position = Vector2.new(math.floor(rootPos.X) - 7, math.floor(rootPos.Y) - 1) - size / 2
                else
                    player_table.Health.Visible = false
                    player_table.HealthOutline.Visible = false
                end

                if Library.flags["ESP_Name"] then
                    player_table.Name.Visible = onScreen
                    player_table.Name.Position = Vector2.new(math.floor(rootPos.X), math.floor(rootPos.Y) - size.Y / 2 - 16)
                    player_table.Name.Color = Library.flags["ESP_Name_Color"]
                    player_table.Name.Text = Library.flags["ESP_Name_Type"] == "Username" and tostring(plr.Name) or tostring(plr.DisplayName)
                else
                    player_table.Name.Visible = false
                end
                
                if Library.flags["ESP_Distance"] then
                    player_table.Distance.Visible = onScreen
                    player_table.Distance.Position = Vector2.new(math.floor(rootPos.X), math.floor(rootPos.Y) + size.Y / 2 + 4)
                    player_table.Distance.Color = Library.flags["ESP_Distance_Color"]
                    player_table.Distance.Text = tostring(math.round((plr.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)) .. " " .. Library.flags["ESP_Distance_Type"]
                else
                    player_table.Distance.Visible = false
                end

                if Library.flags["ESP_Weapon"] and game:GetService("ReplicatedStorage"):FindFirstChild("Players"):FindFirstChild(plr.Name) then
                    local t = game:GetService("ReplicatedStorage").Players[plr.Name].Status.GameplayVariables.EquippedTool
                    local obj = t.Value
                    local str = obj ~= nil and obj.Name or "Hands"
                    player_table.Weapon.Visible = onScreen
                    player_table.Weapon.Position = Vector2.new(math.floor(rootPos.X), math.floor(rootPos.Y) + size.Y / 2 + 17)
                    player_table.Weapon.Color = Library.flags["ESP_Weapon_Color"]
                    player_table.Weapon.Text = str
                else
                    player_table.Weapon.Visible = false
                end

                if Library.flags["ESP_Cham"] then
                    if plr.Character:FindFirstChildOfClass("Highlight") == nil then
                        local highlight = Instance.new("Highlight", plr.Character.HumanoidRootPart)
                        highlight.FillTransparency = 0.3
                        highlight.OutlineTransparency = 1
                        highlight.Adornee = plr.Character
                    end
                    plr.Character.Highlight.FillColor = Library.flags["ESP_Cham_Color"]
                    if Library.flags["ESP_Cham_Outline"] then
                        plr.Character.Highlight.OutlineTransparency = 0.3
                        plr.Character.Highlight.OutlineColor = Library.flags["ESP_Cham_Outline_Color"]
                    else
                        plr.Character.Highlight.OutlineTransparency = 1
                    end
                else
                    if plr.Character:FindFirstChildOfClass("Highlight") then
                        plr.Character:FindFirstChildOfClass("Highlight"):Destroy()
                    end
                end
            else
                for i, v in pairs(player_table) do
                    v.Visible = false
                end
                
                if plr.Character.HumanoidRootPart:FindFirstChildOfClass("Highlight") then
                    plr.Character.HumanoidRootPart:FindFirstChildOfClass("Highlight"):Destroy()
                end
            end
        else
            if Utility.ESP[plr] then
                for i, v in pairs(Utility.ESP[plr]) do
                    if v.Visible ~= false then
                        v.Visible = false
                    end
                end
            end

            if Utility:IsAlive(plr) and plr.Character.HumanoidRootPart:FindFirstChildOfClass("Highlight") then
                plr.Character.HumanoidRootPart:FindFirstChildOfClass("Highlight"):Destroy()
            end
        end
    end
end)

function Utility:GetClosestPlayer(radius)
    local target = nil
    for _, v in pairs(game:GetService("Players"):GetPlayers()) do
        local iswl = Library.flags["Combat_WL_List"] and table.find(Utility.Whitelisted, v.Name) or false
        local isfr = Library.flags["Combat_WL_Friends"] and game:GetService("Players").LocalPlayer:IsFriendsWith(v.UserId) or false
        if v.Name ~= game:GetService("Players").LocalPlayer.Name and Utility:IsAlive(v) then
            if not iswl and not isfr then
                local pos, os = Utility:WorldToViewport(v.Character.HumanoidRootPart)
                if os then
                    local ScreenPoint = workspace.CurrentCamera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                    local VectorDistance = (Vector2.new(game:GetService("UserInputService"):GetMouseLocation().X, game:GetService("UserInputService"):GetMouseLocation().Y ) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                    if VectorDistance <= radius then
                        target = v
                    end
                end
            end
        end
    end
    return target
end
