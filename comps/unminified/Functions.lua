--// Variables
local Players = game:GetService("Players")
local LPlayer = Players.LocalPlayer
local Team = LPlayer.Team
local Mouse = game:GetService("UserInputService"):GetMouseLocation()


local Library = {
    Connections = {},
    Drawings = {}
}

function Library:Connect(Connection, Function)
    local connection = Connection:Connect(Function)
    table.insert(Library.Connections, connection)
    return connection
end

function Library:Draw(Object, Properties)
    local Drawing = Drawing.new(Object)

    for _, v in next, Properties do
        Drawing[_] = v
    end

    table.insert(Library.Drawings)
    return Drawing
end

function Library:Unload()
    for _, v in next, Library.Connections do
        v:Disconnect()
    end

    for _, v in next, Library.Drawings do
        v:Remove()
    end
end

function Library:isFriendly(Player)
    return Player.Team == Team
end

function Library:isAlive(Player)
    if Player.Character:FindFirstChildOfClass("Humanoid") then
        if Player.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
            return true
        end
    end
    return false
end

function Library:getTool(Player)
    if Library:isAlive(Player) then 
        if Player.Character:FindFirstChildWhichIsA("Tool") then
            return Player.Character:FindFirstChildWhichIsA("Tool").Name
        end
    end
end

function Library:getDistance(Player)
    if Library:isAlive(Player) and Library:isAlive(LPlayer) then
        return math.round((Player.Character.HumanoidRootPart.Position - LPlayer.Character.HumanoidRootPart.Position).Magnitude)
    end

    --[[
    outdated system; use distancefromplayer or whatever (change later)
    ]]

    return 0
end

function Library:convertPercentage(Percentage)
    local Random = math.random(0, 100)
    if Random < Percentage then
        return true
    end
    return false
end

function Library:Ray(Part, Orgin, Ignore, Distance)
    local Ignore = Ignore or {}
    local Distance = Distance or 5000

    local Cast = Ray.new(Orgin, (Part.Position - Orgin).Unit * Distance)
    local Hit = workspace:FindPartOnRayWithIgnoreList(Cast, Ignore)

    return (Hit and Hit:IsADescendantOf(Part.Parent)) == true, Hit
end

function Library:getClosestPlayerToMouse(Friendly, Distance, Visible)
    local CurrentMouseDistance = 1000
    local Target

    for _, v in next, game:GetService("Players"):GetPlayers() do
        
        --// Simple validation checks
        if v == LPlayer then return end
        if not Library:isAlive(v) and not Library:isAlive(LPlayer) then return end
        if Friendly and Library:isFriendly(v) then return end 
        if Distance[1] == true and Library:getDistance(v) <= Distance[2] then return end

        local isVisible = true

        if Visible[1] then -- idk how to use raycasts????????
            local Results, Success = Library:Ray(v.Character[Visible[2]], LPlayer.Character[Visible[3]], {}, Distance[2])
            if Success == false or Results.Hit ~= v.Character[Visible[2]] then
                isVisible = false
            end
        end

        if not isVisible then return end
        
        local Success, TargetPosition = workspace.CurrentCamera:WorldToViewportPoint(v.Character[Visible[2]])

        if not Success then return end

        local TargetMouseDistance = Vector2.new(TargetPosition.X - Mouse.X, TargetPosition.Y - TargetPosition.Y)

        if CurrentMouseDistance > TargetMouseDistance then
            CurrentMouseDistance = TargetMouseDistance
            Target = v 
        end
    end

    return Target
end
