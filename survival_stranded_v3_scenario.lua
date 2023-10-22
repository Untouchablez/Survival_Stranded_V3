version = 3 -- Lua Version. Dont touch this
ScenarioInfo = {
    name = "Survival Stranded V3",
    description = " Embark on an Epic Journey in Survival Stranded V3!  Master new challenges, forge alliances, and conquer the unknown in this thrilling survival adventure. Will you rise to the challenge? ??? Download now and face the ultimate test of strategy and survival!",
    preview = '',
    map_version = 6,
    AdaptiveMap = true,
    type = 'skirmish',
    starts = true,
    size = {512, 512},
    reclaim = {1379904, 6575.308},
    map = '/maps/survival_stranded_v3.v0006/survival_stranded_v3.scmap',
    save = '/maps/survival_stranded_v3.v0006/survival_stranded_v3_save.lua',
    script = '/maps/survival_stranded_v3.v0006/survival_stranded_v3_script.lua',
    norushradius = 40,
    Configurations = {
        ['standard'] = {
            teams = {
                {
                    name = 'FFA',
                    armies = {'ARMY_1', 'ARMY_2', 'ARMY_3', 'ARMY_4', 'ARMY_5', 'ARMY_6'}
                },
            },
            customprops = {
                ['ExtraArmies'] = STRING( 'ARMY_ENEMY ARMY_ALLY' ),
            },
        },
    },
}
