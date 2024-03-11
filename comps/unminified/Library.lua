

local Fluent, SaveManager, InterfaceManager = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))(), loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))(), loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "lunar",
    SubTitle = " .gg/lunar",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})



local Tabs = {
    Home = Window:AddTab({ Title = "Home", Icon = "" }),
    Player = Window:AddTab({ Title = "Player", Icon = ""}),
    Combat = Window:AddTab({ Title = "Combat", Icon = "" })
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

Home:AddSection("Discord") do
    Tabs.Home:AddButton({
        Title = "Copy discord link",
        Description = "",
        Callback = function()
            setclipboard()
        end
    })
    Tabs.Home:AddParagraph({
        Title = "Information",
        Content = "Get notified on updates & new tools"
    })
end

Home:AddSection("Changelogs") do
    Tabs.Home:AddParagraph({
        Title = "Update 1.1",
        Content = "• Debug Logs\n• Hitbox Expansion\n• Server Extension"
    })

    Tabs.Home:AddParagraph({
        Title = "Planned Updates",
        Content = "• ESP"
    })
end

Home:AddSection("Server") do
    Tabs.Home:AddButton({
        Title = "Rejoin",
        Description = "Re-joins your server.",
        Callback = function()
            if game:GetService("Players"):GetPlayers() <= 1 then
                game:GetService("Players").LocalPlayer:Kick("\nRejoining...")
                task.wait(0.5)
                TeleportService:Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
            else
                TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
            end        
        end
    })
    Tabs.Home:AddButton({
        Title = "Server-hop",
        Description = "Puts you in a different server.",
        Callback = function()
            local servers = {}
            local req = http_request({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)})
            local body = game:GetService("HttpService"):JSONDecode(req.Body)
            if body and body.data then
                for i, v in next, body.data do
                    if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
                        table.insert(servers, 1, v.id)
                    end
                end
            end
            if #servers > 0 then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game:GetService("Players").LocalPlayer)
            else
                Window:Dialog({
                    Title = "Error",
                    Content = "We couldn't find a server.",
                    Buttons = {
                        {
                            Title = "Okay",
                            Callback = function() end
                        },
                        {
                            Title = "Retry",
                            Callback = function()
                                local servers = {}
                                local req = http_request({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)})
                                local body = game:GetService("HttpService"):JSONDecode(req.Body)
                                if body and body.data then
                                    for i, v in next, body.data do
                                        if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
                                            table.insert(servers, 1, v.id)
                                        end
                                    end
                                end
                                if #servers > 0 then
                                    TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game:GetService("Players").LocalPlayer)
                                end
                            end
                        }
                    }
                })
            end
        end
    })
    Tabs.Home:AddInput("server_input", {
        Title = "Join Player",
        Default = "",
        Placeholder = "username / id",
        Numeric = false, -- Only allows numbers
        Finished = true, -- Only calls callback when you press enter
        Callback = function(Value)
            --dolater
        end
    })

end

Tabs.Player:AddSection("Movement") do
    Tabs.Player:AddDropdown("player_method", {
        Title = "Movement Method",
        Values = {"CFrame", "Regular"},
        Multi = false,
        Default = 2,
    })

    Tabs.Player:AddSlider("player_speed", {
        Title = "Speed",
        Description = "Configuration for player speed.",
        Default = 0,
        Min = 0,
        Max = 100,
        Rounding = 3
    })

    Tabs.Player:AddSlider("player_jumping", {
        Title = "Power",
        Description = "Configuration for jump power.",
        Default = 0,
        Min = 0,
        Max = 100,
        Rounding = 3
    })
end

Tabs.Combat:AddSection("Hitbox Manipulation") do
    Tabs.Combat:AddToggle("combat_hitbox", {Title = "Enabled", Description = "May not work for some games.", Default = false })
end

SaveManager:SetLibrary(Fluent) InterfaceManager:SetLibrary(Fluent) SaveManager:IgnoreThemeSettings() SaveManager:SetIgnoreIndexes({}) InterfaceManager:SetFolder("Lunar") SaveManager:SetFolder("Lunar/" .. tostring(game.PlaceId)) InterfaceManager:BuildInterfaceSection(Tabs.Settings) SaveManager:BuildConfigSection(Tabs.Settings) Window:SelectTab(1) SaveManager:LoadAutoloadConfig()
