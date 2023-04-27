RXO = {}

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

	cb(job)
end)

RegisterServerEvent("RXO:Job_grade")
AddEventHandler("RXO:Job_grade", function()

	local jobGrade = MySQL.Sync.fetchAll('SELECT * FROM job_grades') 

end)

RegisterServerEvent("RXO:SetJob")
AddEventHandler("RXO:SetJob", function(sceltalavoro, id)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.setJob(sceltalavoro, id)

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




