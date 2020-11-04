# Logitech-G-Hub-Modifier-Macros
Create macros for function+modifier key combos

Just add the lua script to your Logitech G Hub Profile and create macros for the desired key stroke with the following convention,

You can create a macro for any combination of the following keys;

 - F1-F12
 - CTRL
 - SHIFT
 - ALT

The naming convention requires you to put the modifier keys in order starting from ctrl, then shift and finishing with alt. Joining each key with a "**+**" and adding the function key name at the end.

If you wanted to create a macro for `CTRL`+`ALT`+`SHIFT`+`F1` then the name should be `"ctrl+shift+alt+f1"`.

```lua
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
```
