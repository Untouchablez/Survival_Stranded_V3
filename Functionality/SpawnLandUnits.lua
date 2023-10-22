--- Made by GaryTheGoat --- 
--- Please do not amend / upload / copy any content without permission
--- feedback welcome samcaunt@hotmail.co.uk

local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

local Areas = import(ScenarioInfo.MapPath .. 'Src/Areas.lua')
local LandTables = import(ScenarioInfo.MapPath .. 'Tables/LandTables.lua')
local DefenceObject = import(ScenarioInfo.MapPath .. 'Src/DefenceObject.lua')

local army = "ARMY_ENEMY"
local Counter = 0

local selectedFaction = ScenarioInfo.Options.opt_EnemyFaction
local initialFaction = nil

function selectRandomUnitFromTech(techLevel)
    local randomTable
    local randomFaction = selectedFaction

    if randomFaction == 5 then
        if not initialFaction then
            local factionTables = {
                LandTables["tech" .. techLevel .. "AeonUnits"],
                LandTables["tech" .. techLevel .. "CybranUnits"],
                LandTables["tech" .. techLevel .. "SeraUnits"],
                LandTables["tech" .. techLevel .. "UEFUnits"],
                -- Add more factions as needed here..
            }
            initialFaction = math.random(table.getn(factionTables))
            randomTable = factionTables[initialFaction]
        else
            randomFaction = initialFaction
            local factionKey = {
                [1] = "Aeon",
                [2] = "Cybran",
                [3] = "Sera",
                [4] = "UEF"
            }
            randomTable = LandTables["tech" .. techLevel .. factionKey[randomFaction] .. "Units"]
        end
    else
        if randomFaction == 0 then
            local factionTables = {
                LandTables["tech" .. techLevel .. "AeonUnits"],
                LandTables["tech" .. techLevel .. "CybranUnits"],
                LandTables["tech" .. techLevel .. "SeraUnits"],
                LandTables["tech" .. techLevel .. "UEFUnits"],
                -- Add more factions as needed here..
            }
            randomFaction = math.random(table.getn(factionTables))
            randomTable = factionTables[randomFaction]
            initialFaction = randomFaction
        else
            local factionKey = {
                [1] = "Aeon",
                [2] = "Cybran",
                [3] = "Sera",
                [4] = "UEF"
            }
            randomTable = LandTables["tech" .. techLevel .. factionKey[randomFaction] .. "Units"]
        end
    end

    if randomTable then
        local randomIndex = math.random(table.getn(randomTable))
        local randomIndexGroup = math.random(table.getn(randomTable[randomIndex]))

        return randomTable[randomIndex][randomIndexGroup]
    end

    return nil -- Return nil or handle the case where no faction is selected
end

