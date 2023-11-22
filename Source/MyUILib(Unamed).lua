--[[

This UI Library is supported mobile players
Code from Kavo UI Library
UI made by Deity

]]

local Library = {}

local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new
local tweeninfo2 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")
local mouse = game.Players.LocalPlayer:GetMouse()
local focusing = false

local Utility = {}
local Objects = {}

function Library:DraggingEnabled(frame, parent)

	parent = parent or frame

	local dragging = false
	local dragInput, mousePos, framePos

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			mousePos = input.Position
			framePos = parent.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	input.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - mousePos
			parent.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
		end
	end)
end

function Utility:TweenObject(obj, properties, duration, ...)
	tween:Create(obj, tweeninfo(duration, ...), properties):Play()
end

function Library:tween(object, goal, callback)
	local tween = tween:Create(object, tweeninfo2, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

local LibName = "UI_"..tostring(math.random(1, 100))..tostring(math.random(1,50))..tostring(math.random(1, 100))

function Library:ToggleUI()
	if game.CoreGui[LibName].Enabled then
		game.CoreGui[LibName].Enabled = false
	else
		game.CoreGui[LibName].Enabled = true
	end
end

function Library:DestroyUI()
	if game:GetService("CoreGui"):FindFirstChild(LibName) then
		game:GetService("CoreGui"):FindFirstChild(LibName):Destroy()
	end
end

function Library:Create(TitleText)
	TitleText = TitleText or "Untitled"

	local UILibrary = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local TopBar = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Extension = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local UIPadding = Instance.new("UIPadding")
	local Close = Instance.new("ImageButton")
	local Line = Instance.new("Frame")
	local DropShadowHolder = Instance.new("Frame")
	local DropShadow = Instance.new("ImageLabel")
	local Navigation = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local Hide = Instance.new("Frame")
	local Hide2 = Instance.new("Frame")
	local ButtonHolder = Instance.new("Frame")
	local UIPadding_2 = Instance.new("UIPadding")
	local UIListLayout = Instance.new("UIListLayout")
	local Line_2 = Instance.new("Frame")
	local ContentContainer = Instance.new("Frame")
	local Fade = Instance.new("Frame")
	local UIGradient = Instance.new("UIGradient")
	local TabsFolder = Instance.new("Folder")

	Library:DraggingEnabled(TopBar, Main)

	UILibrary.Name = LibName
	UILibrary.Parent = game:GetService("CoreGui")

	Main.Name = "Main"
	Main.Parent = UILibrary
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 400, 0, 228)

	UICorner.CornerRadius = UDim.new(0, 6)
	UICorner.Parent = Main

	TopBar.Name = "TopBar"
	TopBar.Parent = Main
	TopBar.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	TopBar.Size = UDim2.new(1, 0, 0, 30)

	UICorner_2.CornerRadius = UDim.new(0, 6)
	UICorner_2.Parent = TopBar

	Extension.Name = "Extension"
	Extension.Parent = TopBar
	Extension.AnchorPoint = Vector2.new(0, 1)
	Extension.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	Extension.BorderSizePixel = 0
	Extension.Position = UDim2.new(0, 0, 1, 0)
	Extension.Size = UDim2.new(1, 0, 0.5, 0)

	Title.Name = "Title"
	Title.Parent = TopBar
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Size = UDim2.new(0.5, 0, 1, 0)
	Title.Font = Enum.Font.Gotham
	Title.Text = TitleText
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14.000
	Title.TextXAlignment = Enum.TextXAlignment.Left

	UIPadding.Parent = Title
	UIPadding.PaddingLeft = UDim.new(0, 8)
	UIPadding.PaddingTop = UDim.new(0, 1)

	Close.Name = "Close"
	Close.Parent = TopBar
	Close.AnchorPoint = Vector2.new(1, 0.5)
	Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Close.BackgroundTransparency = 1.000
	Close.Position = UDim2.new(1, -8, 0.5, 0)
	Close.Size = UDim2.new(0, 14, 0, 14)
	Close.Image = "rbxassetid://10884453403"
	Close.MouseButton1Click:Connect(function()
		game.TweenService:Create(Close, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
			ImageTransparency = 1
		}):Play()
		wait()
		game.TweenService:Create(Main, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(0,0,0,0),
			Position = UDim2.new(0, Main.AbsolutePosition.X + (Main.AbsoluteSize.X / 2), 0, Main.AbsolutePosition.Y + (Main.AbsoluteSize.Y / 2))
		}):Play()
		ContentContainer.Visible = false
		Navigation.Visible = false
		DropShadowHolder.Visible = false
		TopBar.Visible = false
		wait(1.5)
		Library:DestroyUI()
	end)

	Line.Name = "Line"
	Line.Parent = TopBar
	Line.AnchorPoint = Vector2.new(0, 1)
	Line.BackgroundColor3 = Color3.fromRGB(81, 81, 81)
	Line.BorderSizePixel = 0
	Line.Position = UDim2.new(0, 0, 1, 0)
	Line.Size = UDim2.new(1, 0, 0, 1)

	DropShadowHolder.Name = "DropShadowHolder"
	DropShadowHolder.Parent = Main
	DropShadowHolder.BackgroundTransparency = 1.000
	DropShadowHolder.BorderSizePixel = 0
	DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
	DropShadowHolder.ZIndex = 0

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = DropShadowHolder
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Size = UDim2.new(1, 44, 1, 44)
	DropShadow.ZIndex = 0
	DropShadow.Image = "rbxassetid://6015897843"
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 0.500
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	Navigation.Name = "Navigation"
	Navigation.Parent = Main
	Navigation.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Navigation.BorderSizePixel = 0
	Navigation.Position = UDim2.new(0, 0, 0, 30)
	Navigation.Size = UDim2.new(0, 120, 1, -30)

	UICorner_3.CornerRadius = UDim.new(0, 6)
	UICorner_3.Parent = Navigation

	Hide.Name = "Hide"
	Hide.Parent = Navigation
	Hide.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Hide.BorderSizePixel = 0
	Hide.Size = UDim2.new(1, 0, 0, 20)

	Hide2.Name = "Hide2"
	Hide2.Parent = Navigation
	Hide2.AnchorPoint = Vector2.new(1, 0)
	Hide2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Hide2.BorderSizePixel = 0
	Hide2.Position = UDim2.new(1, 0, 0, 0)
	Hide2.Size = UDim2.new(0, 20, 1, 0)

	ButtonHolder.Name = "ButtonHolder"
	ButtonHolder.Parent = Navigation
	ButtonHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ButtonHolder.BackgroundTransparency = 1.000
	ButtonHolder.Size = UDim2.new(1, 0, 1, 0)

	UIPadding_2.Parent = ButtonHolder
	UIPadding_2.PaddingBottom = UDim.new(0, 8)
	UIPadding_2.PaddingTop = UDim.new(0, 8)

	UIListLayout.Parent = ButtonHolder
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 1)

	Line_2.Name = "Line"
	Line_2.Parent = Navigation
	Line_2.BackgroundColor3 = Color3.fromRGB(81, 81, 81)
	Line_2.BorderSizePixel = 0
	Line_2.Position = UDim2.new(1, 0, 0, 0)
	Line_2.Size = UDim2.new(0, 1, 1, 0)

	ContentContainer.Name = "ContentContainer"
	ContentContainer.Parent = Main
	ContentContainer.AnchorPoint = Vector2.new(1, 0)
	ContentContainer.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
	ContentContainer.BackgroundTransparency = 1.000
	ContentContainer.Position = UDim2.new(1, -6, 0, 36)
	ContentContainer.Size = UDim2.new(1, -133, 1, -42)

	Fade.Name = "Fade"
	Fade.Parent = ContentContainer
	Fade.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Fade.BorderSizePixel = 0
	Fade.Size = UDim2.new(1, 0, 0, 30)
	Fade.Visible = false
	Fade.ZIndex = 10

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(40, 40, 40)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(40, 40, 40))}
	UIGradient.Rotation = 90
	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.34, 0.24), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient.Parent = Fade

	TabsFolder.Name = "TabsFolder"
	TabsFolder.Parent = ContentContainer

	local Tabs = {}
	
	local first = true

	function Tabs:Tab(TabText, TabIcon)
		TabText = TabText or "Untitled"
		TabIcon = TabIcon or ""

		local Active = Instance.new("TextButton")
		local UIPadding_3 = Instance.new("UIPadding")
		local Icon = Instance.new("ImageLabel")
		local NewTab = Instance.new("ScrollingFrame")
		local UIPadding_5 = Instance.new("UIPadding")
		local UIListLayout_2 = Instance.new("UIListLayout")

		Active.Name = TabText.."_TabButton"
		Active.Parent = ButtonHolder
		Active.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Active.BackgroundTransparency = 1
		Active.BorderSizePixel = 0
		Active.Size = UDim2.new(1, 0, 0, 28)
		Active.Font = Enum.Font.Ubuntu
		Active.Text = TabText
		Active.TextColor3 = Color3.fromRGB(199, 199, 199)
		Active.TextSize = 12.000
		Active.TextXAlignment = Enum.TextXAlignment.Left

		UIPadding_3.Parent = Active
		UIPadding_3.PaddingLeft = UDim.new(0, 28)

		Icon.Name = "Icon"
		Icon.Parent = Active
		Icon.AnchorPoint = Vector2.new(0, 0.5)
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.Position = UDim2.new(0, -24, 0.5, 0)
		Icon.Size = UDim2.new(0, 20, 0, 20)
		Icon.Image = TabIcon

		NewTab.Name = "NewTab"
		NewTab.Parent = TabsFolder
		NewTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NewTab.BackgroundTransparency = 1.000
		NewTab.BorderSizePixel = 0
		NewTab.Selectable = false
		NewTab.Size = UDim2.new(1, 0, 1, 0)
		NewTab.AutomaticCanvasSize = "Y"
		NewTab.CanvasSize = UDim2.new(0, 0, 0, 0)
		NewTab.ScrollBarThickness = 0
		NewTab.Visible = false

		UIPadding_5.Parent = NewTab
		UIPadding_5.PaddingBottom = UDim.new(0, 1)
		UIPadding_5.PaddingLeft = UDim.new(0, 1)
		UIPadding_5.PaddingRight = UDim.new(0, 1)
		UIPadding_5.PaddingTop = UDim.new(0, 1)

		UIListLayout_2.Parent = NewTab
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 6)
		
		if first then
			first = false
			NewTab.Visible = true
			Active.BackgroundTransparency = 0.9
			Active.TextColor3 = Color3.fromRGB(255, 255, 255)
		else
			NewTab.Visible = false
			Active.BackgroundTransparency = 1
			Active.TextColor3 = Color3.fromRGB(199, 199, 199)
		end

		Active.MouseButton1Click:Connect(function()
			for i,v in next, TabsFolder:GetChildren() do
				v.Visible = false
			end
			NewTab.Visible = true

			for i,v in next, ButtonHolder:GetChildren() do
				if v:IsA("TextButton") then
					game.TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 1
					}):Play()
					game.TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						TextColor3 = Color3.fromRGB(199, 199, 199)
					}):Play()
					game.TweenService:Create(Icon, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						ImageColor3 = Color3.fromRGB(199, 199, 199)
					}):Play()
				end
			end
			game.TweenService:Create(Active, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				BackgroundTransparency = 0.9
			}):Play()
			game.TweenService:Create(Active, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				TextColor3 = Color3.fromRGB(255, 255, 255)
			}):Play()
			game.TweenService:Create(Icon, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				ImageColor3 = Color3.fromRGB(255, 255, 255)
			}):Play()
		end)
		
		local Elements = {}
		
		function Elements:Section(title)
			title = title or "Section"

			local Section = Instance.new("Frame")
			local Title_idk = Instance.new("TextLabel")
			local Thing = Instance.new("TextLabel")
			local UIPadding_idk = Instance.new("UIPadding")
			local Thing2 = Instance.new("TextLabel")
			local UIPadding_idkk = Instance.new("UIPadding")
			local UIPadding_idkkk = Instance.new("UIPadding")

			Section.Name = "Section"
			Section.Parent = NewTab
			Section.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
			Section.BackgroundTransparency = 1.000
			Section.Position = UDim2.new(0, 0, 0.430411309, 0)
			Section.Size = UDim2.new(1, 0, -0.0561393984, 32)

			Title_idk.Name = "Title"
			Title_idk.Parent = Section
			Title_idk.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title_idk.BackgroundTransparency = 1.000
			Title_idk.Position = UDim2.new(0.35253039, 0, -0.303296119, 0)
			Title_idk.Size = UDim2.new(0.339169234, -20, 1, 0)
			Title_idk.Font = Enum.Font.Ubuntu
			Title_idk.Text = title
			Title_idk.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title_idk.TextSize = 14.000

			Thing.Name = "Thing"
			Thing.Parent = Section
			Thing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Thing.BackgroundTransparency = 1.000
			Thing.Position = UDim2.new(0.637247145, 0, -0.303296119, 0)
			Thing.Size = UDim2.new(0.307416946, -20, 1, 0)
			Thing.Font = Enum.Font.Ubuntu
			Thing.Text = "_____"
			Thing.TextColor3 = Color3.fromRGB(255, 255, 255)
			Thing.TextSize = 14.000

			UIPadding_idk.Parent = Thing
			UIPadding_idk.PaddingBottom = UDim.new(0, 10)

			Thing2.Name = "Thing2"
			Thing2.Parent = Section
			Thing2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Thing2.BackgroundTransparency = 1.000
			Thing2.Position = UDim2.new(0.0976673365, 0, -0.303296119, 0)
			Thing2.Size = UDim2.new(0.335968375, -20, 1, 0)
			Thing2.Font = Enum.Font.Ubuntu
			Thing2.Text = "_____"
			Thing2.TextColor3 = Color3.fromRGB(255, 255, 255)
			Thing2.TextSize = 14.000

			UIPadding_idkk.Parent = Thing2
			UIPadding_idkk.PaddingBottom = UDim.new(0, 10)

			UIPadding_idkkk.Parent = Section
			UIPadding_idkkk.PaddingBottom = UDim.new(0, 6)
			UIPadding_idkkk.PaddingLeft = UDim.new(0, 6)
			UIPadding_idkkk.PaddingRight = UDim.new(0, 6)
			UIPadding_idkkk.PaddingTop = UDim.new(0, 6)
		end

		function Elements:Button(ButtonName, callback)
			ButtonName = ButtonName or "Button"
			callback = callback or function() end

			local Button = Instance.new("TextButton")
			local UICorner_4 = Instance.new("UICorner")
			local Title_2 = Instance.new("TextLabel")
			local UIPadding_5 = Instance.new("UIPadding")
			local Sample = Instance.new("ImageLabel")
			local Icon_2 = Instance.new("ImageLabel")
			local UIStroke = Instance.new("UIStroke")

			local modules = {}
			table.insert(modules, ButtonName)

			Button.Name = "Button"
			Button.Parent = NewTab
			Button.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
			Button.ClipsDescendants = true
			Button.Size = UDim2.new(1, 0, 0, 32)
			Button.AutoButtonColor = false
			Button.Font = Enum.Font.SourceSans
			Button.Text = ""
			Button.TextColor3 = Color3.fromRGB(0, 0, 0)
			Button.TextSize = 14.000
			Objects[Button] = "BackgroundColor3"

			UICorner_4.CornerRadius = UDim.new(0, 4)
			UICorner_4.Parent = Button

			Title_2.Name = "Title"
			Title_2.Parent = Button
			Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title_2.BackgroundTransparency = 1.000
			Title_2.Size = UDim2.new(1, -20, 1, 0)
			Title_2.Font = Enum.Font.Ubuntu
			Title_2.Text = ButtonName
			Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title_2.TextSize = 14.000
			Title_2.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_5.Parent = Button
			UIPadding_5.PaddingBottom = UDim.new(0, 6)
			UIPadding_5.PaddingLeft = UDim.new(0, 6)
			UIPadding_5.PaddingRight = UDim.new(0, 6)
			UIPadding_5.PaddingTop = UDim.new(0, 6)

			Sample.Name = "Sample"
			Sample.Parent = Button
			Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Sample.BackgroundTransparency = 1.000
			Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
			Sample.ImageColor3 = Color3.fromRGB(0, 0, 0)
			Objects[Sample] = "ImageColor3"
			Sample.ImageTransparency = 0.600

			Icon_2.Name = "Icon"
			Icon_2.Parent = Button
			Icon_2.AnchorPoint = Vector2.new(1, 0)
			Icon_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Icon_2.BackgroundTransparency = 1.000
			Icon_2.Position = UDim2.new(1, 0, 0, 0)
			Icon_2.Size = UDim2.new(0, 20, 0, 20)
			Icon_2.Image = "rbxassetid://10888474558"

			UIStroke.Name = "UIStroke"
			UIStroke.Parent = Button
			UIStroke.ApplyStrokeMode = "Border"
			UIStroke.Color = Color3.fromRGB(81, 81, 81)
			UIStroke.LineJoinMode = "Round"
			UIStroke.Thickness = 1
			UIStroke.Transparency = 0

			local ms = game.Players.LocalPlayer:GetMouse()

			local btn  = Button
			local sample  = Sample

			btn.MouseButton1Click:Connect(function()
				if not focusing then
					callback()
					local c = sample:Clone()
					c.Parent = btn
					local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
					c.Position = UDim2.new(0, x, 0, y)
					local len, size = 0.35, nil
					if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then
						size = (btn.AbsoluteSize.X * 1.5)
					else
						size = (btn.AbsoluteSize.Y * 1.5)
					end
					c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
					for i = 1, 10 do
						c.ImageTransparency = c.ImageTransparency + 0.05
						wait(len / 12)
					end
					c:Destroy()
				end
			end)
			local hovering = false
			btn.MouseEnter:Connect(function()
				if not focusing then
					game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(54, 54, 54)
					}):Play()
					game.TweenService:Create(UIStroke, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						Color = Color3.fromRGB(162, 162, 162)
					}):Play()
					hovering = true
				end
			end)
			btn.MouseLeave:Connect(function()
				if not focusing then 
					game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(26, 26, 26)
					}):Play()
					game.TweenService:Create(UIStroke, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						Color = Color3.fromRGB(81, 81, 81)
					}):Play()
					hovering = false
				end
			end)
		end
		
		function Elements:TextBox(TextBoxTitle, callback)
			TextBoxTitle = TextBoxTitle or "TextBox"
			callback = callback or function() end
			
			local TextBox = Instance.new("TextButton")
			local UICorner_34 = Instance.new("UICorner")
			local Title_12 = Instance.new("TextLabel")
			local UIPadding_20 = Instance.new("UIPadding")
			local UIStroke_9 = Instance.new("UIStroke")
			local TextBox_2 = Instance.new("TextBox")
			local UICorner_35 = Instance.new("UICorner")
			local UIStroke_10 = Instance.new("UIStroke")
			
			TextBox.Name = "TextBox"
			TextBox.Parent = NewTab
			TextBox.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
			TextBox.ClipsDescendants = true
			TextBox.Size = UDim2.new(1, 0, 0, 32)
			TextBox.AutoButtonColor  = false
			TextBox.Font = Enum.Font.SourceSans
			TextBox.Text = ""
			TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextBox.TextSize = 14.000

			UICorner_34.CornerRadius = UDim.new(0, 4)
			UICorner_34.Parent = TextBox

			Title_12.Name = "Title"
			Title_12.Parent = TextBox
			Title_12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title_12.BackgroundTransparency = 1.000
			Title_12.Size = UDim2.new(0.750988126, -20, 1, 0)
			Title_12.Font = Enum.Font.Ubuntu
			Title_12.Text = TextBoxTitle
			Title_12.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title_12.TextSize = 14.000
			Title_12.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_20.Parent = TextBox
			UIPadding_20.PaddingBottom = UDim.new(0, 6)
			UIPadding_20.PaddingLeft = UDim.new(0, 6)
			UIPadding_20.PaddingRight = UDim.new(0, 6)
			UIPadding_20.PaddingTop = UDim.new(0, 6)
			
			UIStroke_9.Name = "UIStroke"
			UIStroke_9.Parent = TextBox
			UIStroke_9.ApplyStrokeMode = "Border"
			UIStroke_9.Color = Color3.fromRGB(81, 81, 81)
			UIStroke_9.LineJoinMode = "Round"
			UIStroke_9.Thickness = 1
			UIStroke_9.Transparency = 0

			TextBox_2.Parent = TextBox
			TextBox_2.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
			TextBox_2.BorderSizePixel = 0
			TextBox_2.ClipsDescendants = true
			TextBox_2.Position = UDim2.new(0.691699624, 0, 0, 0)
			TextBox_2.Size = UDim2.new(0, 75, 0, 20)
			TextBox_2.ZIndex = 99
			TextBox_2.ClearTextOnFocus = false
			TextBox_2.Font = Enum.Font.Ubuntu
			TextBox_2.PlaceholderText = "Type here!"
			TextBox_2.Text = ""
			TextBox_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox_2.TextSize = 12.000

			UICorner_35.Parent = TextBox_2
			
			UIStroke_10.Name = "UIStroke"
			UIStroke_10.Parent = TextBox_2
			UIStroke_10.ApplyStrokeMode = "Border"
			UIStroke_10.Color = Color3.fromRGB(136, 136, 136)
			UIStroke_10.LineJoinMode = "Round"
			UIStroke_10.Thickness = 1
			UIStroke_10.Transparency = 0
			
			local btn = TextBox
			
			local hovering = false
			btn.MouseEnter:Connect(function()
				if not focusing then
					game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(54, 54, 54)
					}):Play()
					game.TweenService:Create(UIStroke_9, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						Color = Color3.fromRGB(162, 162, 162)
					}):Play()
					hovering = true
				end 
			end)
			btn.MouseLeave:Connect(function()
				if not focusing then
					game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(26, 26, 26)
					}):Play()
					game.TweenService:Create(UIStroke_9, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						Color = Color3.fromRGB(81, 81, 81)
					}):Play()
					hovering = false
				end
			end)
			
			TextBox_2.FocusLost:Connect(function(EnterPressed)
				if not EnterPressed then 
					return
				else
					callback(TextBox_2.Text)
					wait(0.18)
					TextBox.Text = ""  
				end
			end)
			
		end

		function Elements:Toggle(ToggleName, callback)
			ToggleName = ToggleName or "Toggle"
			callback = callback or function() end

			local Toggle = Instance.new("TextButton")
			local UICorner_8 = Instance.new("UICorner")
			local Title_6 = Instance.new("TextLabel")
			local UIPadding_13 = Instance.new("UIPadding")
			local CheckmarkHolder = Instance.new("Frame")
			local UICorner_9 = Instance.new("UICorner")
			local UIStroke_2 = Instance.new("UIStroke")
			local Sample = Instance.new("ImageLabel")
			local UIStroke_3 = Instance.new("UIStroke")

			Toggle.Name = "Toggle"
			Toggle.Parent = NewTab
			Toggle.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
			Toggle.ClipsDescendants = true
			Toggle.Size = UDim2.new(1, 0, 0, 32)
			Toggle.AutoButtonColor = false
			Toggle.Font = Enum.Font.SourceSans
			Toggle.Text = ""
			Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.TextSize = 14.000

			UICorner_8.CornerRadius = UDim.new(0, 4)
			UICorner_8.Parent = Toggle

			Title_6.Name = "Title"
			Title_6.Parent = Toggle
			Title_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title_6.BackgroundTransparency = 1.000
			Title_6.Size = UDim2.new(1, -26, 1, 0)
			Title_6.Font = Enum.Font.Ubuntu
			Title_6.Text = ToggleName
			Title_6.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title_6.TextSize = 14.000
			Title_6.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_13.Parent = Toggle
			UIPadding_13.PaddingBottom = UDim.new(0, 6)
			UIPadding_13.PaddingLeft = UDim.new(0, 6)
			UIPadding_13.PaddingRight = UDim.new(0, 6)
			UIPadding_13.PaddingTop = UDim.new(0, 6)

			UIStroke_2.Name = "UIStroke"
			UIStroke_2.Parent = Toggle
			UIStroke_2.ApplyStrokeMode = "Border"
			UIStroke_2.Color = Color3.fromRGB(81, 81, 81)
			UIStroke_2.LineJoinMode = "Round"
			UIStroke_2.Thickness = 1
			UIStroke_2.Transparency = 0

			Sample.Name = "Sample"
			Sample.Parent = Toggle
			Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Sample.BackgroundTransparency = 1.000
			Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
			Sample.ImageColor3 = Color3.fromRGB(0, 0, 0)
			Sample.ImageTransparency = 0.600

			CheckmarkHolder.Name = "CheckmarkHolder"
			CheckmarkHolder.Parent = Toggle
			CheckmarkHolder.AnchorPoint = Vector2.new(1, 0.5)
			CheckmarkHolder.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
			CheckmarkHolder.Position = UDim2.new(1, -3, 0.5, 0)
			CheckmarkHolder.Size = UDim2.new(0, 16, 0, 16)

			UICorner_9.CornerRadius = UDim.new(0, 2)
			UICorner_9.Parent = CheckmarkHolder

			UIStroke_3.Name = "UIStroke"
			UIStroke_3.Parent = CheckmarkHolder
			UIStroke_3.ApplyStrokeMode = "Border"
			UIStroke_3.Color = Color3.fromRGB(81, 81, 81)
			UIStroke_3.LineJoinMode = "Round"
			UIStroke_3.Thickness = 1
			UIStroke_3.Transparency = 0

			local ms = game.Players.LocalPlayer:GetMouse()

			local btn  = Toggle
			local sample  = Sample
			local focusing = false

			local toggled = false
			Toggle.MouseButton1Click:Connect(function()
				if not focusing then
					if toggled == false then
						game.TweenService:Create(CheckmarkHolder, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							BackgroundColor3 = Color3.fromRGB(115, 191, 92)
						}):Play()
						game.TweenService:Create(UIStroke_3, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							Color = Color3.fromRGB(0, 255, 59) 
						}):Play()
						local c = sample:Clone()
						c.Parent = btn
						local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
						c.Position = UDim2.new(0, x, 0, y)
						local len, size = 0.35, nil
						if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then
							size = (btn.AbsoluteSize.X * 1.5)
						else
							size = (btn.AbsoluteSize.Y * 1.5)
						end
						c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
						for i = 1, 10 do
							c.ImageTransparency = c.ImageTransparency + 0.05
							wait(len / 12)
						end
						c:Destroy()
					else
						game.TweenService:Create(CheckmarkHolder, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							BackgroundColor3 = Color3.fromRGB(63, 63, 63) 
						}):Play()
						game.TweenService:Create(UIStroke_3, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							Color = Color3.fromRGB(81, 81, 81) 
						}):Play()
						local c = sample:Clone()
						c.Parent = btn
						local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
						c.Position = UDim2.new(0, x, 0, y)
						local len, size = 0.35, nil
						if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then
							size = (btn.AbsoluteSize.X * 1.5)
						else
							size = (btn.AbsoluteSize.Y * 1.5)
						end
						c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
						for i = 1, 10 do
							c.ImageTransparency = c.ImageTransparency + 0.05
							wait(len / 12)
						end
						c:Destroy()
					end
					toggled = not toggled
					pcall(callback, toggled)
				end
			end)
			local hovering = false
			btn.MouseEnter:Connect(function()
				if not focusing then
					game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(54, 54, 54)
					}):Play()
					game.TweenService:Create(UIStroke_2, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						Color = Color3.fromRGB(162, 162, 162)
					}):Play()
					hovering = true
				end 
			end)
			btn.MouseLeave:Connect(function()
				if not focusing then
					game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(26, 26, 26)
					}):Play()
					game.TweenService:Create(UIStroke_2, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						Color = Color3.fromRGB(81, 81, 81)
					}):Play()
					hovering = false
				end
			end)
		end

		function Elements:Slider(SliderTitle, minvalue, maxvalue, callback)
			SliderTitle = SliderTitle or "Slider"
			minvalue = minvalue or 0
			maxvalue = maxvalue or 100
			callback = callback or function() end
			local Value;
			local moveconnection;
			local releaseconnection;

			local Slider = Instance.new("Frame")
			local UICorner_12 = Instance.new("UICorner")
			local UIStroke_4 = Instance.new("UIStroke")
			local Title_8 = Instance.new("TextLabel")
			local UIPadding_15 = Instance.new("UIPadding")
			local Valuee = Instance.new("TextLabel")
			local SliderButton = Instance.new("TextButton")
			local UIStroke_5 = Instance.new("UIStroke")
			local SliderInner = Instance.new("Frame")
			local UICorner_13 = Instance.new("UICorner")
			local UICorner_14 = Instance.new("UICorner")

			Slider.Name = "Slider"
			Slider.Parent = NewTab
			Slider.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
			Slider.Size = UDim2.new(1, 0, 0, 38)

			UICorner_12.CornerRadius = UDim.new(0, 4)
			UICorner_12.Parent = Slider

			UIStroke_4.Name = "UIStroke"
			UIStroke_4.Parent = Slider
			UIStroke_4.ApplyStrokeMode = "Border"
			UIStroke_4.Color = Color3.fromRGB(81, 81, 81)
			UIStroke_4.LineJoinMode = "Round"
			UIStroke_4.Thickness = 1
			UIStroke_4.Transparency = 0

			Title_8.Name = "Title"
			Title_8.Parent = Slider
			Title_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title_8.BackgroundTransparency = 1.000
			Title_8.Size = UDim2.new(1, -24, 1, -10)
			Title_8.Font = Enum.Font.Ubuntu
			Title_8.Text = SliderTitle
			Title_8.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title_8.TextSize = 14.000
			Title_8.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_15.Parent = Slider
			UIPadding_15.PaddingBottom = UDim.new(0, 6)
			UIPadding_15.PaddingLeft = UDim.new(0, 6)
			UIPadding_15.PaddingRight = UDim.new(0, 6)
			UIPadding_15.PaddingTop = UDim.new(0, 6)

			Valuee.Name = "Value"
			Valuee.Parent = Slider
			Valuee.AnchorPoint = Vector2.new(1, 0)
			Valuee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Valuee.BackgroundTransparency = 1.000
			Valuee.Position = UDim2.new(1, 0, 0, 0)
			Valuee.Size = UDim2.new(0, 24, 1, -10)
			Valuee.Font = Enum.Font.Ubuntu
			Valuee.Text = minvalue
			Valuee.TextColor3 = Color3.fromRGB(255, 255, 255)
			Valuee.TextSize = 14.000
			Valuee.TextXAlignment = Enum.TextXAlignment.Right

			SliderButton.Name = "SliderButton"
			SliderButton.Parent = Slider
			SliderButton.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
			SliderButton.BackgroundTransparency = 1
			SliderButton.Position = UDim2.new(0, 0, 0.846153855, 0)
			SliderButton.Size = UDim2.new(0, 253, 0, 4)
			SliderButton.Font = Enum.Font.SourceSans
			SliderButton.Text = ""
			SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			SliderButton.TextSize = 14.000

			UIStroke_5.Name = "UIStroke"
			UIStroke_5.Parent = SliderButton
			UIStroke_5.ApplyStrokeMode = "Border"
			UIStroke_5.Color = Color3.fromRGB(63, 63, 63)
			UIStroke_5.LineJoinMode = "Round"
			UIStroke_5.Thickness = 1
			UIStroke_5.Transparency = 0

			SliderInner.Name = "SliderInner"
			SliderInner.Parent = SliderButton
			SliderInner.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
			SliderInner.Size = UDim2.new(0, 0, 0, 4)

			UICorner_13.CornerRadius = UDim.new(0, 4)
			UICorner_13.Parent = SliderInner

			UICorner_14.CornerRadius = UDim.new(0, 4)
			UICorner_14.Parent = SliderButton

			SliderButton.MouseButton1Down:Connect(function()
				if not focusing then
					Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 255) * SliderInner.AbsoluteSize.X) + tonumber(minvalue)) or 0
					pcall(function()
						callback(Value)
					end)
					SliderInner.Size = UDim2.new(0, math.clamp(mouse.X - SliderInner.AbsolutePosition.X, 0, 255), 0, 4.5)
					moveconnection = mouse.Move:Connect(function()
						Valuee.Text = Value
						Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 255) * SliderInner.AbsoluteSize.X) + tonumber(minvalue))
						pcall(function()
							callback(Value)
						end)
						SliderInner.Size = UDim2.new(0, math.clamp(mouse.X - SliderInner.AbsolutePosition.X, 0, 255), 0, 4.5)
					end)
					releaseconnection = input.InputEnded:Connect(function(Mouse)
						if Mouse.UserInputType == Enum.UserInputType.MouseButton1 or Mouse.UserInputType == Enum.UserInputType.Touch then
							Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 255) * SliderInner.AbsoluteSize.X) + tonumber(minvalue))
							pcall(function()
								callback(Value)
							end)
							SliderInner.Size = UDim2.new(0, math.clamp(mouse.X - SliderInner.AbsolutePosition.X, 0, 255), 0, 4.5)
							moveconnection:Disconnect()
							releaseconnection:Disconnect()
						end
					end)
				end
			end)
		end
		
		function Elements:Keybind(KeybindTitle, first, callback)
			KeybindTitle = KeybindTitle or "Untitled"
			callback = callback or function() end
			
			local oldKey = first.Name
			local Keybind = Instance.new("TextButton")
			local UICorner_36 = Instance.new("UICorner")
			local Title_14 = Instance.new("TextLabel")
			local UIPadding_24 = Instance.new("UIPadding")
			local Sample = Instance.new("ImageLabel")
			local Box = Instance.new("Frame")
			local UICorner_37 = Instance.new("UICorner")
			local KeybindC = Instance.new("TextLabel")
			local UIPadding_25 = Instance.new("UIPadding")
			local UIStroke_Idk791 = Instance.new("UIStroke")
			local UIStroke_qqqaa = Instance.new("UIStroke")
			
			local ms = game.Players.LocalPlayer:GetMouse()
			local uis = game:GetService("UserInputService")
			
			local sample = Sample
			local btn = Keybind
			
			Keybind.Name = "Keybind"
			Keybind.Parent = NewTab
			Keybind.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
			Keybind.ClipsDescendants = true
			Keybind.Size = UDim2.new(1, 0, 0, 32)
			Keybind.AutoButtonColor = false
			Keybind.Font = Enum.Font.SourceSans
			Keybind.Text = ""
			Keybind.TextColor3 = Color3.fromRGB(0, 0, 0)
			Keybind.TextSize = 14.000
			Keybind.MouseButton1Click:connect(function() 
				if not focusing then
					KeybindC.Text = ". . ."
					local a, b = game:GetService('UserInputService').InputBegan:wait();
					if a.KeyCode.Name ~= "Unknown" then
						KeybindC.Text = a.KeyCode.Name
						oldKey = a.KeyCode.Name;
					end
					local c = sample:Clone()
					c.Parent = btn
					local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
					c.Position = UDim2.new(0, x, 0, y)
					local len, size = 0.35, nil
					if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then
						size = (btn.AbsoluteSize.X * 1.5)
					else
						size = (btn.AbsoluteSize.Y * 1.5)
					end
					c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
					for i = 1, 10 do
						c.ImageTransparency = c.ImageTransparency + 0.05
						wait(len / 12)
					end
					c:Destroy()
				end
			end)

			game:GetService("UserInputService").InputBegan:connect(function(current, ok) 
				if not ok then 
					if current.KeyCode.Name == oldKey then 
						callback()
					end
				end
			end)
			local hovering = false
			btn.MouseEnter:Connect(function()
				if not focusing then
					game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(54, 54, 54)
					}):Play()
					game.TweenService:Create(UIStroke_Idk791, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						Color = Color3.fromRGB(162, 162, 162)
					}):Play()
					hovering = true
				end 
			end)
			btn.MouseLeave:Connect(function()
				if not focusing then
					game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(26, 26, 26)
					}):Play()
					game.TweenService:Create(UIStroke_Idk791, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						Color = Color3.fromRGB(81, 81, 81)
					}):Play()
					hovering = false
				end
			end)

			UICorner_36.CornerRadius = UDim.new(0, 4)
			UICorner_36.Parent = Keybind

			Title_14.Name = "Title"
			Title_14.Parent = Keybind
			Title_14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title_14.BackgroundTransparency = 1.000
			Title_14.Size = UDim2.new(1, -20, 1, 0)
			Title_14.Font = Enum.Font.Ubuntu
			Title_14.Text = KeybindTitle
			Title_14.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title_14.TextSize = 14.000
			Title_14.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_24.Parent = Keybind
			UIPadding_24.PaddingBottom = UDim.new(0, 6)
			UIPadding_24.PaddingLeft = UDim.new(0, 6)
			UIPadding_24.PaddingRight = UDim.new(0, 6)
			UIPadding_24.PaddingTop = UDim.new(0, 6)
			
			UIStroke_Idk791.Name = "UIStroke"
			UIStroke_Idk791.Parent = Keybind
			UIStroke_Idk791.ApplyStrokeMode = "Border"
			UIStroke_Idk791.Color = Color3.fromRGB(81, 81, 81)
			UIStroke_Idk791.LineJoinMode = "Round"
			UIStroke_Idk791.Thickness = 1
			UIStroke_Idk791.Transparency = 0

			Sample.Name = "Sample"
			Sample.Parent = Keybind
			Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Sample.BackgroundTransparency = 1.000
			Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
			Sample.ImageColor3 = Color3.fromRGB(0, 0, 0)
			Sample.ImageTransparency = 0.600

			Box.Name = "Box"
			Box.Parent = Keybind
			Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Box.BackgroundTransparency = 0.900
			Box.BorderColor3 = Color3.fromRGB(53, 53, 53)
			Box.Position = UDim2.new(0.897233188, 0, 0, 0)
			Box.Size = UDim2.new(0, 22, 0, 20)

			UICorner_37.CornerRadius = UDim.new(0, 4)
			UICorner_37.Parent = Box
			
			UIStroke_qqqaa.Name = "UIStroke"
			UIStroke_qqqaa.Parent = Box
			UIStroke_qqqaa.ApplyStrokeMode = "Border"
			UIStroke_qqqaa.Color = Color3.fromRGB(81, 81, 81)
			UIStroke_qqqaa.LineJoinMode = "Round"
			UIStroke_qqqaa.Thickness = 1
			UIStroke_qqqaa.Transparency = 0

			KeybindC.Name = "KeybindC"
			KeybindC.Parent = Keybind
			KeybindC.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			KeybindC.BackgroundTransparency = 1.000
			KeybindC.Position = UDim2.new(0.897233188, 0, 0, 0)
			KeybindC.Size = UDim2.new(0, 26, 0, 20)
			KeybindC.Font = Enum.Font.SourceSans
			KeybindC.Text = oldKey
			KeybindC.TextColor3 = Color3.fromRGB(255, 255, 255)
			KeybindC.TextSize = 14.000

			UIPadding_25.Parent = KeybindC
			UIPadding_25.PaddingRight = UDim.new(0, 4)
		end

		function Elements:WarningLabel(WarningText)
			WarningText = WarningText or "This is a warning"

			local WarningLabell = {}

			local Warning = Instance.new("Frame")
			local UIPadding_7 = Instance.new("UIPadding")
			local Title_3 = Instance.new("TextLabel")
			local Icon_4 = Instance.new("ImageLabel")
			local UIPadding_8 = Instance.new("UIPadding")
			local UICorner_5 = Instance.new("UICorner")
			local UIStroke_6 = Instance.new("UIStroke")

			Warning.Name = "Warning"
			Warning.Parent = NewTab
			Warning.BackgroundColor3 = Color3.fromRGB(43, 36, 3)
			Warning.Size = UDim2.new(1, 0, 0, 26)

			UIPadding_7.Parent = Warning
			UIPadding_7.PaddingBottom = UDim.new(0, 6)
			UIPadding_7.PaddingLeft = UDim.new(0, 6)
			UIPadding_7.PaddingRight = UDim.new(0, 6)
			UIPadding_7.PaddingTop = UDim.new(0, 6)

			Title_3.Name = "Title"
			Title_3.Parent = Warning
			Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title_3.BackgroundTransparency = 1.000
			Title_3.Size = UDim2.new(1, 0, 1, 0)
			Title_3.Font = Enum.Font.Ubuntu
			Title_3.Text = WarningText
			Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title_3.TextSize = 14.000
			Title_3.TextWrapped = true
			Title_3.TextXAlignment = Enum.TextXAlignment.Left
			Title_3.TextYAlignment = Enum.TextYAlignment.Top

			Icon_4.Name = "Icon"
			Icon_4.Parent = Title_3
			Icon_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Icon_4.BackgroundTransparency = 1.000
			Icon_4.Position = UDim2.new(0, -20, 0, 0)
			Icon_4.Size = UDim2.new(0, 14, 0, 14)
			Icon_4.Image = "rbxassetid://10889384842"
			Icon_4.ImageColor3 = Color3.fromRGB(214, 178, 14)

			UIPadding_8.Parent = Title_3
			UIPadding_8.PaddingLeft = UDim.new(0, 20)

			UICorner_5.CornerRadius = UDim.new(0, 4)
			UICorner_5.Parent = Warning

			UIStroke_6.Name = "UIStroke"
			UIStroke_6.Parent = Warning
			UIStroke_6.ApplyStrokeMode = "Border"
			UIStroke_6.Color = Color3.fromRGB(165, 137, 11)
			UIStroke_6.LineJoinMode = "Round"
			UIStroke_6.Thickness = 1
			UIStroke_6.Transparency = 0

			function WarningLabell:SetText(WarningLabelSetText)
				WarningText = WarningLabelSetText
				WarningLabell:_update()
			end

			function WarningLabell:_update()
				Title_3.Text = WarningText

				Title_3.Size = UDim2.new(Title_3.Size.X.Scale, Title_3.Size.X.Offset, 0, math.huge)
				Title_3.Size = UDim2.new(Title_3.Size.X.Scale, Title_3.Size.X.Offset, 0, Title_3.TextBounds.Y)
				Library:tween(Warning, {Size = UDim2.new(Warning.Size.X.Scale, Warning.Size.X.Offset, 0, Title_3.TextBounds.Y + 12)})
			end

			WarningLabell:_update()
			return WarningLabell
		end

		function Elements:InfoLabel(InfoText)
			InfoText = InfoText or "This is a info"

			local InfoLabell = {}

			local Info = Instance.new("Frame")
			local UIPadding_9 = Instance.new("UIPadding")
			local Title_4 = Instance.new("TextLabel")
			local Icon_5 = Instance.new("ImageLabel")
			local UIPadding_10 = Instance.new("UIPadding")
			local UICorner_6 = Instance.new("UICorner")
			local UIStroke_7 = Instance.new("UIStroke")

			Info.Name = "Info"
			Info.Parent = NewTab
			Info.BackgroundColor3 = Color3.fromRGB(3, 32, 43)
			Info.Size = UDim2.new(1, 0, 0, 26)

			UIPadding_9.Parent = Info
			UIPadding_9.PaddingBottom = UDim.new(0, 6)
			UIPadding_9.PaddingLeft = UDim.new(0, 6)
			UIPadding_9.PaddingRight = UDim.new(0, 6)
			UIPadding_9.PaddingTop = UDim.new(0, 6)

			Title_4.Name = "Title"
			Title_4.Parent = Info
			Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title_4.BackgroundTransparency = 1.000
			Title_4.Size = UDim2.new(1, 0, 1, 0)
			Title_4.Font = Enum.Font.Ubuntu
			Title_4.Text = InfoText
			Title_4.TextWrapped = true
			Title_4.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title_4.TextSize = 14.000
			Title_4.TextXAlignment = Enum.TextXAlignment.Left
			Title_4.TextYAlignment = Enum.TextYAlignment.Top

			Icon_5.Name = "Icon"
			Icon_5.Parent = Title_4
			Icon_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Icon_5.BackgroundTransparency = 1.000
			Icon_5.Position = UDim2.new(0, -20, 0, 0)
			Icon_5.Size = UDim2.new(0, 14, 0, 14)
			Icon_5.Image = "rbxassetid://10889391188"
			Icon_5.ImageColor3 = Color3.fromRGB(12, 170, 218)

			UIPadding_10.Parent = Title_4
			UIPadding_10.PaddingLeft = UDim.new(0, 20)

			UICorner_6.CornerRadius = UDim.new(0, 4)
			UICorner_6.Parent = Info

			UIStroke_7.Name = "UIStroke"
			UIStroke_7.Parent = Info
			UIStroke_7.ApplyStrokeMode = "Border"
			UIStroke_7.Color = Color3.fromRGB(11, 136, 177)
			UIStroke_7.LineJoinMode = "Round"
			UIStroke_7.Thickness = 1
			UIStroke_7.Transparency = 0


			function InfoLabell:SetText(InfoLabelSetText)
				InfoText = InfoLabelSetText
				InfoLabell:_update()
			end

			function InfoLabell:_update()
				Title_4.Text = InfoText

				Title_4.Size = UDim2.new(Title_4.Size.X.Scale, Title_4.Size.X.Offset, 0, math.huge)
				Title_4.Size = UDim2.new(Title_4.Size.X.Scale, Title_4.Size.X.Offset, 0, Title_4.TextBounds.Y)
				Library:tween(Info, {Size = UDim2.new(Info.Size.X.Scale, Info.Size.X.Offset, 0, Title_4.TextBounds.Y + 12)})
			end

			InfoLabell:_update()
			return InfoLabell
		end

		function Elements:Label(LabelText)
			LabelText = LabelText or "This is a label"

			local Labell = {}

			local Label = Instance.new("Frame")
			local UIPadding_11 = Instance.new("UIPadding")
			local Title_5 = Instance.new("TextLabel")
			local Icon_6 = Instance.new("ImageLabel")
			local UIPadding_12 = Instance.new("UIPadding")
			local UICorner_7 = Instance.new("UICorner")
			local UIStroke_8 = Instance.new("UIStroke")

			Label.Name = "Label"
			Label.Parent = NewTab
			Label.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
			Label.Size = UDim2.new(1, 0, 0, 26)

			UIPadding_11.Parent = Label
			UIPadding_11.PaddingBottom = UDim.new(0, 6)
			UIPadding_11.PaddingLeft = UDim.new(0, 6)
			UIPadding_11.PaddingRight = UDim.new(0, 6)
			UIPadding_11.PaddingTop = UDim.new(0, 6)

			Title_5.Name = "Title"
			Title_5.Parent = Label
			Title_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title_5.BackgroundTransparency = 1.000
			Title_5.Size = UDim2.new(1, 0, 1, 0)
			Title_5.Font = Enum.Font.Ubuntu
			Title_5.Text = LabelText
			Title_5.TextWrapped = true
			Title_5.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title_5.TextSize = 14.000
			Title_5.TextXAlignment = Enum.TextXAlignment.Left
			Title_5.TextYAlignment = Enum.TextYAlignment.Top

			Icon_6.Name = "Icon"
			Icon_6.Parent = Title_5
			Icon_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Icon_6.BackgroundTransparency = 1.000
			Icon_6.Position = UDim2.new(0, -20, 0, 0)
			Icon_6.Size = UDim2.new(0, 14, 0, 14)
			Icon_6.Image = "rbxassetid://10889394367"
			Icon_6.ImageColor3 = Color3.fromRGB(127, 127, 127)

			UIPadding_12.Parent = Title_5
			UIPadding_12.PaddingLeft = UDim.new(0, 20)

			UICorner_7.CornerRadius = UDim.new(0, 4)
			UICorner_7.Parent = Label

			UIStroke_8.Name = "UIStroke"
			UIStroke_8.Parent = Label
			UIStroke_8.ApplyStrokeMode = "Border"
			UIStroke_8.Color = Color3.fromRGB(81, 81, 81)
			UIStroke_8.LineJoinMode = "Round"
			UIStroke_8.Thickness = 1
			UIStroke_8.Transparency = 0

			function Labell:SetText(LabelSetText)
				LabelText = LabelSetText
				Labell:_update()
			end

			function Labell:_update()
				Title_5.Text = LabelText

				Title_5.Size = UDim2.new(Title_5.Size.X.Scale, Title_5.Size.X.Offset, 0, math.huge)
				Title_5.Size = UDim2.new(Title_5.Size.X.Scale, Title_5.Size.X.Offset, 0, Title_5.TextBounds.Y)
				Library:tween(Label, {Size = UDim2.new(Label.Size.X.Scale, Label.Size.X.Offset, 0, Title_5.TextBounds.Y + 12)})
			end

			Labell:_update()
			return Labell
		end
		return Elements
	end
	return Tabs
end
return Library
