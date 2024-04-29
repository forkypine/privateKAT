local function GetFile(Branch, FileName)
	local FileSplit = string.split(FileName, ".")
	local FilePath = "https://raw.githubusercontent.com/forkypine/privateKAT/" .. table.concat({Branch or "main", FileName .. (#FileSplit > 1 and "" or ".lua")}, "/")

	local response = syn.request({
		Url = FilePath,
		Method = "GET"
	})

	if response.Success then
		return response.Body
	else
		print("Error fetching file:", response.StatusCode, response.Body)
		return nil
	end
end

getgenv().loadrepo = function(Branch, FileName)
	local fileContent = GetFile(Branch, FileName)
	if fileContent then
		local chunk, errorMsg = loadstring(fileContent)
		if chunk then
			return chunk
		else
			error("Error loading file: " .. errorMsg)
		end
	else
		error("File not found or unable to fetch.")
	end
end

local network = loadrepo("main", "network.lua")
local KATFrame = Instance.new("Frame")
local ParentThing = game.Players.LocalPlayer.PlayerGui:WaitForChild("Chat").Frame.ChatBarParentFrame.Frame.BoxFrame.Frame or script.Parent.Parent.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame
local prefixA = ">"


local createLabels = loadrepo("main", "commandLabels.lua")
local commands = loadrepo("main", "CommandModules.lua")

createLabels()

local function ChatSendMessage(placeName, tag, msg, Data)

	Data = {
		TG = {COL = Color3.fromRGB(45,45,45), TXT = tag or "exploiter chat"},
		NM = {COL = Color3.fromRGB(180,180,180), TXT = placeName or game.Players.LocalPlayer.Name},
		CHAT = {COL = Color3.fromRGB(255, 255, 0), TXT = msg},
	}
	--print(Data)
	firesignal(game:GetService("ReplicatedStorage").GameEvents.Misk.Chatted.OnClientEvent, Data, true, true) 
	network.Send("ExploiterChat", Data)

	network:BindToTopic("ExploiterChat", function(D)
		firesignal(game:GetService("ReplicatedStorage").GameEvents.Misk.Chatted.OnClientEvent, D, true, true) 
	end)
end





ParentThing.ChatBar.FocusLost:Connect(function(enterPressed)
	local text = ParentThing.ChatBar.Text

	if enterPressed and string.sub(text, 1, 1) == prefixA then
		local command, argumentsStr = text:match(prefixA .. "(%w+)%s*(.*)")

		if command then
			local foundCommand = false
			for cmd, data in pairs(commands) do
				if cmd == command or table.find(data.aliases or {}, command) then
					foundCommand = true
					ParentThing.ChatBar.Text = ""
					local arguments = {}
					for arg in argumentsStr:gmatch("%S+") do
						table.insert(arguments, arg)
					end


					if command ~= "help" then
						data.func(argumentsStr)
						print("Command: " .. command .. ", Arguments: " .. argumentsStr)
					elseif cmd == "help" then
						commands.help.func(commands, argumentsStr)
					end
				end
			end

			if not foundCommand then
				local message = text:match(prefixA .. "%s*(.*)") 

				if message then
					ParentThing.ChatBar.Text = ""
					local name = game.Players.LocalPlayer.Name
					local tag = "exploiter chat"
					ChatSendMessage(name, tag, message)
				end
			end
		end
	end
end)

local function SendMessage(Data, tag, name, text)
	firesignal(game:GetService("ReplicatedStorage").GameEvents.Misk.Chatted.OnClientEvent, Data, true, true)  
end




SendMessage({
	TG = {COL = Color3.fromRGB(45, 45, 45), TXT = "KAT Admin"},
	NM = {COL = Color3.fromRGB(255, 255, 255), TXT = "System"},
	CHAT = {COL = Color3.fromRGB(255, 255, 0), TXT = "KAT Admin Successfully Loaded".. " ".. "Version HAPPY BIRTHDAY, AMARI>;3 :tire: :pianobreaker: .2"},
})


local commandLabels = {
	["7777"]= {label = "messageName", yPos = 0.095}, --semi works
	playradio = {label = "radioName", yPos = 0.15}, --broke somehow!?
	nuke = {label = "nukeName", yPos = 0.205}, --works
	help = {label = "helpCommand", yPos = 0.26}, --works
	settag = {label = "settagName", yPos = 0.315}, --this does not work
	lrt = {label = "lrtName", yPos = 0.481}, --this does not work
	credits = {label = "credits", yPos = 0.37}, --works
	unlrt = {label = "unlrt", yPos = 0.425}, --works
	trade = {label = "trade", yPos = 0.536}, --works
	loopnuke = {label = "loopNuke", yPos = 0.591}, --works (?)
	unloopnuke = {label = "unloopNuke", yPos = 0.646}, --works(?)
	setprefix = {label = "prefixName", yPos = 0.701}, --works
	stopradio = {label = "stopradio", yPos = 0.756}, --should work
	listbackpack = {label = "listbackpackName", yPos = 0.811}, --untested, should work
	dropknife = {label = "dropknifeName", yPos = 0.867}, --untested, should work
	loopdropknife = {label = "loopdropknifeName", yPos = 0.921}, --untested, should work
	tickspeed = {label = "tickspeed", yPos = 0.977}, -- probably wont work first try
	setname = {label = "setnameName", yPos = 1.032} --works xD
}


local foundLabels = {}
local notFoundLabels = {}

ParentThing.ChatBar:GetPropertyChangedSignal("Text"):Connect(function()
	local text = ParentThing.ChatBar.Text
	local searchText = text:sub(#prefixA + 1):lower()
	KATFrame.Visible = text:sub(1, #prefixA) == prefixA

	foundLabels = {}
	notFoundLabels = {}

	if text == prefixA then
		for command, data in pairs(commandLabels) do
			KATFrame[data.label].Visible = true
			KATFrame[data.label].Position = UDim2.new(0, 0, data.yPos, 0)
		end
	else
		if searchText ~= "" then
			local command, argument = searchText:match(">(%w+)%s*(.-)$")
			if command then
				for cmd, data in pairs(commandLabels) do
					local match = false
					local cmdData = commands[cmd]
					if cmdData then
						if cmd:lower() == command then
							match = true
						else
							for _, alias in ipairs(cmdData.aliases or {}) do
								if alias:lower() == command then
									match = true
									break
								end
							end
						end
					end
					if match then
						table.insert(foundLabels, cmd)
					else
						table.insert(notFoundLabels, cmd)
					end
				end
			else 
				local commandWithoutArg = searchText:match("(%S+)")
				if commandWithoutArg then
					for cmd, data in pairs(commandLabels) do
						local match = false
						local cmdData = commands[cmd]
						if cmdData then
							if cmd:lower():sub(1, #commandWithoutArg) == commandWithoutArg then
								match = true
							else
								for _, alias in ipairs(cmdData.aliases or {}) do
									if alias:lower():sub(1, #commandWithoutArg) == commandWithoutArg then
										match = true
										break
									end
								end
							end
						end
						if match then
							table.insert(foundLabels, cmd)
						else
							table.insert(notFoundLabels, cmd)
						end
					end
				end
			end
		end
	end

	local yPos = 0.095
	if #foundLabels == 0 then
		for command, data in pairs(commandLabels) do
			KATFrame[data.label].Visible = true
			KATFrame[data.label].Position = UDim2.new(0, 0, data.yPos, 0)
		end
	else
		for i, command in ipairs(foundLabels) do
			local labelData = commandLabels[command]
			KATFrame[labelData.label].Visible = true
			KATFrame[labelData.label].Position = UDim2.new(0, 0, yPos, 0)
			yPos = yPos + 0.055
		end

		for _, command in ipairs(notFoundLabels) do
			local labelData = commandLabels[command]
			KATFrame[labelData.label].Visible = false
		end
	end
end)
