-- This file is loaded from "Racial-Ability-Macro-Changer.toc"
do

	-- Setting up string for console output
	local RAMCADDON_CHAT_TITLE = "|CFF9482C9Racial Ability Macro Changer:|r "

	local RacialAbilityChangerMacroIcon = CreateFrame("Frame");
	RacialAbilityChangerMacroIcon:RegisterEvent("PLAYER_LOGIN");
	RacialAbilityChangerMacroIcon:SetScript("OnEvent",function(self,event,...)
	
		if event == "PLAYER_LOGIN" then
--				print(string.format("%sUpdating macro",RAMCADDON_CHAT_TITLE));
			local macroStr;
			
			local numMacros = GetNumMacros();
			local foundMacro = false;
	
			for i=1, numMacros do
				local name = GetMacroInfo(i)
				if name == "RAMCbutton" then
					foundMacro = true;
				end		
			end
			macroStr = "#showtooltip\n/cast ";
			
			-- Get player race
			local _, _, raceID = UnitRace("player");

			if raceID == 1 then -- Check if race is human
				macroStr = macroStr.."Will to Survive";
			elseif raceID == 2 then -- Check if race is orc
				macroStr = macroStr.."Blood Fury";
			elseif raceID == 3 then -- Check if race is dwarf
				macroStr = macroStr.."Stoneform";
			elseif raceID == 4 then -- Check if race is night elf
				macroStr = macroStr.."Shadowmeld";
			elseif raceID == 5 then -- Check if race is undead
				macroStr = macroStr.."[mod:alt] Cannibalize; Will of the Forsaken";
			elseif raceID == 6 then -- Check if race is tauren
				macroStr = macroStr.."War Stomp";
			elseif raceID == 7 then -- Check if race is gnome
				macroStr = macroStr.."Escape Artist";
			elseif raceID == 8 then -- Check if race is troll
				macroStr = macroStr.."Berserking";
			elseif raceID == 9 then -- Check if race is goblin
				macroStr = macroStr.."[mod:ctrl] Rocket Jump; [mod:alt] Pack Hobgoblin; Rocket Barrage";
			elseif raceID == 10 then -- Check if race is blood elf
				macroStr = macroStr.."Arcane Torrent";
			elseif raceID == 11 then -- Check if race is draenei
				macroStr = macroStr.."Gift of the Naaru";
			elseif raceID == 22 then -- Check if race is worgen
				macroStr = macroStr.."[mod:alt] Two Forms; Darkflight";
			elseif (raceID == 24 or raceID == 25 or raceID == 26) then -- Check if race is pandaren (neutral, alliance, horde)
				macroStr = macroStr.."Quaking Palm";
			elseif raceID == 27 then -- Check if race is nightborne
				macroStr = macroStr.."[mod:alt]Cantrips; Arcane Pulse";
			elseif raceID == 28 then -- Check if race is highmountain tauren
				macroStr = macroStr.."Bull Rush";
			elseif raceID == 29 then -- Check if race is void elf
				macroStr = macroStr.."Spatial Rift";
			elseif raceID == 30 then -- Check if race is lightforged draenei
				macroStr = macroStr.."[mod:alt] Forge of Light; Light's Judgment";
			elseif raceID == 31 then -- Check if race is zandalari troll
				macroStr = macroStr.."[mod:ctrl] Pterrordax Swoop; [mod:alt] Embrace of the Loa; Regeneratin'";
			elseif raceID == 32 then -- Check if race is kul tiran
				macroStr = macroStr.."Haymaker";
			elseif raceID == 34 then -- Check if race is dark iron dwarf
				macroStr = macroStr.."[mod:alt] Mole Machine; Fireblood";
			elseif raceID == 35 then -- Check if race is vulpera
				macroStr = macroStr.."[mod:altctrl] Make Camp; [mod:ctrl] Return to Camp; [mod:alt] Rummage Your Bag; Bag of Tricks";
			elseif raceID == 36 then -- Check if race is maghar orc
				macroStr = macroStr.."Ancestral Call";
			elseif raceID == 37 then -- Check if race is mechagnome
				macroStr = macroStr.."[mod:alt] Skeleton Pinkie; Hyper Organic Light Originator";
			elseif (raceID == 52 or raceID == 70) then -- Check if race is dracthyr (alliance, horde)
				macroStr = macroStr.."[mod:altctrl] Visage; [mod:ctrl] Soar; [mod:alt] Tail Swipe; Wing Buffet";
			end

			if foundMacro == true then
				EditMacro("RAMCbutton", "RAMCbutton", nil, macroStr, 1, nil);
			else
				print(string.format("%sExisitng macro for racial ability not found. Creating new one...",RAMCADDON_CHAT_TITLE));
				if numMacros < MAX_ACCOUNT_MACROS then
					CreateMacro("RAMCbutton", "INV_MISC_QUESTIONMARK", macroStr, nil);
				else
					print(string.format("%sCould not create macro for racial ability. Macro limit reached.",RAMCADDON_CHAT_TITLE));
				end
			end
		end
	end)
end

			
