---------------------------
------CHOSE SQL MODE-------
---------------------------
--Async   -----------------
--MySQL   -----------------
---------------------------

function debugprint(msg)
   print(msg)
end


local mode = "Async"

local lang = 'de'
local txt = {

    ['de'] = {
        ['welcome'] = 'Willkommen zuhause!',
        ['nocash'] = 'Du hast nicht genug Geld!',
        ['estVendu'] = 'Apartment verkauft!',
        ['depositcash'] = 'Du hast Geld abgelegt: ',
        ['withdraw'] = 'Du hast Geld abgehoben ',
        ['curency'] = '$'
    }
}


local isBuy = 0
local money = 0
local dirtymoney = 0


---------------------------
---GET APARTMENT METHODE---
---------------------------

RegisterServerEvent("lucas_houses:getAppart")
AddEventHandler('lucas_houses:getAppart', function(name)
  local source = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.getIdentifier()
    local name = name
    if (mode == "Async") then
      MySQL.Async.fetchAll("SELECT * FROM user_appartement WHERE name = @nom", {['@nom'] = tostring(name)}, function (result)
        if (result) then
          count = 0
          for _ in pairs(result) do
            count = count + 1
          end
          if count > 0 then
          	if (result[1].identifier == player) then
          		TriggerClientEvent('lucas_houses:isMine', source)
          	else
              	TriggerClientEvent('lucas_houses:isBuy', source)
          	end
          else
          	TriggerClientEvent('lucas_houses:isNotBuy', source)
          end
        end
      end)
    elseif mode == "MySQL" then
      local executed_query = MySQL:executeQuery("SELECT * FROM user_appartement WHERE name = @nom", {['@nom'] = tostring(name)})
      local result = MySQL:getResults(executed_query, {'identifier'})
      if (result) then
        count = 0
        for _ in pairs(result) do
          count = count +1
        end
        if count > 0 then
          if (result[1].identifier == player) then
            TriggerClientEvent('lucas_houses:isMine', source)
          else
            TriggerClientEvent('lucas_houses:isBuy', source)
          end
        else
          TriggerClientEvent('lucas_houses:isNotBuy', source)
        end
      end
    end
  end)
end)
					----------------------
					---  LOCK METHODE  ---
					----------------------
					
					-- UPDATE user_appartement SET `money`=@cash WHERE name = @nom",{['@cash'] = newmoney, ['@nom'] = apart}, function(data)
RegisterServerEvent("lucas_houses:setlockapartment")
AddEventHandler('lucas_houses:setlockapartment', function(status, apart)
	if (mode == "Async") then
		MySQL.Async.fetchAll("SELECT locked FROM user_appartement WHERE name = @nom", {['@nom'] = apart}, function (result)
            if (result) then
              MySQL.Async.execute("UPDATE user_appartement SET `locked`= @status WHERE name = @nom",{['@status'] = status, ['@nom'] = apart}, function(data)
              end)
            end
        end)
      end
    end)
	
RegisterServerEvent("lucas_houses:getlockstatus")
AddEventHandler('lucas_houses:getlockstatus', function(name)
  local source = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
  local player = user.getIdentifier()
  local name = name
  if (mode == "Async") then
     MySQL.Async.fetchAll("SELECT * FROM user_appartement WHERE name = @nom", {['@nom'] = tostring(name)}, function (result)
                if (result) then
                  status = result[1].locked
                  TriggerClientEvent('lucas_houses:getlockstatus', status)
                end
              end)
            elseif mode == "MySQL" then
              local executed_query = MySQL:executeQuery("SELECT * FROM user_appartement WHERE name = @nom", {['@nom'] = tostring(name)})
              local result = MySQL:getResults(executed_query, {'identifier'})
              if (result) then
                money = result[1].money
                dirtymoney = result[1].dirtymoney
                TriggerClientEvent('lucas_houses:getlockstatus', status)
              end
            end
          end)
        end)
					----------------------
					---GET CASH METHODE---
					----------------------

