wait()

if game.PlaceId == 998374377 then
	local UpdateLog = [[
	- Minor optimisation (Thanks to my friend for poiting them out)
	- Fixed first person indicator size and position
	- Made text outline thicker on team playerlist
	- > Happy Home In Robloxia! update:
	- Fixed bug where you weren't able to build
	]]

	if game:IsLoaded() == false then
		game.Loaded:Wait()
	end

	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local StarterGui = game:GetService("StarterGui")
	local GuiService = game:GetService("GuiService")
	local TeleportService = game:GetService("TeleportService")
	local RunService = game:GetService("RunService")

	local Player = Players.LocalPlayer

	local MenuGui = Player.PlayerGui:WaitForChild("MenuGui")
	local WindowBase = MenuGui.CoreFrame:WaitForChild("WindowBase")
	local Windows = WindowBase:WaitForChild("Windows")
	local SettingsWindow = Windows:WaitForChild("Settings")
	local SettingsTab = WindowBase.Tabs:WaitForChild("Settings")
	local GamesWindow = Windows:WaitForChild("Games")
	local TShirtCatalog = Windows.Avatar.TShirtCatalog

	local function Universal_Queue_On_Teleport(Script)
		if syn then
			return syn.queue_on_teleport(Script)
		end
		return queue_on_teleport(Script)
	end

	local NewTShirts = {
		7674117600,
		7533176758,
		1000024,
		1359255,
		20566071,
		11212267,
		1142115,
		3643464,
		1000004,
		1000006,
		169880633,
		507854947,
		502803809,
		513699725,
		6468692478,
		2858650044,
		1028898,
		7695817356,
		1739561,
		1649721,
		1649726,
		1149741,
		1028592,
		1028590,
		1672990,
		1253442,
		7753026446,
		7753087951,
		1628117,
		1185711,
		1440371,
		1494281,
		1008923,
		1271540,
		1592360,
		1100732,
		1284054,
		1775942,
		7755948777,
		1434649,
		1767008,
		1258107,
		1155757,
		1224596,
		1312454,
		1059800,
		1031889,
		4433245,
		7756035601,
		7756054604,
		7756126974,
		1304407,
		1140458,
		1621584,
		1528091,
		1648207,
		1123929,
		1094536,
		1147037,
		1301317,
		6437607,
		7756405882,
		1299411,
		1340547,
		1390153,
		1457875,
		1703033,
		1265127,
		1504329,
		1526206,
		1449261,
		1731204,
		1206091,
		1550233,
		1510919,
		1659492,
		1493259,
		1377960,
		7762937278,
		7764907214,
		1332989,
		1120553,
		1000836,
		1028594,
		1088727,
		7798117720,
		1131938,
		1293381,
		1001484,
		1364901
	}

	local GameSettings = {
		["AllowMusic"] = true,
		["CharacterBevels"] = false,
		["ClassicSky"] = true,
		["ClickToMove"] = true,
		["FPSCapTo30"] = false,
		["FollowCamera"] = true,
		["ReducedParticles"] = true,
		["RetroExplosions"] = false,
		["SoundEquipBug"] = true,
		["StencilShadows"] = false,
		["TurboGraphics"] = false
	}

	StarterGui:SetCore("SendNotification",{
		Title = "Alert!",
		Text = "Please hold...",
		Duration = 10
	})

	for GameSetting,Bool in pairs(GameSettings) do
		ReplicatedStorage.DataGateway:InvokeServer("SetData","Settings",GameSetting,Bool)
	end

	repeat RunService.RenderStepped:Wait() until MenuGui.MessageGui.Visible == false
	for _,v in pairs(SettingsWindow:GetChildren()) do
		if v:IsA("TextButton") then
			v:Destroy() 
		end
	end

	TShirtCatalog.Catalog.AutomaticCanvasSize = Enum.AutomaticSize.Y
	TShirtCatalog.Catalog.ScrollingEnabled = true
	TShirtCatalog.Catalog.ScrollBarImageColor3 = Color3.fromRGB(0,0,0)
	TShirtCatalog.Catalog.ScrollBarThickness = 10
	TShirtCatalog.Catalog:FindFirstChildOfClass("UIGridLayout"):Destroy()

	local NewUIGridLayout = Instance.new("UIGridLayout")
	NewUIGridLayout.CellSize = UDim2.new(0,130,0,130)
	NewUIGridLayout.Parent = TShirtCatalog.Catalog

	for _,TShirts in pairs(NewTShirts) do
		local TShirtTemplate = TShirtCatalog.Catalog:FindFirstChild("0"):Clone()
		TShirtTemplate:Clone()
		TShirtTemplate.Name = TShirts
		TShirtTemplate.Image = "rbxassetid://"..TShirts
		TShirtTemplate.MouseButton1Down:Connect(function()
			ReplicatedStorage.DataGateway:InvokeServer("SetData","TShirt",TShirts)
			TShirtCatalog.Visible = false
		end)
		TShirtTemplate.Parent = TShirtCatalog.Catalog
	end

	SettingsWindow.AAAAAAAA.Text = "Updates"
	SettingsTab.Text = "Updates"

	local SettingsAlert = Instance.new("TextLabel")
	SettingsAlert.BackgroundTransparency = 1
	SettingsAlert.Size = UDim2.new(1,0,0.75,0)
	SettingsAlert.Font = Enum.Font.Cartoon
	SettingsAlert.Text = UpdateLog
	SettingsAlert.TextColor3 = Color3.fromRGB(0,0,0)
	SettingsAlert.TextSize = 40
	SettingsAlert.TextWrapped = true
	SettingsAlert.TextXAlignment = Enum.TextXAlignment.Left
	SettingsAlert.TextYAlignment = Enum.TextYAlignment.Top
	SettingsAlert.Parent = SettingsWindow

	local Games = {334705531,734466940,864583959,996175297,996222285,1008347549,1008937812,1009092446,1021292424,1022925890,1024961009,1034328244,1050047793,1050608101,1052571446,1063163888,1067970809,1073469644,1074685082,1081616136,1089876422,1092866081,1132224157,1388959419,2421080323,2468068521,2471146032,1050811992}

	local function CreateGameButton(Text,Y)
		local Button = Instance.new("TextButton")
		Button.AutoButtonColor = false
		Button.BackgroundColor3 = Color3.fromRGB(110,153,201)
		Button.BorderColor3 = Color3.fromRGB(0,0,0)
		Button.Position = UDim2.new(1,1,Y,1)
		Button.Size = UDim2.new(0.2,0,0.052,0)
		Button.Visible = GamesWindow.Visible
		Button.Text = Text
		Button.Font = Enum.Font.Cartoon
		Button.TextColor3 = Color3.fromRGB(255,255,255)
		Button.TextScaled = true
		Button.Parent = Windows
		return Button
	end

	local PlayRandomGame = CreateGameButton("Play Random Game",0)
	PlayRandomGame.MouseButton1Click:Connect(function()
		TeleportService:Teleport(Games[math.random(1,#Games)],Player)
	end)

	local ListingOrder = CreateGameButton("Sort Order: Most players",0.052)
	ListingOrder.MouseButton1Click:Connect(function()
		if ListingOrder.Text == "Sort Order: Most players" then
			ListingOrder.Text = "Sort Order: Name"
			GamesWindow.UIGridLayout.SortOrder = Enum.SortOrder.Name
		else
			ListingOrder.Text = "Sort Order: Most players"
			GamesWindow.UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
		end
	end)

	GamesWindow.Changed:Connect(function()
		PlayRandomGame.Visible = GamesWindow.Visible
		ListingOrder.Visible = GamesWindow.Visible
	end)

	local Text

	if not syn and not identifyexecutor():find("Krnl") and not getexecutorname():find("ScriptWare") then
		Text = "We have detected that you are not using a executor tested to run this script, you may experience issues."
	elseif GuiService:GetScreenResolution().X > 1176 then
		Text = "We recommend you to play in 1176 x 664 or lower resolution."
	end

	StarterGui:SetCore("SendNotification",{
		Title = "Alert!",
		Text = Text,
		Duration = 10
	})

	StarterGui:SetCore("SendNotification",{
		Title = "Alert!",
		Text = "Super Nostalgia Zone Plus successfully loaded!",
		Duration = 10
	})

	Player.OnTeleport:Connect(function(State)
		if State == Enum.TeleportState.Started then
			Universal_Queue_On_Teleport([[
			if game:IsLoaded() == false then
				game.Loaded:Wait()
			end
			
			local Players = game:GetService("Players")
			local Lighting = game:GetService("Lighting")
			local ReplicatedStorage = game:GetService("ReplicatedStorage")
			local CoreGui = game:GetService("CoreGui")
			local RunService = game:GetService("RunService")
			local GuiService = game:GetService("GuiService")
			local GameSettings  = UserSettings().GameSettings
			local UserGameSettings = UserSettings():GetService("UserGameSettings")

			local Player = Players.LocalPlayer
			
			local OnTeam = false
			
			local function UpdateFullscreen(FullscreenButton)
				if GameSettings:InFullScreen() then
					FullscreenButton.Text = "  x Fullscreen"
				else
					FullscreenButton.Text = "  Fullscreen"
				end
			end
			
			local function UpdatePlayerlist(Object)
		    	if Object.Name == "Beyond_5D" then
			        Object.PlayerName.Text = "👑 "..Object.Name
			        if OnTeam == false then
			            Object.PlayerName.TextColor3 = Color3.fromRGB(255,0,0)
			        end
			    end
			end
			
			local function OldifyCharacter(TargetCharacter)
				if TargetCharacter then
				    local Torso = Instance.new("CharacterMesh")
				    Torso.Name = "CL_Torso"
				    Torso.BodyPart = Enum.BodyPart.Torso
				    Torso.MeshId = 1112228624
				    Torso.Parent = TargetCharacter
				    local LeftArm = Instance.new("CharacterMesh")
				    LeftArm.Name = "CL_LeftArm"
				    LeftArm.BodyPart = Enum.BodyPart.LeftArm
				    LeftArm.MeshId = 1112256772
				    LeftArm.Parent = TargetCharacter
				    local RightArm = Instance.new("CharacterMesh")
				    RightArm.Name = "CL_RightArm"
				    RightArm.BodyPart = Enum.BodyPart.RightArm
				    RightArm.MeshId = 1112244824
				    RightArm.Parent = TargetCharacter
				    local LeftLeg = Instance.new("CharacterMesh")
				    LeftLeg.Name = "CL_LeftLeg"
				    LeftLeg.BodyPart = Enum.BodyPart.LeftLeg
				    LeftLeg.MeshId = 1112275294
				    LeftLeg.Parent = TargetCharacter
				    local RightLeg = Instance.new("CharacterMesh")
				    RightLeg.Name = "CL_RightLeg"
				    RightLeg.BodyPart = Enum.BodyPart.RightLeg
				    RightLeg.MeshId = 1112267576
				    RightLeg.Parent = TargetCharacter
					if TargetCharacter:WaitForChild("HumanoidRootPart",5) then
						TargetCharacter.HumanoidRootPart:WaitForChild("FreeFall").SoundId = "rbxassetid://7505901987"
					end
					if TargetCharacter:FindFirstChild("ShirtGraphic") then
						TargetCharacter.ShirtGraphic.Graphic = "rbxhttp://Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=128&ht=128&aid="..TargetCharacter:WaitForChild("ShirtGraphic").Graphic:split("//")[2]
					end
			    end
			end
			
			local UI = Player.PlayerGui:WaitForChild("UI")
            local PlayerList = UI:WaitForChild("PlayerList")
			local Topbar = UI:WaitForChild("Topbar")
            local ZoomControls = UI:WaitForChild("ZoomControls")

			Topbar.Position = UDim2.new(0,0,0,1)
			Topbar.Size = UDim2.new(0,70,0,14)

			for _,v in pairs(Topbar:GetChildren()) do
				if v:IsA("TextButton") then
					v.TextSize = 11
				end
			end

            ZoomControls.AnchorPoint = Vector2.new(1,1)
            ZoomControls.Position = UDim2.new(1,0,1,20)
            ZoomControls.RotateUp.LayoutOrder = 1
            ZoomControls.ZoomIn.LayoutOrder = 2
            ZoomControls.ZoomIn.Position = UDim2.new(0,25,0,0)
            ZoomControls.RotateDown.LayoutOrder = 3
            ZoomControls.RotateDown.Position = UDim2.new(0,0,0,25)
            ZoomControls.ZoomOut.LayoutOrder = 4
            ZoomControls.ZoomOut.Position = UDim2.new(0,25,0,25)
            for _,buttons in pairs(ZoomControls:GetChildren()) do
                if buttons:IsA("ImageButton") then
                    buttons.Size = UDim2.new(0,25,0,25)
                end
            end

            ZoomControls.FirstPersonIndicator.Size = UDim2.new(0,71,0,24)
            ZoomControls.FirstPersonIndicator.Position = UDim2.new(1,0,0,-25)

            for _,guis in pairs(PlayerList.Container:GetChildren()) do
                for _,textlabels in pairs(guis:GetDescendants()) do
                    if textlabels:IsA("TextLabel") and textlabels.TextStrokeTransparency < 1 then
                        local Outline = Instance.new("UIStroke")
                        Outline.Thickness = 1.25
                        Outline.Parent = textlabels
                    end
                end
            end

			UI.Chat.ChatOutput.Position = UDim2.new(0,30,0,45)
			CoreGui:WaitForChild("ThemeProvider").Enabled = false
			CoreGui:WaitForChild("RobloxGui"):Destroy()
			
			Player.CharacterAdded:Connect(function(Character)
				local JumpLimiter = Character:WaitForChild("JumpLimiter")
				local JumpLimiterClone = JumpLimiter:Clone()
				JumpLimiterClone.Parent = Character
				JumpLimiter:Destroy()
			end)
			
			UI.Chat.ChatOutput.ChildAdded:Connect(function(Object)
			    if Object.PlayerName.Text == "Beyond_5D;  " then
			        Object.Message.TextColor3 = Color3.fromRGB(239,184,56)
			        if OnTeam == false then
			     	   Object.PlayerName.TextColor3 = Color3.fromRGB(255,0,0)
			        end
			    end
			end)
			
			for _,Teams in pairs(PlayerList.Container:GetChildren()) do
                if Teams:IsA("Frame") then
                    for _,Objects in pairs(Teams:GetChildren()) do
                        if Teams.Name == "Default" then
                        	OnTeam = false
                        else
                        	OnTeam = true
                        end
                        UpdatePlayerlist(Objects)
		        	end
		    	end
			end
			
			for _,Teams in pairs(PlayerList.Container:GetChildren()) do
		    	if Teams:IsA("Frame") then
		        	Teams.ChildAdded:Connect(function(Objects)
			            if Teams.Name == "Default" then
                            OnTeam = false
                        else
                            OnTeam = true
                        end
                        UpdatePlayerlist(Objects)
		        	end)
		        end
		    end
			
			for _,v in pairs(Players:GetPlayers()) do
			    OldifyCharacter(v.Character)
			    v.CharacterAdded:Connect(function(NewCharacter)
			        OldifyCharacter(NewCharacter)
			    end)
			end
			
			Players.PlayerAdded:Connect(function(NewPlayer)
			    NewPlayer.CharacterAdded:Connect(function(NewCharacter)
			       OldifyCharacter(NewCharacter)
			    end)
			end)
			
			for _,spawns in pairs(workspace:GetDescendants()) do
				if spawns:IsA("SpawnLocation") then
					for _,textures in pairs(spawns:GetChildren()) do
						if textures:IsA("Texture") then
							textures:Destroy()
						end
					end
				end
			end
			
			local Fullscreen = Topbar.Fullscreen
			local FullscreenClone = Fullscreen:Clone()
			FullscreenClone.Parent = Topbar
			Fullscreen:Destroy()
			
			FullscreenClone.MouseEnter:Connect(function()
				FullscreenClone.BackgroundTransparency = 0
			end)
			
			FullscreenClone.MouseLeave:Connect(function()
				FullscreenClone.BackgroundTransparency = 0.5
			end)
			
			FullscreenClone.MouseButton1Down:Connect(function()
				GuiService:ToggleFullscreen()
				if UI:WaitForChild("MsgLbl_Player [Players.Beyond_5D.FullscreenMsg]",5) then
					UI:FindFirstChild("MsgLbl_Player [Players.Beyond_5D.FullscreenMsg]"):Destroy()
				end
			end)
			
			UpdateFullscreen(FullscreenClone)
			
			GameSettings.FullscreenChanged:Connect(function()
				UpdateFullscreen(FullscreenClone)
			end)
			
			local LegacyToneMap = Lighting:WaitForChild("LegacyToneMap")
			local LegacyToneMapClone = LegacyToneMap:Clone()
			LegacyToneMapClone.Brightness = -0.02
			LegacyToneMapClone.Contrast = -0.2
			LegacyToneMapClone.Saturation = -0.1
			LegacyToneMap:Destroy()
			LegacyToneMapClone.Parent = Lighting
			
			if game.PlaceId == 1009092446 then
				local function WeaponPatch(_Player)
					if Player.Character then
						local PBG = _Player.Backpack:WaitForChild("PBG")
						
						_Player.Character:WaitForChild("ToolSoundGlitch"):Destroy()
						
						PBG.Equipped:Connect(function()
							PBG.Handle.Fire:Play()
							local Hint = _Player.PlayerGui.UI.Messages.Hint:Clone()
							Hint.Name = "MsgLbl_Hint [Created by SNZ+]"
							Hint.Text = "Press Q to switch modes, and press R to use grenade"
							Hint.Parent = _Player.PlayerGui:WaitForChild("UI")
						end)
						
						PBG.Unequipped:Connect(function()
							PBG.Handle.Fire:Play()
							_Player.PlayerGui:WaitForChild("UI"):WaitForChild("MsgLbl_Hint [Created by SNZ+]"):Destroy()
						end)
					end
				end
				
				local function NewWeaponPatch(_Character)
					_Character:WaitForChild("Torso").ChildAdded:Connect(function(Child)
					    if Child:IsA("Sound") and Child.SoundId ~= "rbxasset://sounds//paintball.wav" then
					       game:GetService("RunService").RenderStepped:Wait()
					       Child:Destroy()
					    end
					end)
				end
				
				if Player.Character then
					WeaponPatch(_Player)
				end
				
				Player.CharacterAdded:Connect(function(Character)
					WeaponPatch(Players[Character.Name])
				end)
				
				for _,_NewPlayers in pairs(Players:GetPlayers()) do
					if _NewPlayers.Character then
						NewWeaponPatch(_NewPlayers.Character)
					end
					_NewPlayers.CharacterAdded:Connect(function(_NewCharacter)
						NewWeaponPatch(_NewCharacter)
					end)
				end
				
				Players.PlayerAdded:Connect(function(_NewPlayer)
					_NewPlayer.CharacterAdded:Connect(function(_NewCharacter)
						NewWeaponPatch(_NewCharacter)
					end)
				end)
			elseif game.PlaceId == 1034328244 then
				workspace:WaitForChild("Base"):FindFirstChildOfClass("Texture").Texture = "rbxassetid://7799656950"
			end
			
			while true do
				settings().Rendering.EnableFRM = false
				local _tick = tick()
				RunService.RenderStepped:Wait()
				repeat until (_tick+1/30) <= tick()
			end
			]])
		end
	end)
end
