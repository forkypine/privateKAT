local cache = {}
local function getFile(Branch, FileName)
	local FileSplit = string.split(File, ".")
	local FileUrl = "https://raw.githubusercontent.com/forkypine/".. table.concat({Branch or "main", FileName .. (#FileSplit > 1 and "" or ".lua")}, "/")

	if not cache[FileUrl] then
		local Data = syn.reqiest({
			Url = FileUrl,
			Method = "GET"
		})

		return Data.Body
	else
		return cache[FileUrl]
	end
end

getgenv().loadfile = function(Branch, FileName)
	loadstring(assert(getFile(Branch, FileName), "requested module not found."))
end

local gameEvents = game.ReplicatedStorage.GameEvents
local EData = gameEvents.Data
local ParentThing = game.Players.LocalPlayer.PlayerGui:WaitForChild("Chat").Frame.ChatBarParentFrame.Frame.BoxFrame.Frame or script.Parent.Parent.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame
local lrtdplayers = {}
local name = game.Players.LocalPlayer.Name
local tag = "exploiter chat"
local CreateLabels = loadfile("main", "Labels.lua")

CreateLabels()
print("created labels")
local KATFrame = ParentThing.Parent.KATFrame

ParentThing.ChatBar.FocusLost:Connect(function()
	KATFrame.Visible = false
end)

local function SendMessage(Data, tag, name, text)
	--print(Data)
	firesignal(game:GetService("ReplicatedStorage").GameEvents.Misk.Chatted.OnClientEvent, Data, true, true) 
end

local commands = loadfile("main", "MainAdminModule.lua")
print("loading main module")
SendMessage({
	TG = {COL = Color3.fromRGB(45, 45, 45), TXT = "KAT Admin"},
	NM = {COL = Color3.fromRGB(255, 255, 255), TXT = "System"},
	CHAT = {COL = Color3.fromRGB(255, 255, 0), TXT = "KAT Admin Successfully Loaded".. " ".. "Version 1.0.4"},
})
