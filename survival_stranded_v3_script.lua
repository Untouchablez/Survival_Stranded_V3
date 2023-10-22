ScenarioInfo.MapPath = '/maps/survival_stranded_v3.v0006/'

-- Forged Alliance
local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

-- My Other LUA
local Areas = import(ScenarioInfo.MapPath .. 'Src/Areas.lua')
local AllFactions = import(ScenarioInfo.MapPath .. 'Src/AllFactions.lua')
local DefenceObject = import(ScenarioInfo.MapPath .. 'Src/DefenceObject.lua')
local DefaultOptions = import(ScenarioInfo.MapPath .. 'Src/DefaultOptions.lua')
local ResourceSpawning = import(ScenarioInfo.MapPath .. 'Src/ResourceSpawning.lua')
local ResourceTable = import(ScenarioInfo.MapPath .. 'Survival_Stranded_V3_tables.lua')
local SpawnLandUnits = import(ScenarioInfo.MapPath .. 'Functionality/SpawnLandUnits.lua')
local SpawnNavyUnits = import(ScenarioInfo.MapPath .. 'Functionality/SpawnNavyUnits.lua')
local SpawnAirUnits = import(ScenarioInfo.MapPath .. 'Functionality/SpawnAirUnits.lua')
local LandTables = import(ScenarioInfo.MapPath .. 'Tables/LandTables.lua')
local NavyTables = import(ScenarioInfo.MapPath .. 'Tables/NavyTables.lua')
local AirTables = import(ScenarioInfo.MapPath .. 'Tables/AirTables.lua')
local UnitRevealer = import(ScenarioInfo.MapPath .. 'Src/UnitRevealer.lua')
local LandGateTables = import(ScenarioInfo.MapPath .. 'Tables/LandGateTables.lua')
local LandGates = import(ScenarioInfo.MapPath .. 'Functionality/LandGates.lua')
local PlayableArea = import(ScenarioInfo.MapPath .. 'Src/PlayableArea.lua')
local Missions = import(ScenarioInfo.MapPath .. 'Functionality/Missions.lua')


---TABLES
PlayerArmyCount = 0
PlayerArmies = { }
PlayerIndex = { }
EnemyArmies = { }

ScenarioUtils.CreateResources = function() end

function OnPopulate()
    ScenarioInfo.Options.Victory = 'sandbox'
    ScenarioUtils.InitializeArmies()
    ScenarioInfo.CampaignMode = true
    Sync.CampaignMode = true
    import('/lua/sim/simuistate.lua').IsCampaign(true)
end

function OnStart(self)

    -- Initialise Options
    DefaultOptions.OnStart()
    -- Initialise All Factions
    AllFactions.OnStart()
    -- Initialise Areas
    Areas.OnStart()
    -- Initialise Defence object & objectives
    DefenceObject.OnStart()
    -- initialise Gates
    LandGates.OnStart()
    -- initialise player script

        
    -- Forkthreads
    ForkThread(DefenceObject.UpdateGameTimeObjective)
    ForkThread(SpawnLandUnits.SpawnLandUnits)
    ForkThread(SpawnNavyUnits.SpawnNavyUnits)
    ForkThread(SpawnAirUnits.SpawnAirUnits)
    ForkThread(LandGates.CheckGatesStatus)
    ForkThread(PlayableArea.OnTick) 
    ForkThread(Missions.OnTick)

    -- Adaptive Mass Spawning configuration
    TheRedOrTheBluePill()
    -- intialise the resource spawning
    ResourceSpawning.SetupResources(PlayerIndex, ResourceTable)

 -- setup army specific things
 for i, army in ListArmies() do
    if (army == "ARMY_1" or army == "ARMY_2" or army == "ARMY_3" or army == "ARMY_4"  or army == "ARMY_5"  or army == "ARMY_6") then
            -- restrict players from building walls
            ScenarioFramework.AddRestriction(army, categories.WALL)

            -- restrict players from making yolo/paragon if enabled in options
            if  ScenarioInfo.Options.opt_GameBreaker == 0 then
                ScenarioFramework.AddRestriction(army, categories.xab1401)
                ScenarioFramework.AddRestriction(army, categories.xsb2401)
            elseif ScenarioInfo.Options.opt_GameBreaker == 1 then
                ScenarioFramework.AddRestriction(army, categories.xab1401)
            elseif ScenarioInfo.Options.opt_GameBreaker == 2 then
               ScenarioFramework.AddRestriction(army, categories.xsb2401)
            elseif ScenarioInfo.Options.opt_GameBreaker == 3 then
            end
       
            for x, ArmyX in ListArmies() do
                -- if human army
                if (ArmyX == "ARMY_1" or ArmyX == "ARMY_2" or ArmyX == "ARMY_3" or ArmyX == "ARMY_4" or army == "ARMY_5"  or army == "ARMY_6") then
                    SetAlliance(army, ArmyX, 'Ally')
                    SetAlliance(army, "ARMY_ENEMY", "Enemy")
                    SetAlliance(army, "ARMY_ALLY", "Ally")
                    SetAlliance("ARMY_ENEMY", "ARMY_ALLY", 'Enemy') 
                    SetAlliedVictory(army, true)
                end
            end
    end
 end

  -- set army colours
  SetArmyColor("ARMY_ENEMY", 128, 0, 0)
  SetArmyColor("ARMY_ALLY",128, 128, 128)
  SetIgnoreArmyUnitCap("ARMY_ENEMY", true)

end

function TheRedOrTheBluePill()
    local ArmyName = {
        "ARMY_1", "ARMY_2", "ARMY_3", "ARMY_4", "ARMY_5", "ARMY_6", "ARMY_7", "ARMY_8", 
        "ARMY_9", "ARMY_10", "ARMY_11", "ARMY_12", "ARMY_13", "ARMY_14", "ARMY_15", "ARMY_16"}
    local EnemyArmyName = {
        "ARMY_ENEMY" , "ARMY_ALLY"}

    for i, Player in ListArmies() do
        for x, PossibleName in ArmyName do 
            if PossibleName == Player then 
                table.insert(PlayerArmies, Player)
            end
        end
        for x, PossibleName in EnemyArmyName do
            if PossibleName == Player then
                table.insert(EnemyArmies, Player)
            end
        end
    end
    for Every, Player in PlayerArmies do
        for IndexNumber = 1, 16 do 
            if Player == "ARMY_" .. IndexNumber then
                table.insert(PlayerIndex, IndexNumber)
            end
        end   
    end
        
    ResourceTable =	ResourceTable
    PlayerArmyCount = table.getn(PlayerArmies)
    
end

function GetActivePlayerCount()
    local activePlayerCount = 0
    local armies = GetArmiesTable()

    for index, army in armies do
        if army.is_human and not army.out_of_game then
            activePlayerCount = activePlayerCount + 1
        end
    end

    return activePlayerCount
end

