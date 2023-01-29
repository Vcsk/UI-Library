local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/UI-Library/main/Source/MyUILib(Unamed).lua"))()
local Window = Library:Create("Example") -- any name

local Tab1 = Window:Tab("Tab 1","rbxassetid://10888331510")
local Tab2 = Window:Tab("Players","rbxassetid://12296135476")

Tab1:Button("Button 1", function() -- button
	print("Pressed Button 1!")
end)

Tab1:Toggle("Toggle 1", function(state) -- toggle
	print(state)
end)

Tab1:Slider("Slider 1", 1,100, function(value) -- slider | min,max
	print(value)
end)

Tab1:Button("Destroy UI", function()
	Library:DestroyUI()
end)

Tab2:Slider("WalkSpeed", 16,500, function(value)
	game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

Tab2:Slider("JumpPower", 50,1000, function(value)
	game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = value
end)
