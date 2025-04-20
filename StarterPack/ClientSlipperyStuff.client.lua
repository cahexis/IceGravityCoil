local tool = script.Parent
local coilsound = tool.Handle.CoilSound
--Normal friction is 0.3

local newfric = 0
local newfricw = 100
local oldfric = 0.3
local oldfricw = 1

local newphysics = PhysicalProperties.new(0.7,newfric,0.5,newfricw,1)
local oldphysics = PhysicalProperties.new(0.7,oldfric,0.5,oldfricw,1)

tool.Equipped:Connect(function(plr)
	local char = tool.Parent
	print("Coil used!")
	coilsound:Play()
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA("Part") and v.Parent ~= char and v ~= tool.Handle then
			v.CustomPhysicalProperties = newphysics
		end
	end
end)

tool.Unequipped:Connect(function(plr)
	local char = tool.Parent
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA("Part") and v.Parent ~= char and v ~= tool.Handle then
			v.CustomPhysicalProperties = oldphysics
		end
	end
end)
