-- services
local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local coreGui = game:GetService("CoreGui")

-- vars
local lp = players.LocalPlayer
local mouse = lp:GetMouse()
local viewport = workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

local Library = {}

function Library:validate(defaults, options)
	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function Library:tween(object, goal, callback)
	local tween = tweenService:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function Library:Init(options)
	options = Library:validate({
		name = "UI Library Test"
	}, options or {})
	
	local GUI = {
		CurrentTab = nil
	}
	
	-- Main Frame
	do
		
		-- StarterGui.MyLibrary
		GUI["1"] = Instance.new("ScreenGui", runService:IsStudio() and players.LocalPlayer:WaitForChild("PlayerGui") or coreGui);
		GUI["1"]["Name"] = [[MyLibrary]];
		GUI["1"]["IgnoreGuiInset"] = true

		-- StarterGui.MyLibrary.Main
		GUI["2"] = Instance.new("Frame", GUI["1"]);
		GUI["2"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
		GUI["2"]["AnchorPoint"] = Vector2.new(0, 0);
		GUI["2"]["Size"] = UDim2.new(0, 400, 0, 300);
		GUI["2"]["Position"] = UDim2.fromOffset((viewport.X/2) - (GUI["2"].Size.X.Offset / 2), (viewport.Y/2) - (GUI["2"].Size.Y.Offset / 2));
		GUI["2"]["Name"] = [[Main]];

		-- StarterGui.MyLibrary.Main.UICorner
		GUI["3"] = Instance.new("UICorner", GUI["2"]);
		GUI["3"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.MyLibrary.Main.DropShadowHolder
		GUI["b"] = Instance.new("Frame", GUI["2"]);
		GUI["b"]["ZIndex"] = 0;
		GUI["b"]["BorderSizePixel"] = 0;
		GUI["b"]["BackgroundTransparency"] = 1;
		GUI["b"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["b"]["Name"] = [[DropShadowHolder]];

		-- StarterGui.MyLibrary.Main.DropShadowHolder.DropShadow
		GUI["c"] = Instance.new("ImageLabel", GUI["b"]);
		GUI["c"]["ZIndex"] = 0;
		GUI["c"]["BorderSizePixel"] = 0;
		GUI["c"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
		GUI["c"]["ScaleType"] = Enum.ScaleType.Slice;
		GUI["c"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["c"]["ImageTransparency"] = 0.5;
		GUI["c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["c"]["Image"] = [[rbxassetid://6015897843]];
		GUI["c"]["Size"] = UDim2.new(1, 44, 1, 44);
		GUI["c"]["Name"] = [[DropShadow]];
		GUI["c"]["BackgroundTransparency"] = 1;
		GUI["c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

		-- StarterGui.MyLibrary.Main.TopBar
		GUI["4"] = Instance.new("Frame", GUI["2"]);
		GUI["4"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
		GUI["4"]["Size"] = UDim2.new(1, 0, 0, 30);
		GUI["4"]["Name"] = [[TopBar]];

		-- StarterGui.MyLibrary.Main.TopBar.UICorner
		GUI["5"] = Instance.new("UICorner", GUI["4"]);
		GUI["5"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.MyLibrary.Main.TopBar.Extension
		GUI["6"] = Instance.new("Frame", GUI["4"]);
		GUI["6"]["BorderSizePixel"] = 0;
		GUI["6"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
		GUI["6"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["6"]["Size"] = UDim2.new(1, 0, 0.5, 0);
		GUI["6"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["6"]["Name"] = [[Extension]];

		-- StarterGui.MyLibrary.Main.TopBar.Title
		GUI["7"] = Instance.new("TextLabel", GUI["4"]);
		GUI["7"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["7"]["TextSize"] = 14;
		GUI["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["7"]["Size"] = UDim2.new(0.5, 0, 1, 0);
		GUI["7"]["Text"] = options["name"];
		GUI["7"]["Name"] = options["name"];
		GUI["7"]["Font"] = Enum.Font.Gotham;
		GUI["7"]["BackgroundTransparency"] = 1;

		-- StarterGui.MyLibrary.Main.TopBar.Title.UIPadding
		GUI["8"] = Instance.new("UIPadding", GUI["7"]);
		GUI["8"]["PaddingTop"] = UDim.new(0, 1);
		GUI["8"]["PaddingLeft"] = UDim.new(0, 8);

		-- StarterGui.MyLibrary.Main.TopBar.Close
		GUI["9"] = Instance.new("ImageLabel", GUI["4"]);
		GUI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["9"]["AnchorPoint"] = Vector2.new(1, 0.5);
		GUI["9"]["Image"] = [[rbxassetid://10884453403]];
		GUI["9"]["Size"] = UDim2.new(0, 14, 0, 14);
		GUI["9"]["Name"] = [[Close]];
		GUI["9"]["BackgroundTransparency"] = 1;
		GUI["9"]["Position"] = UDim2.new(1, -8, 0.5, 0);

		-- StarterGui.MyLibrary.Main.TopBar.Line
		GUI["a"] = Instance.new("Frame", GUI["4"]);
		GUI["a"]["BorderSizePixel"] = 0;
		GUI["a"]["BackgroundColor3"] = Color3.fromRGB(82, 82, 82);
		GUI["a"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["a"]["Size"] = UDim2.new(1, 0, 0, 1);
		GUI["a"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["a"]["Name"] = [[Line]];
		
		-- StarterGui.MyLibrary.Main.ContentContainer
		GUI["1b"] = Instance.new("Frame", GUI["2"]);
		GUI["1b"]["BackgroundColor3"] = Color3.fromRGB(55, 55, 55);
		GUI["1b"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["1b"]["BackgroundTransparency"] = 1;
		GUI["1b"]["Size"] = UDim2.new(1, -133, 1, -42);
		GUI["1b"]["Position"] = UDim2.new(1, -6, 0, 36);
		GUI["1b"]["Name"] = [[ContentContainer]];
	end
	
	-- Navigation
	do
		
		-- StarterGui.MyLibrary.Main.Navigation
		GUI["d"] = Instance.new("Frame", GUI["2"]);
		GUI["d"]["BorderSizePixel"] = 0;
		GUI["d"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
		GUI["d"]["Size"] = UDim2.new(0, 120, 1, -30);
		GUI["d"]["Position"] = UDim2.new(0, 0, 0, 30);
		GUI["d"]["Name"] = [[Navigation]];

		-- StarterGui.MyLibrary.Main.Navigation.UICorner
		GUI["e"] = Instance.new("UICorner", GUI["d"]);
		GUI["e"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.MyLibrary.Main.Navigation.Hide
		GUI["f"] = Instance.new("Frame", GUI["d"]);
		GUI["f"]["BorderSizePixel"] = 0;
		GUI["f"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
		GUI["f"]["Size"] = UDim2.new(1, 0, 0, 20);
		GUI["f"]["Name"] = [[Hide]];

		-- StarterGui.MyLibrary.Main.Navigation.Hide2
		GUI["10"] = Instance.new("Frame", GUI["d"]);
		GUI["10"]["BorderSizePixel"] = 0;
		GUI["10"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
		GUI["10"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["10"]["Size"] = UDim2.new(0, 20, 1, 0);
		GUI["10"]["Position"] = UDim2.new(1, 0, 0, 0);
		GUI["10"]["Name"] = [[Hide2]];

		-- StarterGui.MyLibrary.Main.Navigation.ButtonHolder
		GUI["11"] = Instance.new("Frame", GUI["d"]);
		GUI["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["11"]["BackgroundTransparency"] = 1;
		GUI["11"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["11"]["Name"] = [[ButtonHolder]];

		-- StarterGui.MyLibrary.Main.Navigation.ButtonHolder.UIPadding
		GUI["12"] = Instance.new("UIPadding", GUI["11"]);
		GUI["12"]["PaddingTop"] = UDim.new(0, 4);
		GUI["12"]["PaddingBottom"] = UDim.new(0, 4);
		GUI["12"]["PaddingRight"] = UDim.new(0, 4);
		GUI["12"]["PaddingLeft"] = UDim.new(0, 4);

		-- StarterGui.MyLibrary.Main.Navigation.ButtonHolder.UIListLayout
		GUI["13"] = Instance.new("UIListLayout", GUI["11"]);
		GUI["13"]["Padding"] = UDim.new(0, 1);
		GUI["13"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		
		-- StarterGui.MyLibrary.Main.Navigation.Line
		GUI["1a"] = Instance.new("Frame", GUI["d"]);
		GUI["1a"]["BorderSizePixel"] = 0;
		GUI["1a"]["BackgroundColor3"] = Color3.fromRGB(82, 82, 82);
		GUI["1a"]["Size"] = UDim2.new(0, 1, 1, 0);
		GUI["1a"]["Position"] = UDim2.new(1, 0, 0, 0);
		GUI["1a"]["Name"] = [[Line]];
		
		
	end
	
	function GUI:Tab(options)
		options = Library:validate({
			name = "Preview Tab",
			icon = "rbxassetid://10888331510"
		}, options or {})
		
		local Tab = {
			Hover = false,
			Active = false
		}
	
		-- Render
		do
			-- StarterGui.MyLibrary.Main.Navigation.ButtonHolder.Inactive
			Tab["17"] = Instance.new("TextLabel", GUI["11"]);
			Tab["17"]["BorderSizePixel"] = 0;
			Tab["17"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Tab["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["17"]["TextSize"] = 12;
			Tab["17"]["TextColor3"] = Color3.fromRGB(200, 200, 200);
			Tab["17"]["Size"] = UDim2.new(1, 0, 0, 24);
			Tab["17"]["Text"] = options.name;
			Tab["17"]["Name"] = [[Inactive]];
			Tab["17"]["Font"] = Enum.Font.Ubuntu;
			Tab["17"]["BackgroundTransparency"] = 1;

			-- StarterGui.MyLibrary.Main.Navigation.ButtonHolder.Inactive.UIPadding
			Tab["18"] = Instance.new("UIPadding", Tab["17"]);
			Tab["18"]["PaddingLeft"] = UDim.new(0, 28);

			-- StarterGui.MyLibrary.Main.Navigation.ButtonHolder.Inactive.Icon
			Tab["19"] = Instance.new("ImageLabel", Tab["17"]);
			Tab["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["19"]["ImageColor3"] = Color3.fromRGB(200, 200, 200);
			Tab["19"]["AnchorPoint"] = Vector2.new(0, 0.5);
			Tab["19"]["Image"] = options.icon;
			Tab["19"]["Size"] = UDim2.new(0, 20, 0, 20);
			Tab["19"]["Name"] = [[Icon]];
			Tab["19"]["BackgroundTransparency"] = 1;
			Tab["19"]["Position"] = UDim2.new(0, -24, 0.5, 0);
			
			-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab
			Tab["1c"] = Instance.new("ScrollingFrame", GUI["1b"]);
			Tab["1c"]["BorderSizePixel"] = 0;
			Tab["1c"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["1c"]["BackgroundTransparency"] = 1;
			Tab["1c"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["1c"]["Selectable"] = false;
			Tab["1c"]["ScrollBarThickness"] = 0;
			Tab["1c"]["Name"] = [[HomeTab]];
			Tab["1c"]["SelectionGroup"] = false;
			Tab["1c"]["Visible"] = false;
			
			-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.UIPadding
			Tab["23"] = Instance.new("UIPadding", Tab["1c"]);
			Tab["23"]["PaddingTop"] = UDim.new(0, 1);
			Tab["23"]["PaddingRight"] = UDim.new(0, 1);
			Tab["23"]["PaddingBottom"] = UDim.new(0, 1);
			Tab["23"]["PaddingLeft"] = UDim.new(0, 1);
			
			-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.UIListLayout
			GUI["2b"] = Instance.new("UIListLayout", Tab["1c"]);
			GUI["2b"]["Padding"] = UDim.new(0, 6);
			GUI["2b"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		end
		
		-- Methods
		function Tab:Activate()
			if not Tab.Active then
				if GUI.CurrentTab ~= nil then
					GUI.CurrentTab:Deactivate()
				end

				Tab.Active = true
				Library:tween(Tab["17"], {BackgroundTransparency = .8})
				Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
				Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(255, 255, 255)})
				Tab["1c"].Visible = true
				
				GUI.CurrentTab = Tab
			end
		end
		
		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false
				Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(200, 200, 200)})
				Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(200, 200, 200)})
				Library:tween(Tab["17"], {BackgroundTransparency = 1})
				Tab["1c"].Visible = false
			end
		end
		
		-- Logic
		do
			Tab["17"].MouseEnter:Connect(function()
				Tab.Hover = true

				if not Tab.Active then
					Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
					Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(255, 255, 255)})
				end
			end)

			Tab["17"].MouseLeave:Connect(function()
				Tab.Hover = false

				if not Tab.Active then
					Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(200, 200, 200)})
					Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(200, 200, 200)})
				end
			end)

			uis.InputBegan:Connect(function(input, gpe)
				if gpe then return end

				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					if Tab.Hover then
						Tab:Activate()
					end
				end
			end)

			if GUI.CurrentTab == nil then
				Tab:Activate()
			end
		end
		
		function Tab:Button(options)
			options = Library:validate({
				name = "Preview Button",
				callback = function() end
			}, options or {})
			
			local Button = {
				Hover = false,
				MouseDown = false
			}
			
			-- Render
			do
				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Button
				Button["1d"] = Instance.new("Frame", Tab["1c"]);
				Button["1d"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
				Button["1d"]["Size"] = UDim2.new(1, 0, 0, 32);
				Button["1d"]["Name"] = [[Button]];

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Button.UICorner
				Button["1e"] = Instance.new("UICorner", Button["1d"]);
				Button["1e"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Button.UIStroke
				Button["1f"] = Instance.new("UIStroke", Button["1d"]);
				Button["1f"]["Color"] = Color3.fromRGB(82, 82, 82);
				Button["1f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Button.Title
				Button["20"] = Instance.new("TextLabel", Button["1d"]);
				Button["20"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Button["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["20"]["TextSize"] = 14;
				Button["20"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Button["20"]["Size"] = UDim2.new(1, -20, 1, 0);
				Button["20"]["Text"] = options.name;
				Button["20"]["Name"] = [[Title]];
				Button["20"]["Font"] = Enum.Font.Ubuntu;
				Button["20"]["BackgroundTransparency"] = 1;

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Button.UIPadding
				Button["21"] = Instance.new("UIPadding", Button["1d"]);
				Button["21"]["PaddingTop"] = UDim.new(0, 6);
				Button["21"]["PaddingRight"] = UDim.new(0, 6);
				Button["21"]["PaddingBottom"] = UDim.new(0, 6);
				Button["21"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Button.Icon
				Button["22"] = Instance.new("ImageLabel", Button["1d"]);
				Button["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["22"]["AnchorPoint"] = Vector2.new(1, 0);
				Button["22"]["Image"] = [[rbxassetid://10888474558]];
				Button["22"]["Size"] = UDim2.new(0, 20, 0, 20);
				Button["22"]["Name"] = [[Icon]];
				Button["22"]["BackgroundTransparency"] = 1;
				Button["22"]["Position"] = UDim2.new(1, 0, 0, 0);
			end
			
			-- Methods
			function Button:SetText(text)
				Button["20"].Text = text
				options.name = text
			end
			
			function Button:SetCallback(fn)
				options.callback = fn
			end
			
			-- Logic
			do
				Button["1d"].MouseEnter:Connect(function()
					Button.Hover = true
					
					Library:tween(Button["1f"], {Color = Color3.fromRGB(102, 102, 102)})
				end)
				
				Button["1d"].MouseLeave:Connect(function()
					Button.Hover = false
					
					if not Button.MouseDown then
						Library:tween(Button["1f"], {Color = Color3.fromRGB(82, 82, 82)})
					end
				end)
				
				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end
					
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch and Button.Hover then
						Button.MouseDown = true
						Library:tween(Button["1d"], {BackgroundColor3 = Color3.fromRGB(57, 57, 57)})
						Library:tween(Button["1f"], {Color = Color3.fromRGB(200, 200, 200)})
						options.callback()
					end
				end)
				
				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						Button.MouseDown = false
						
						if Button.Hover then
							Library:tween(Button["1d"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
							Library:tween(Button["1f"], {Color = Color3.fromRGB(102, 102, 102)})
						else
							Library:tween(Button["1d"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
							Library:tween(Button["1f"], {Color = Color3.fromRGB(82, 82, 82)})
						end
					end
				end)
			end
			
			return Button
		end
		
		function Tab:Warning(options)
			options = Library:validate({
				message = "Preview Warning"
			}, options or {})
			
			local Warning = {}
			
			-- Render
			do

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Warning
				Warning["24"] = Instance.new("Frame", Tab["1c"]);
				Warning["24"]["BackgroundColor3"] = Color3.fromRGB(44, 37, 4);
				Warning["24"]["Size"] = UDim2.new(1, 0, 0, 26);
				Warning["24"]["Name"] = [[Warning]];

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Warning.UICorner
				Warning["25"] = Instance.new("UICorner", Warning["24"]);
				Warning["25"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Warning.UIStroke
				Warning["26"] = Instance.new("UIStroke", Warning["24"]);
				Warning["26"]["Color"] = Color3.fromRGB(166, 138, 12);
				Warning["26"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Warning.Title
				Warning["27"] = Instance.new("TextLabel", Warning["24"]);
				Warning["27"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Warning["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Warning["27"]["TextSize"] = 14;
				Warning["27"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Warning["27"]["Size"] = UDim2.new(1, 0, 1, 0);
				Warning["27"]["Text"] = options.message;
				Warning["27"]["Name"] = [[Title]];
				Warning["27"]["Font"] = Enum.Font.Ubuntu;
				Warning["27"]["BackgroundTransparency"] = 1;
				Warning["27"]["TextWrapped"] = true
				Warning["27"]["TextYAlignment"] = Enum.TextYAlignment.Top
				
				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Warning.Title.UIPadding
				Warning["28"] = Instance.new("UIPadding", Warning["27"]);
				Warning["28"]["PaddingLeft"] = UDim.new(0, 20);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Warning.Title.Icon
				Warning["29"] = Instance.new("ImageLabel", Warning["27"]);
				Warning["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Warning["29"]["ImageColor3"] = Color3.fromRGB(215, 179, 15);
				Warning["29"]["Image"] = [[rbxassetid://10889384842]];
				Warning["29"]["Size"] = UDim2.new(0, 14, 0, 14);
				Warning["29"]["Name"] = [[Icon]];
				Warning["29"]["BackgroundTransparency"] = 1;
				Warning["29"]["Position"] = UDim2.new(0, -20, 0, 0);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Warning.UIPadding
				Warning["2a"] = Instance.new("UIPadding", Warning["24"]);
				Warning["2a"]["PaddingTop"] = UDim.new(0, 6);
				Warning["2a"]["PaddingRight"] = UDim.new(0, 6);
				Warning["2a"]["PaddingBottom"] = UDim.new(0, 6);
				Warning["2a"]["PaddingLeft"] = UDim.new(0, 6);
			end
			
			-- Methods
			function Warning:SetText(text)
				options.message = text
				Warning:_update()
			end
			
			function Warning:_update()
				Warning["27"].Text = options.message
				
				Warning["27"].Size = UDim2.new(Warning["27"].Size.X.Scale, Warning["27"].Size.X.Offset, 0, math.huge)
				Warning["27"].Size = UDim2.new(Warning["27"].Size.X.Scale, Warning["27"].Size.X.Offset, 0, Warning["27"].TextBounds.Y)
				Library:tween(Warning["24"], {Size = UDim2.new(Warning["24"].Size.X.Scale, Warning["24"].Size.X.Offset, 0, Warning["27"].TextBounds.Y + 12)})
			end
			
			
			Warning:_update()
			return Warning
		end
		
		function Tab:Toggle(options)
			options = Library:validate({
				title = "Preview Toggle",
				callback = function() end
			}, options or {})
			
			local Toggle = {
				Hover = false,
				MouseDown = false,
				State = false
			}
			
			-- Render
			do
				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.ToggleInactive
				Toggle["56"] = Instance.new("Frame", Tab["1c"]);
				Toggle["56"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
				Toggle["56"]["Size"] = UDim2.new(1, 0, 0, 32);
				Toggle["56"]["Name"] = [[ToggleInactive]];

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.ToggleInactive.UICorner
				Toggle["57"] = Instance.new("UICorner", Toggle["56"]);
				Toggle["57"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.ToggleInactive.UIStroke
				Toggle["58"] = Instance.new("UIStroke", Toggle["56"]);
				Toggle["58"]["Color"] = Color3.fromRGB(82, 82, 82);
				Toggle["58"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.ToggleInactive.Title
				Toggle["59"] = Instance.new("TextLabel", Toggle["56"]);
				Toggle["59"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Toggle["59"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["59"]["TextSize"] = 14;
				Toggle["59"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["59"]["Size"] = UDim2.new(1, -26, 1, 0);
				Toggle["59"]["Text"] = options.title;
				Toggle["59"]["Name"] = [[Title]];
				Toggle["59"]["Font"] = Enum.Font.Ubuntu;
				Toggle["59"]["BackgroundTransparency"] = 1;

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.ToggleInactive.UIPadding
				Toggle["5a"] = Instance.new("UIPadding", Toggle["56"]);
				Toggle["5a"]["PaddingTop"] = UDim.new(0, 6);
				Toggle["5a"]["PaddingRight"] = UDim.new(0, 6);
				Toggle["5a"]["PaddingBottom"] = UDim.new(0, 6);
				Toggle["5a"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder
				Toggle["5b"] = Instance.new("Frame", Toggle["56"]);
				Toggle["5b"]["BackgroundColor3"] = Color3.fromRGB(64, 64, 64);
				Toggle["5b"]["AnchorPoint"] = Vector2.new(1, 0.5);
				Toggle["5b"]["Size"] = UDim2.new(0, 16, 0, 16);
				Toggle["5b"]["Position"] = UDim2.new(1, -3, 0.5, 0);
				Toggle["5b"]["Name"] = [[CheckmarkHolder]];

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder.UICorner
				Toggle["5c"] = Instance.new("UICorner", Toggle["5b"]);
				Toggle["5c"]["CornerRadius"] = UDim.new(0, 2);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder.UIStroke
				Toggle["5d"] = Instance.new("UIStroke", Toggle["5b"]);
				Toggle["5d"]["Color"] = Color3.fromRGB(82, 82, 82);
				Toggle["5d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder.Checkmark
				Toggle["5e"] = Instance.new("ImageLabel", Toggle["5b"]);
				Toggle["5e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["5e"]["ImageTransparency"] = 1;
				Toggle["5e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Toggle["5e"]["Image"] = [[rbxassetid://10889741525]];
				Toggle["5e"]["Size"] = UDim2.new(1, -2, 1, -2);
				Toggle["5e"]["Name"] = [[Checkmark]];
				Toggle["5e"]["BackgroundTransparency"] = 1;
				Toggle["5e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
			end
			
			-- Methods
			do
				function Toggle:Toggle(b)
					if b == nil then
						Toggle.State = not Toggle.State
					else
						Toggle.State = b
					end
					
					if Toggle.State then
						Library:tween(Toggle["5b"], {BackgroundColor3 = Color3.fromRGB(115, 191, 92)})
						Library:tween(Toggle["5e"], {ImageTransparency = 0})
					else
						Library:tween(Toggle["5b"], {BackgroundColor3 = Color3.fromRGB(64, 64, 64)})
						Library:tween(Toggle["5e"], {ImageTransparency = 1})
					end

					
					options.callback(Toggle.State)
				end
			end
			
			-- Logic
			do
				Toggle["56"].MouseEnter:Connect(function()
					Toggle.Hover = true

					Library:tween(Toggle["58"], {Color = Color3.fromRGB(102, 102, 102)})
				end)

				Toggle["56"].MouseLeave:Connect(function()
					Toggle.Hover = false

					if not Toggle.MouseDown then
						Library:tween(Toggle["58"], {Color = Color3.fromRGB(82, 82, 82)})
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch and Toggle.Hover then
						Toggle.MouseDown = true
						Library:tween(Toggle["56"], {BackgroundColor3 = Color3.fromRGB(57, 57, 57)})
						Library:tween(Toggle["58"], {Color = Color3.fromRGB(200, 200, 200)})
						Toggle:Toggle()
					end
				end)

				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						Toggle.MouseDown = false

						if Toggle.Hover then
							Library:tween(Toggle["56"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
							Library:tween(Toggle["58"], {Color = Color3.fromRGB(102, 102, 102)})
						else
							Library:tween(Toggle["56"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
							Library:tween(Toggle["58"], {Color = Color3.fromRGB(82, 82, 82)})
						end
					end
				end)				
			end
			
			return Toggle
		end
		
		function Tab:Slider(options)
			options = Library:validate({
				title = "Preview Slider",
				min = 0,
				max = 100,
				default = 50,
				callback = function(v) print(v) end
			}, options or {})

			local Slider = {
				MouseDown = false,
				Hover = false,
				Connection = nil,
				Options = options
			}
			
			-- Render
			do
				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider
				Slider["3a"] = Instance.new("Frame", Tab["1c"]);
				Slider["3a"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
				Slider["3a"]["Size"] = UDim2.new(1, 0, 0, 38);
				Slider["3a"]["Name"] = [[Slider]];

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider.UICorner
				Slider["3b"] = Instance.new("UICorner", Slider["3a"]);
				Slider["3b"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider.UIStroke
				Slider["3c"] = Instance.new("UIStroke", Slider["3a"]);
				Slider["3c"]["Color"] = Color3.fromRGB(82, 82, 82);
				Slider["3c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider.Title
				Slider["3d"] = Instance.new("TextLabel", Slider["3a"]);
				Slider["3d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["3d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["3d"]["TextSize"] = 14;
				Slider["3d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["3d"]["Size"] = UDim2.new(1, -24, 1, -10);
				Slider["3d"]["Text"] = options.title;
				Slider["3d"]["Name"] = [[Title]];
				Slider["3d"]["Font"] = Enum.Font.Ubuntu;
				Slider["3d"]["BackgroundTransparency"] = 1;

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider.UIPadding
				Slider["3e"] = Instance.new("UIPadding", Slider["3a"]);
				Slider["3e"]["PaddingTop"] = UDim.new(0, 6);
				Slider["3e"]["PaddingRight"] = UDim.new(0, 6);
				Slider["3e"]["PaddingBottom"] = UDim.new(0, 6);
				Slider["3e"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider.Value
				Slider["3f"] = Instance.new("TextLabel", Slider["3a"]);
				Slider["3f"]["TextXAlignment"] = Enum.TextXAlignment.Right;
				Slider["3f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["3f"]["TextSize"] = 14;
				Slider["3f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["3f"]["AnchorPoint"] = Vector2.new(1, 0);
				Slider["3f"]["Size"] = UDim2.new(0, 24, 1, -10);
				Slider["3f"]["Text"] = tostring(options.default);
				Slider["3f"]["Name"] = [[Value]];
				Slider["3f"]["Font"] = Enum.Font.Ubuntu;
				Slider["3f"]["BackgroundTransparency"] = 1;
				Slider["3f"]["Position"] = UDim2.new(1, 0, 0, 0);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider.SliderBack
				Slider["40"] = Instance.new("Frame", Slider["3a"]);
				Slider["40"]["BackgroundColor3"] = Color3.fromRGB(13, 13, 13);
				Slider["40"]["AnchorPoint"] = Vector2.new(0, 1);
				Slider["40"]["Size"] = UDim2.new(1, 0, 0, 4);
				Slider["40"]["Position"] = UDim2.new(0, 0, 1, 0);
				Slider["40"]["Name"] = [[SliderBack]];

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider.SliderBack.UICorner
				Slider["41"] = Instance.new("UICorner", Slider["40"]);
				Slider["41"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider.SliderBack.UIStroke
				Slider["42"] = Instance.new("UIStroke", Slider["40"]);
				Slider["42"]["Color"] = Color3.fromRGB(64, 64, 64);
				Slider["42"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider.SliderBack.Draggable
				Slider["43"] = Instance.new("Frame", Slider["40"]);
				Slider["43"]["BackgroundColor3"] = Color3.fromRGB(57, 57, 57);
				Slider["43"]["Size"] = UDim2.new(0.5, 0, 1, 0);
				Slider["43"]["Name"] = [[Draggable]];

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider.SliderBack.Draggable.UICorner
				Slider["44"] = Instance.new("UICorner", Slider["43"]);
				Slider["44"]["CornerRadius"] = UDim.new(0, 4);
			end
			
			-- Methods
			function Slider:SetValue(v)
				if v == nil then
					local percentage = math.clamp((mouse.X - Slider["40"].AbsolutePosition.X) / (Slider["40"].AbsoluteSize.X), 0, 1)
					local value = math.floor(((options.max - options.min) * percentage) + options.min)
					
					Slider["3f"].Text = tostring(value)
					Slider["43"].Size = UDim2.fromScale(percentage, 1)
				else
					Slider["3f"].Text = tostring(v)
					Slider["43"].Size = UDim2.fromScale(((v - options.min) / (options.max - options.min)), 1)
				end
				options.callback(Slider:GetValue())
			end
			
			function Slider:GetValue()
				return tonumber(Slider["3f"].Text)				
			end
			
			-- Logic
			do
				Slider["3a"].MouseEnter:Connect(function()
					Slider.Hover = true

					Library:tween(Slider["3c"], {Color = Color3.fromRGB(102, 102, 102)})
					Library:tween(Slider["42"], {Color = Color3.fromRGB(102, 102, 102)})
					Library:tween(Slider["43"], {BackgroundColor3 = Color3.fromRGB(102, 102, 102)})
				end)

				Slider["3a"].MouseLeave:Connect(function()
					Slider.Hover = false

					if not Slider.MouseDown then
						Library:tween(Slider["3c"], {Color = Color3.fromRGB(82, 82, 82)})
						Library:tween(Slider["42"], {Color = Color3.fromRGB(82, 82, 82)})
						Library:tween(Slider["43"], {BackgroundColor3 = Color3.fromRGB(82, 82, 82)})
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch and Slider.Hover then
						Slider.MouseDown = true
						Library:tween(Slider["3a"], {BackgroundColor3 = Color3.fromRGB(57, 57, 57)})
						Library:tween(Slider["3c"], {Color = Color3.fromRGB(200, 200, 200)})
						Library:tween(Slider["42"], {Color = Color3.fromRGB(200, 200, 200)})
						Library:tween(Slider["43"], {BackgroundColor3 = Color3.fromRGB(200, 200, 200)})
						
						if not Slider.Connection then
							Slider.Connection = runService.RenderStepped:Connect(function()
								Slider:SetValue()
							end)
						end
					end
				end)

				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						Slider.MouseDown = false

						if Slider.Hover then
							Library:tween(Slider["3a"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
							Library:tween(Slider["3c"], {Color = Color3.fromRGB(102, 102, 102)})
							Library:tween(Slider["42"], {Color = Color3.fromRGB(102, 102, 102)})
							Library:tween(Slider["43"], {BackgroundColor3 = Color3.fromRGB(102, 102, 102)})
						else
							Library:tween(Slider["3a"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
							Library:tween(Slider["3c"], {Color = Color3.fromRGB(82, 82, 82)})
							Library:tween(Slider["42"], {Color = Color3.fromRGB(82, 82, 82)})
							Library:tween(Slider["43"], {BackgroundColor3 = Color3.fromRGB(82, 82, 82)})
						end
						
						if Slider.Connection then Slider.Connection:Disconnect() end
						Slider.Connection = nil
					end
				end)
			end
			
			return Slider
		end
		
		function Tab:Dropdown(options)
			options = Library:validate({
				title = "Preview Slider",
				callback = function(v) print(v) end,
				items = {}
			}, options or {})
			
			local Dropdown = {
				Items = {
					["id"] = { 
						"value"
					}
				},
				Open = false,
				MouseDown = false,
				Hover = false,
				HoveringItem = false
			}
			
			-- Render
			do
				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown
				Dropdown["45"] = Instance.new("Frame", Tab["1c"]);
				Dropdown["45"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
				Dropdown["45"]["Size"] = UDim2.new(1, 0, 0, 30);
				Dropdown["45"]["ClipsDescendants"] = true;
				Dropdown["45"]["Name"] = [[Dropdown]];

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown.UICorner
				Dropdown["46"] = Instance.new("UICorner", Dropdown["45"]);
				Dropdown["46"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown.UIStroke
				Dropdown["47"] = Instance.new("UIStroke", Dropdown["45"]);
				Dropdown["47"]["Color"] = Color3.fromRGB(82, 82, 82);
				Dropdown["47"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown.Title
				Dropdown["48"] = Instance.new("TextLabel", Dropdown["45"]);
				Dropdown["48"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Dropdown["48"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["48"]["TextSize"] = 14;
				Dropdown["48"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["48"]["Size"] = UDim2.new(1, -20, 0, 20);
				Dropdown["48"]["Text"] = options.title;
				Dropdown["48"]["Name"] = [[Title]];
				Dropdown["48"]["Font"] = Enum.Font.Ubuntu;
				Dropdown["48"]["BackgroundTransparency"] = 1;

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown.UIPadding
				Dropdown["49"] = Instance.new("UIPadding", Dropdown["45"]);
				Dropdown["49"]["PaddingTop"] = UDim.new(0, 6);
				Dropdown["49"]["PaddingRight"] = UDim.new(0, 6);
				Dropdown["49"]["PaddingBottom"] = UDim.new(0, 6);
				Dropdown["49"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown.Icon
				Dropdown["4a"] = Instance.new("ImageLabel", Dropdown["45"]);
				Dropdown["4a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["4a"]["AnchorPoint"] = Vector2.new(1, 0);
				Dropdown["4a"]["Image"] = [[rbxassetid://10889644850]];
				Dropdown["4a"]["Size"] = UDim2.new(0, 20, 0, 20);
				Dropdown["4a"]["Name"] = [[Icon]];
				Dropdown["4a"]["BackgroundTransparency"] = 1;
				Dropdown["4a"]["Position"] = UDim2.new(1, 0, 0, 0);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown.OptionHolder
				Dropdown["4b"] = Instance.new("Frame", Dropdown["45"]);
				Dropdown["4b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["4b"]["BackgroundTransparency"] = 1;
				Dropdown["4b"]["Size"] = UDim2.new(1, 0, 1, -24);
				Dropdown["4b"]["Position"] = UDim2.new(0, 0, 0, 26);
				Dropdown["4b"]["Visible"] = false;
				Dropdown["4b"]["Name"] = [[OptionHolder]];

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown.OptionHolder.UIListLayout
				Dropdown["4c"] = Instance.new("UIListLayout", Dropdown["4b"]);
				Dropdown["4c"]["Padding"] = UDim.new(0, 4);
				Dropdown["4c"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
			end
			
			-- Methods
			do
				function Dropdown:Add(id, value)
					local Item = {
						Hover = false,
						MouseDown = false
					}
					
					if Dropdown.Items[id] ~= nil then
						return
					end
					
					Dropdown.Items[id] = {
						instance = {},
						value = value
					}
					-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown.OptionHolder.Inactive Option
					Dropdown.Items[id].instance["4d"] = Instance.new("TextLabel", Dropdown["4b"]);
					Dropdown.Items[id].instance["4d"]["BackgroundColor3"] = Color3.fromRGB(57, 57, 57);
					Dropdown.Items[id].instance["4d"]["TextSize"] = 12;
					Dropdown.Items[id].instance["4d"]["TextColor3"] = Color3.fromRGB(203, 203, 203);
					Dropdown.Items[id].instance["4d"]["Size"] = UDim2.new(1, 0, 0, 16);
					Dropdown.Items[id].instance["4d"]["Text"] = id;
					Dropdown.Items[id].instance["4d"]["Name"] = [[Inactive Option]];
					Dropdown.Items[id].instance["4d"]["Font"] = Enum.Font.Ubuntu;

					-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown.OptionHolder.Inactive Option.UIStroke
					Dropdown.Items[id].instance["4e"] = Instance.new("UIStroke", Dropdown.Items[id].instance["4d"]);
					Dropdown.Items[id].instance["4e"]["Color"] = Color3.fromRGB(82, 82, 82);
					Dropdown.Items[id].instance["4e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown.OptionHolder.Inactive Option.UICorner
					Dropdown.Items[id].instance["4f"] = Instance.new("UICorner", Dropdown.Items[id].instance["4d"]);
					Dropdown.Items[id].instance["4f"]["CornerRadius"] = UDim.new(0, 2);
					
					Dropdown.Items[id].instance["4d"].MouseEnter:Connect(function()
						Item.Hover = true
						Dropdown.HoveringItem = true

						Library:tween(Dropdown.Items[id].instance["4e"], {Color = Color3.fromRGB(102, 102, 102)})
					end)

					Dropdown.Items[id].instance["4d"].MouseLeave:Connect(function()
						Item.Hover = false
						Dropdown.HoveringItem = false

						if not Item.MouseDown then
							Library:tween(Dropdown.Items[id].instance["4e"], {Color = Color3.fromRGB(82, 82, 82)})
						end
					end)

					uis.InputBegan:Connect(function(input, gpe)
						if gpe then return end
						
						if Dropdown.Items[id] == nil then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch and Item.Hover then
							Item.MouseDown = true
							Library:tween(Dropdown.Items[id].instance["4d"], {BackgroundColor3 = Color3.fromRGB(57, 57, 57)})
							Library:tween(Dropdown.Items[id].instance["4e"], {Color = Color3.fromRGB(200, 200, 200)})
							options.callback(value)
							Dropdown:Toggle()
						end
					end)

					uis.InputEnded:Connect(function(input, gpe)
						if gpe then return end
						
						if Dropdown.Items[id] == nil then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							Item.MouseDown = false

							if Item.Hover then
								Library:tween(Dropdown.Items[id].instance["4d"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
								Library:tween(Dropdown.Items[id].instance["4e"], {Color = Color3.fromRGB(102, 102, 102)})
							else
								Library:tween(Dropdown.Items[id].instance["4d"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
								Library:tween(Dropdown.Items[id].instance["4e"], {Color = Color3.fromRGB(82, 82, 82)})
							end
						end
					end)
				end

				function Dropdown:Remove(id)
					if Dropdown.Items[id] ~= nil then
						if Dropdown.Items[id].instance ~= nil then
							for i, v in pairs(Dropdown.Items[id].instance) do
								v:Destroy()
							end
						end
						Dropdown.Items[id] = nil
					end
				end

				function Dropdown:Clear()
					for i, v in pairs(Dropdown.Items) do
						Dropdown:Remove(i)
					end
				end

				function Dropdown:Toggle()
					Dropdown.Open = not Dropdown.Open
					
					if not Dropdown.Open then
						Library:tween(Dropdown["45"], {Size = UDim2.new(1, 0, 0, 30)}, function()
							Dropdown["4b"].Visible = false
						end)
					else
						local count = 0
						for i, v in pairs(Dropdown.Items) do
							if v ~= nil then
								count += 1
							end
						end
						
						Dropdown["4b"].Visible = true
						Library:tween(Dropdown["45"], {Size = UDim2.new(1, 0, 0, 30 + (count * 16) + 1)})
					end
				end
			end
			
			-- Logic
			do
				Dropdown["45"].MouseEnter:Connect(function()
					Dropdown.Hover = true

					Library:tween(Dropdown["47"], {Color = Color3.fromRGB(102, 102, 102)})
				end)

				Dropdown["45"].MouseLeave:Connect(function()
					Dropdown.Hover = false

					if not Dropdown.MouseDown then
						Library:tween(Dropdown["47"], {Color = Color3.fromRGB(82, 82, 82)})
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch and Dropdown.Hover then
						Dropdown.MouseDown = true
						Library:tween(Dropdown["45"], {BackgroundColor3 = Color3.fromRGB(57, 57, 57)})
						Library:tween(Dropdown["47"], {Color = Color3.fromRGB(200, 200, 200)})
						
						if not Dropdown.HoveringItem then
							Dropdown:Toggle()
						end
					end
				end)

				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						Dropdown.MouseDown = false

						if Dropdown.Hover then
							Library:tween(Dropdown["45"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
							Library:tween(Dropdown["47"], {Color = Color3.fromRGB(102, 102, 102)})
						else
							Library:tween(Dropdown["45"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
							Library:tween(Dropdown["47"], {Color = Color3.fromRGB(82, 82, 82)})
						end
					end
				end)
			end
			
			
			return Dropdown
		end
		
		
		
		return Tab
	end
	
	return GUI
end
return Library

--[[
local main = Library:Init {
	name = "custom name"
}

local tab = main:Tab()


local warning = tab:Warning({message = "I am a warning."})
local btn = tab:Button({ callback = function() warning:SetText("something really long something really long something really long something really long something really long something really long something really long something really long something really long something really long ")
end })
local slider = tab:Slider()

local tog = tab:Toggle({
	callback = function(v)
		print(v)
	end,
	title = "hello"
})

local btn2 = tab:Button({callback = function() tog:Toggle(false) end})
local d = tab:Dropdown({
	title = "hello",
	callback = function(v)
		print(v .. " was clicked")
	end,
})
d:Add("bob", 1)
d:Add("bob2", 2)
d:Add("bob3", 3)
]]
