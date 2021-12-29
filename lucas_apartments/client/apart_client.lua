
function debugprint(msg)
   print(msg)
end

local displayApartBlips = false --SET TO TRUE IF YOU WANT TO ADD BLIPS FOR APPARTMENTS

local interiors = {
	
	---------------- VERKAUFT ----------------
	-- (SHLOROX)
	[1] = { ["price"] = 0, ["xe"] = -658.55, ["ye"] = 887.04, ["ze"] = 229.25, ["he"] = 0.00, 
	["xo"] = -786.9563, ["yo"] = 315.6229, ["zo"] = 187.9136, ["ho"] = 0.00, ["name"] = 'Modern 3 Apartment'},
	
	---------------- Low End Apartment (40000) (Grove) ----------------
	[2] = { ["price"] = 0, ["xe"] = 114.21, ["ye"] = -1960.95, ["ze"] = 21.33, ["he"] = 0.00, 
	["xo"] = 266.01, ["yo"] = -1007.21, ["zo"] = -101.01, ["ho"] = 0.00, ["name"] = 'Grove'},
	
	-- 3655 Wild Oats Drive (VERKAUFT) (xCutionTurTle)
	[3] = { ["price"] = 0, ["xe"] = -174.75, ["ye"] = 502.42, ["ze"] = 137.42, ["he"] = 0.00, 
	["xo"] = -174.17, ["yo"] = 497.37, ["zo"] = 137.67, ["ho"] = 0.00, ["name"] = '3655 Wild Oats Drive'}, 
	
	-- 2862 Hillcrest Avenue (VERKAUFT) (Freyberg)
	[4] = { ["price"] = 0, ["xe"] = -686.21, ["ye"] = 596.28, ["ze"] = 143.64, ["he"] = 0.00, 
	["xo"] = -676.127, ["yo"] = 588.612, ["zo"] = 145.1698, ["ho"] = 0.00, ["name"] = '2862 Hillcrest Avenue'}, 	
	
	---------------- MOTEL (10000)----------------
	--[3] = { ["price"] = 10000000, ["xe"] = 292.14, ["ye"] = -1078.53, ["ze"] = 29.41, ["he"] = 0.00, 
	--["xo"] = 152.2605, ["yo"] = -1004.471, ["zo"] = -98.99999, ["ho"] = 0.00, ["name"] = 'Motel'},
	
	---------------- Medium End Apartment(50000)----------------
	--[4] = { ["price"] = 50000000, ["xe"] = -85.76, ["ye"] = -1284.58, ["ze"] = 29.3, ["he"] = 0.00, 
	--["xo"] = 346.59, ["yo"] = -1013.14, ["zo"] = -99.2, ["ho"] = 0.00, ["name"] = 'Medium End Apartment'},

	
	---------------- Aqua 1 Apartment ----------------
    --[1] = { ["price"] = 350000, ["xe"] = -618.216, ["ye"] = 35.477, ["ze"] = 43.54, ["he"] = 0.000, ["xo"] = -786.9469, ["yo"] = 315.5655, ["zo"] = 217.6383, ["ho"] = 0.000, ["name"] = 'Luxus Apartment'},
	
    --[2] = { ["price"] = 350000, ["xe"] = -1910.7265625, ["ye"] = -576.919189453125, ["ze"] = 19.0969314575195, ["he"] = 0.00, ["xo"] = -1910.099609375, ["yo"] = -574.97265625, ["zo"] = 19.0956039428711, ["ho"] = 0.00, ["name"] = 'Büro am Strand'},
	
	--[3] = { ["price"] = 350000, ["xe"] = 119.249359130859, ["ye"] = 564.305969238281, ["ze"] = 183.96142578125, ["he"] = 0.00, ["xo"] = 117.411087036133, ["yo"] = 559.382934570313, ["zo"] = 184.30485534668, ["ho"] = 0.00, ["name"] = 'Premium Haus #1'},
    
	--[4] = { ["price"] = 350000, ["xe"] = 374.177398681641, ["ye"] = 427.730651855469, ["ze"] = 145.684204101563, ["he"] = 0.00, ["xo"] = 373.5234375, ["yo"] = 423.222930908203, ["zo"] = 145.90788269043, ["ho"] = 0.00, ["name"] = 'Premium Haus #2'},
    
	
	---------------- NORMALE APARTMENTS ----------------
	
	--2862 Hillcrest Avenue (Mody 1 Apartment)
	--[4] = { ["price"] = 100000000, ["xe"] = -686.21, ["ye"] = 596.28, ["ze"] = 143.64, ["he"] = 0.00, 
	--["xo"] = -787.0749, ["yo"] = 315.8198, ["zo"] = 217.6386, ["ho"] = 0.00, ["name"] = '2862 Hillcrest Avenue'},
	
	---787.029, 315.7113, 217.6385
	--2868 Hillcrest Avenue
	--[5] = { ["price"] = 100000000, ["xe"] = -753.11, ["ye"] = 620.54, ["ze"] = 142.71, ["he"] = 0.00, 
	--["xo"] = -787.029, ["yo"] = 315.7113, ["zo"] = 217.6385, ["ho"] = 0.00, ["name"] = '2868 Hillcrest Avenue'},
	
	---774.0349, 342.0296, 196.6862
	--2874 Hillcrest Avenue
	--[5] = { ["price"] = 100000000, ["xe"] = -852.93, ["ye"] = 695.19, ["ze"] = 148.99, ["he"] = 0.00, 
	--["xo"] = -774.0349, ["yo"] = 342.0296, ["zo"] = 196.6862, ["ho"] = 0.00, ["name"] = '2874 Hillcrest Avenue'},
    
    
	---------------- BÜROS ----------------
	--Executive Rich MAZEBANK
	--[13] = { ["price"] = 1500000, ["xe"] = -66.55, ["ye"] = -802.26, ["ze"] = 44.23, ["he"] = 0.00, 
	--["xo"] = -75.8466, ["yo"] = -826.9893, ["zo"] = 243.3859, ["ho"] = 0.00, ["name"] = 'Büro: Mazenank'},
	
	--Executive Rich LOMBANK
	--[14] = { ["price"] = 1500000, ["xe"] = -1581.2, ["ye"] = -558.33, ["ze"] = 34.95, ["he"] = 0.00, 
	--["xo"] = -1579.677, ["yo"] = -565.0689, ["zo"] = 108.5229, ["ho"] = 0.00, ["name"] = 'Büro Lombank'},
	
	--Arcadius Business Centre
	--[15] = { ["price"] = 1500000, ["xe"] = -117.52, ["ye"] = -605.84, ["ze"] = 36.28, ["he"] = 0.00, 
    --["xo"] = -141.1987, ["yo"] = -620.913, ["zo"] = 168.8205, ["ho"] = 0.00, ["name"] = 'Arcadius Business Centre'},
    
	
	---------------- Leuchtturm ----------------
					
	--[16] = { ["price"] = 1000000, ["xe"] = 3310.88, ["ye"] = 5176.25, ["ze"] = 19.61, ["he"] = 0.00, 
    --["xo"] = -786.8663, ["yo"] = 315.7642, ["zo"] = 217.6385, ["ho"] = 0.00, ["name"] = 'Leuchtturm Haus'},
	

    ---------------- LAGERHÄUSER ----------------
	
    --[15] = { ["price"] = 150000, ["xe"] = -514.18, ["ye"] = -2201.18, ["ze"] = 6.39, ["he"] = 0.00, ["xo"] = 1094.988, ["yo"] = -3101.776, ["zo"] = -39.00363, ["ho"] = 0.00, ["name"] = 'Kleines Lagerhaus'},
    --[16] = { ["price"] = 250000, ["xe"] = 236.98, ["ye"] = -3312.16, ["ze"] = 5.79, ["he"] = 0.00, ["xo"] = -1505.783, ["yo"] = -3012.587, ["zo"] = -80.000, ["ho"] = 0.00, ["name"] = 'Mittleres Lagerhaus'},
    --[17] = { ["price"] = 250000, ["xe"] = 236.98, ["ye"] = -3312.16, ["ze"] = 5.79, ["he"] = 0.00, ["xo"] = -1505.783, ["yo"] = -3012.587, ["zo"] = -80.000, ["ho"] = 0.00, ["name"] = 'Großes Lagerhaus'},
}

