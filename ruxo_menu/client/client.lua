ESX = exports["es_extended"]:getSharedObject()

local toggle = false
local toggle_god = false
local toggleLavoro = false
local checkpermessi = nil
local myJobs = nil
local Abilitato = false

local elements = {
    {
      unselectable= true,
      icon="fas fa-dragon",
      title="<span style=color:purple;> RUXO MENU",
    },
    {
        unselectable= false,
        icon="",
        title="Ripara Veicolo",
        value = "ripara_veicolo"
    },
    {
        unselectable= false,
        icon="",
        title="Invisibilità",
        value = "invisibilità"
    },
    {
        unselectable= false,
        icon="",
        title="God Mode",
        value = "god_mode"
    },
    {
        unselectable= false,
        icon="",
        title="Lista Veicoli",
        value = "lista_veicoli"
    },
    {
        unselectable= false,
        icon="",
        title="Pulisci Area",
        value = "clean_up"
    },
    {
        unselectable= false,
        icon="",
        title="Lista Job",
        value = "job"
    },
}

local elements1 = {
    {
      unselectable= true,
      icon="fas fa-info-circle",
      title="Lista Veicoli",
  },
    {
        unselectable= false,
        icon="",
        title="Veicoli Custom",
        value = "veicoli_custom"
    },
    
}

local elements2 = {
    {
      unselectable= true,
      icon="fas fa-info-circle",
      title="Lista Veicoli",
  },
    
}

local elements4 = {
    {
      unselectable= true,
      icon="fas fa-info-circle",
      title="Lista Lavori",
  },
  
}

local elements5 = {
    {
      unselectable= true,
      icon="fas fa-info-circle",
      title="Scegli Grado",
  },
  
}

local elements3 = {
    {
        unselectable= true,
        icon="fas fa-dragon",
        title="<span style=color:purple;> RUXO MENU",
      },
    {
        unselectable= true,
        icon="fas fa-info-circle",
        title="Inserisci Range",
        input=true, -- allow input
        inputType="number", -- allow numbers to be inputted
        inputValue=500, -- default value
        inputMin=0, -- minimum value
        inputMax=2000, -- maximun value
        value = "input"
    },
    {
        unselectable= false,
        icon="fas fa-car",
        title="Auto",
        description = "Elimina autoo",
        value = "clean_up_car"
    },
    {
        unselectable= false,
        icon="fas fa-user",
        title="Ped",
        description = "Elimina ped",
        value = "clean_up_ped"
    },
    {
        unselectable= false,
        icon="fas fa-box-open",
        title="Prop",
        description = "Elimina prop",
        value = "clean_up_prop"
    },
    
}

RegisterCommand("ruxomenu", function(_src, arg)

    ESX.TriggerServerCallback("RXO:Identifier", function(identifier)

        for k, v in ipairs(identifier) do
            for l, n in pairs(RuxoACC.BypassAdmin) do
                if n == v then
                    Abilitato = true
                end
            end
        end

    end)

    ESX.TriggerServerCallback("RXO:Job", function(jobs)

        myJobs = jobs
        if toggleLavoro == false then
            for k, lavoro in ipairs(jobs) do
                
                elements4[#elements4+1] = {
                    icon = "fas fa-briefcase",
                    title = tostring(lavoro.name),
                    description =  tostring(lavoro.label),
                    value = "lavoro"
                }

            end
            toggleLavoro = true
        end

    end)

    ESX.TriggerServerCallback("RXO:Group", function(permessi)
      
        checkpermessi = permessi

    end)
            
    if checkpermessi == "superadmin" or checkpermessi == "admin" or checkpermessi == "mod" or checkpermessi == "founder" or checkpermessi == "cofounder" then 
        if not RuxoACC.AdminControl then
            OpenRuxo()
            
        elseif RuxoACC.AdminControl then
            if Abilitato == true then
                OpenRuxo()
    
            else 
                ESX.ShowNotification("Non hai i permessi")    
        
            end 
        end
    
    end

end)
RegisterKeyMapping('ruxomenu', 'Abilita/Disabilita menu', 'keyboard', "numpad8")

--funzione