RegisterServerEvent("lucas_houses:getCash")
AddEventHandler('lucas_houses:getCash', function(name)
  local source = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.getIdentifier()
    local name = name
    if (mode == "Async") then
      MySQL.Async.fetchAll("SELECT * FROM user_appartement WHERE name = @nom", {['@nom'] = tostring(name)}, function (result)
        if (result) then
          money = result[1].money
          dirtymoney = result[1].dirtymoney
          TriggerClientEvent('lucas_houses:getCash', source, money, dirtymoney)
        end
      end)
    elseif mode == "MySQL" then
      local executed_query = MySQL:executeQuery("SELECT * FROM user_appartement WHERE name = @nom", {['@nom'] = tostring(name)})
      local result = MySQL:getResults(executed_query, {'identifier'})
      if (result) then
        money = result[1].money
        dirtymoney = result[1].dirtymoney
        TriggerClientEvent('lucas_houses:getCash', source, money, dirtymoney)
      end
    end
  end)
end)

					----------------------
					--DEPOSIT CASH METHODE
					----------------------

RegisterServerEvent("lucas_houses:depositcash")
AddEventHandler('lucas_houses:depositcash', function(cash, apart)
  local source = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.getIdentifier()
    local money = 0
    if (tonumber(user.getMoney()) >= tonumber(cash) and tonumber(cash) > 0) then
      if mode == "Async" then
        MySQL.Async.fetchAll("SELECT money FROM user_appartement WHERE name = @nom", {['@nom'] = apart}, function (result)
            if (result) then
              money = result[1].money
              user.removeMoney(tonumber(cash))
              local newmoney = money + cash
              MySQL.Async.execute("UPDATE user_appartement SET `money`=@cash WHERE name = @nom",{['@cash'] = newmoney, ['@nom'] = apart}, function(data)
              end)
              --TriggerClientEvent("pNotify:SendNotification", -1, {text = txt[lang]['deposit'] .. cash .. txt[lang]['curency'] , type = "success", timeout = 5000, layouts = "bottomCenter"})
            end
        end)
      elseif mode == "MySQL" then
        local executed_query = MySQL:executeQuery("SELECT money FROM user_appartement WHERE name = @nom", {['@nom'] = apart})
        local result = MySQL:getResults(executed_query, {'money'})
        if (result) then
          money = result[1].money
          user.removeMoney(tonumber(cash))
          local newmoney = money + cash
          MySQL:executeQuery("UPDATE user_appartement SET `money`=@cash WHERE name = @nom",{['@cash'] = newmoney, ['@nom'] = apart})
          --TriggerClientEvent("pNotify:SendNotification", -1, {text = txt[lang]['deposit'] .. cash .. txt[lang]['curency'] , type = "success", timeout = 5000, layouts = "bottomCenter"})
        end
      end

      TriggerClientEvent('lucas_houses:getCash', source, money, dirtymoney)
    else
      --TriggerClientEvent("pNotify:SendNotification", -1, {text = txt[lang]['nocash'], type = "error", timeout = 5000, layouts = "bottomCenter"})
    end
  end)
end)

					----------------------
					--SCHWARZGELD WEGLEGEN
					----------------------

