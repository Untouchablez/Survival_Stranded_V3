-- Made by GaryTheGoat
-- Please do not amend / upload / copy any content without permission
-- feedback welcome samcaunt@hotmail.co.uk

local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

-- List of possible Aeon Units
tech1AeonUnits = {
    { 'uaa0101', 'uaa0102', 'uaa0103'},
    { 'uaa0102', 'uaa0102', 'uaa0103'}
}

tech2AeonUnits = {
    { 'uaa0204', 'xaa0202','uaa0203'},
    { 'uaa0204', 'uaa0203', 'daa0206'}
}

tech3AeonUnits = {
    { 'uaa0303', 'uaa0303', 'xaa0305', 'uaa0304' },
    { 'uaa0303', 'uaa0303', 'xaa0306', 'uaa0304' }
}

tech4AeonUnits = {
    { 'uaa0310' },
    { 'uaa0310' }
}

-- List of possible Cyrban Units
tech1CybranUnits = {
    { 'ura0101', 'ura0102', 'ura0103'},
    { 'ura0102', 'ura0102', 'ura0103'}
}

tech2CybranUnits = {
    { 'dra0202', 'ura0203','ura0204'},
    { 'dra0202', 'ura0203','ura0204'}
}

tech3CybranUnits = {
    { 'ura0302', 'ura0303', 'xra0305', 'ura0304' },
    { 'ura0303', 'ura0303', 'xra0305', 'ura0304' }
}

tech4CybranUnits = {
    { 'ura0401', 'ura0303', 'ura0303', 'ura0303', 'ura0303', 'ura0303' },
    { 'ura0401', 'ura0303', 'ura0303', 'ura0303', 'ura0303' }
}

-- List of possible UEF units
tech1UEFUnits = {
    { 'uea0101', 'uea0102', 'uea0103'},
    { 'uea0101', 'uea0102', 'uea0103'}
}

tech2UEFUnits = {
    { 'dea0202', 'uea0203','uea0204'},
    { 'dea0202', 'uea0203','uea0204'}
}

tech3UEFUnits = {
    { 'uea0302', 'uea0303', 'uea0304', 'uea0305' },
    { 'uea0302', 'uea0303', 'uea0304', 'uea0304','uea0303','uea0303','uea0303','uea0303', },
}

tech4UEFUnits = {
    { 'uea0302', 'uea0303', 'uea0304', 'uea0305' }
}

-- List of possible SERA Units
tech1SeraUnits = {
    { 'xsa0101', 'xsa0102', 'xsa0103'},
    { 'xsa0102', 'xsa0102', 'xsa0103'}
}

tech2SeraUnits = {
    { 'xsa0204', 'xsa0202','xsa0203'},
    { 'xsa0204', 'xsa0202','xsa0203'}
}

tech3SeraUnits = {
    { 'xsa0303', 'xsa0303', 'xsa0304', 'xsa0302'},
    { 'xsa0303', 'xsa0303', 'xsa0304'}
}

tech4SeraUnits = {
    { 'xsa0402','xsa0303', 'xsa0303', 'xsa0303', 'xsa0303' },
    { 'xsa0402','xsa0303', 'xsa0303', 'xsa0303', 'xsa0303','xsa0303', 'xsa0303', 'xsa0303', 'xsa0303' }
}
