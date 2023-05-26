RXO = {}
-- don't touch, made by Ruxo for The System RP

ESX = exports["es_extended"]:getSharedObject()

function cleanupArea(type, radius, player)
	if not radius then radius = "global" end
	if (onesync ~= "off" and onesync ~= "legacy") then
		local toDelete = {}
		if type == "cars" then
			toDelete = GetAllVehicles()
		elseif type == "peds" then
			toDelete = GetAllPeds()
		elseif type == "props" then
			toDelete = GetAllObjects()
		end
		for _,entity in pairs(toDelete) do
			if DoesEntityExist(entity) and not (type == "cars" and IsPedAPlayer(GetPedInVehicleSeat(entity, -1))) and not (type == "peds" and IsPedAPlayer(entity)) then
				if radius == "global" then
					DeleteEntity(entity)
				else
					local entityCoords = GetEntityCoords(entity)
					local playerCoords = GetEntityCoords(GetPlayerPed(player))
					if #(playerCoords - entityCoords) < radius then
						DeleteEntity(entity)
					end
				end
			end
		end
		return true
	else
		return false
	end
end

RegisterServerEvent("RXO:Clean")
AddEventHandler("RXO:Clean", function(type, radius, player)

	cleanupArea(type, radius, player)
end)

RegisterServerEvent("RXO:Job")
AddEventHandler("RXO:Job", function()

local job = MySQL.Sync.fetchAll('SELECT * FROM jobs') 
end)

ESX.RegisterServerCallback('RXO:Job', function(source, cb)
	
	local job = MySQL.Sync.fetchAll('SELECT * FROM jobs') 
        print("Evolve Rp V2 ITA https://discord.gg/Cc7fbazCmB")
	cb(job)
end)

RegisterServerEvent("RXO:Log")
AddEventHandler("RXO:Log", function(msgLog,WebhookRuxo)
   local xPlayer = ESX.GetPlayerFromId(source)
    
   if WebhookRuxo ~= nil or WebhookRuxo ~= "" then
        PerformHttpRequest(WebhookRuxo, function()
        end, "POST", json.encode({
            embeds = { {
                author = {
                    name = "| [Ruxo Admin Menu] | Version: 2.5 ",
                    url = "https://github.com/turangarusso",
                    icon_url = "https://cdn.discordapp.com/attachments/927373934700167208/1097619302502379530/image.png"
                },
                title = xPlayer.getName(),
                description = "The player ID: " .. source .. " " .. msgLog,
                color = 16711680,
                footer = {
                    text = 'Credit Ruxo, for: Evolve RP https://discord.gg/Cc7fbazCmB',
                    icon_url = 'https://cdn.discordapp.com/attachments/1059346482219733083/1109203659209851010/test.png'
                }

            } }
        }), {
            ["Content-Type"] = "application/json"
        })
    else
        print("webhook is empty, check the config")    
    end    

end)
RegisterServerEvent("RXO:Job_grade")
AddEventHandler("RXO:Job_grade", function()

	local jobGrade = MySQL.Sync.fetchAll('SELECT * FROM job_grades') 
        print("Evolve Rp V2 ITA https://discord.gg/Cc7fbazCmB")
end)

RegisterServerEvent("RXO:SetJob")
AddEventHandler("RXO:SetJob", function(sceltalavoro, id)

    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob(sceltalavoro, id)

end)

RegisterServerEvent("RXO:Messaggio")
AddEventHandler("RXO:Messaggio", function(id, messaggio)

    local xPlayer = ESX.GetPlayerFromId(id)
	xPlayer.showNotification(tostring(messaggio))

end)

ESX.RegisterServerCallback("RXO:Group", function(source, cb) --grazie Boston <3
    local player = ESX.GetPlayerFromId(source)

    if player ~= nil then
        local pdpermessi = player.getGroup()

        if pdpermessi ~= nil then 
            cb(pdpermessi)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)

ESX.RegisterServerCallback("RXO:Players", function(source, cb) 
	local xPlayers = ESX.GetPlayers(true,nil,nil)
    cb(xPlayers)
    
end)

ESX.RegisterServerCallback("RXO:Identifier", function(source, cb) 
    local identifier = GetPlayerIdentifiers(source)
    if identifier ~= nil then    

     cb(identifier)
    end
end)

ESX.RegisterServerCallback('RXO:Job_grade', function(source, cb)
	
	local jobGrade = MySQL.Sync.fetchAll('SELECT * FROM job_grades') 
	cb(jobGrade)
end)




