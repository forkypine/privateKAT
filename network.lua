local function GetFile(Branch, FileName)
	local FileSplit = string.split(FileName, ".")
	local FilePath = "https://raw.githubusercontent.com/forkypine/privateKAT/" .. table.concat({Branch or "main", FileName .. (#FileSplit > 1 and "" or ".lua")}, "/")

	return syn.request({
		Url = FilePath,
		Method = "GET"
	}).Body
end

getgenv().loadrepo = function(Branch, FileName)
	return loadstring(assert(GetFile(Branch, FileName), "File Not Found"))
end)

local Serializer = loadrepo("main", "Serializer")
local crypt = {}


setmetatable(crypt, {
	__index = function(_, key)
		return function(a) return a end 
	end
})

function crypt.encrypt(text, key)
	key = key or 3 
	local result = ""
	for i = 1, #text do
		local char = text:sub(i, i)
		if char >= "A" and char <= "Z" then
			result = result .. string.char((string.byte(char) - 65 + key) % 26 + 65)
		elseif char >= "a" and char <= "z" then
			result = result .. string.char((string.byte(char) - 97 + key) % 26 + 97)
		else
			result = result .. char 
		end
	end
	return result
end

function crypt.decrypt(ciphertext, key)
	key = key or 3 
	return crypt.encrypt(ciphertext, -key) 
end



local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = {}
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ReplicateSound = ReplicatedStorage.GameEvents.Misk.ReplicateSound
local Binds = {}

function Network.Send(_, Topic, ...)
	ReplicateSound:FireServer(
		{nil,nil,nil,{}},
		crypt.encrypt(
			Topic, Topic
		),
		crypt.encrypt(
			Serializer:Serialize({...}), 
			Topic
		)
	)
end

function Network:BindToTopic(Topic, Callback)
	Binds[Topic] = Binds[Topic] or {}
	table.insert(Binds[Topic], Callback)
end

function Network.SendToSelf(_, Topic, ...)
	firesignal(ReplicateSound.OnClientEvent,
		{nil,nil,nil,{}},
		crypt.encrypt(
			Topic, Topic
		),
		crypt.encrypt(
			Serializer:Serialize({...}), 
			Topic
		)
	)
end

ReplicateSound.OnClientEvent:Connect(function(_, Topic, Data)
	if not Topic then return end
	for i,v in pairs(Binds) do
		if crypt.decrypt(Topic, i) == i then
			local DecData = Serializer:Deserialize(crypt.decrypt(Data, i))
			
			firesignal(game:GetService("ReplicatedStorage").GameEvents.Misk.Chatted.OnClientEvent, DecData, true, true) 
			for _,v in pairs(v) do
				print(v or " ")
			end
		end
	end
end)

return Network
