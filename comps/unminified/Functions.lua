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
    if Player.Team == game:GetService("Players").LocalPlayer.Team then
        return true
    end
    return false
end

function Library:isAlive(Player)
    if Player.Character:FindFirstChildOfClass("Humanoid") then
        if Player.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
            return true
        end
    end
    return false
end

function Library:hasTool(Player)
    if Player.Character then 
        if Player.Character:FindFirstChildWhichIsA("Tool") then
            return Player.Character:FindFirstChildWhichIsA("Tool").Name
        end
    end
end
function Library:ConvertPercentage(Percentage)
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
