--- Made by GaryTheGoat --- 
--- Please do not amend / upload / copy any content without permission
--- feedback welcome samcaunt@hotmail.co.uk

local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

local DefenceObject = import(ScenarioInfo.MapPath .. 'Src/DefenceObject.lua')

function OnTick()
  while true do
    -- get current game time in seconds  
    gameTime = GetGameTimeSeconds() - ScenarioInfo.Options.opt_Survival_BuildTime
    
    -- make the AI unaware of this box # replace ENEMY_1 with army name
    ScenarioFramework.SetIgnorePlayableRect("ARMY_ENEMY", true)
    --LOG("Game Time: " .. tostring(gameTime))
    -- make all the players aware of this area and playable at the set time
    if gameTime < 2160 then
      ScenarioFramework.SetPlayableArea('AREA_1', false)
    elseif gameTime > 2160 then
      ScenarioFramework.SetPlayableArea('AREA_2', false)
    end
    WaitSeconds(1)
  end
end
