function Alert(title, message, time, type)
	SendNUIMessage({
		action = 'open',
		title = title,
		type = type,
		message = message,
		time = time,
	})
end

-- Client side

--exports['lucas_notify']:Alert("Title", "Message", Time, 'type')

-- Server side

--TriggerClientEvent('lucas_notify:Alert', source, "Title", "Message", Time, 'type')

RegisterNetEvent('lucas_notify:Alert')
AddEventHandler('lucas_notify:Alert', function(title, message, time, type)
	Alert(title, message, time, type)
end)

-- Example Commands - Delete them

RegisterCommand('success', function()
	exports['lucas_notify']:Alert("SUCCESS", "You have sent <span style='color:#47cf73'>420€</span> to Tommy!", 5000, 'success')
end)

RegisterCommand('info', function()
	exports['lucas_notify']:Alert("INFO", "Test!", 5000, 'info')
end)

RegisterCommand('error', function()
	exports['lucas_notify']:Alert("ERROR", "Please try again later!", 5000, 'error')
end)

RegisterCommand('warning', function()
	exports['lucas_notify']:Alert("WARNING", "You are getting nervous!", 5000, 'warning')
end)

RegisterCommand('phone', function()
	exports['lucas_notify']:Alert("SMS", "<span style='color:#f38847'>Tommy: </span> Where are you?", 5000, 'phonemessage')
end)

RegisterCommand('longtext', function()
	exports['lucas_notify']:Alert("LONG MESSAGE", "Lorem ipsum dolor sit amet, consectetur adipiscing elit e pluribus unum.", 5000, 'neutral')
end)