local lang = 'de'

local txt = {
    ['de'] = {
        ['fermermenu'] = 'Menü schließen',
        ['sonner'] = 'Haus betreten',
        ['gohome'] = 'Betrete dein Apartment',
        ['vendre'] = 'Apartment verkaufen',
        ['acheter'] = 'Apartment kaufen',
        ['visiter'] = 'Apartment anschauen',
        ['menu'] = 'Drücke ~g~E~s~ um das Menü zu öffnen',
        ['soon'] = 'Comming Soon',
        ['exit'] = 'Apartment verlassen',
        ['retirerargent'] = 'Sauberes Geld abheben',
        ['retirersale'] = 'Schmutziges Geld abheben',
        ['deposerargent'] = 'Sauberes Geld einlagern',
        ['deposersale'] = 'Schmutziges Geld einlagern',
		
        ['betreten'] = 'Haus betreten',
        ['verkauft'] = 'Haus bereits verkauft',
        ['geschlossen'] = 'Haus: geschlossen',
        ['offen'] = 'Haus: offen'
    }
}

local entrer = false
local isBuy = 0
local money = 0
local dirtymoney = 0
local depositcash = false
local depositdirtycash = false
local depositapart = ""


distance = 50.5999 -- distance to draw
timer = 0
current_int = 0

