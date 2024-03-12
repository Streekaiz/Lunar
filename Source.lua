local Flags = loadstring(game:HttpGet("https://rawgithubusercontent.com/Streekaiz/Lunar/comps/minified/Library.lua"))()
local Utility = {
    [1] = loadstring(game:HttpGet("https://rawgithubusercontent.com/Streekaiz/Lunar/comps/minified/Functions.lua"))()
}

local HighlightFolder = Instance.new("Folder", game:GetService("CoreGui"))

Utility[1]:Connect(game:GetService("RunService").RenderStepped, function()
    -- // #hitbox
    if Flags.combat_hitbox then
        for _, v in next, game:GetService("Players"):GetPlayers() do
            if Utility[1]:isAlive(v) and (Flags.combat_hitbox_team and not Utility[1]:isFriendly(v)) then
                v.Character[Flags.combat_hitbox_target].Size = Vector3.new(
                    Flags.combat_hitbox_vector_x,
                    Flags.combat_hitbox_vector_y,
                    Flags.combat_hitbox_vector_z
                )
            end
        end
    end
    -- // #highlight
    if Flags.visuals_highlight then
        for _, v in next, game:GetService("Players"):GetPlayers() do
            if Utility[1]:isAlive(v) and (Flags.visuals_team and (Utility[1]:isFriendly(v) ~= true) or true) then
                local Highlight = nil
                if not HighlightFolder[v.Name] then
                    Highlight = Instance.new("Highlight", HighlightFolder)
                    Highlight.Adornee = v.Character
                end
                for _, v in next, HighlightFolder:GetChildren() do
                    Highlight.FillColor = Flags.visuals_highlight_color1
                    Highlight.OutlineColor = Flags.visuals_highlight_color2 
                    Highlight.FillTransparency = Flags.visuals_highlight_transparency1
                    Highlight.OutlineTransparency = Flags.visuals_highlight_transparency2
                end
            end
        end
    end
end

Utility[1]:Connect(game:GetService("Players").PlayerRemoving, function(Player)
    if HighlightFolder[Player.Name] then
        HighlightFolder[Player.Name]:Destroy()
    end
end)


