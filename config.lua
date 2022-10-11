Config = {}

Config.HuntingEquipment = 5000 -- cost of permit and equipment use

Config.PeltItems = {
	
	-- pelts
    ["large_pelt_g1"] = { ["price"] = 300 },
    ["large_pelt_g2"] = { ["price"] = 275 },
    ["large_pelt_g3"] = { ["price"] = 250 },
    ["medium_pelt_g1"] = { ["price"] = 200 },
    ["medium_pelt_g2"] = { ["price"] = 175 },
    ["medium_pelt_g3"] = { ["price"] = 150 },
    ["small_pelt_g1"] = { ["price"] = 100 },
    ["small_pelt_g2"] = { ["price"] = 75 },
    ["small_pelt_g3"] = { ["price"] = 50 },
	--hunting equipment refund
	["huntingpermit"] = { ["price"] = 0 }, -- value to be added to the deposit refund
	["weapon_sniperrifle"] = { ["price"] = 4000 }, -- value to be added to the deposit refund
	["weapon_knife"] = { ["price"] = 0 }, -- value to be added to the deposit refund
	["snp_ammo"] = { ["price"] = 0 }, -- value to be added to the deposit refund
}

Config.Invincible = true -- Is the ped going to be invincible?
Config.Frozen = true -- Is the ped frozen in place?
Config.Stoic = true -- Will the ped react to events around them?
Config.FadeIn = true -- Will the ped fade in and out based on the distance. (Looks a lot better.)
Config.DistanceSpawn = 20.0 -- Distance before spawning/despawning the ped. (GTA Units.)

Config.MinusOne = true -- Leave this enabled if your coordinates grabber does not -1 from the player coords.

Config.GenderNumbers = { -- No reason to touch these.
	['male'] = 4,
	['female'] = 5
}

Config.HuntingList = {

	{
        model = `s_f_y_ranger_01`, -- hunting ranger
        coords = vector4(377.45596, 791.71527, 190.40863, 272.32366),
        gender = 'female',
        scenario = 'WORLD_HUMAN_CLIPBOARD'
    },
}