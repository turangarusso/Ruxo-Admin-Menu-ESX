ESX = exports["es_extended"]:getSharedObject()
-- don't touch
local toggle = false --noclip toogle
local toggle_god = false --god_mode toggle
local toggleLavoro = false -- toggle jobs
local checkpermessi = nil -- check player group
local myJobs = nil 
local Abilitato = false -- config identifier check 

local itemNames = {}

local elements = {
    {
      unselectable= true,
      icon="fas fa-dragon",
      title="<span style=color:purple;> RUXO MENU",
    },
    {
        unselectable= false,
        icon="",
        title="Fix Vehicle",
        value = "ripara_veicolo"
    },
    {
        unselectable= false,
        icon="",
        title="Trainer",
        value = "trainer"
    },
    {
        unselectable= false,
        icon="",
        title="List Players",
        value = "lista_player"
    },
    {
        unselectable= false,
        icon="",
        title="List Vehicles",
        value = "lista_veicoli"
    },
    {
        unselectable= false,
        icon="",
        title="List Resource",
        value = "lista_risorse"
    },
    {
        unselectable= false,
        icon="",
        title="List Items",
        value = "lista_items"
    },
    {
        unselectable= false,
        icon="",
        title="Clean Area",
        value = "clean_up"
    },
    {
        unselectable= false,
        icon="",
        title="List Jobs",
        value = "job"
    },
}

local elements1 = {
    {
      unselectable= true,
      icon="fas fa-info-circle",
      title="List Vehicles",
  },
    {
        unselectable= false,
        icon="",
        title="Custom Vehicles",
        value = "veicoli_custom"
    },
    
}

local elements2 = {
    {
      unselectable= true,
      icon="fas fa-info-circle",
      title="List Vehicles",
  },
    
}

local elements4 = {
    {
      unselectable= true,
      icon="fas fa-info-circle",
      title="List Jobs",
  },
  
}

local elements5 = {
    {
      unselectable= true,
      icon="fas fa-info-circle",
      title="Select Grade",
  },
  
}

local elements6 = {
    {
        unselectable= true,
        icon="fas fa-dragon",
        title="<span style=color:purple;> RUXO MENU",
    },
    {
        unselectable= false,
        icon="",
        title="Invisibility",
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
        title="Revive",
        value = "revive"
    },
    {
        unselectable= false,
        icon="",
        title="Heal",
        value = "heal"
    },
  
}

local elements7 = {
    {
      unselectable= true,
      icon="fas fa-info-circle",
      title="List Players",
  }, 
}

local elements9 = {
    {
      unselectable= true,
      icon="fas fa-info-circle",
      title="List Resource",
  }, 
}

local elements10 = {
    {
      unselectable= true,
      icon="fas fa-info-circle",
      title="Resouce Stopped",
  }, 
}

local elements11 = {
    {
      unselectable= true,
      icon="fas fa-info-circle",
      title="List Items",
  }, 
}

