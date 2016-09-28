Assets = {
	Asset("ATLAS", "images/status_bgs.xml")
}

local Widget = GLOBAL.require('widgets/widget')
local Image = GLOBAL.require('widgets/image')
local Text = GLOBAL.require('widgets/text')
local Badge = GLOBAL.require("widgets/badge")
local Houndbadge = GLOBAL.require("widgets/houndbadge")

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

	self.attackDay = self:AddChild(Houndbadge("HoundAttack", self.owner))
	
	self.inst:ListenForEvent("cycleschanged",
		function(inst)
			local _timeToAttack = GLOBAL.TheWorld.components.hounded:GetTimeToAttack()
			local timeToAttack = second2Day(_timeToAttack)
			if timeToAttack <= 2 then
				self.attackDay.num:SetString(attackString(timeToAttack))
			end

				print("Hound attack: " .. _timeToAttack)
		end,
		GLOBAL.TheWorld)

	self.attackDay:SetPosition(60, 50, 0)
	self.attackDay:SetScale(.6, .6, .6)
	
end
if ENABLE_HOUND_ATTACK then
	AddClassPostConstruct("widgets/controls", HoundAttack)
end
