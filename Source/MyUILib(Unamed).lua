local Library = {}

local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")
local mouse = game.Players.LocalPlayer:GetMouse()

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

local something123 = tostring(math.random(1, 100))..tostring(math.random(1,50))..tostring(math.random(1, 100))

function Library:Window(title)
	title = title or "Untitled"

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

	function Library:ToggleUI()
		if game.CoreGui[title.."_UI"..something123].Enabled then
			game.CoreGui[title.."_UI"..something123].Enabled = false
		else
			game.CoreGui[title.."_UI"..something123].Enabled = true
		end
	end
	function Library:DestroyUI()
		game:GetService("CoreGui"):FindFirstChild(title.."_UI"..something123):Destroy()
	end

	UILibrary.Name = title.."_UI"..something123
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
	Title.Text = title
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

	function Tabs:Tab(TabTitle, TabIcon)
		TabTitle = TabTitle or "Untitled Tab"
		TabIcon = TabIcon or ""

		local Active = Instance.new("TextButton")
		local UIPadding_3 = Instance.new("UIPadding")
		local Icon = Instance.new("ImageLabel")
		local NewTab = Instance.new("ScrollingFrame")
		local UIPadding_5 = Instance.new("UIPadding")
		local UIListLayout_2 = Instance.new("UIListLayout")

		Active.Name = TabTitle.."_TabButton"
		Active.Parent = ButtonHolder
		Active.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Active.BackgroundTransparency = 0.9
		Active.BorderSizePixel = 0
		Active.Size = UDim2.new(1, 0, 0, 28)
		Active.Font = Enum.Font.Ubuntu
		Active.Text = TabTitle
		Active.TextColor3 = Color3.fromRGB(255, 255, 255)
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
		NewTab.ScrollBarThickness = 0

		UIPadding_5.Parent = NewTab
		UIPadding_5.PaddingBottom = UDim.new(0, 1)
		UIPadding_5.PaddingLeft = UDim.new(0, 1)
		UIPadding_5.PaddingRight = UDim.new(0, 1)
		UIPadding_5.PaddingTop = UDim.new(0, 1)

		UIListLayout_2.Parent = NewTab
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 6)

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
				end
			end
			game.TweenService:Create(Active, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				BackgroundTransparency = 0.9
			}):Play()
			game.TweenService:Create(Active, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				TextColor3 = Color3.fromRGB(255, 255, 255)
			}):Play()
		end)

		local Elements = {}

		function Elements:Slider(SliderTitle, minvalue, maxvalue, callback)
			SliderTitle = SliderTitle or "Untitled"
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
			Valuee.Text = "0"
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
			end)

			function Elements:Toggle(ToggleName, callback)
				ToggleName = ToggleName or ""
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
								BackgroundColor3 = Color3.fromRGB(61, 67, 74) 
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
						hovering = true
					end 
				end)
				btn.MouseLeave:Connect(function()
					if not focusing then
						game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							BackgroundColor3 = Color3.fromRGB(26, 26, 26)
						}):Play()
						hovering = false
					end
				end)

				--[[ not working
				local Labels = {}
				
				function Labels:Label(LableTitlee)
					LableTitlee = LableTitlee or "Untitled"
					
					local Label = Instance.new("Frame")
					local UIPadding_11 = Instance.new("UIPadding")
					local Title_5 = Instance.new("TextLabel")
					local Icon_6 = Instance.new("ImageLabel")
					local UIPadding_12 = Instance.new("UIPadding")
					local UICorner_7 = Instance.new("UICorner")
					
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
					Title_5.Text = LableTitlee
					Title_5.Font = Enum.Font.Ubuntu
					Title_5.TextColor3 = Color3.fromRGB(255, 255, 255)
					Title_5.TextSize = 14.000
					Title_5.TextXAlignment = Enum.TextXAlignment.Left

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
					
				end
				
				local UIStroke_4 = Instance.new("UIStroke")
				
				UIStroke_4.Name = "UIStroke"
				UIStroke_4.Parent = Slider
				UIStroke_4.ApplyStrokeMode = "Border"
				UIStroke_4.Color = Color3.fromRGB(81, 81, 81)
				UIStroke_4.LineJoinMode = "Round"
				UIStroke_4.Thickness = 1
				UIStroke_4.Transparency = 0
				
				local UIStroke_5 = Instance.new("UIStroke")
				
				UIStroke_5.Name = "UIStroke"
				UIStroke_5.Parent = SliderBack
				UIStroke_5.ApplyStrokeMode = "Border"
				UIStroke_5.Color = Color3.fromRGB(63, 63, 63)
				UIStroke_5.LineJoinMode = "Round"
				UIStroke_5.Thickness = 1
				UIStroke_5.Transparency = 0
				
				]]

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
							hovering = true
						end
					end)
					btn.MouseLeave:Connect(function()
						if not focusing then 
							game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
								BackgroundColor3 = Color3.fromRGB(26, 26, 26)
							}):Play()
							hovering = false
						end
					end)

				end

			end

		end
		return Elements
	end
	return Tabs
end
return Library
