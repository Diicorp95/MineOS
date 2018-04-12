
local unicode = require("unicode")
local image = require("image")
local GUI = require("GUI")
local tool = {}

------------------------------------------------------

tool.shortcut = "Tx"
tool.keyCode = 20
tool.about = "Text tool allows you to type some text data with selected primary color right on your image! It's time to say \"ur mom gay\" to everyone <3"

tool.eventHandler = function(mainContainer, object, eventData)
	if eventData[1] == "touch" then
		local input = mainContainer:addChild(GUI.input(
			eventData[3] - 1,
			eventData[4],
			mainContainer.image.x + mainContainer.image.width - eventData[3] + 2,
			1,
			nil,
			mainContainer.primaryColorSelector.color,
			mainContainer.primaryColorSelector.color,
			nil,
			mainContainer.primaryColorSelector.color,
			""
		))
		
		input.onInputFinished = function()
			if #input.text > 0 then
				local x, y = eventData[3] - mainContainer.image.x + 1, eventData[4] - mainContainer.image.y + 1
				for i = 1, unicode.len(input.text) do
					if x <= mainContainer.image.width then
						local background, foreground, alpha = image.get(mainContainer.image.data, x, y)
						image.set(mainContainer.image.data, x, y, background, mainContainer.primaryColorSelector.color, alpha, unicode.sub(input.text, i, i))
						x = x + 1
					else
						break
					end
				end
			end

			input:delete()
			mainContainer:drawOnScreen()
		end

		input:startInput()
	end
end


------------------------------------------------------

return tool