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
            if Utility[1]:isAlive(v) then
                local Highlight = nil
                if not HighlightFolder[v.Name] then
                    Highlight = Instance.new("Highlight", HighlightFolder)
                    
                end
            end
        end
    end
end