---------------------
----isBuy Methode----
---------------------
 
RegisterNetEvent("herorp:isBuy")
AddEventHandler("herorp:isBuy", function()
  isBuy = 1
end)

----------------------
---isNotBuy METHODE---
----------------------
 
RegisterNetEvent("herorp:isNotBuy")
AddEventHandler("herorp:isNotBuy", function()
  isBuy = 0
end)

----------------------
----isMine Methode----
----------------------

RegisterNetEvent("herorp:isMine")
AddEventHandler("herorp:isMine", function()
  isBuy = 2
end)

----------------------
---getCash Methode----
----------------------

RegisterNetEvent("herorp:getCash")
AddEventHandler("herorp:getCash", function(moneyparm, dirtymoneyparm)
  money = moneyparm
  dirtymoney = dirtymoneyparm
end)

RegisterNetEvent("herorp:getlockstatus")
AddEventHandler("herorp:getlockstatus", function(statusparam)
  status = statusparam
    debugprint('' .. statusparam)

end)

function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
        N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - 0.1+w, y - 0.02+h)
end

function SetBlipTrade(id, text, color, x, y, z)
  local Blip = AddBlipForCoord(x, y, z)

  SetBlipSprite(Blip, id)
  SetBlipColour(Blip, color)
  SetBlipAsShortRange(Blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(text)
  EndTextCommandSetBlipName(Blip)
end
 
function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x , y)
end

----------------------
-----Inside Menu------
----------------------			

