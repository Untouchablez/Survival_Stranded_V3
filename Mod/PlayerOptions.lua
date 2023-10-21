--- Made by GaryTheGoat --- 
--- Please do not amend / upload / copy any content without permission
--- feedback welcome samcaunt@hotmail.co.uk

local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')
local UIUtil = import('/lua/ui/uiutil.lua')
local LayoutHelpers = import('/lua/maui/layouthelpers.lua')
local GameMain = import('/lua/ui/game/gamemain.lua')
local Group = import('/lua/maui/group.lua').Group
local Checkbox = import('/lua/maui/checkbox.lua').Checkbox
local Bitmap = import('/lua/maui/bitmap.lua').Bitmap
local Text = import('/lua/maui/text.lua').Text

local options = {'Option 1', 'Option 2', 'Option 3', 'Option 4'}

local controls = {}
local savedParent = false

function CreateOptionUI(parent)
    savedParent = parent
    
    controls.bg = Group(savedParent)
    controls.bg.Depth:Set(10)
    
    controls.options = {}
    
    for i, optionText in ipairs(options) do
        controls.options[i] = Checkbox(controls.bg)
        controls.options[i].label = UIUtil.CreateText(controls.bg, optionText, 16, UIUtil.bodyFont)
        
        controls.options[i]:SetCheck(false, true)
        controls.options[i].OnCheck = function(self, checked)
            if checked then
                -- Player has selected this option
                self.label:SetColor('ff00ff00') -- Change text color to indicate selection
                HandleOptionSelected(optionText)
            else
                self.label:SetColor('ffffffff') -- Reset text color
            end
        end
        
        LayoutHelpers.AtLeftTopIn(controls.options[i], controls.bg, 10, 10 + (i-1)*30)
        LayoutHelpers.RightOf(controls.options[i].label, controls.options[i], 10)
    end
    
    -- Add a button to submit selections if needed
    -- local submitButton = UIUtil.CreateButtonWithDropshadow(controls.bg, '/buttons/large/', 'Submit')
    -- submitButton.Left:Set(function() return controls.bg.Right() - 110 end)
    -- submitButton.Top:Set(function() return controls.bg.Bottom() - 40 end)
    -- submitButton.OnClick = function(self)
    --     HandleSubmitButtonClick()
    -- end
end

function HandleOptionSelected(selectedOption)
    -- Implement logic for when a player selects an option
    LOG("Player selected option: " .. selectedOption)
end

-- Uncomment the following function if you want to handle button click
-- function HandleSubmitButtonClick()
--     -- Implement logic for when the submit button is clicked
--     LOG("Submit button clicked")
-- end

function ToggleOptionUI(state)
    if state or controls.bg:IsHidden() then
        controls.bg:Show()
    else
        controls.bg:Hide()
    end
end