RegisterServerEvent("lucas_houses:depositdirtycash")
AddEventHandler('lucas_houses:depositdirtycash', function(cash, apart)
  local source = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.getIdentifier()
    local money = 0
    if (tonumber(user.getDirtyMoney()) >= tonumber(cash) and tonumber(cash) > 0) then
      if mode == "Async" then
        MySQL.Async.fetchAll("SELECT dirtymoney FROM user_appartement WHERE name = @nom", {['@nom'] = apart}, function (result)
            if (result) then
              money = result[1].dirtymoney
              user.removeDirtyMoney(tonumber(cash))
              local newmoney = money + cash
              MySQL.Async.execute("UPDATE user_appartement SET `dirtymoney`=@cash WHERE name = @nom",{['@cash'] = newmoney, ['@nom'] = apart}, function(data)
              end)
              --TriggerClientEvent("pNotify:SendNotification", -1, {text = txt[lang]['deposit'] .. cash .. txt[lang]['curency'] , type = "success", timeout = 5000, layouts = "bottomCenter"})
            end
        end)
      elseif mode == "MySQL" then
        local executed_query = MySQL:executeQuery("SELECT dirtymoney FROM user_appartement WHERE name = @nom", {['@nom'] = apart})
        local result = MySQL:getResults(executed_query, {'dirtymoney'})
        if (result) then
          money = result[1].dirtymoney
          user.removeDirtyMoney(tonumber(cash))
          local newmoney = money + cash
          MySQL:executeQuery("UPDATE user_appartement SET `dirtymoney`=@cash WHERE name = @nom",{['@cash'] = newmoney, ['@nom'] = apart})
          --TriggerClientEvent("pNotify:SendNotification", -1, {text = txt[lang]['deposit'] .. cash .. txt[lang]['curency'] , type = "success", timeout = 5000, layouts = "bottomCenter"})
        end
      end

      TriggerClientEvent('lucas_houses:getCash', source, money, dirtymoney)
    else
      --TriggerClientEvent("pNotify:SendNotification", -1, {text = txt[lang]['nocash'], type = "error", timeout = 5000, layouts = "bottomCenter"})
    end
  end)
end)

					----------------------
					---GELD NEHMEN---
					----------------------

RegisterServerEvent("lucas_houses:takecash")
AddEventHandler('lucas_houses:takecash', function(cash, apart)
  local source = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.getIdentifier()
    local money = 0
    if mode == "Async" then
      MySQL.Async.fetchAll("SELECT money FROM user_appartement WHERE name = @nom", {['@nom'] = apart}, function (result)
          if (result) then
            money = result[1].money
            if (tonumber(cash) <= tonumber(money) and tonumber(cash) > 0) then
              user.addMoney(tonumber(cash))
              local newmoney = money - cash
              MySQL.Async.execute("UPDATE user_appartement SET `money`=@cash WHERE name = @nom",{['@cash'] = newmoney, ['@nom'] = apart}, function(data)
              end)
              --TriggerClientEvent("pNotify:SendNotification", -1, {text = txt[lang]['withdraw'] .. cash .. txt[lang]['curency'] , type = "success", timeout = 5000, layouts = "bottomCenter"})
            else
              --TriggerClientEvent("pNotify:SendNotification", -1, {text = txt[lang]['nocash'], type = "error", timeout = 5000, layouts = "bottomCenter"})
            end
          end
      end)
    elseif mode == "MySQL" then
      local executed_query = MySQL:executeQuery("SELECT money FROM user_appartement WHERE name = @nom", {['@nom'] = apart})
      local result = MySQL:getResults(executed_query, {'money'})
      if (result) then
        money = result[1].money
        if (tonumber(cash) <= tonumber(money) and tonumber(cash) > 0) then
          user.addMoney(tonumber(cash))
          local newmoney = money - cash
          MySQL:executeQuery("UPDATE user_appartement SET `money`=@cash WHERE name = @nom",{['@cash'] = newmoney, ['@nom'] = apart})
          --TriggerClientEvent("pNotify:SendNotification", -1, {text = txt[lang]['withdraw'] .. cash .. txt[lang]['curency'] , type = "success", timeout = 5000, layouts = "bottomCenter"})
        else
          --TriggerClientEvent("pNotify:SendNotification", -1, {text = txt[lang]['nocash'], type = "error", timeout = 5000, layouts = "bottomCenter"})
        end
      end
    end

    TriggerClientEvent('lucas_houses:getCash', source, money, dirtymoney)
  end)
end)

					----------------------
					---SCHWARZGELD NEHMEN-
					----------------------