function MenuInsideAppartement()
	ped = GetPlayerPed(-1);
    MenuTitle = "  Appartment"
    ClearMenu()
 
    for i=1, #interiors do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xo,interiors[i].yo,interiors[i].zo, true) < 1.599 then
            TriggerServerEvent("herorp:getCash", interiors[i].name)
            Wait(250)
            if isBuy == 2 then
            	print(money)
            	print(dirtymoney)
                Menu.addButton("Sauberes Geld: " .. money .. " $","privetimuseless",nil)
                Menu.addButton("Schmutziges Geld: " .. dirtymoney .." $","privetimuseless",nil)
                Menu.addButton(txt[lang]['deposerargent'],"deposerargent",interiors[i].name)
                Menu.addButton(txt[lang]['deposersale'],"deposersale",interiors[i].name)
                Menu.addButton(txt[lang]['retirerargent'],"retirerargent",interiors[i].name)
                Menu.addButton(txt[lang]['retirersale'],"retirersale",interiors[i].name)
				
                Menu.addButton(txt[lang]['exit'],"Exit",nil)
            else
                Menu.addButton(txt[lang]['exit'],"Exit",nil)
            end
            Menu.addButton(txt[lang]['fermermenu'],"CloseMenu",nil)
        end
    end
end
function privetimuseless() 
end

function deposerargent(apart)
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	while UpdateOnscreenKeyboard() == 0 do
		DisableAllControlActions(0)
       	Wait(0);
    end
	if (GetOnscreenKeyboardResult()) then
		local txt = GetOnscreenKeyboardResult()
		if (string.len(txt) > 0) then
			TriggerServerEvent("herorp:depositcash", txt, apart)
			CloseMenu()
		end
	end
end

function deposersale(apart)
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	while UpdateOnscreenKeyboard() == 0 do
		DisableAllControlActions(0)
       	Wait(0);
    end
	if (GetOnscreenKeyboardResult()) then
		local txt = GetOnscreenKeyboardResult()
		if (string.len(txt) > 0) then
			TriggerServerEvent("herorp:depositdirtycash", txt, apart)
			CloseMenu()
		end
	end
end

function retirerargent(apart)
	print("coucou")
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	while UpdateOnscreenKeyboard() == 0 do
		DisableAllControlActions(0)
       	Wait(0);
    end
	if (GetOnscreenKeyboardResult()) then
		local txt = GetOnscreenKeyboardResult()
		if (string.len(txt) > 0) then
			print("ok c bon")
			TriggerServerEvent("herorp:takecash", txt, apart)
			CloseMenu()
		end
	end
end

function retirersale(apart)
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	while UpdateOnscreenKeyboard() == 0 do
		DisableAllControlActions(0)
       	Wait(0);
    end
	if (GetOnscreenKeyboardResult()) then
		local txt = GetOnscreenKeyboardResult()
		if (string.len(txt) > 0) then
			TriggerServerEvent("herorp:takedirtycash", txt, apart)
			CloseMenu()
		end
	end
end

---------------------
----EXIT Methode------
----------------------

function Exit()
	for i=1, #interiors do
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xo,interiors[i].yo,interiors[i].zo, true) < 1.599 then
			if timer == 0 then
			    DoScreenFadeOut(1000)
			    while IsScreenFadingOut() do Citizen.Wait(0) end
			    NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
			    Wait(1000)
			    SetEntityCoords(GetPlayerPed(-1), interiors[i].xe,interiors[i].ye,interiors[i].ze)
			    SetEntityHeading(GetPlayerPed(-1), interiors[i].ho)
			    NetworkFadeInEntity(GetPlayerPed(-1), 0)
			    Wait(1000)
			    current_int = i
			    timer = 5
			    SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
			    DoScreenFadeIn(1000)
			    Menu.hidden = true
			    while IsScreenFadingIn() do Citizen.Wait(0) end
			end
		end
	end
end

----------------------
----MENU AUSSEN-------
----------------------
 
function MenuAppartement()
    ped = GetPlayerPed(-1);
    MenuTitle = " Haus"
    ClearMenu()
 
    for i=1, #interiors do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < 1.599 then
		CloseMenu()
            TriggerServerEvent("herorp:getAppart", interiors[i].name)
            Wait(250)
			
			if isBuy == 1 then		
				Menu.addButton(txt[lang]['verkauft'], "CloseMenu",nil)
				
            elseif isBuy == 2 then
                Menu.addButton(txt[lang]['gohome'],"Visiter",nil)
                Menu.addButton(txt[lang]['vendre'],"Vendre",nil)
					
            else
                Menu.addButton("Preis: " .. interiors[i].price .. " $","privetimuseless",nil)
				Menu.addButton(txt[lang]['acheter'],"Acheter",nil)
                Menu.addButton(txt[lang]['visiter'],"Visiter",nil)
            end			
            Menu.addButton(txt[lang]['fermermenu'],"CloseMenu",nil)
        end
    end
