-- Made by GaryTheGoat
-- Please do not amend / upload / copy any content without permission
-- feedback welcome samcaunt@hotmail.co.uk

local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

-- List of possible Tech 1 AEON units (replace these with actual unit IDs)
tech1AeonUnits = {
    { 'ual0101', 'ual0103', 'ual0104', 'ual0106', 'ual0201' },
    { 'ual0101', 'ual0101', 'ual0104', 'ual0106', 'ual0106' }
}

tech2AeonUnits = {
    { 'ual0202', 'ual0111', 'ual0205', 'ual0307' },
    { 'ual0202', 'ual0111', 'ual0205', 'ual0307' }
}

tech3AeonUnits = {
    { 'dal0310', 'dalk003', 'ual0303', 'ual0304', 'xal0305' },
    { 'dal0310', 'dalk003', 'ual0303', 'ual0304', 'xal0305' }
}

tech4AeonUnits = {
    { 'ual0401' },
    { 'ual0401' }
}
-- List of possible Tech 1 SERA land units
tech1SeraUnits = {
    { 'xsl0101', 'xsl0103', 'xsl0104', 'xsl0201', 'xsl0201' },
    { 'xsl0101', 'xsl0101', 'xsl0104', 'xsl0201', 'xsl0103' }
}

-- List of possible Tech 2 SERA land units
tech2SeraUnits = {
    { 'xsl0202', 'xsl0111', 'xsl0205', },
    { 'xsl0202', 'xsl0111', 'xsl0205', }
}

-- List of possible Tech 3 SERA land units
tech3SeraUnits = {
    { 'xsl0303', 'xsl0304', 'xsl0305' },
    { 'xsl0303', 'xsl0304', 'xsl0305' }
}

-- List of possible Tech 4 SERA land units
tech4SeraUnits = {
    { 'xsl0401' },
    { 'xsl0401' }
}
-- List of possible Tech 1 UEF land units
tech1UEFUnits = {
    { 'uel0101', 'uel0103', 'uel0104', 'uel0106', 'uel0201' },
    { 'uel0101', 'uel0101', 'uel0104', 'uel0106', 'uel0106' }
}

-- List of possible Tech 2 UEF land units
tech2UEFUnits = {
    { 'uel0202', 'uel0111', 'uel0205', 'uel0307' },
    { 'uel0202', 'uel0111', 'uel0205', 'uel0307' }
}

-- List of possible Tech 3 UEF land units
tech3UEFUnits = {
    { 'uel0303', 'uel0304', 'xel0305' },
    { 'uel0303', 'uel0304', 'xel0305' }
}

-- List of possible Tech 4 UEF land units
tech4UEFUnits = {
    { 'uel0401' },
    { 'uel0401' }
}
-- List of possible Tech 1 Cybran land units
tech1CybranUnits = {
    { 'url0101', 'url0103', 'url0104', 'url0106', 'url0107' },
    { 'url0101', 'url0107', 'url0104', 'url0107', 'url0106' }
}

-- List of possible Tech 2 Cybran land units
tech2CybranUnits = {
    { 'url0202', 'url0203', 'url0205', 'url0306', 'url0111'},
    { 'url0202', 'url0202', 'url0205', 'url0306' }
}

-- List of possible Tech 3 Cybran land units
tech3CybranUnits = {
    { 'url0303', 'url0304', 'xrl0305', 'drlk001' },
    { 'url0303', 'url0304', 'xrl0005', 'xrl0005' },
    { 'xrl0305','xrl0305','xrl0305','xrl0005' }
}

-- List of possible Tech 4 Cybran land units
tech4CybranUnits = {
    { 'url0403','url0303', 'url0304', 'xrl0305', 'drlk001' },
    { 'url0402','url0303', 'url0304', 'xrl0305', 'drlk001' }
}