local elements8 = {
    {
        unselectable= true,
        icon="fas fa-dragon",
        title="<span style=color:purple;> RUXO MENU",
    },
    {
        unselectable= true,
        icon="", -- disable icon
        title="Message Text", -- Title of text input to show to user
        input=true, -- Allow input
        inputType="text", -- set type to Text
        inputPlaceholder = "Assistance, thanks!", -- PlaceHolder to Show
        name="textinput1", -- input identifier
     },
    {
        unselectable= false,
        icon="",
        title="Message",
        value = "messaggio"
    }, 
    {
      unselectable= false,
      icon="",
      title="Bring",
      value = "bring"
    }, 
    {
        unselectable= false,
        icon="",
        title="Go To",
        value = "goto"
    }, 
   {
        unselectable= false,
        icon="",
        title="Revive",
        value = "revive"
    },
    {
        unselectable= false,
        icon="",
        title="Heal",
        value = "heal"
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
        title="Select Range",
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
        title="Vehicle",
        description = "Delete vehicle",
        value = "clean_up_car"
    },
    {
        unselectable= false,
        icon="fas fa-user",
        title="Ped",
        description = "Delete ped",
        value = "clean_up_ped"
    },
    {
        unselectable= false,
        icon="fas fa-box-open",
        title="Prop",
        description = "Delete prop",
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
                ESX.ShowNotification("You Don't have permissions")    
        
            end 
        end
    
    end

end)
RegisterKeyMapping('ruxomenu', 'Enable/Disable menu', 'keyboard', "numpad8")

--funzione
function OpenRuxo()  
    ESX.TriggerServerCallback("RXO:Players", function(xPlayers)

        elements7 = {}

        elements7[#elements7+1] ={
            unselectable= true,
            icon="fas fa-info-circle",
            title="List Players",
        }

        if xPlayers ~= nil then
            for i=1, #xPlayers, 1 do

                elements7[#elements7+1] = {
                    icon = "fas fa-user",
                    title = "Player ID: ",
                    description = tostring(xPlayers[i]),
                    value = "giocatore"
                }

            end
        end    
    end)
    
    elements9 = {}
    elements10 = {}
    elements11 ={}

    elements9[#elements9+1] ={
        unselectable= true,
        icon="fas fa-info-circle",
        title="List Resource",
    }

    elements9[#elements9+1] ={
        unselectable= false,
        icon="fas fa-stop",
        title="<span style=color:red;> Stopped Resource",
        value = "stopped"
    }

    elements9[#elements9+1] ={
        unselectable= false,
        icon="fas fa-check",
        title="<span style=color:green;> Refresh",
        value = "refresh"
    }

    elements10[#elements10+1] ={
        unselectable= true,
        icon="fas fa-info-circle",
        title="Stopped Resource",
    }

    elements11[#elements11+1] ={
        unselectable= true,
        icon="fas fa-info-circle",
        title="List Items",
    }

    elements11[#elements11+1] ={

        unselectable= true,
        icon="fas fa-info-circle",
        title="Quantity",
        input=true, -- allow input
        inputType="number", -- allow numbers to be inputted
        inputValue=1, -- default value
        inputMin=0, -- minimum value
        inputMax=2000, -- maximun value
        value = "input"
    }

    for item, data in pairs(exports.ox_inventory:Items()) do
        itemNames[item] = data.label
        elements11[#elements11+1] = {
            icon = "",
            title = tostring(data.name),
            description = tostring(data.label),
            value = "item"
        }
    end

    --local resourceList = {}
    for i = 0, GetNumResources(), 1 do
     local resource_name = GetResourceByFindIndex(i)
        if resource_name and GetResourceState(resource_name) == "started" then

            --table.insert(resourceList, resource_name)
            elements9[#elements9+1] = {
                icon = "",
                title = tostring(resource_name),
                value = "risorsa"
            }

        elseif resource_name and GetResourceState(resource_name) == "stopped" then    

            elements10[#elements10+1] = {
                icon = "",
                title = tostring(resource_name),
                value = "risorsa_stoppata"
            }

        end
    end
    --print(table.unpack(resourceList))

    ESX.OpenContext("right", elements, function(menu,element)
        if element.value == "lista_risorse" then
            if checkpermessi == "founder" then 
        
                ESX.OpenContext("right", elements9, function(menu,element)
                    if element.value == "risorsa" then
                        --print(json.encode(element.title))

                        ExecuteCommand("ensure " .. tostring(element.title))    
                        ESX.ShowNotification("Done")
                        ESX.CloseContext()

                    elseif element.value == "refresh" then

                        ExecuteCommand("refresh")    
                        ESX.ShowNotification("Refresh done")
                        ESX.CloseContext()

                    elseif element.value == "stopped" then
                        ESX.OpenContext("right", elements10, function(menu,element)

                            if element.value == "risorsa_stoppata" then
                                ExecuteCommand("start " .. element.title)    
                                ESX.ShowNotification("Start of " .. element.title .. " done")
                                ESX.CloseContext()

                            end
                        end) 

                    end    
                end) 
            end    
        elseif element.value == "lista_items" then
            if checkpermessi == "founder" then 
        
                ESX.OpenContext("right", elements11, function(menu,element)
                    if element.value == "item" then
                        --print(json.encode(element.title))

                        ExecuteCommand("giveitem me " .. tostring(element.title) .." ".. menu.eles[2].inputValue)    
                        ESX.ShowNotification("Done")
                        ESX.CloseContext()

                    end    
                end) 
            end    
        elseif element.value == "ripara_veicolo" then
            if checkpermessi == "superadmin" or checkpermessi == "admin" or checkpermessi == "founder" or checkpermessi == "cofounder" then 

                local vehicle = GetVehiclePedIsIn(PlayerPedId())
                if vehicle == 0 then
                    --vehicle = GetVehiclePedIsIn(PlayerPedId(),true)
                    ESX.CloseContext()
                    ESX.ShowNotification("You are not in a vehicle")

                end
                SetVehicleFixed(vehicle)
                SetVehicleDirtLevel(vehicle,0.0)
                SetVehicleBodyHealth(vehicle,1000.0)
                SetVehicleEngineHealth(vehicle,1000.0)
                SetVehiclePetrolTankHealth(vehicle,1000.0)
                vehicle_health = 1000
                ESX.CloseContext()
                ESX.ShowNotification("Vehicle Fixed")
            else
                ESX.ShowNotification("You can't")
            end
        elseif element.value == "trainer" then
            ESX.OpenContext("right", elements6, function(menu,element)
                if element.value == "invisibilità" then
                    
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
                                
                            ESX.ShowNotification("Done")
                            toggle = true
                        else
                            SetEntityVisible(pPed, true) --ped visibile
                            SetEntityVisible(veh, true) --veh visibile
                            ResetEntityAlpha(pPed)
                            ResetEntityAlpha(veh)
                            SetEntityInvincible(pPed, false)

                            ESX.CloseContext()
                                
                            ESX.ShowNotification("Done")
                            toggle = false

                        end
                    else
                        ESX.ShowNotification("You can't")
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
                            ESX.ShowNotification("God On")
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
                        ESX.ShowNotification("You can't")
                    end           
                elseif element.value == "revive" then

                    ExecuteCommand("revive me")    
                    ESX.ShowNotification("Done")
                    ESX.CloseContext()

                elseif element.value == "heal" then

                    ExecuteCommand("heal me")    
                    ESX.ShowNotification("Buy some food")
                    ESX.CloseContext()

                end       
            end)
        elseif element.value == "lista_player" then
            ESX.OpenContext("right", elements7, function(menu,element)
                if element.value == "giocatore" then
                    local xID = element.description
                    ESX.OpenContext("right", elements8, function(menu,element)
                        if element.value == "revive" then

                            ExecuteCommand("revive " .. xID )    
                            ESX.ShowNotification("Done")
        
                        elseif element.value == "heal" then
        
                            ExecuteCommand("heal " .. xID)    
                            ESX.ShowNotification("Heal done")

                        elseif element.value == "bring" then
        
                            ExecuteCommand("bring " .. xID)    
                            ESX.ShowNotification("Bring done")

                        elseif element.value == "goto" then
                            
                            ExecuteCommand("goto " .. xID)    
                            ESX.ShowNotification("Goto done")
                        elseif element.value == "messaggio" then
                            local mess = tostring(menu.eles[2].inputPlaceholder)

                            if menu.eles[2].inputValue ~= nil then
                                mess  = tostring(menu.eles[2].inputValue )

                            end    

                            TriggerServerEvent("RXO:Messaggio", xID, mess)
                            ESX.ShowNotification("Message send")

                        end       
                    end)    
                end
            end)
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
                ESX.ShowNotification("You can't")
            end          
        elseif element.value == "clean_up" then
            if checkpermessi == "superadmin" or checkpermessi == "admin" or checkpermessi == "mod" or checkpermessi == "founder" or checkpermessi == "cofounder" then 

                ESX.OpenContext("right", elements3, function(menu,element)
                    local xPlayer = GetPlayerServerId(PlayerId())
                    local range = tonumber(menu.eles[2].inputValue)

                    if element.value == "clean_up_car" then
                        local type = "cars"

                        TriggerServerEvent("RXO:Clean", type, range, xPlayer)

                        ESX.ShowNotification("Area is Clean")

                    elseif element.value == "clean_up_ped" then
                        local type = "peds"

                        TriggerServerEvent("RXO:Clean", type, range, xPlayer)

                        ESX.ShowNotification("Area is Clean")

                    elseif element.value == "clean_up_prop" then
                        local type = "props"

                        TriggerServerEvent("RXO:Clean", type, range, xPlayer)

                        ESX.ShowNotification("Area is Clean")
                    end     
                end)
            else
                ESX.ShowNotification("You can't")
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
                                
                                ESX.ShowNotification("Job set")
                                elements5 = {}
                                ESX.CloseContext()

                            end
                        end)

                    end
                end)
            else
                ESX.ShowNotification("You can't")
            end 
        end
    end)

end