local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/UI-Library/main/Source/MyUILib(Unamed).lua"))()
local Window = Library:Window("Example")

local Tab1 = Window:Tab("Tab 1","rbxassetid://10888331510")
local Tab2 = Window:Tab("Tab 2","rbxassetid://10888331510")

Tab1:Button("Button 1", function()
	print("Pressed Button 1!")
end)

Tab1:Toggle("Toggle 1", function(state)
	print(state)
end)

Tab1:Slider("Slider 1", 1,100, function(value)
	print(value)
end)

Tab2:Button("Button 2", function()
	print("Pressed Button 2!")
end)

Tab2:Toggle("Toggle 2", function(state)
	print(state)
end)

Tab2:Slider("Slider 2", 16,500, function(value)
	game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

Tab2:Button("Destroy UI", function()
	Library:DestroyUI()
end)
