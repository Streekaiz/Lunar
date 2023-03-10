
local Module = {
    Hooks = {},
    Players = {},
    Whitelisted = {},
    Drawings = {},
    Connections = {},
    ESP = {},
    Loaded = false
}

function Module:CreateHook(args, func)
    local name = args.Name or args.name or "Hook"
    local type = args.Method or args.method or "__newindex"
    Module[tostring(name)] = hookmetamethod(game, type, newcclosure(func))
end

function Module:IsLoaded()
    return Module.Loaded
end

function Module:ChangeArms(args)
    if args.Type == "Color" then
        for _, v in next, workspace.Camera:FindFirstChild("ViewModel"):GetChildren() do
            if v:IsA("BasePart") and v.Color ~= args.Color then
                v.Color = args.Color
            end
        end
    elseif args.Type == "Material" then
        for _, v in next, workspace.Camera:FindFirstChild("ViewModel"):GetChildren() do
            if v:IsA("BasePart") and v.Material ~= args.Material then
                v.Material = args.Material
            end
        end
    elseif args.Type == "Offset" then
        for _, v in next, workspace.Camera:FindFirstChild("ViewModel"):GetDescendants() do
            if v:IsA("BasePart") then
                v.CFrame = v.CFrame * args.Offset
            end
        end
    end
end

function Module:ChangeWeapon(args)
    if args.Type == "Color" then
        for _, v in next, workspace.Camera.ViewModel.Item:GetChildren() do
            if v:IsA("BasePart") and v.Color ~= args.Color then
                v.Color = args.Color
            end
        end
    elseif args.Type == "Material" then
        for _, v in next, workspace.Camera.ViewModel.Item:GetChildren() do
            if v:IsA("BasePart") and v.Material ~= args.Material then
                v.Material = args.Material
            end
        end
    end
end

function Module:PlaySound(sound, volume, pitch)
    local SoundToPlay = sound == "Skeet" and "4753603610" or sound == "Gamesense" and "4817809188" or sound == "NeverLose" and "8726881116" or sound == "Rust" and "1255040462" or sound == "Osu" and "7149919358"
    local Instance = Instance.new("Sound", game:GetService("SoundService"))
    Instance.SoundId = "rbxassetid://" .. SoundToPlay
    Instance.PlayOnRemove = true
    Instance.Volume = volume
    Instance.PlaybackSpeed = pitch
    Instance:Destroy()
end


function Module:IsAlive(player)
    local alive = false
    if player ~= nil and player.Parent == game.Players and player.Character ~= nil then
		if player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") ~= nil and player.Character.Humanoid.Health > 0 and player.Character:FindFirstChild("Head") then
			alive = true
		end
    end

    return alive
end

function Module:isTarget(plr, teammates)
	if Module:IsAlive(plr) then
		if not plr.Neutral and not lplr.Neutral then
			if teammates == false then
				return plr.Team ~= lplr.Team
			elseif teammates == true then
				return plr ~= lplr
			end
		else
			return plr ~= lplr
		end
	end
end

function Module:WorldToViewport(pos)
    local Position, OnScreen = workspace.CurrentCamera:WorldToViewportPoint(pos)
    return Position, OnScreen
end

function Module:Connect(type, func)
    local connection = type:Connect(func)
    table.insert(Module.Connections, connection)
    return connection
end

