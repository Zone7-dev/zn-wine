ESX = nil


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(250)
    end
end)

local araccikartsinmi = nil
local sonuzum = 1
local uzumlegalsatis = vector3(1221.173, -3005.50, 5.053)
local uzumsarapyap = vector3(-565.863, 295.6900, 82.309)
local araccikart = vector3(-554.023, 310.4699, 83.181)
local araccoords = vector3(-553.840, 304.3867, 83.297)
local sarapsat = vector3(1732.816, 3305.010, 41.223)
local uzumlokasyon = {
    vector3(-1832.13, 2134.58, 123.00),
    vector3(-1823.2, 2136.19, 123.00),
    vector3(-1811.81, 2144.91, 119.50),
    vector3(-1801.06, 2146.72, 119.60),
    vector3(-1818.63, 2146.68, 118.00)
}

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, uzumlokasyon[sonuzum].x, uzumlokasyon[sonuzum].y, uzumlokasyon[sonuzum].z, true)
        local dst2 = GetDistanceBetweenCoords(playercoords, uzumlokasyon[sonuzum].x, uzumlokasyon[sonuzum].y, uzumlokasyon[sonuzum].z, true)
            if dst2 < 50 then
                sleep = 2
                DrawMarker(2, uzumlokasyon[sonuzum].x, uzumlokasyon[sonuzum].y, uzumlokasyon[sonuzum].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 100, 0, 254, 150, 0, 0, 0, 0, 0, 0, 0)
                if dst2 < 2 then
                    DrawText3Ds(uzumlokasyon[sonuzum].x, uzumlokasyon[sonuzum].y, uzumlokasyon[sonuzum].z + 0.5, '[E] Üzüm Topla')
                    if IsControlJustReleased(0, 38) then
                        sonuzum = math.random(1, #uzumlokasyon)
                        TriggerEvent("mythic_progbar:client:progress", {
                            name = "kayakaz",
                            duration = 5000,
                            label = "üzüm topluyorsun",
                            useWhileDead = false,
                            canCancel = true,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            },
                            animation = {
                                animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
                                anim = "idle_c",
                                flags = 49,
                            },
                        }, function(status)
                            if not status then
                                TriggerServerEvent("zn-wine:uzum")
                            end
                        end)
                    end
                end
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, uzumlegalsatis.x, uzumlegalsatis.y, uzumlegalsatis.z, true)
        local dst2 = GetDistanceBetweenCoords(playercoords, uzumlegalsatis.x, uzumlegalsatis.y, uzumlegalsatis.z, true)
        if dst2 < 5 then
            sleep = 2
            DrawMarker(2, uzumlegalsatis.x, uzumlegalsatis.y, uzumlegalsatis.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 255, 0, 0, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst2 < 2 then
                DrawText3Ds(uzumlegalsatis.x, uzumlegalsatis.y, uzumlegalsatis.z + 0.5, '[E] Üzüm Sat')
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent("zn-wine:uzumsat")
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, uzumsarapyap.x, uzumsarapyap.y, uzumsarapyap.z, true)
        local dst2 = GetDistanceBetweenCoords(playercoords, uzumsarapyap.x, uzumsarapyap.y, uzumsarapyap.z, true)
            if dst2 < 50 then
                sleep = 2
                DrawMarker(2, uzumsarapyap.x, uzumsarapyap.y, uzumsarapyap.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 100, 0, 254, 150, 0, 0, 0, 0, 0, 0, 0)
                if dst2 < 2 then
                    DrawText3Ds(uzumsarapyap.x, uzumsarapyap.y, uzumsarapyap.z + 0.5, '[E] Üzümleri Şarap Yaptır')
                    if IsControlJustReleased(0, 38) then
                        ESX.TriggerServerCallback("zn-wine:uzumkontrol", function(uzum)
                            if uzum then
                                araccikartsinmi = true
                                TriggerEvent("mythic_progbar:client:progress", {
                                    name = "illegaluzum",
                                    duration = 1000,
                                    label = "üzümler çeviriliyor",
                                    useWhileDead = false,
                                    canCancel = false,
                                    controlDisables = {
                                        disableMovement = true,
                                        disableCarMovement = true,
                                        disableMouse = false,
                                        disableCombat = true,
                                    },
                                }, function(status)
                                    if not status then
                                        TriggerServerEvent("zn-wine:sarapyap")
                                    end
                                end)
                            else
                                ESX.ShowNotification('Üzerinde 20 Adet Üzüm Yok!')        
                            end
                        end)                                          
                    end
                end
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, araccikart.x, araccikart.y, araccikart.z, true)
        local dst2 = GetDistanceBetweenCoords(playercoords, araccikart.x, araccikart.y, araccikart.z, true)
        if araccikartsinmi then
            if dst2 < 50 then
                sleep = 2
                DrawMarker(2, araccikart.x, araccikart.y, araccikart.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 100, 0, 254, 150, 0, 0, 0, 0, 0, 0, 0)
                if dst2 < 2 then
                    DrawText3Ds(araccikart.x, araccikart.y, araccikart.z + 0.5, '[E] Araç Çıkart')
                    if IsControlJustReleased(0, 38) then
                        ESX.TriggerServerCallback("zn-wine:sarapkontrol", function(sarap)
                            if sarap then
                                TriggerEvent("zn-wine:arac")
                                SetNewWaypoint(1734.236, 3304.924)
                                ESX.ShowNotification('Şarapları götürmen gereken yer haritada işaretlendi!')   
                            else
                                ESX.ShowNotification('Üzerinde En Az 10 Tane Şarap Olması Gerek!')  
                            end
                        end)
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, sarapsat.x, sarapsat.y, sarapsat.z, true)
        local dst2 = GetDistanceBetweenCoords(playercoords, sarapsat.x, sarapsat.y, sarapsat.z, true)
        if araccikartsinmi then
            if dst2 < 50 then
                sleep = 2
                DrawMarker(2, sarapsat.x, sarapsat.y, sarapsat.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 100, 0, 254, 150, 0, 0, 0, 0, 0, 0, 0)
                if dst2 < 2 then
                    DrawText3Ds(sarapsat.x, sarapsat.y, sarapsat.z + 0.5, '[E] Şarapları Teslim Et')
                    if IsControlJustReleased(0, 38) then
                        ESX.TriggerServerCallback("zn-wine:sarapkontrol", function(sarap)
                            if sarap then
                                araccikartsinmi = false
                                TriggerServerEvent("zn-wine:sarapsat")
                                TriggerEvent("zn-wine:aracteslim")
                            else
                                ESX.ShowNotification('Üzerinde En Az 10 Tane Şarap Olması Gerek!')  
                            end
                        end)
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

                       
RegisterNetEvent("zn-wine:arac")
AddEventHandler("zn-wine:arac", function()
    local ped = PlayerPedId()
    ESX.Game.SpawnVehicle("benson", araccoords, 200.50, function(vehicle)
        TaskWarpPedIntoVehicle(ped, vehicle, -1)
    end)
end)

RegisterNetEvent("zn-wine:aracteslim")
AddEventHandler("zn-wine:aracteslim", function()
    local currentVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    SetEntityAsMissionEntity(currentVehicle, true, true)
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    SetEntityCoords(GetPlayerPed(-1), x - 2, y, z)
    DeleteVehicle(currentVehicle)
end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end

Citizen.CreateThread(function()
	local blip = AddBlipForCoord(-1832.13, 2134.58, 123.00)

	SetBlipSprite (blip, 1)
	SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 0.8)
    SetBlipColour (blip, 27)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Üzüm Tarlası")
	EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()
	local blip = AddBlipForCoord(1221.173, -3005.50, 5.053)

	SetBlipSprite (blip, 1)
	SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 0.8)
    SetBlipColour (blip, 27)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Kaliteli Üzüm Satış")
	EndTextCommandSetBlipName(blip)
end)