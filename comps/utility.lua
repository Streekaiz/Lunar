-- Services
local InputService, TeleportService, RunService, Workspace, Lighting, Players, HttpService, StarterGui, ReplicatedStorage, TweenService  = game:GetService("UserInputService"), game:GetService("TeleportService"), game:GetService("RunService"), game:GetService("Workspace"), game:GetService("Lighting"), game:GetService("Players"), game:GetService("HttpService"), game:GetService("StarterGui"), game:GetService("ReplicatedStorage"), game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Mouse, Camera = LocalPlayer:GetMouse(), Workspace.Camera
local Library = {Connections = {}}

do 
    function Library:Call(Function)
        local Error, Message = pcall(Function)
        if Error then
            return Error, Message 
        end
    end
    --
    function Library:Connection(Type, Callback)
        local Connection = Type:Connect(Callback)
        Library.Connections[#Library.Connections + 1] = Connection
        --
        return Connection
    end
    --
    function Library:Drawing(type, prop)
        local obj = Drawing.new(type)
        --
        if prop then
            for i,v in next, prop do
                obj[i] = v
            end
        end
        return obj  
    end
    --
    function Library:GetStatus(Player)
        local Alive = false
        local Character

        if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            if Player.Character:FindFirstChildWhichIsA("Humanoid") then 
                if Player.Character:FindFirstChildWhichIsA("Humanoid").Health > 0 then
                    Alive = true
                end
            end
        end

        return Library:GetTeamStatus(LocalPlayer, Player), Alive, Player.Character
    end
    function Library:ChangeProperties(Object, Properties)
        for i, v in next, Properties do 
            Object[i] = v 
        end

        return Object
    end
    --
    function Library:GetBodyParts(Character, RootPart, Indexes, Hitboxes)
        local Parts = {}
        local Hitboxes = Hitboxes or {"Head", "Torso", "Arms", "Legs"}
        --
        for Index, Part in pairs(Character:GetChildren()) do
            if Part:IsA("BasePart") and Part ~= RootPart then
                if table.find(Hitboxes, "Head") and Part.Name:lower():find("head") then
                    Parts[Indexes and Part.Name or #Parts + 1] = Part
                elseif table.find(Hitboxes, "Torso") and Part.Name:lower():find("torso") then
                    Parts[Indexes and Part.Name or #Parts + 1] = Part
                elseif table.find(Hitboxes, "Arms") and Part.Name:lower():find("arm") then
                    Parts[Indexes and Part.Name or #Parts + 1] = Part
                elseif table.find(Hitboxes, "Legs") and Part.Name:lower():find("leg") then
                    Parts[Indexes and Part.Name or #Parts + 1] = Part
                elseif (table.find(Hitboxes, "Arms") and Part.Name:lower():find("hand")) or (table.find(Hitboxes, "Legs ") and Part.Name:lower():find("foot")) then
                    Parts[Indexes and Part.Name or #Parts + 1] = Part
                end
            end
        end
        --
        return Parts
    end
    --
    function Library:GetClosestPlayer()
        local shortestDistance = math.huge
        --  
        local closestPlayer
        for _, Player in pairs(Players:GetPlayers()) do
            if Player ~= LocalPlayer and Library:GetPlayerStatus(Player) then
                local pos,OnScreen = Camera:WorldToViewportPoint(Player.Character.HumanoidRootPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
                --
                if magnitude < shortestDistance and OnScreen then
                        closestPlayer = Player
                        shortestDistance = magnitude
                    end
                end
            end 
        return closestPlayer
    end
    -- 
    function Library:RayCast(Part, Origin, Ignore, Distance)
        local Ignore = Ignore or {}
        local Distance = Distance or 5000
        --
        local Cast = Ray.new(Origin, (Part.Position - Origin).Unit * Distance)
        local Hit = Workspace:FindPartOnRayWithIgnoreList(Cast, Ignore)
        --
        return (Hit and Hit:IsDescendantOf(Part.Parent)) == true, Hit
    end
    --
    function Library:GetOrigin(Origin)
        if Origin == "Head" then
            local Object, Humanoid, RootPart = Library:ValidateClient(LocalPlayer)
            local Head = Object:FindFirstChild("Head")
            --
            if Head and Head:IsA("RootPart") then
                return Head.CFrame.Position
            end
        elseif Origin == "Torso" then
            local Object, Humanoid, RootPart = Library:ValidateClient(LocalPlayer)
            --
            if RootPart then
                return RootPart.CFrame.Position
            end
        end
        --
        return Workspace.CurrentCamera.CFrame.Position
    end
    --
    function Library:GetTeamStatus(Player1, Player2)
        return (Player1.Team ~= Player2.Team)
    end
    --
    function Library:GetPlayerStatus(Player: Instance)
        if not Player then Player = LocalPlayer end
        return Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health > 0 and true or false
    end 
    --
    function Library:GetClosestPart(Player: Instance, List: Table)
        local shortestDistance = math.huge
        local closestPart
        if Library:GetPlayerStatus(Player) then
            for _, Value in pairs(Player.Character:GetChildren()) do
                if Value:IsA("BasePart") then 
                    local pos = Camera:WorldToViewportPoint(Value.Position)
                    local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y + 36)).magnitude
                        if magnitude < shortestDistance and table.find(List, Value) then
                            closestPart = Value
                            shortestDistance = magnitude
                        end
                    end
                end 
            return closestPart
        end
    end 
    --
    function Library:RandomChance(Percentage: Int)
        local Chance = Percentage
        --
        if math.random(1,100) <= Chance then
            return true 
        else
            return false
        end
    end
    --
    function Library:CloneCharacter(Player: Instance, Color: Color3, Material: Enum, Transparency: Int)
        for i,v in pairs(Player.Character:GetChildren()) do 
            if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then 
                local ClonedPart = Instance("Part")
                ClonedPart.Anchored = true 
                ClonedPart.CanCollide = false 
                ClonedPart.Position = v.Position
                ClonedPart.Parent = Workspace.Terrain 
                ClonedPart.Material = Enum.Material[Material]
                ClonedPart.Shape = Enum.PartType.Block 
                ClonedPart.Transparency = Transparency 
                ClonedPart.Color = Color
                ClonedPart.Size = v.Size + Vector3.new(0.01,0.01,0.01)
                ClonedPart.Name = v.Name
                ClonedPart.Rotation = v.Rotation
            end 
        end
    end 
    --
    function Library:CalculateAbsolutePosition(Player: Instance)
        if Library:GetPlayerStatus(Player) then
            local root = Player.Character.HumanoidRootPart
            local character = Player.Character 
            --
            local currentPosition = root.Position
            local currentTime = tick() 
            --
            task.wait()
            --
            local newPosition = root.Position
            local newTime = tick()
            --
            local distanceTraveled = (newPosition - currentPosition) 
            --
            local timeInterval = newTime - currentTime
            local velocity = distanceTraveled / timeInterval
            currentPosition = newPosition
            currentTime = newTime
            --
            return velocity
        end
    end  
    --
    function Library:CreateBeam(Origin, End, Color1, Color2, Texture)
        local BeamPart = Instance("Part", workspace)
        BeamPart.Name = "BeamPart"
        BeamPart.Transparency = 1
        --
        local Part = Instance("Part", BeamPart)
        Part.Size = Vector3.new(1, 1, 1)
        Part.Transparency = 1
        Part.CanCollide = false
        Part.CFrame = CFrame.new(Origin)
        Part.Anchored = true
        local Attachment = Instance("Attachment", Part)
        local Part2 = Instance("Part", BeamPart)
        Part2.Size = Vector3.new(1, 1, 1)
        Part2.Transparency = 1
        Part2.CanCollide = false
        Part2.CFrame = CFrame.new(End)
        Part2.Anchored = true
        Part2.Color = Color3.fromRGB(255, 255, 255)
        local Attachment2 = Instance("Attachment", Part2)
        local Beam = Instance("Beam", Part)
        Beam.FaceCamera = true
        Beam.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0.00, Color1),
            ColorSequenceKeypoint.new(1, Color2),
        }
        Beam.Attachment0 = Attachment
        Beam.Attachment1 = Attachment2
        Beam.LightEmission = 6
        Beam.LightInfluence = 1
        Beam.Width0 = 1
        Beam.Width1 = 0.6
        Beam.Texture = "rbxassetid://".. Texture ..""
        Beam.LightEmission = 1
        Beam.LightInfluence = 1
        Beam.TextureMode = Enum.TextureMode.Wrap 
        Beam.TextureLength = 3 
        Beam.TextureSpeed = 3
        delay(1, function()
        for i = 0.5, 1, 0.02 do
            task.wait()
            Beam.Transparency = NumberSequence.new(i)
        end
        Part:Destroy()
        Part2:Destroy()
        BeamPart:Destroy()
        end)
    end
    --
    function Library:GetTool() 
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA("Tool") and Library:GetPlayerStatus() then 
            return LocalPlayer.Character:FindFirstChildWhichIsA("Tool") 
        end 
    end

    function Library:Unload()
        for i, v in next, Library.Connections do
            v:Disconnect()
        end
    end
end

return Library, LocalPlayer, InputService, TeleportService, RunService, Lighting, Players, HttpService, ReplicatedStorage, TweenService
