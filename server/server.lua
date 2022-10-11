local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('rsg_hunting:server:GetItemData', function(source, cb, itemName)
	local retval = false
	local Player = QBCore.Functions.GetPlayer(source)
	if Player ~= nil then 
		if Player.Functions.GetItemByName(itemName) ~= nil then
			retval = true
		end
	end
	cb(retval)
end)

-- check hunting permit
QBCore.Functions.CreateCallback('rsg_hunting:server:get:huntingcheck', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local huntingpermit = Ply.Functions.GetItemByName("huntingpermit")
	local weapon_sniperrifle = Ply.Functions.GetItemByName("weapon_sniperrifle")
	local weapon_knife = Ply.Functions.GetItemByName("weapon_knife")
    if huntingpermit ~= nil and weapon_sniperrifle ~= nil and weapon_knife ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-- give permit and equipment
RegisterNetEvent('rsg_hunting:server:getPermit', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local bankBalance = Player.PlayerData.money["bank"]
	if bankBalance >= Config.HuntingEquipment then
		Player.Functions.RemoveMoney("bank", Config.HuntingEquipment, "hunting-equipment")
		TriggerEvent('qb-bossmenu:server:addAccountMoney', "police", Config.HuntingEquipment)
		TriggerClientEvent('osrp-osmechanic:client:SendBillEmail', src, Config.RepairPrice)
		Player.Functions.AddItem('huntingpermit', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['huntingpermit'], "add")
		Player.Functions.AddItem('weapon_sniperrifle', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weapon_sniperrifle'], "add")
		Player.Functions.AddItem('weapon_knife', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weapon_knife'], "add")
		Player.Functions.AddItem('snp_ammo', 10)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['snp_ammo'], "add")
	else
		TriggerClientEvent('QBCore:Notify', src, 'You don\'t have enough money in your bank to do this!', 'error')
	end
end)

-- animals : deer (-664053099) / mtlion
-- large_pelt_g1 (best)
-- large_pelt_g2
-- large_pelt_g3
-- raw_meat

-- large reward
RegisterServerEvent('rsg_hunting:server:giveLargeReward')
AddEventHandler('rsg_hunting:server:giveLargeReward', function()
    local src = tonumber(source)
    local xPlayer = QBCore.Functions.GetPlayer(src)
	local randomNumber = math.random(1,3)
	local randomMeat = math.random(1,2)

	if randomNumber == 1 then
		-- hide
		xPlayer.Functions.AddItem('large_pelt_g1', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['large_pelt_g1'], "add")
		-- meat
		xPlayer.Functions.AddItem('raw_meat', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['raw_meat'], "add")
		-- notify
		TriggerClientEvent('QBCore:Notify', src, 'you skinned the animal and got a large grade 1 pelt & meat', 'success')
	elseif randomNumber == 2 then
		-- hide
		xPlayer.Functions.AddItem('large_pelt_g2', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['large_pelt_g2'], "add")
		-- meat
		xPlayer.Functions.AddItem('raw_meat', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['raw_meat'], "add")
		-- notify
		TriggerClientEvent('QBCore:Notify', src, 'you skinned the animal and got a large grade 2 pelt & meat', 'success')
	elseif randomNumber == 3 then
		-- hide
		xPlayer.Functions.AddItem('large_pelt_g3', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['large_pelt_g3'], "add")
		-- meat
		xPlayer.Functions.AddItem('raw_meat', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['raw_meat'], "add")
		-- notify
		TriggerClientEvent('QBCore:Notify', src, 'you skinned the animal and got a large grade 3 pelt & meat', 'success')
	else
		TriggerClientEvent('QBCore:Notify', src, 'something went wrong!', 'error')
	end
end)

-- animals : boar / coyote (1682622302)
-- medium_pelt_g1 (best)
-- medium_pelt_g2
-- medium_pelt_g3
-- raw_meat

-- medium reward
RegisterServerEvent('rsg_hunting:server:giveMediumReward')
AddEventHandler('rsg_hunting:server:giveMediumReward', function()
    local src = tonumber(source)
    local xPlayer = QBCore.Functions.GetPlayer(src)
	local randomNumber = math.random(1,3)
	local randomMeat = math.random(1,2)

	if randomNumber == 1 then
		-- hide
		xPlayer.Functions.AddItem('medium_pelt_g1', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['medium_pelt_g1'], "add")
		-- meat
		xPlayer.Functions.AddItem('raw_meat', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['raw_meat'], "add")
		-- notify
		TriggerClientEvent('QBCore:Notify', src, 'you skinned the animal and got a medium grade 1 pelt & meat', 'success')
	elseif randomNumber == 2 then
		-- hide
		xPlayer.Functions.AddItem('medium_pelt_g2', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['medium_pelt_g2'], "add")
		-- notify
		TriggerClientEvent('QBCore:Notify', src, 'you skinned the animal and got a medium grade 2 pelt & meat', 'success')
	elseif randomNumber == 3 then
		-- hide
		xPlayer.Functions.AddItem('medium_pelt_g3', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['medium_pelt_g3'], "add")
		-- notify
		TriggerClientEvent('QBCore:Notify', src, 'you skinned the animal and got a medium grade 3 pelt & meat', 'success')
	else
		TriggerClientEvent('QBCore:Notify', src, 'something went wrong!', 'error')
	end
end)

-- small_pelt_g1 (best)
-- small_pelt_g2
-- small_pelt_g3

-- small reward
RegisterServerEvent('rsg_hunting:server:giveSmallReward')
AddEventHandler('rsg_hunting:server:giveSmallReward', function()
    local src = tonumber(source)
    local xPlayer = QBCore.Functions.GetPlayer(src)
	local randomNumber = math.random(1,3)
	local randomMeat = math.random(1,2)

	if randomNumber == 1 then
		-- hide
		xPlayer.Functions.AddItem('small_pelt_g1', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['small_pelt_g1'], "add")
		-- meat
		xPlayer.Functions.AddItem('raw_meat', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['raw_meat'], "add")
		-- notify
		TriggerClientEvent('QBCore:Notify', src, 'you skinned the animal and got a small grade 1 pelt & meat', 'success')
	elseif randomNumber == 2 then
		-- hide
		xPlayer.Functions.AddItem('small_pelt_g2', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['small_pelt_g2'], "add")
		-- notify
		TriggerClientEvent('QBCore:Notify', src, 'you skinned the animal and got a small grade 2 pelt & meat', 'success')
	elseif randomNumber == 3 then
		-- hide
		xPlayer.Functions.AddItem('small_pelt_g3', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['small_pelt_g3'], "add")
		-- notify
		TriggerClientEvent('QBCore:Notify', src, 'you skinned the animal and got a small grade 3 pelt & meat', 'success')
	else
		TriggerClientEvent('QBCore:Notify', src, 'something went wrong!', 'error')
	end
end)

RegisterServerEvent("rsg_hunting:server:sellPelts")
AddEventHandler("rsg_hunting:server:sellPelts", function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local price = 0
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Player.PlayerData.items[k].name == "large_pelt_g1" then 
                    price = price + (Config.PeltItems["large_pelt_g1"]["price"] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("large_pelt_g1", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "large_pelt_g2" then 
                    price = price + (Config.PeltItems["large_pelt_g2"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("large_pelt_g2", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "large_pelt_g3" then 
                    price = price + (Config.PeltItems["large_pelt_g3"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("large_pelt_g3", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "medium_pelt_g1" then 
                    price = price + (Config.PeltItems["medium_pelt_g1"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("medium_pelt_g1", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "medium_pelt_g2" then 
                    price = price + (Config.PeltItems["medium_pelt_g2"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("medium_pelt_g2", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "medium_pelt_g3" then 
                    price = price + (Config.PeltItems["medium_pelt_g3"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("medium_pelt_g3", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "small_pelt_g1" then 
                    price = price + (Config.PeltItems["small_pelt_g1"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("small_pelt_g1", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "small_pelt_g2" then 
                    price = price + (Config.PeltItems["small_pelt_g2"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("small_pelt_g2", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "small_pelt_g3" then 
                    price = price + (Config.PeltItems["small_pelt_g3"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("small_pelt_g3", Player.PlayerData.items[k].amount, k)
				-- remove permit, weapon and ammo
				elseif Player.PlayerData.items[k].name == "huntingpermit" then 
                    price = price + (Config.PeltItems["huntingpermit"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("huntingpermit", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "weapon_sniperrifle" then 
                    price = price + (Config.PeltItems["weapon_sniperrifle"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("weapon_sniperrifle", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "weapon_knife" then 
                    price = price + (Config.PeltItems["weapon_knife"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("weapon_knife", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "snp_ammo" then 
                    price = price + (Config.PeltItems["snp_ammo"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("snp_ammo", Player.PlayerData.items[k].amount, k)
                end
            end
        end
        Player.Functions.AddMoney("cash", price, "sold-pelts")
		TriggerClientEvent('QBCore:Notify', src, 'Thank you, I have sent your reciept via email', 'success')
		TriggerClientEvent('rsg_hunting:clent:peltssoldMail', src, price)
	end
end)