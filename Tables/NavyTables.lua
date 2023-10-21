--- Made by GaryTheGoat --- 
--- Please do not amend / upload / copy any content without permission
--- feedback welcome samcaunt@hotmail.co.uk

local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

-- List of possible Tech 1 AEON units (replace these with actual unit IDs)
tech1AeonUnits = {
    {'uas0102','uas0103','uas0203','uas0102'},
    {'uas0102','uas0102','uas0102','uas0102'}
}

tech2AeonUnits = {
    {'uas0201','uas0201','uas0202'},
    {'uas0201','xas0204','uas0202'}
}

tech3AeonUnits = {
    {'uas0302','xas0306'},
    {'uas0302','uas0303','uas0304'}
}

tech4AeonUnits = {
    {'uas0401'},
    {'uas0401'}
}

-- List of possible Tech 1 SERA units
tech1SeraUnits = {
    {'xsa0102','xsa0103','xsa0203','xsa0102'},
    {'xsa0102','xsa0102','xsa0102','xsa0102'}
}

-- List of possible Tech 2 SERA units
tech2SeraUnits = {
    {'xss0201','xss0202'},
}

-- List of possible Tech 3 SERA units
tech3SeraUnits = {
    {'xsa0302','xsa0303'},
    {'xsa0302','xsa0303','xsa0304'}
}

-- List of possible Tech 4 SERA units
tech4SeraUnits = {
    {'xsa0401'},
    {'xsa0401'}
}

-- List of possible Tech 1 UEF units
tech1UEFUnits = {
    {'ues0103','ues0203'}
}

-- List of possible Tech 2 UEF units
tech2UEFUnits = {
    {'ues0201','ues0201','ues0202'},
    {'xes0102','xes0205','ues0202'}
}

-- List of possible Tech 3 UEF units
tech3UEFUnits = {
    {'ues0302'},
    {'ues0302','ues0304'}
}

-- List of possible Tech 4 UEF units
tech4UEFUnits = {
    {'ues0401'},
    {'ues0401'}
}

-- List of possible Tech 1 Cyrban units
tech1CybranUnits = {
    {'urs0103','urs0203'}
}

-- List of possible Tech 2 Cyrban units
tech2CybranUnits = {
    {'urs0201','urs0201','urs0202','xrs0204'},
    {'urs0201','urs0202'}
}

-- List of possible Tech 3 Cyrban units
tech3CybranUnits = {
    {'urs0302','urs0201','urs0201'},
    {'urs0302','urs0303','urs0304'}
}

-- List of possible Tech 4 Cyrban units
tech4CybranUnits = {
    {'urs0302'},
    {'urs0303'}
}
