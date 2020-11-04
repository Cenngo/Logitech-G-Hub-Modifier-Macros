function OnEvent(event, arg)
	if event == "G_PRESSED" then
		modifiers = {"ctrl", "shift", "alt"};
		pressed = "";
		
		for i = 1, 3 do
			if IsModifierPressed(modifiers[i]) then
				if pressed == "" then
					pressed = pressed .. modifiers[i];
				else
					pressed = pressed .. "+" .. modifiers[i];
				end
			end
		end
		if pressed ~= "" then
			macroKey = pressed .. "+f" .. arg;
			OutputLogMessage("Macro Key Pressed " .. macroKey .. "\n");
			PlayMacro(macroKey);
		end
	end
end