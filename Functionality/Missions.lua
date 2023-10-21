--- Made by GaryTheGoat --- 
--- Please do not amend / upload / copy any content without permission
--- feedback welcome samcaunt@hotmail.co.uk

local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

local DefenceObject = import(ScenarioInfo.MapPath .. 'Src/DefenceObject.lua')
local Areas = import(ScenarioInfo.MapPath .. 'Src/Areas.lua')

local salvospawned1= false
local salvospawned2 = false
local mavor1 = false
local mavor2 = false
local yolo1 = false
local yolo2 = false
local arty1 = false
local arty2 = false
local arty3 = false
local arty4 = false

function OnTick()

    local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
        
    while true do
        -- Calculate time passed inside the loop
        gameTime = GetGameTimeSeconds() - ScenarioInfo.Options.opt_Survival_BuildTime
        --LOG("Seconds Passed " .. tostring(gameTime))

        if gameTime > 2400 then
            -------------- GC 2 START PATROL -------------
            local markerName = "salvo1"  -- Replace with the name of the marker where you want to spawn the unit
            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not salvospawned1 then
                local unitType = "xab2307"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local salvo = CreateUnitHPR(unitType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)
                salvo:SetMaxHealth(110000)
                salvo:SetHealth(nil,110000)

                if salvo then
                    salvospawned1 = true  -- Set the flag to indicate that the GC has been spawned 
                end
            end
        end

        if gameTime > 2400 then
            -------------- GC 2 START PATROL -------------
            local markerName = "salvo2"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not salvospawned2 then
                local unitType = "xab2307"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local salvo = CreateUnitHPR(unitType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)
                salvo:SetMaxHealth(110000)
                salvo:SetHealth(nil,110000)

                if salvo then
                    salvospawned2 = true  -- Set the flag to indicate that the GC has been spawned 
                end
            end
        end

        if gameTime > 2100 then
            local markerName = "mavor1"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not mavor1 then
                local unitType = "ueb2401"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local mavor = CreateUnitHPR(unitType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)
                mavor:SetMaxHealth(110000)
                mavor:SetHealth(nil,110000)
                if mavor then
                    mavor1 = true  -- Set the flag to indicate that the GC has been spawned 
                end
            end
        end

        if gameTime > 2100 then
            local markerName = "mavor2"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not mavor2 then
                local unitType = "ueb2401"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local mavor = CreateUnitHPR(unitType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)
                mavor:SetMaxHealth(110000)
                mavor:SetHealth(nil,110000)
                if mavor then
                    mavor2 = true  -- Set the flag to indicate that the GC has been spawned 
                end
            end
        end

        if gameTime > 2700 then
            --LOG("Executing nuke launch code...")
            local markerName = "yolo1"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not yolo1 then
                local unitType = "xsb2401"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local yolo = CreateUnitHPR(unitType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)
                yolo:SetMaxHealth(110000)
                yolo:SetHealth(nil,110000)

                local area = Areas.PickRandomArea(Areas.playerLandArea)
                local attack = Areas.PickRandomPointInArea(area)            
                local army = "ARMY_ENEMY"
    
                if yolo then
                    yolo1 = true  -- Set the flag to indicate that the GC has been spawned
                    
                    ForkThread(function()
                        for i = 1, 30 do
                            local area = Areas.PickRandomArea(Areas.playerLandArea)
                            local attack = Areas.PickRandomPointInArea(area)          
                            yolo:GiveNukeSiloAmmo(1)
                            IssueNuke({yolo}, attack)
                            --LOG("Nuke command issued.")
                            WaitSeconds(5) -- Add a delay between nuke launches (optional)
                        end
                    end)
                end
            end
        end

        if gameTime > 2700 then
            local markerName = "yolo2"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not yolo2 then
                local unitType = "xsb2401"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local yolo = CreateUnitHPR(unitType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)
                yolo:SetMaxHealth(110000)
                yolo:SetHealth(nil,110000)
         
                local army = "ARMY_ENEMY"
    
                if yolo then
                    yolo2 = true  -- Set the flag to indicate that the GC has been spawned 
                    
                    ForkThread(function()
                        for i = 1, 30 do
                            local area = Areas.PickRandomArea(Areas.playerLandArea)
                            local attack = Areas.PickRandomPointInArea(area)          
                            yolo:GiveNukeSiloAmmo(1)
                            IssueNuke({yolo}, attack)
                            --LOG("Nuke command issued.")
                            WaitSeconds(5) -- Add a delay between nuke launches (optional)
                        end
                    end)
                end
            end
        end

        if gameTime > 3000 then
            local markerName = "arty1"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not arty1 then
                local unitType = "uab2302"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local arty = CreateUnitHPR(unitType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)
                arty:SetMaxHealth(110000)
                arty:SetHealth(nil,110000)

                if arty then
                    arty1 = true  -- Set the flag to indicate that the GC has been spawned 
                end
            end
        end

        if gameTime > 3000 then
            local markerName = "arty2"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not arty2 then
                local unitType = "uab2302"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local arty = CreateUnitHPR(unitType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)
                arty:SetMaxHealth(110000)
                arty:SetHealth(nil,110000)

                if arty then
                    arty2 = true  -- Set the flag to indicate that the GC has been spawned 
                end
            end
        end

        if gameTime > 3000 then
            local markerName = "arty3"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not arty3 then
                local unitType = "uab2302"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local arty = CreateUnitHPR(unitType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)
                arty:SetMaxHealth(110000)
                arty:SetHealth(nil,110000)

                if arty then
                    arty3 = true  -- Set the flag to indicate that the GC has been spawned 
                end
            end
        end

        if gameTime > 3000 then
            local markerName = "arty4"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not arty4 then
                local unitType = "uab2302"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local arty = CreateUnitHPR(unitType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)
                arty:SetMaxHealth(110000)
                arty:SetHealth(nil,110000)

                if arty then
                    arty4 = true  -- Set the flag to indicate that the GC has been spawned 
                end
            end
        end

        WaitSeconds(1)
    end
end




