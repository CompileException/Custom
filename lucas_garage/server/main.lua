ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)


ESX.RegisterServerCallback('lucas_garage:loadVehicles', function(source, cb)
	local ownedCars = {}
	local s = source
	local x = ESX.GetPlayerFromId(s)
	
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE `owner` = @owner AND `stored` = 1 AND `job` = @job', {['@owner'] = x.identifier, ['@job'] = 'civ'}, function(vehicles)

		for _,v in pairs(vehicles) do
			local vehicle = json.decode(v.vehicle)
			table.insert(ownedCars, {vehicle = vehicle, stored = v.stored, plate = v.plate})
		end
		cb(ownedCars)
	end)
end)

ESX.RegisterServerCallback('lucas_garage:loadVehicle', function(source, cb, plate)
	
	local s = source
	local x = ESX.GetPlayerFromId(s)
	
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE `plate` = @plate', {['@plate'] = plate}, function(vehicle)

		
		cb(vehicle)
	end)
end)


MySQL.ready(function()

	MySQL.Async.execute("DELETE FROM vehicle_parking", { })

	MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = true WHERE `stored` = @stored', {
		['@stored'] = false
	}, function(rowsChanged)
		if rowsChanged > 0 then
			print(('lucas_garage: %s vehicle(s) have been stored!'):format(rowsChanged))
		end
	end)
end)

ESX.RegisterServerCallback('lucas_garage:isOwned', function(source, cb, plate)
	
	local s = source
	local x = ESX.GetPlayerFromId(s)

	local s = source
	local x = ESX.GetPlayerFromId(s)
	
	MySQL.Async.fetchAll('SELECT `vehicle` FROM owned_vehicles WHERE `plate` = @plate AND `owner` = @owner', {['@plate'] = plate, ['@owner'] = x.identifier}, function(vehicle)
		if next(vehicle) then
			cb(true)
		else
			cb(false)
		end
	end)
end)

RegisterNetEvent('lucas_garage:changeState')
AddEventHandler('lucas_garage:changeState', function(plate, state)
	MySQL.Sync.execute("UPDATE owned_vehicles SET `stored` = @state WHERE `plate` = @plate", {['@state'] = state, ['@plate'] = plate})
end)

RegisterNetEvent('lucas_garage:saveProps')
AddEventHandler('lucas_garage:saveProps', function(plate, props)
	local xProps = json.encode(props)
	MySQL.Sync.execute("UPDATE owned_vehicles SET `vehicle` = @props WHERE `plate` = @plate", {['@plate'] = plate, ['@props'] = xProps})
end)


--------------------------------------------------- IMPOUND BEREICH --------------------------------------------------------------------
--------------------------------------------------- IMPOUND BEREICH --------------------------------------------------------------------
--------------------------------------------------- IMPOUND BEREICH --------------------------------------------------------------------
--------------------------------------------------- IMPOUND BEREICH --------------------------------------------------------------------
--------------------------------------------------- IMPOUND BEREICH --------------------------------------------------------------------

-- Abfrage Fahrzeugbesitz
ESX.RegisterServerCallback('lucas_garage:getOwnedCars', function(source, cb)
	local ownedCars = {}
	local xPlayer = ESX.GetPlayerFromId(source)

	if Config.DontShowPoundCarsInGarage == true then
		MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND Type = @Type AND job = @job AND `stored` = @stored', { -- job = NULL
			['@owner'] = xPlayer.identifier,
			['@Type'] = 'car',
			['@job'] = 'civ',
			['@stored'] = true
		}, function(data)
			for _,v in pairs(data) do
				local vehicle = json.decode(v.vehicle)
				table.insert(ownedCars, {vehicle = vehicle, stored = v.stored, plate = v.plate})
			end
			cb(ownedCars)
		end)
	end
end)

-- Abfrage Fahrzeugbesitz (ausserhalb Garage)
ESX.RegisterServerCallback('lucas_garage:getOutOwnedCars', function(source, cb)
	local ownedCars = {}
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND Type = @Type AND job = @job AND `stored` = @stored', { -- job = NULL
		['@owner'] = xPlayer.identifier,
		['@Type'] = 'car',
		['@job'] = 'civ',
		['@stored'] = false
	}, function(data) 
		for _,v in pairs(data) do
			local vehicle = json.decode(v.vehicle)
			table.insert(ownedCars, vehicle)
		end
		cb(ownedCars)
	end)
end)

-- Geld abfrage
ESX.RegisterServerCallback('lucas_garage:checkMoneyCars', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getMoney() >= Config.CarPoundPrice then
		cb(true)
	else
		cb(false)
	end
end)

-- Geld zahlen
RegisterServerEvent('lucas_garage:payCar')
AddEventHandler('lucas_garage:payCar', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeMoney(Config.CarPoundPrice)
	TriggerClientEvent('esx:showNotification', source, "Du hast: " .. Config.CarPoundPrice .. " € bezahlt")

	if Config.GiveSocietyMoney then
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
			account.addMoney(Config.CarPoundPrice)
		end)
	end
end)

-- State verändern
RegisterServerEvent('lucas_garage:setVehicleState')
AddEventHandler('lucas_garage:setVehicleState', function(plate, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = @stored WHERE plate = @plate', {
		['@stored'] = state,
		['@plate'] = plate
	}, function(rowsChanged)
		if rowsChanged == 0 then
			print(('lucas_garage: %s exploited the garage!'):format(xPlayer.identifier))
		end
	end)
end)
