--- Made by GaryTheGoat --- 
--- Please do not amend / upload / copy any content without permission
--- feedback welcome samcaunt@hotmail.co.uk

local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

function GametimegoalFunction()
    local GameTimeLength = 3600
    local remainingTimeSeconds = (GameTimeLength + ScenarioInfo.Options.opt_Survival_BuildTime) - GetGameTimeSeconds()
    local remainingMinutes = math.floor(remainingTimeSeconds / 60)
    local remainingSeconds = remainingTimeSeconds - math.floor(remainingTimeSeconds / 60) * 60
    return remainingMinutes, remainingSeconds
end

   
function UpdateGameTimeObjective()
        while true do
            local remainingMinutes, remainingSeconds = GametimegoalFunction()
            local remainingTimeFormatted = string.format("%02d:%02d", remainingMinutes, remainingSeconds)
            Survival_DefUnit:SetCustomName("Time " .. remainingTimeFormatted .. " Remaining")
            WaitSeconds(1)

            remainingSeconds = math.floor(remainingSeconds) -- Round down to the nearest second
            LOG("Remaining Game Time: " .. remainingMinutes .. " minutes and " .. remainingSeconds .. " seconds")
    
            if remainingMinutes == 0 and remainingSeconds == 0 then
                ScenarioFramework.Dialogue(import('/maps/X1CA_004/X1CA_004_strings.lua').X04_M03_210, nil, true)
                local text = 'center \r\n enter \r\n row3';
                local size = 25;
                local fade = 9;
                local alignment = 'center';
                local color = '00bfff';
                local offset = "          "
                
                for k = 1, 7 do 
                    PrintText("", size + 10, color, fade, alignment);
                end
                
                PrintText(offset .. "The Black Sun has been protected", size + 10, color, fade, alignment);
                PrintText(offset .. " You Have Won Well Done!", size + 10, color, fade, alignment);
    
                for i, army in ListArmies() do
                    if (army == "ARMY_1" or army == "ARMY_2" or army == "ARMY_3" or army == "ARMY_4" or army == "ARMY_5" or army == "ARMY_6") then
                        GetArmyBrain(army):OnVictory()
                    end
                end
    
            EndGame()
            WaitSeconds(1) -- Add this line
        end
    end
end

function OnStart()
    local POS = ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1");
	Survival_DefUnit = CreateUnitHPR('UEC1901', "ARMY_ALLY", POS[1], POS[2], POS[3], 0,0,0);

	Survival_DefUnit:SetReclaimable(false);
	Survival_DefUnit:SetCapturable(false);
	Survival_DefUnit:SetConsumptionPerSecondEnergy(1);
	Survival_DefUnit:SetMaxHealth(205000);
	Survival_DefUnit:SetHealth(nil, 205000);
	Survival_DefUnit:SetRegenRate(200);
	local Survival_DefUnitBP = Survival_DefUnit:GetBlueprint();
	Survival_DefUnitBP.Intel.MaxVisionRadius = 100;
	Survival_DefUnitBP.Intel.MinVisionRadius = 100;
	Survival_DefUnitBP.Intel.VisionRadius = 100;
	Survival_DefUnit:SetIntelRadius('Vision', 100);

       	local ShieldSpecs = {
            ImpactEffects = 'SeraphimShieldHit01',
            ImpactMesh = '/effects/entities/ShieldSection01/ShieldSection01_mesh',
            Mesh = '/effects/entities/SeraphimShield01/SeraphimShield01_mesh',
            MeshZ = '/effects/entities/Shield01/Shield01z_mesh',
            RegenAssistMult = 60,
            ShieldEnergyDrainRechargeTime = 60,
            ShieldMaxHealth = 55000,
            ShieldRechargeTime = 60,
            ShieldRegenRate = 290,
            ShieldRegenStartTime = 1,
            ShieldSize = 90,
            ShieldVerticalOffset = -10,
        };

	Survival_DefUnit.OldOnKilled = Survival_DefUnit.OnKilled;

	Survival_DefUnit.OnKilled = function(self, instigator, type, overkillRatio)

		--BroadcastMSG("The Black Sun has been destroyed by the Aeon Illuminate!", 8);
		local text = 'center \r\n enter \r\n row3';
        local size = 25;
        local fade = 9;

        -- what other options are there?
        local alignment = 'center';

        -- what format should the color be in?
        local color = '00bfff';
        

        -- alignment
        local offset = "          "
        for k = 1, 7 do 
            PrintText("", size + 10, color, fade, alignment);
        end

        -- print title
        PrintText(offset .. "The Black Sun has been destroyed", size + 10, color, fade, alignment);
        PrintText(offset .. " You have failed us commander!", size + 10, color, fade, alignment);
				
		self.OldOnKilled(self, instigator, type, overkillRatio);

		Survival_GameState = 3; --defenders defeat

		for i, army in ListArmies() do

			if (army == "ARMY_1" or army == "ARMY_2" or army == "ARMY_3" or army == "ARMY_4" or army == "ARMY_5" or army == "ARMY_6" or army == "ARMY_7" or army == "ARMY_8") then
				--killAllCommanders(army);
				GetArmyBrain(army):OnDefeat();
			end
		end
        EndGame()
	end
end