function GetSpawnedUnitBasedOnGameTime()

        local remainingMinutes, remainingSeconds = DefenceObject.GametimegoalFunction()
        local selectedUnit

    ----- Tech level Timer Settings
    if remainingMinutes <= 99 and remainingMinutes > 50 then
        selectedUnit = selectRandomUnitFromTech(1) -- SPAWN Just this tech

    elseif remainingMinutes <= 50 and remainingMinutes > 46 then
        if Counter == 0 or Counter == 1 or Counter == 2 then -- SPAWN Every 3 is True for the top statement and 1 from bottom
            selectedUnit = selectRandomUnitFromTech(1)
        else
            selectedUnit = selectRandomUnitFromTech(2)
        end
        Counter = Counter + 1
        if Counter == 4 then
            Counter = 0 -- Reset tech1Counter after every third increment
        end

    elseif remainingMinutes <= 46 and remainingMinutes > 42 then
        if Counter == 0 or Counter == 1 then -- SPAWN True for each statement 2 times 
            selectedUnit = selectRandomUnitFromTech(1)
        else
            selectedUnit = selectRandomUnitFromTech(2)
        end
        Counter = Counter + 1
        if Counter == 4 then
            Counter = 0 -- Reset tech1Counter after every third increment
        end

    elseif remainingMinutes <= 42 and remainingMinutes > 40 then
        if Counter == 0 or Counter == 1 or Counter == 2 then -- SPAWN Every 3 is True for the top statement and 1 from bottom
            selectedUnit = selectRandomUnitFromTech(2)
        else
            selectedUnit = selectRandomUnitFromTech(1)
        end
        Counter = Counter + 1
        if Counter == 4 then
            Counter = 0 -- Reset tech1Counter after every third increment
        end

    elseif remainingMinutes <= 40 and remainingMinutes > 30 then
        selectedUnit = selectRandomUnitFromTech(2) -- SPAWN Just this tech

    elseif remainingMinutes <= 30 and remainingMinutes > 26 then
        if Counter == 0 or Counter == 1 or Counter == 2 then -- SPAWN Every 3 is True for the top statement and 1 from bottom
            selectedUnit = selectRandomUnitFromTech(2)
        else
            selectedUnit = selectRandomUnitFromTech(3)
        end
        Counter = Counter + 1
        if Counter == 4 then
            Counter = 0 -- Reset tech1Counter after every third increment
        end

    elseif remainingMinutes <= 26 and remainingMinutes > 22 then
        if Counter == 0 or Counter == 1 then -- SPAWN True for each statement 2 times 
            selectedUnit = selectRandomUnitFromTech(2)
        else
            selectedUnit = selectRandomUnitFromTech(3)
        end
        Counter = Counter + 1
        if Counter == 4 then
            Counter = 0 -- Reset tech1Counter after every third increment
        end

    elseif remainingMinutes <= 22 and remainingMinutes > 20 then
        if Counter == 0 or Counter == 1 or Counter == 2 then -- SPAWN Every 3 is True for the top statement and 1 from bottom
            selectedUnit = selectRandomUnitFromTech(3)
        else
            selectedUnit = selectRandomUnitFromTech(2)
        end
        Counter = Counter + 1
        if Counter == 4 then
            Counter = 0 -- Reset tech1Counter after every third increment
        end

    elseif remainingMinutes <= 20 and remainingMinutes > 10 then
        selectedUnit = selectRandomUnitFromTech(3) -- SPAWN Just this tech

    elseif remainingMinutes <= 10 and remainingMinutes > 6 then
        if Counter == 0 or Counter == 1 or Counter == 2 then -- SPAWN Every 3 is True for the top statement and 1 from bottom
            selectedUnit = selectRandomUnitFromTech(3)
        else
            selectedUnit = selectRandomUnitFromTech(4)
        end
        Counter = Counter + 1
        if Counter == 4 then
            Counter = 0 -- Reset tech1Counter after every third increment
        end

    elseif remainingMinutes <= 6 and remainingMinutes > 2 then
        if Counter == 0 or Counter == 1 then -- SPAWN True for each statement 2 times 
            selectedUnit = selectRandomUnitFromTech(3)
        else
            selectedUnit = selectRandomUnitFromTech(4)
        end
        Counter = Counter + 1
        if Counter == 4 then
            Counter = 0 -- Reset tech1Counter after every third increment
        end

    elseif remainingMinutes <= 2 and remainingMinutes > 0 then
        if Counter == 0 or Counter == 1 or Counter == 2 then -- SPAWN Every 3 is True for the top statement and 1 from bottom
            selectedUnit = selectRandomUnitFromTech(4)
        else
            selectedUnit = selectRandomUnitFromTech(3)
        end
        Counter = Counter + 1
        if Counter == 4 then
            Counter = 0 -- Reset tech1Counter after every third increment
        end
    end
    return selectedUnit
end

function SpawnLandUnits()
    WaitSeconds(120 + ScenarioInfo.Options.opt_Survival_BuildTime)

    while true do
        WaitSeconds(1)

        local area = Areas.PickRandomArea(Areas.spawnLandArea)
        local spawn = Areas.PickRandomPointInArea(area)    
        local attack = ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1")
        local playerarea = Areas.PickRandomArea(Areas.playerLandArea)
        local playerattackarea = Areas.PickRandomPointInArea(playerarea)

        local unitGroup = {}  -- Create an empty table to store the units in the group

        for i = 1, 4 do  -- Spawn 5 units at a time
            local unit = GetSpawnedUnitBasedOnGameTime()
            --local unit = 'uaa0101'
            local unitspawned = CreateUnitHPR(unit, army, spawn[1], spawn[2],spawn[3],0,0,0); 

            unitspawned:SetMaxHealth(unitspawned:GetMaxHealth() * ScenarioInfo.Options.opt_Survival_HealthMultiplier)
            unitspawned:SetHealth(unitspawned,unitspawned:GetMaxHealth())
            for j = 1, unitspawned:GetWeaponCount() do
                local Weapon = unitspawned:GetWeapon(j)
                if Weapon.Label ~= 'DeathWeapon' and Weapon.Label ~= 'DeathImpact' then
                    Weapon:AddDamageMod(Weapon:GetBlueprint().Damage * (ScenarioInfo.Options.opt_Survival_DamageMultiplier - 1))
                end
            end

            if ScenarioInfo.Options.opt_Wrecks == 1 then
                local bp = unitspawned:GetBlueprint()
                if bp ~= nil then
                    bp.Wreckage = nil
                end 
            end

            table.insert(unitGroup, unitspawned)  -- Add the unit to the group
        end

        local random_action = math.random(2)

        if random_action == 1 then
            IssueAggressiveMove(unitGroup, playerattackarea)
        else
            IssueFormMove(unitGroup, playerattackarea, 'GrowthFormation', 0)
        end

        -- Issue formation move towards the central attack point
        IssueFormAggressiveMove(unitGroup, attack, 'GrowthFormation', 0)
    end
end


