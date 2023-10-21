--- Made by GaryTheGoat --- 
--- Please do not amend / upload / copy any content without permission
--- feedback welcome samcaunt@hotmail.co.uk

local Utilities = import('/lua/utilities.lua')
local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

local Areas = import(ScenarioInfo.MapPath .. 'Src/Areas.lua')
local UnitRevealer = import(ScenarioInfo.MapPath .. 'Src/UnitRevealer.lua')

local LandGateTables = import(ScenarioInfo.MapPath .. 'Tables/LandGateTables.lua')
local DefenceObject = import(ScenarioInfo.MapPath .. 'Src/DefenceObject.lua')

local numGatesDestroyed = 0
local army = "ARMY_ENEMY"

local size = 25;
local fade = 9;
local alignment = 'lefttop';
local color = '00bfff';

local Counter = 0

function OnGateDestroyed()
    numGatesDestroyed = numGatesDestroyed + 1
    LOG("Number of gates destroyed:", numGatesDestroyed)
    -- Check how many gates are destroyed and invoke corresponding functions
    if numGatesDestroyed == 1 then
        FunctionForOneGateDestroyed()
    elseif numGatesDestroyed == 2 then
        FunctionForTwoGatesDestroyed()
    elseif numGatesDestroyed == 3 then
        FunctionForThreeGatesDestroyed()
    elseif numGatesDestroyed == 4 then
        FunctionForFourGatesDestroyed()
    elseif numGatesDestroyed == 5 then
        FunctionForFiveGatesDestroyed()
    elseif numGatesDestroyed == 6 then
        FunctionForSixGatesDestroyed()
    elseif numGatesDestroyed == 7 then
        FunctionForSevenGatesDestroyed()
    end
end

