local function CreateLabels()
	local ParentThing = game.Players.LocalPlayer.PlayerGui:WaitForChild("Chat").Frame.ChatBarParentFrame.Frame.BoxFrame.Frame or script.Parent.Parent.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame
	local KATFrame = Instance.new("Frame")
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
	loopdropknife.Position = UDim2.new(0,0,0.922,0)
	loopdropknife.Size = UDim2.new(0.39, 0, 0.057, 0)
	loopdropknife.TextSize = 14
	loopdropknife.Font = Enum.Font.Arial
	loopdropknife.TextXAlignment = Enum.TextXAlignment.Left
	loopdropknife.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)

	local setname = Instance.new("TextLabel")
	setname.Name = "setnameName"
	setname.Parent = KATFrame
	setname.BackgroundTransparency = 1
	setname.TextColor3 = Color3.new(1,1,1)
	setname.Text = ">setname [name]"
	setname.Position = UDim2.new(0,0,0.977,0)
	setname.Size = UDim2.new(0.39, 0, 0.057, 0)
	setname.TextSize = 14
	setname.Font = Enum.Font.Arial
	setname.TextXAlignment = Enum.TextXAlignment.Left
	setname.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)

	local tickspeed = Instance.new("TextLabel")
	tickspeed.Name = "tickspeed"
	tickspeed.Parent = KATFrame
	tickspeed.BackgroundTransparency = 1
	tickspeed.TextColor3 = Color3.new(1,1,1)
	tickspeed.Text = ">tickspeed [speed]"
	tickspeed.Position = UDim2.new(0,0,1.032,0)
	tickspeed.Size = UDim2.new(0.39, 0, 0.057, 0)
	tickspeed.TextSize = 14
	tickspeed.Font = Enum.Font.Arial
	tickspeed.TextXAlignment = Enum.TextXAlignment.Left
	tickspeed.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)

	
	local settagcolor = Instance.new("TextLabel")
	settagcolor.Name = "settagcolor"
	settagcolor.Parent = KATFrame
	settagcolor.BackgroundTransparency = 1
	settagcolor.TextColor3 = Color3.new(1,1,1)
	settagcolor.Text = ">settagcolor [red] [green] [blue]"
	settagcolor.Position = UDim2.new(0,0,1.087,0)
	settagcolor.Size = UDim2.new(0.39, 0, 0.057, 0)
	settagcolor.TextSize = 14
	settagcolor.Font = Enum.Font.Arial
	settagcolor.TextXAlignment = Enum.TextXAlignment.Left
	settagcolor.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)

	local setnamecolor = Instance.new("TextLabel")
	setnamecolor.Name = "setnamecolor"
	setnamecolor.Parent = KATFrame
	setnamecolor.BackgroundTransparency = 1
	setnamecolor.TextColor3 = Color3.new(1,1,1)
	setnamecolor.Text = ">setnamecolor [red] [green] [blue]"
	setnamecolor.Position = UDim2.new(0,0,1.142,0)
	setnamecolor.Size = UDim2.new(0.39, 0, 0.057, 0)
	setnamecolor.TextSize = 14
	setnamecolor.Font = Enum.Font.Arial
	setnamecolor.TextXAlignment = Enum.TextXAlignment.Left
	setnamecolor.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
end


return CreateLabels
