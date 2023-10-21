--- Made by GaryTheGoat --- 
--- Please do not amend / upload / copy any content without permission
--- feedback welcome samcaunt@hotmail.co.uk

local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')


    function OnStart()
        if (ScenarioInfo.Options.opt_Survival_BuildTime == nil) then
            ScenarioInfo.Options.opt_Survival_BuildTime = 0
        end
        
        if (ScenarioInfo.Options.opt_SurvivalAllFactions == nil) then
            ScenarioInfo.Options.opt_SurvivalAllFactions = 0
        end

        if (ScenarioInfo.Options.opt_Wrecks == nil) then
            ScenarioInfo.Options.opt_Wrecks = 0
        end

        if (ScenarioInfo.Options.opt_GameBreaker == nil) then
            ScenarioInfo.Options.opt_GameBreaker = 0
        end

        if (ScenarioInfo.Options.opt_Survival_HealthMultiplier == nil) then
            ScenarioInfo.Options.opt_Survival_HealthMultiplier = 1
        end

        if (ScenarioInfo.Options.opt_Survival_DamageMultiplier == nil) then
            ScenarioInfo.Options.opt_Survival_DamageMultiplier = 1
        end
        
        if (ScenarioInfo.Options.opt_SurvivalAllFactions == nil) then
            ScenarioInfo.Options.opt_SurvivalAllFactions = 0
        end

        if (ScenarioInfo.Options.opt_GameBreaker == nil) then
            ScenarioInfo.Options.opt_GameBreaker = 0
        else
        ScenarioInfo.Options.opt_GameBreaker = tonumber(ScenarioInfo.Options.opt_GameBreaker)
        end
        
        if (ScenarioInfo.Options.opt_EnemyFaction == nil) then
            ScenarioInfo.Options.opt_EnemyFaction = 5
        end

    end


    
 
   

   
