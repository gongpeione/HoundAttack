local Widget = GLOBAL.require('widgets/widget')

local ENABLE_HOUND_ATTACK = GetModConfigData("enable_houndattack")
local STRING_FORMAT = GetModConfigData("format")

-- A full Day lasts for 8 real-time minutes
local secADay = 8 * 60
local function second2Day(val) 
	return math.floor(val / secADay)
end
local function attackString(timeToAttack)
	if STRING_FORMAT == "complex" then
		return timeToAttack  .. 'Days'
	elseif STRING_FORMAT == "simple" then
		return timeToAttack  .. 'd'
	end
end

local function HoundAttack(self)
	
	self.inst:ListenForEvent("cycleschanged",
		function(inst)
			local _timeToAttack = GLOBAL.TheWorld.components.hounded:GetTimeToAttack()
			local timeToAttack = second2Day(_timeToAttack)
			if timeToAttack <= 2 then
				GLOBAL.TheNet:Announce(attackString(timeToAttack))
			end
			print("Hound attack: " .. _timeToAttack)
		end,
		GLOBAL.TheWorld)

end
if ENABLE_HOUND_ATTACK then
	AddClassPostConstruct("widgets/controls", HoundAttack)
end
