local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/UI-Library/main/Source/Orion.lua"))()

local Window = OrionLib:MakeWindow({Name = "Title of the library", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]

local Tab = Window:MakeTab({
Name = "Tab 1",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

local Section = Tab:AddSection({
Name = "Section"
})

--[[
Name = <string> - The name of the section.
]]

OrionLib:MakeNotification({
Name = "Title!",
Content = "Notification content... what will it say??",
Image = "rbxassetid://4483345998",
Time = 5
})

--[[
Title = <string> - The title of the notification.
Content = <string> - The content of the notification.
Image = <string> - The icon of the notification.
Time = <number> - The duration of the notfication.
]]

Tab:AddButton({
Name = "Button!",
Callback = function()
          print("button pressed")
  end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddToggle({
Name = "This is a toggle!",
Default = false,
Callback = function(Value)
    print(Value)
end    
})

--[[
Name = <string> - The name of the toggle.
Default = <bool> - The default value of the toggle.
Callback = <function> - The function of the toggle.
]]


Tab:AddColorpicker({
Name = "Colorpicker",
Default = Color3.fromRGB(255, 0, 0),
Callback = function(Value)
    print(Value)
end	  
})

--[[
Name = <string> - The name of the colorpicker.
Default = <color3> - The default value of the colorpicker.
Callback = <function> - The function of the colorpicker.
]]


Tab:AddSlider({
Name = "Slider",
Min = 0,
Max = 20,
Default = 5,
Color = Color3.fromRGB(255,255,255),
Increment = 1,
ValueName = "bananas",
Callback = function(Value)
    print(Value)
end    
})

--[[
Name = <string> - The name of the slider.
Min = <number> - The minimal value of the slider.
Max = <number> - The maxium value of the slider.
Increment = <number> - How much the slider will change value when dragging.
Default = <number> - The default value of the slider.
ValueName = <string> - The text after the value number.
Callback = <function> - The function of the slider.
]]

Tab:AddLabel("Label")

Tab:AddParagraph("Paragraph","Paragraph Content")

Tab:AddTextbox({
Name = "Textbox",
Default = "default box input",
TextDisappear = true,
Callback = function(Value)
    print(Value)
end	  
})

--[[
Name = <string> - The name of the textbox.
Default = <string> - The default value of the textbox.
TextDisappear = <bool> - Makes the text disappear in the textbox after losing focus.
Callback = <function> - The function of the textbox.
]]


Tab:AddBind({
Name = "Bind",
Default = Enum.KeyCode.E,
Hold = false,
Callback = function()
    print("press")
end    
})

--[[
Name = <string> - The name of the bind.
Default = <keycode> - The default value of the bind.
Hold = <bool> - Makes the bind work like: Holding the key > The bind returns true, Not holding the key > Bind returns false.
Callback = <function> - The function of the bind.
]]


Tab:AddDropdown({
Name = "Dropdown",
Default = "1",
Options = {"1", "2"},
Callback = function(Value)
    print(Value)
end    
})

--[[
Name = <string> - The name of the dropdown.
Default = <string> - The default value of the dropdown.
Options = <table> - The options in the dropdown.
Callback = <function> - The function of the dropdown.
]]

OrionLib:Init()
