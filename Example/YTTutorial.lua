local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/UI-Library/main/Source/YTTutorial.lua"))()
local Window = Library:Init {
	name = "custom name"
}

local tab = Window:Tab()


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