function OpenRuxo()

    ESX.OpenContext("right", elements, function(menu,element)

        if element.value == "ripara_veicolo" then
            if checkpermessi == "superadmin" or checkpermessi == "admin" or checkpermessi == "founder" or checkpermessi == "cofounder" then 

                local vehicle = GetVehiclePedIsIn(PlayerPedId())
                if vehicle == 0 then
                    --vehicle = GetVehiclePedIsIn(PlayerPedId(),true)
                    ESX.CloseContext()
                    ESX.ShowNotification("Non sei in un veicolo")

                end
                SetVehicleFixed(vehicle)
                SetVehicleDirtLevel(vehicle,0.0)
                SetVehicleBodyHealth(vehicle,1000.0)
                SetVehicleEngineHealth(vehicle,1000.0)
                SetVehiclePetrolTankHealth(vehicle,1000.0)
                vehicle_health = 1000
                ESX.CloseContext()
                ESX.ShowNotification("Veicolo Riparato e pulito")
            else
                ESX.ShowNotification("Voleeevi")
            end
        elseif element.value == "invisibilità" then
            if checkpermessi == "superadmin" or checkpermessi == "admin" or checkpermessi == "mod" or checkpermessi == "founder" or checkpermessi == "cofounder" then 

                local playerPed = PlayerPedId()
                local veh = GetVehiclePedIsIn(playerPed, false)
                local pPed = playerPed
                local veh = veh

                if toggle == false then
                    SetEntityVisible(pPed, false) --ped invisibile
                    SetEntityVisible(veh, false) --veh invisibile
                    SetLocalPlayerVisibleLocally(true)
                    SetEntityAlpha(pPed, 100, false)
                    SetEntityAlpha(veh, 100, false)
                    SetEntityInvincible(pPed, true)

                    ESX.CloseContext()
                        
                    ESX.ShowNotification("Comando eseguito")
                    toggle = true
                else
                    SetEntityVisible(pPed, true) --ped visibile
                    SetEntityVisible(veh, true) --veh visibile
                    ResetEntityAlpha(pPed)
                    ResetEntityAlpha(veh)
                    SetEntityInvincible(pPed, false)

                    ESX.CloseContext()
                        
                    ESX.ShowNotification("Comando eseguito")
                    toggle = false

                end
            else
                ESX.ShowNotification("Voleeevi")
            end    
        elseif element.value == "god_mode" then
            if checkpermessi == "superadmin" or checkpermessi == "admin" or checkpermessi == "founder" or checkpermessi == "cofounder" then 

                local playerPed = PlayerPedId()
                local veh = GetVehiclePedIsIn(playerPed, false)
                local pPed = playerPed
                local veh = veh

                if toggle_god == false then
                    SetEntityInvincible(pPed, true)
                    SetEntityInvincible(veh, true)
                    ESX.ShowNotification("God Attivata")
                    ESX.CloseContext()
                    toggle_god = true
                else
                    SetEntityInvincible(pPed, false)
                    SetEntityInvincible(veh, false)
                    ESX.ShowNotification("God Off")
                    ESX.CloseContext()
                    toggle_god = false

                end
            else
                ESX.ShowNotification("Voleeevi")
            end        
        elseif element.value == "lista_veicoli" then
            if checkpermessi == "superadmin" or checkpermessi == "admin" or checkpermessi == "mod" or checkpermessi == "founder" or checkpermessi == "cofounder" then 

                for k, veicolo in ipairs(RuxoACC.ListedVehicle) do
                    
                    elements1[#elements1+1] = {
                        icon = "fas fa-car",
                        title = tostring(veicolo),
                        value = "drive_test"
                    }
                end
                for z, veicolo2 in ipairs(RuxoACC.ModVehicle) do
                    
                    elements2[#elements2+1] = {
                        icon = "fas fa-car",
                        title = tostring(veicolo2),
                        value = "drive_test2"
                    }
                end      
                ESX.OpenContext("right", elements1, function(menu,element)
                    if element.value == "veicoli_custom" then

                        ESX.OpenContext("right", elements2, function(menu,element)
                            if element.value == "drive_test2" then

                                ExecuteCommand("car " .. element.title)    
                            end    
                        end)
                    elseif element.value == "drive_test" then

                        ExecuteCommand("car " .. element.title)    
                    end     
                end)
            else
                ESX.ShowNotification("Voleeevi")
            end          
        elseif element.value == "clean_up" then
            if checkpermessi == "superadmin" or checkpermessi == "admin" or checkpermessi == "mod" or checkpermessi == "founder" or checkpermessi == "cofounder" then 

                ESX.OpenContext("right", elements3, function(menu,element)
                    local xPlayer = GetPlayerServerId(PlayerId())
                    local range = tonumber(menu.eles[2].inputValue)

                    if element.value == "clean_up_car" then
                        local type = "cars"

                        TriggerServerEvent("RXO:Clean", type, range, xPlayer)

                        ESX.ShowNotification("Area Pulita")

                    elseif element.value == "clean_up_ped" then
                        local type = "peds"

                        TriggerServerEvent("RXO:Clean", type, range, xPlayer)

                        ESX.ShowNotification("Area Pulita")

                    elseif element.value == "clean_up_prop" then
                        local type = "props"

                        TriggerServerEvent("RXO:Clean", type, range, xPlayer)

                        ESX.ShowNotification("Area Pulita")
                    end     
                end)
            else
                ESX.ShowNotification("Voleeevi")
            end    
        elseif element.value == "job" then
            if checkpermessi == "superadmin" or checkpermessi == "admin" or checkpermessi == "founder" or checkpermessi == "cofounder" then 

                local myGrade = nil

                ESX.TriggerServerCallback("RXO:Job_grade", function(jobGrade)
                    
                    myGrade = jobGrade
                    
                end)

                ESX.OpenContext("right", elements4, function(menu,element)
                    local sceltalavoro = nil

                    if element.value == "lavoro" then
                        elements5 = {}
                        sceltalavoro = tostring(element.title)
                        for k, gradolavoro in ipairs(myGrade) do

                            if gradolavoro.job_name == element.title then
                                elements5[#elements5+1] = {
                                    icon = "fas fa-database",
                                    title = tostring(gradolavoro.grade),
                                    description =  tostring(gradolavoro.label),
                                    name = tostring(gradolavoro.job_name),
                                    value = "grado"
                                }
                            end    
                
                        end

                        ESX.OpenContext("right", elements5, function(menu,element)
                            
                            if element.value == "grado" then

                                TriggerServerEvent("RXO:SetJob",sceltalavoro, element.title)
                                
                                ESX.ShowNotification("Job settato")
                                elements5 = {}
                                ESX.CloseContext()

                            end
                        end)

                    end
                end)
            else
                ESX.ShowNotification("Voleeevi")
            end 
        end
    end)

end    