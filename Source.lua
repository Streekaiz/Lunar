local Flags = loadstring(game:HttpGet("https://rawgithubusercontent.com/Streekaiz/Lunar/comps/minified/Library.lua"))()
local Utility = {
    [1] = loadstring(game:HttpGet("https://rawgithubusercontent.com/Streekaiz/Lunar/comps/minified/Functions.lua"))()
}

local function ModifyPlayer()
    if Flags.player_speed == 0 or not Utility[1]:GetClient(game:GetService("Players").LocalPlayer).Alive then return end
    if Flags.player_method == "Regular" then
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Flags.player_speed
    else 
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:TranslateBy(hum.MoveDirection * Flags.player_speed / 100)
    end
    if Flags.player_jumping ~= 0 then
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Flags.player_jumping
    end
end

Utility[1]:Connect(game:GetService("RunService").RenderStepped, ModifyPlayer())