function Module:Draw(class, offset, properties, hidden)
    hidden = hidden or false

    local draw = Drawing.new(class)
    local fakeDraw = {}
    rawset(fakeDraw, "__OBJECT_EXIST", true)
    setmetatable(fakeDraw, {
        __index = function(self, key)
            if rawget(fakeDraw, "__OBJECT_EXIST") then
                return draw[key]
            end
        end,
        __newindex = function(self, key, value)
            if rawget(fakeDraw, "__OBJECT_EXIST") then
                draw[key] = value
                if key == "Position" then
                    for _, v in pairs(rawget(fakeDraw, "children")) do
                        v.Position = fakeDraw.Position + v.GetOffset()
                    end
                end
            end
        end
    })
    rawset(fakeDraw, "Remove", function()
        if rawget(fakeDraw, "__OBJECT_EXIST") then
            draw:Remove()
            rawset(fakeDraw, "__OBJECT_EXIST", false)
        end
    end)
    rawset(fakeDraw, "GetType", function()
        return class
    end)
    rawset(fakeDraw, "GetOffset", function()
        return offset or Vector2.new()
    end)
    rawset(fakeDraw, "SetOffset", function(noffset)
        offset = noffset or Vector2.new()

        fakeDraw.Position = properties.Parent.Position + fakeDraw.GetOffset()
    end)
    rawset(fakeDraw, "children", {})
    rawset(fakeDraw, "Lerp", function(instanceTo, instanceTime)
        if not rawget(fakeDraw, "__OBJECT_EXIST") then return end

        local currentTime = 0
        local currentIndex = {}
        local connection

        for i,v in pairs(instanceTo) do
            currentIndex[i] = fakeDraw[i]
        end
    end)

    local customProperties = {
        ["Parent"] = function(object)
            table.insert(rawget(object, "children"), fakeDraw)
        end
    }

    if class == "Square" or class == "Circle" or class == "Line" then
        fakeDraw.Thickness = 1
        if class == "Square" then
            fakeDraw.Filled = true
        end
    end

    if class ~= "Image" then
        fakeDraw.Color = Color3.new(0, 0, 0)
    end
    if properties ~= nil then
        for key, value in pairs(properties) do
            if customProperties[key] == nil then
                fakeDraw[key] = value
            else
                customProperties[key](value)
            end
        end
        if properties.Parent then
            fakeDraw.Position = properties.Parent.Position + fakeDraw.GetOffset()
        end
        if properties.Parent and properties.From then
            fakeDraw.From = properties.Parent.Position + fakeDraw.GetOffset()
        end
        if properties.Parent and properties.To then
            fakeDraw.To = properties.Parent.Position + fakeDraw.GetOffset()
        end
    end


    properties = properties or {}

    return fakeDraw
end

function Module:GetBulletAttribute(attribute)
    local attribute_value = nil
    local name = game:GetService("Players").LocalPlayer.Name
    local status = game.ReplicatedStorage.Players[name]:FindFirstChild("Status")
    if status then
        local equipped_tool = status.GameplayVariables.EquippedTool.Value
        if equipped_tool then
            local inventory_equipped_tool = game.ReplicatedStorage.Players[ name].Inventory:FindFirstChild(tostring(equipped_tool))
            if inventory_equipped_tool then
                local mag = inventory_equipped_tool.Attachments:FindFirstChild("Magazine") and inventory_equipped_tool.Attachments:FindFirstChild("Magazine"):FindFirstChildOfClass("StringValue") and inventory_equipped_tool.Attachments:FindFirstChild("Magazine"):FindFirstChildOfClass("StringValue"):FindFirstChild("ItemProperties").LoadedAmmo or inventory_equipped_tool.ItemProperties:FindFirstChild("LoadedAmmo")
                if mag then
                    local first_bullet_type = mag:FindFirstChild("1")
                    if first_bullet_type then
                        attribute_value = game.ReplicatedStorage.AmmoTypes[first_bullet_type:GetAttribute("AmmoType")]:GetAttribute(attribute)
                    end
                end
            end
        end
    end
    return attribute_value
end

function Module:ESPAddPlayer(v)
    Module.ESP[v] = {
        BoxOutline = Module:Draw("Square", Vector2.new(), {Visible = false, Filled = false, Thickness = 3}, true),
        Box = Module:Draw("Square", Vector2.new(), {Visible = false, Filled = false, ZIndex}, true),
        HealthOutline = Module:Draw("Square", Vector2.new(), {Visible = false}, true),
        Health = Module:Draw("Square", Vector2.new(), {Visible = false}, true),
        Name = Module:Draw("Text", Vector2.new(), {Size = 13, Font = 2, Text = v.Name, Outline = true, Center = true, Visible = false}, true),
        Weapon = Module:Draw("Text", Vector2.new(), {Size = 13, Font = 2, Outline = true, Center = true, Visible = false}, true),
        Distance = Module:Draw("Text", Vector2.new(), {Size = 13, Font = 2, Outline = true, Center = true, Visible = false}, true),
    }
end


function Module:ESPRemovePlayer(v)
    if Module.ESP[v] then
        for i, v in pairs(Module.ESP[v]) do
            v.Remove()
        end
        Module.ESP[v] = nil
    end
end

for _, v in next, game:GetService("Players"):GetPlayers() do
    Module:ESPAddPlayer(v)
    table.insert(Module.Players, tostring(v.Name))
end

Module:Connect(game:GetService("Players").PlayerAdded, function(Player)
    Module:ESPAddPlayer(Player)
    table.insert(Module.Players, tostring(Player.Name))
end)

Module:Connect(game:GetService("Players").PlayerRemoving, function(Player)
    Module:ESPRemovePlayer(Player)
    table.remove(Module.Players, table.find(Module.Players, tostring(Player.Name)))
end)

return Module