RegisterServerEvent("lucas_houses:takedirtycash")
AddEventHandler('lucas_houses:takedirtycash', function(cash, apart)
  local source = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.getIdentifier()
    local money = 0
    if mode == "Async" then
      MySQL.Async.fetchAll("SELECT dirtymoney FROM user_appartement WHERE name = @nom", {['@nom'] = apart}, function (result)
          if (result) then
            money = result[1].dirtymoney
            if (tonumber(cash) <= tonumber(money) and tonumber(cash) > 0) then
              user.addDirtyMoney(tonumber(cash))
              local newmoney = money - cash
              MySQL.Async.execute("UPDATE user_appartement SET `dirtymoney`=@cash WHERE name = @nom",{['@cash'] = newmoney, ['@nom'] = apart}, function(data)
              end)
              --TriggerClientEvent("pNotify:SendNotification", -1, {text = txt[lang]['withdraw'] .. cash .. txt[lang]['curency'] , type = "success", timeout = 5000, layouts = "bottomCenter"})
            else
              --TriggerClientEvent("pNotify:SendNotification", -1, {text = txt[lang]['nocash'], type = "error", timeout = 5000, layouts = "bottomCenter"})
            end
          end
      end)
    elseif mode == "MySQL" then
      local executed_query = MySQL:executeQuery("SELECT dirtymoney FROM user_appartement WHERE name = @nom", {['@nom'] = apart})
      local result = MySQL:getResults(executed_query, {'dirtymoney'})
      if (result) then
        money = result[1].dirtymoney
        if (tonumber(cash) <= tonumber(money) and tonumber(cash) > 0) then
          user.addDirtyMoney(tonumber(cash))
          local newmoney = money - cash
          MySQL:executeQuery("UPDATE user_appartement SET `dirtymoney`=@cash WHERE name = @nom",{['@cash'] = newmoney, ['@nom'] = apart})
          --TriggerClientEvent("pNotify:SendNotification", -1, {text = txt[lang]['withdraw'] .. cash .. txt[lang]['curency'] , type = "success", timeout = 5000, layouts = "bottomCenter"})
        else
          --TriggerClientEvent("pNotify:SendNotification", -1, {text = txt[lang]['nocash'], type = "error", timeout = 5000, layouts = "bottomCenter"})
        end
      end
    end

    TriggerClientEvent('lucas_houses:getCash', source, money, dirtymoney)
  end)
end)

					----------------------
					---APARTMENT KAUFEN---
					----------------------

RegisterServerEvent("lucas_houses:buyAppart")
AddEventHandler('lucas_houses:buyAppart', function(name, price)
  local source = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.getIdentifier()
    local name = name
    local price = price
    if (tonumber(user.getMoney()) >= tonumber(price)) then
        user.removeMoney(tonumber(price))
      if (mode == "Async") then
    	  MySQL.Async.execute("INSERT INTO user_appartement (`identifier`, `name`, `price`) VALUES (@username, @name, @price)", {['@username'] = player, ['@name'] = name, ['@price'] = price})
      elseif mode == "MySQL" then
        local executed_query2 = MySQL:executeQuery("INSERT INTO user_appartement (`identifier`, `name`, `price`) VALUES (@username, @name, @price)", {['@username'] = player, ['@name'] = name, ['@price'] = price})
      end
    	--TriggerClientEvent("pNotify:SendNotification", -1, {text = txt[lang]['welcome'], type = "success", timeout = 5000, layouts = "bottomCenter"})
    	TriggerClientEvent('lucas_houses:isMine', source)
    else
    	--TriggerClientEvent("pNotify:SendNotification", -1, {text = txt[lang]['nocash'], type = "error", timeout = 5000, layouts = "bottomCenter"})
    end
  end)
end)

					----------------------
					--APARTMENT VERKAUFEN
					----------------------

RegisterServerEvent("lucas_houses:sellAppart")
AddEventHandler('lucas_houses:sellAppart', function(name, price)
  local source = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.getIdentifier()
    local name = name
    local price = price/2
    user.addMoney(tonumber(price))
      if (mode == "Async") then
        MySQL.Async.execute("DELETE from user_appartement WHERE identifier = @username AND name = @name",
        {['@username'] = player, ['@name'] = name})
      elseif mode == "MySQL" then
        local executed_query3 = MySQL:executeQuery("DELETE from user_appartement WHERE identifier = @username AND name = @name",
        {['@username'] = player, ['@name'] = name})
      end
      --TriggerClientEvent("pNotify:SendNotification", -1, {text = txt[lang]['estVendu'], type = "success", timeout = 5000, layouts = "bottomCenter"})
      TriggerClientEvent('lucas_houses:isNotBuy', source)
  end)
end)