function FunctionForOneGateDestroyed()
    -- Code for when 1 gate is destroyed
    local offset = "                               "
    for k = 1, 2 do 
        PrintText("", size + 10, color, fade, alignment);
    end
    PrintText(offset .. "One Gate Destroyed!", size + 10, color, fade, alignment);

    ---- spawn boss when gate 1 dead
    ScenarioFramework.Dialogue(import('/maps/X1CA_004/X1CA_004_strings.lua').X04_M03_090, nil, true)
    local area = Areas.PickRandomArea(Areas.spawnLandArea)
    local spawn = Areas.PickRandomPointInArea(area)
    local army = "ARMY_ENEMY"
    
    local rand = Utilities.GetRandomInt(1,4)
        if (rand == 1) then
            ENEMYBOSS = CreateUnitHPR('ual0401',army, spawn[1], spawn[2], spawn[3], 0, 0, 0)
            elseif (rand == 2) then
            ENEMYBOSS = CreateUnitHPR('xsl0401',army, spawn[1], spawn[2], spawn[3], 0, 0, 0)
            elseif (rand == 3) then
            ENEMYBOSS = CreateUnitHPR('xrl0403',army, spawn[1], spawn[2], spawn[3], 0, 0, 0)
            elseif (rand == 4) then
            ENEMYBOSS = CreateUnitHPR('uel0401',army, spawn[1], spawn[2], spawn[3], 0, 0, 0)
        end
        ENEMYBOSS:SetVeterancy(1)
        ENEMYBOSS:SetVeterancy(1)
        ENEMYBOSS:SetVeterancy(1)
        ENEMYBOSS:SetVeterancy(1)
        ENEMYBOSS:SetVeterancy(1)
        ENEMYBOSS:CreateShield({
        ImpactEffects = 'SeraphimShieldHit01',
        ImpactMesh = '/effects/entities/ShieldSection01/ShieldSection01_mesh',
        Mesh = '/effects/entities/AeonShield01/AeonShield01_mesh',
        MeshZ = '/effects/entities/Shield01/Shield01z_mesh',
        RegenAssistMult = 60,
        ShieldEnergyDrainRechargeTime = 5,
        ShieldMaxHealth = 18000,
        ShieldRechargeTime = 24,
        ShieldRegenRate = 150,
        ShieldRegenStartTime = 3,
        ShieldSize = 35,
        ShieldVerticalOffset = -5,
        })
 
        ENEMYBOSS:SetProductionPerSecondEnergy(1000)
        ENEMYBOSS:SetConsumptionPerSecondEnergy(0)
        ENEMYBOSS:SetRegenRate(100)
        ENEMYBOSS:SetCustomName("JammerNub V1")       
        ENEMYBOSS:SetMaxHealth((200000) * ScenarioInfo.Options.opt_Survival_HealthMultiplier)
        ENEMYBOSS:SetHealth(ENEMYBOSS,ENEMYBOSS:GetMaxHealth())
        IssueAggressiveMove({ENEMYBOSS}, ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1"))
        IssueFormMove(ENEMYBOSS, ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1"), 'GrowthFormation', 0)
        ---- Reveal the Boss to all players
        UnitRevealer.revealUnit(ENEMYBOSS, 42)     

end

function FunctionForTwoGatesDestroyed()
    -- Code for when 2 gates are destroyed
    local offset = "                               "
    for k = 1, 2 do 
        PrintText("", size + 10, color, fade, alignment);
    end
    PrintText(offset .. "Two Gates Destroyed!", size + 10, color, fade, alignment);

    ScenarioFramework.Dialogue(import('/maps/X1CA_004/X1CA_004_strings.lua').X04_M03_090, nil, true)
    local area = Areas.PickRandomArea(Areas.spawnLandArea)
    local spawn = Areas.PickRandomPointInArea(area)
    local army = "ARMY_ENEMY"
    
    -- spawn bosses when two gates dead
    local rand = Utilities.GetRandomInt(1,4)
    local bossOptions = {
        'ual0401',  -- Option 1
        'xsl0401',  -- Option 2
        'xrl0403',  -- Option 3
        'uel0401',  -- Option 4
    }

    local group = {}

    for i = 1, 5 do
        local rand = table.getn(bossOptions) > 0 and math.random(1, table.getn(bossOptions)) or 1
        local selectedBoss = bossOptions[rand]  
        local ENEMYBOSS = CreateUnitHPR(selectedBoss, army, spawn[1], spawn[2], spawn[3], 0, 0, 0)

        -- Apply settings to ENEMYBOSS
        ENEMYBOSS:SetVeterancy(1)
        ENEMYBOSS:CreateShield({
            ImpactEffects = 'SeraphimShieldHit01',
            ImpactMesh = '/effects/entities/ShieldSection01/ShieldSection01_mesh',
            Mesh = '/effects/entities/AeonShield01/AeonShield01_mesh',
            MeshZ = '/effects/entities/Shield01/Shield01z_mesh',
            RegenAssistMult = 60,
            ShieldEnergyDrainRechargeTime = 5,
            ShieldMaxHealth = 18000,
            ShieldRechargeTime = 24,
            ShieldRegenRate = 150,
            ShieldRegenStartTime = 3,
            ShieldSize = 35,
            ShieldVerticalOffset = -5,
        })
        ENEMYBOSS:SetProductionPerSecondEnergy(1000)
        ENEMYBOSS:SetConsumptionPerSecondEnergy(0)
        ENEMYBOSS:SetRegenRate(100)
        ENEMYBOSS:SetCustomName("JammerNub V2")       
        ENEMYBOSS:SetMaxHealth((250000) * ScenarioInfo.Options.opt_Survival_HealthMultiplier)
        ENEMYBOSS:SetHealth(ENEMYBOSS,ENEMYBOSS:GetMaxHealth())        

        -- Reveal the Boss to all players
        UnitRevealer.revealUnit(ENEMYBOSS, 42)    

        table.insert(group, ENEMYBOSS)
    end

    -- Issue a FormMove command to move the units together in a formation
    IssueFormMove(group, ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1"), 'AttackFormation', 0)
end


function FunctionForThreeGatesDestroyed()
    -- Code for when 3 gates are destroyed
    local offset = "                               "
    for k = 1, 2 do 
        PrintText("", size + 10, color, fade, alignment);
    end
    PrintText(offset .. "Three Gates Destroyed!", size + 10, color, fade, alignment);

    ScenarioFramework.Dialogue(import('/maps/X1CA_004/X1CA_004_strings.lua').X04_M03_090, nil, true)
    local area = Areas.PickRandomArea(Areas.spawnLandArea)
    local spawn = Areas.PickRandomPointInArea(area)
    local army = "ARMY_ENEMY"
    
    -- spawn bosses when two gates dead
    local rand = Utilities.GetRandomInt(1,5)
    local bossOptions = {
        'ual0401',  -- Option 1
        'xsl0401',  -- Option 2
        'xrl0403',  -- Option 3
        'uel0401',  -- Option 4
        'uaa0310',  -- Option 5
    }

    local group = {}

    for i = 1, 7 do
        local rand = table.getn(bossOptions) > 0 and math.random(1, table.getn(bossOptions)) or 1
        local selectedBoss = bossOptions[rand]  
        local ENEMYBOSS = CreateUnitHPR(selectedBoss, army, spawn[1], spawn[2], spawn[3], 0, 0, 0)

        -- Apply settings to ENEMYBOSS
        ENEMYBOSS:SetVeterancy(1)
        ENEMYBOSS:CreateShield({
            ImpactEffects = 'SeraphimShieldHit01',
            ImpactMesh = '/effects/entities/ShieldSection01/ShieldSection01_mesh',
            Mesh = '/effects/entities/AeonShield01/AeonShield01_mesh',
            MeshZ = '/effects/entities/Shield01/Shield01z_mesh',
            RegenAssistMult = 60,
            ShieldEnergyDrainRechargeTime = 5,
            ShieldMaxHealth = 18000,
            ShieldRechargeTime = 24,
            ShieldRegenRate = 150,
            ShieldRegenStartTime = 3,
            ShieldSize = 35,
            ShieldVerticalOffset = -5,
        })
        ENEMYBOSS:SetProductionPerSecondEnergy(1000)
        ENEMYBOSS:SetConsumptionPerSecondEnergy(0)
        ENEMYBOSS:SetRegenRate(100)
        ENEMYBOSS:SetCustomName("JammerNub V3")       
        ENEMYBOSS:SetMaxHealth((300000) * ScenarioInfo.Options.opt_Survival_HealthMultiplier)
        ENEMYBOSS:SetHealth(ENEMYBOSS,ENEMYBOSS:GetMaxHealth())        

        -- Reveal the Boss to all players
        UnitRevealer.revealUnit(ENEMYBOSS, 42)    

        table.insert(group, ENEMYBOSS)
    end

    -- Issue a FormMove command to move the units together in a formation
    IssueFormMove(group, ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1"), 'AttackFormation', 0)

end

function FunctionForFourGatesDestroyed()
    -- Code for when 4 gates are destroyed
    local offset = "                               "
    for k = 1, 2 do 
        PrintText("", size + 10, color, fade, alignment);
    end
    PrintText(offset .. "Four Gates Destroyed!", size + 10, color, fade, alignment);
    
    ScenarioFramework.Dialogue(import('/maps/X1CA_004/X1CA_004_strings.lua').X04_M03_090, nil, true)
    local area = Areas.PickRandomArea(Areas.spawnLandArea)
    local spawn = Areas.PickRandomPointInArea(area)
    local army = "ARMY_ENEMY"
    
    -- spawn bosses when two gates dead
    local rand = Utilities.GetRandomInt(1,5)
    local bossOptions = {
        'ual0401',  -- Option 1
        'xsl0401',  -- Option 2
        'xrl0403',  -- Option 3
        'uel0401',  -- Option 4
        'uaa0310',  -- Option 5
    }

    local group = {}

    for i = 1, 7 do
        local rand = table.getn(bossOptions) > 0 and math.random(1, table.getn(bossOptions)) or 1
        local selectedBoss = bossOptions[rand]  
        local ENEMYBOSS = CreateUnitHPR(selectedBoss, army, spawn[1], spawn[2], spawn[3], 0, 0, 0)

        -- Apply settings to ENEMYBOSS
        ENEMYBOSS:SetVeterancy(1)
        ENEMYBOSS:CreateShield({
            ImpactEffects = 'SeraphimShieldHit01',
            ImpactMesh = '/effects/entities/ShieldSection01/ShieldSection01_mesh',
            Mesh = '/effects/entities/AeonShield01/AeonShield01_mesh',
            MeshZ = '/effects/entities/Shield01/Shield01z_mesh',
            RegenAssistMult = 60,
            ShieldEnergyDrainRechargeTime = 5,
            ShieldMaxHealth = 18000,
            ShieldRechargeTime = 24,
            ShieldRegenRate = 150,
            ShieldRegenStartTime = 3,
            ShieldSize = 35,
            ShieldVerticalOffset = -5,
        })
        ENEMYBOSS:SetProductionPerSecondEnergy(1000)
        ENEMYBOSS:SetConsumptionPerSecondEnergy(0)
        ENEMYBOSS:SetRegenRate(100)
        ENEMYBOSS:SetCustomName("JammerNub V4")       
        ENEMYBOSS:SetMaxHealth((350000) * ScenarioInfo.Options.opt_Survival_HealthMultiplier)
        ENEMYBOSS:SetHealth(ENEMYBOSS,ENEMYBOSS:GetMaxHealth())        

        -- Reveal the Boss to all players
        UnitRevealer.revealUnit(ENEMYBOSS, 42)    

        table.insert(group, ENEMYBOSS)
    end

    -- Issue a FormMove command to move the units together in a formation
    IssueFormMove(group, ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1"), 'AttackFormation', 0)
end

function FunctionForFiveGatesDestroyed()
    -- Code for when 5 gates are destroyed
    local offset = "                               "
    for k = 1, 2 do 
        PrintText("", size + 10, color, fade, alignment);
    end
    PrintText(offset .. "Five Gates Destroyed!", size + 10, color, fade, alignment);
    
    ScenarioFramework.Dialogue(import('/maps/X1CA_004/X1CA_004_strings.lua').X04_M03_090, nil, true)
    local area = Areas.PickRandomArea(Areas.spawnLandArea)
    local spawn = Areas.PickRandomPointInArea(area)
    local army = "ARMY_ENEMY"
    
    -- spawn bosses when two gates dead
    local rand = Utilities.GetRandomInt(1,5)
    local bossOptions = {
        'ual0401',  -- Option 1
        'xsl0401',  -- Option 2
        'xrl0403',  -- Option 3
        'uel0401',  -- Option 4
        'uaa0310',  -- Option 5
    }

    local group = {}

    for i = 1, 7 do
        local rand = table.getn(bossOptions) > 0 and math.random(1, table.getn(bossOptions)) or 1
        local selectedBoss = bossOptions[rand]  
        local ENEMYBOSS = CreateUnitHPR(selectedBoss, army, spawn[1], spawn[2], spawn[3], 0, 0, 0)

        -- Apply settings to ENEMYBOSS
        ENEMYBOSS:SetVeterancy(1)
        ENEMYBOSS:CreateShield({
            ImpactEffects = 'SeraphimShieldHit01',
            ImpactMesh = '/effects/entities/ShieldSection01/ShieldSection01_mesh',
            Mesh = '/effects/entities/AeonShield01/AeonShield01_mesh',
            MeshZ = '/effects/entities/Shield01/Shield01z_mesh',
            RegenAssistMult = 60,
            ShieldEnergyDrainRechargeTime = 5,
            ShieldMaxHealth = 18000,
            ShieldRechargeTime = 24,
            ShieldRegenRate = 150,
            ShieldRegenStartTime = 3,
            ShieldSize = 35,
            ShieldVerticalOffset = -5,
        })
        ENEMYBOSS:SetProductionPerSecondEnergy(1000)
        ENEMYBOSS:SetConsumptionPerSecondEnergy(0)
        ENEMYBOSS:SetRegenRate(100)
        ENEMYBOSS:SetCustomName("JammerNub V5")       
        ENEMYBOSS:SetMaxHealth((400000) * ScenarioInfo.Options.opt_Survival_HealthMultiplier)
        ENEMYBOSS:SetHealth(ENEMYBOSS,ENEMYBOSS:GetMaxHealth())        

        -- Reveal the Boss to all players
        UnitRevealer.revealUnit(ENEMYBOSS, 42)    

        table.insert(group, ENEMYBOSS)
    end

    -- Issue a FormMove command to move the units together in a formation
    IssueFormMove(group, ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1"), 'AttackFormation', 0)
end

function FunctionForSixGatesDestroyed()
    -- Code for when 6 gates are destroyed
    local offset = "                               "
    for k = 1, 2 do 
        PrintText("", size + 10, color, fade, alignment);
    end
    PrintText(offset .. "Six Gates Destroyed!", size + 10, color, fade, alignment);
    
    ScenarioFramework.Dialogue(import('/maps/X1CA_004/X1CA_004_strings.lua').X04_M03_090, nil, true)
    local area = Areas.PickRandomArea(Areas.spawnLandArea)
    local spawn = Areas.PickRandomPointInArea(area)
    local army = "ARMY_ENEMY"
    
    -- spawn bosses when two gates dead
    local rand = Utilities.GetRandomInt(1,5)
    local bossOptions = {
        'ual0401',  -- Option 1
        'xsl0401',  -- Option 2
        'xrl0403',  -- Option 3
        'uel0401',  -- Option 4
        'uaa0310',  -- Option 5
    }

    local group = {}

    for i = 1, 7 do
        local rand = table.getn(bossOptions) > 0 and math.random(1, table.getn(bossOptions)) or 1
        local selectedBoss = bossOptions[rand]  
        local ENEMYBOSS = CreateUnitHPR(selectedBoss, army, spawn[1], spawn[2], spawn[3], 0, 0, 0)

        -- Apply settings to ENEMYBOSS
        ENEMYBOSS:SetVeterancy(1)
        ENEMYBOSS:CreateShield({
            ImpactEffects = 'SeraphimShieldHit01',
            ImpactMesh = '/effects/entities/ShieldSection01/ShieldSection01_mesh',
            Mesh = '/effects/entities/AeonShield01/AeonShield01_mesh',
            MeshZ = '/effects/entities/Shield01/Shield01z_mesh',
            RegenAssistMult = 60,
            ShieldEnergyDrainRechargeTime = 5,
            ShieldMaxHealth = 18000,
            ShieldRechargeTime = 24,
            ShieldRegenRate = 150,
            ShieldRegenStartTime = 3,
            ShieldSize = 35,
            ShieldVerticalOffset = -5,
        })
        ENEMYBOSS:SetProductionPerSecondEnergy(1000)
        ENEMYBOSS:SetConsumptionPerSecondEnergy(0)
        ENEMYBOSS:SetRegenRate(100)
        ENEMYBOSS:SetCustomName("JammerNub V6")       
        ENEMYBOSS:SetMaxHealth((450000) * ScenarioInfo.Options.opt_Survival_HealthMultiplier)
        ENEMYBOSS:SetHealth(ENEMYBOSS,ENEMYBOSS:GetMaxHealth())        

        -- Reveal the Boss to all players
        UnitRevealer.revealUnit(ENEMYBOSS, 42)    

        table.insert(group, ENEMYBOSS)
    end

    -- Issue a FormMove command to move the units together in a formation
    IssueFormMove(group, ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1"), 'AttackFormation', 0)
end

function FunctionForSevenGatesDestroyed()
    -- Code for when 7 gates are destroyed
    local offset = "                               "
    for k = 1, 2 do 
        PrintText("", size + 10, color, fade, alignment);
    end
    PrintText(offset .. "All Land Gates Destroyed!", size + 10, color, fade, alignment);

    
    ScenarioFramework.Dialogue(import('/maps/X1CA_004/X1CA_004_strings.lua').X04_M03_090, nil, true)
    local area = Areas.PickRandomArea(Areas.spawnLandArea)
    local spawn = Areas.PickRandomPointInArea(area)
    local army = "ARMY_ENEMY"
    
    -- spawn bosses when two gates dead
    local rand = Utilities.GetRandomInt(1,5)
    local bossOptions = {
        'ual0401',  -- Option 1
        'xsl0401',  -- Option 2
        'xrl0403',  -- Option 3
        'uel0401',  -- Option 4
        'uaa0310',  -- Option 5
        'xsa0402',  -- Option 6
    }

    local group = {}

    for i = 1, 10 do
        local rand = table.getn(bossOptions) > 0 and math.random(1, table.getn(bossOptions)) or 1
        local selectedBoss = bossOptions[rand]  
        local ENEMYBOSS = CreateUnitHPR(selectedBoss, army, spawn[1], spawn[2], spawn[3], 0, 0, 0)

        -- Apply settings to ENEMYBOSS
        ENEMYBOSS:SetVeterancy(1)
        ENEMYBOSS:CreateShield({
            ImpactEffects = 'SeraphimShieldHit01',
            ImpactMesh = '/effects/entities/ShieldSection01/ShieldSection01_mesh',
            Mesh = '/effects/entities/AeonShield01/AeonShield01_mesh',
            MeshZ = '/effects/entities/Shield01/Shield01z_mesh',
            RegenAssistMult = 60,
            ShieldEnergyDrainRechargeTime = 5,
            ShieldMaxHealth = 18000,
            ShieldRechargeTime = 24,
            ShieldRegenRate = 150,
            ShieldRegenStartTime = 3,
            ShieldSize = 35,
            ShieldVerticalOffset = -5,
        })
        ENEMYBOSS:SetProductionPerSecondEnergy(1000)
        ENEMYBOSS:SetConsumptionPerSecondEnergy(0)
        ENEMYBOSS:SetRegenRate(100)
        ENEMYBOSS:SetCustomName("JammerNub V7")       
        ENEMYBOSS:SetMaxHealth((500000) * ScenarioInfo.Options.opt_Survival_HealthMultiplier)
        ENEMYBOSS:SetHealth(ENEMYBOSS,ENEMYBOSS:GetMaxHealth())        

        -- Reveal the Boss to all players
        UnitRevealer.revealUnit(ENEMYBOSS, 42)    

        table.insert(group, ENEMYBOSS)
    end

    -- Issue a FormMove command to move the units together in a formation
    IssueFormMove(group, ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1"), 'AttackFormation', 0)
end


local destroyedGates = {}

function CheckGatesStatus()
    while true do    
        WaitSeconds (1)
        local gates = {EnemyGate1, EnemyGate2, EnemyGate3, EnemyGate4, EnemyGate5, EnemyGate6, EnemyGate7}
        local aliveGates = {}

        for _, gate in ipairs(gates) do
            if gate and not gate:IsDead() then
                table.insert(aliveGates, gate)
            end
        end

        for _, gate in ipairs(aliveGates) do
            CreateUnitFromGate(gate)  -- Call the function to create a unit from the alive gate
        end

        for _, gate in ipairs(gates) do
            if gate and gate:IsDead() and not destroyedGates[gate] then
                destroyedGates[gate] = true
                OnGateDestroyed()
            end
        end
    end
end

function CreateUnitFromGate(gate)
    local pos = gate:GetPosition()
    if not CreateUnitFromGate.firstCall then
        CreateUnitFromGate.firstCall = true
        WaitSeconds(180 + ScenarioInfo.Options.opt_Survival_BuildTime)
    end

    local attack = ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1")
    local playerarea = Areas.PickRandomArea(Areas.playerLandArea)
    local playerattackarea = Areas.PickRandomPointInArea(playerarea)

    local unitGroup = {}  -- Store the spawned units in a table

    for i = 1, 4 do  -- Spawn 5 units at a time
        local unit = GetSpawnedUnitBasedOnGameTime()
        local unitspawned = CreateUnitHPR(unit, army, pos[1], pos[2],pos[3],0,0,0); 

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

    -- Issue move orders for the entire group
    IssueFormMove(unitGroup, attack, 'GrowthFormation', 0)  -- Issue a formation move order
    
    WaitSeconds(5)
end

local selectedFaction = ScenarioInfo.Options.opt_EnemyFaction
local initialFaction = nil

function selectRandomUnitFromTech(techLevel)
    local randomTable
    local randomFaction = selectedFaction

    if randomFaction == 5 then
        if not initialFaction then
            local factionTables = {
                LandGateTables["tech" .. techLevel .. "AeonUnits"],
                LandGateTables["tech" .. techLevel .. "CybranUnits"],
                LandGateTables["tech" .. techLevel .. "SeraUnits"],
                LandGateTables["tech" .. techLevel .. "UEFUnits"],
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
            randomTable = LandGateTables["tech" .. techLevel .. factionKey[randomFaction] .. "Units"]
        end
    else
        if randomFaction == 0 then
            local factionTables = {
                LandGateTables["tech" .. techLevel .. "AeonUnits"],
                LandGateTables["tech" .. techLevel .. "CybranUnits"],
                LandGateTables["tech" .. techLevel .. "SeraUnits"],
                LandGateTables["tech" .. techLevel .. "UEFUnits"],
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
            randomTable = LandGateTables["tech" .. techLevel .. factionKey[randomFaction] .. "Units"]
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

function OnStart()

    local r = Utilities.GetRandomInt(1, 4)
    local gateFaction
    local armies = ListArmies()
    UnitRevealer = import('/maps/Survival_Stranded_V3.v0005/Src/UnitRevealer.lua').newInstance(armies)
    local players = {}
  
    -- Use the gateFaction variable for further processing

        local pos = ScenarioUtils.MarkerToPosition("landgate-1")
        --spawn gate 1
        EnemyGate1 = CreateUnitHPR( 'UAB0304', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
		EnemyGate1:SetMaxHealth(110000)
		EnemyGate1:SetHealth(nil,110000)
		EnemyGate1:SetReclaimable(false)
		EnemyGate1:SetCapturable(false)
		EnemyGate1:SetProductionPerSecondEnergy(9999)
		EnemyGate1:SetProductionPerSecondMass(9999)
		EnemyGate1:SetCustomName("Enemy Gate 1")
        -- Example usage: Highlight the "EnemyGate1" structure with a specific color

        local pos = ScenarioUtils.MarkerToPosition("landgate-2")
        --spawn gate 2
        EnemyGate2 = CreateUnitHPR( 'UAB0304', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
		EnemyGate2:SetMaxHealth(110000)
		EnemyGate2:SetHealth(nil,110000)
		EnemyGate2:SetReclaimable(false)
		EnemyGate2:SetCapturable(false)
		EnemyGate2:SetProductionPerSecondEnergy(9999)
		EnemyGate2:SetProductionPerSecondMass(9999)
		EnemyGate2:SetCustomName("Enemy Gate 2")

        local pos = ScenarioUtils.MarkerToPosition("landgate-3")
        --spawn gate 3
        EnemyGate3 = CreateUnitHPR( 'UAB0304', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
		EnemyGate3:SetMaxHealth(110000)
		EnemyGate3:SetHealth(nil,110000)
		EnemyGate3:SetReclaimable(false)
		EnemyGate3:SetCapturable(false)
		EnemyGate3:SetProductionPerSecondEnergy(9999)
		EnemyGate3:SetProductionPerSecondMass(9999)
		EnemyGate3:SetCustomName("Enemy Gate 3")

        local pos = ScenarioUtils.MarkerToPosition("landgate-4")
        --spawn gate 4
        EnemyGate4 = CreateUnitHPR( 'UAB0304', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
		EnemyGate4:SetMaxHealth(110000)
		EnemyGate4:SetHealth(nil,110000)
		EnemyGate4:SetReclaimable(false)
		EnemyGate4:SetCapturable(false)
		EnemyGate4:SetProductionPerSecondEnergy(9999)
		EnemyGate4:SetProductionPerSecondMass(9999)
		EnemyGate4:SetCustomName("Enemy Gate 4")

        local pos = ScenarioUtils.MarkerToPosition("landgate-5")
        --spawn gate 5
        EnemyGate5 = CreateUnitHPR( 'UAB0304', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
		EnemyGate5:SetMaxHealth(110000)
		EnemyGate5:SetHealth(nil,110000)
		EnemyGate5:SetReclaimable(false)
		EnemyGate5:SetCapturable(false)
		EnemyGate5:SetProductionPerSecondEnergy(9999)
		EnemyGate5:SetProductionPerSecondMass(9999)
		EnemyGate5:SetCustomName("Enemy Gate 5")

        local pos = ScenarioUtils.MarkerToPosition("landgate-6")
        --spawn gate 6
        EnemyGate6 = CreateUnitHPR( 'UAB0304', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
		EnemyGate6:SetMaxHealth(110000)
		EnemyGate6:SetHealth(nil,110000)
		EnemyGate6:SetReclaimable(false)
		EnemyGate6:SetCapturable(false)
		EnemyGate6:SetProductionPerSecondEnergy(9999)
		EnemyGate6:SetProductionPerSecondMass(9999)
		EnemyGate6:SetCustomName("Enemy Gate 6")

        local pos = ScenarioUtils.MarkerToPosition("landgate-7")
        --spawn gate 7
        EnemyGate7 = CreateUnitHPR( 'UAB0304', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
		EnemyGate7:SetMaxHealth(110000)
		EnemyGate7:SetHealth(nil,110000)
		EnemyGate7:SetReclaimable(false)
		EnemyGate7:SetCapturable(false)
		EnemyGate7:SetProductionPerSecondEnergy(9999)
		EnemyGate7:SetProductionPerSecondMass(9999)
		EnemyGate7:SetCustomName("Enemy Gate 7")

         --- make the gates visable to all human allied armys in the game
         for v, army in armies do
            if (army == "ARMY_1" or army == "ARMY_2" or army == "ARMY_3" or army == "ARMY_4"  or army == "ARMY_5"  or army == "ARMY_6") then
                table.insert(players, army)
             end
        end
        for k, player in players do   
        ScenarioFramework.CreateVisibleAreaAtUnit(15, EnemyGate1, 0, GetArmyBrain(player))
        ScenarioFramework.CreateVisibleAreaAtUnit(15, EnemyGate2, 0, GetArmyBrain(player))
        ScenarioFramework.CreateVisibleAreaAtUnit(15, EnemyGate3, 0, GetArmyBrain(player))
        ScenarioFramework.CreateVisibleAreaAtUnit(15, EnemyGate4, 0, GetArmyBrain(player))
        ScenarioFramework.CreateVisibleAreaAtUnit(15, EnemyGate5, 0, GetArmyBrain(player))
        ScenarioFramework.CreateVisibleAreaAtUnit(15, EnemyGate6, 0, GetArmyBrain(player))
        ScenarioFramework.CreateVisibleAreaAtUnit(15, EnemyGate7, 0, GetArmyBrain(player))
        end
end