end
 
function CloseMenu()
    Menu.hidden = true    
end

function Sonner()
    --exports.pNotify:SendNotification({text = txt[lang]['soon'], type = "error", timeout = 5000, layouts = "bottomCenter"})
end

function Vendre()
    for i=1, #interiors do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < 1.599 then
            TriggerServerEvent("herorp:sellAppart", interiors[i].name, interiors[i].price)
            CloseMenu()
        end
    end
end

function Acheter()
    for i=1, #interiors do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < 1.599 then
            TriggerServerEvent("herorp:buyAppart", interiors[i].name, interiors[i].price)
            CloseMenu()
        end
    end
end
 
function Visiter(i)
    for i=1, #interiors do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < 1.599 then
            if timer == 0 then
                DoScreenFadeOut(1000)
                while IsScreenFadingOut() do Citizen.Wait(0) end
                NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
                Wait(1000)
                SetEntityCoords(GetPlayerPed(-1), interiors[i].xo,interiors[i].yo,interiors[i].zo)
                SetEntityHeading(GetPlayerPed(-1), interiors[i].ho)
                NetworkFadeInEntity(GetPlayerPed(-1), 0)
                Wait(1000)
                current_int = i
                timer = 5
                SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
                DoScreenFadeIn(1000)
                Menu.hidden = true
                while IsScreenFadingIn() do Citizen.Wait(0) end
            end
        end
    end
end
 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if timer > 0 and current_int > 0 then DrawAdvancedText(0.707, 0.77, 0.005, 0.0028, 1.89, "~b~"..interiors[current_int].name, 255, 255, 255, 255, 1, 1) end
            for i=1, #interiors do
                if not IsEntityDead(PlayerPedId()) then
                    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < distance then
                        DrawMarker(1,interiors[i].xe,interiors[i].ye,interiors[i].ze-1.0001, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
                        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < 1.599 then
                            drawTxt(txt[lang]['menu'],0,1,0.5,0.8,0.6,255,255,255,255)
                            if IsControlJustPressed(1, 86) then
                                MenuAppartement()
                                Menu.hidden = not Menu.hidden
                            end
                            Menu.renderGUI()
                        end
                    end
                    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xo,interiors[i].yo,interiors[i].zo, true) < distance then
                        DrawMarker(1,interiors[i].xo,interiors[i].yo,interiors[i].zo-1.0001, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
                        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xo,interiors[i].yo,interiors[i].zo, true) < 1.599 then
                            drawTxt(txt[lang]['menu'],0,1,0.5,0.8,0.6,255,255,255,255)
                            if IsControlJustPressed(1, 86) then
                                MenuInsideAppartement()
                                Menu.hidden = not Menu.hidden
                            end
                            Menu.renderGUI()
                        end
                    end
                end
            end
    end
end)
 
Citizen.CreateThread(function()
    while true do
        Wait(1000)
        if timer > 0 then
            timer=timer-1
            if timer == 0 then current_int = 0 end
        end
    end
end)

Citizen.CreateThread(function()
    if displayApartBlips == true then
        for _, item in pairs(interiors) do
          item.blip = AddBlipForCoord(item.xe, item.ye, item.ze)
          SetBlipSprite(item.blip, 375)
          SetBlipAsShortRange(item.blip, true)
          BeginTextCommandSetBlipName("STRING")
          SetBlipColour(item.blip, 3)
          SetBlipScale(item.blip, 0.9)
          AddTextComponentString("Appartment")
          EndTextCommandSetBlipName(item.blip)
        end
    end
end)