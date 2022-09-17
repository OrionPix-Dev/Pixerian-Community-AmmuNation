weaponMainMenu = RageUI.CreateMenu("Armurerie", "Interaction")
weaponMainMenu:setData('index', 1)
weaponMainMenu:setData('account', 'money')

weaponMainMenu:setMenu(function()
    weaponMainMenu:IsVisible(function(item)
        item:AddList("Compte: ", {"Argent liquide", "Argent en banque"}, weaponMainMenu:getData('index'), nil, {}, function(currentIndex, _, c)
            if c then
                weaponMainMenu:setData('index', currentIndex)
            end
            if currentIndex == 1 then
                weaponMainMenu:setData('account', 'money')
            elseif currentIndex == 2 then
                weaponMainMenu:setData('account', 'bank')
            end
        end)
        item:AddSeparator(("%s"):format(Weapon.Categorie1))
        item:AddLine(Weapon.Line1.r, Weapon.Line1.g, Weapon.Line1.b, Weapon.Line1.a)
        for _, v in pairs(Weapon.Blanche) do
            item:AddButton(v.label, nil, {RightLabel = ("%s~g~$"):format(v.price)}, function(s)
                if s then
                    if weaponMainMenu:getData('account') ~= nil then
                            ESX.TriggerServerCallback('pixerianshop:buyitemsInWeaponBlanche', function(returned)
                            end, v.name, weaponMainMenu:getData('account'))
                    else
                        utils:notification("~r~Vous devez choisir un compte")
                    end
                end
            end)
        end

        item:AddSeparator(("%s"):format(Weapon.Categorie2))
        item:AddLine(Weapon.Line2.r, Weapon.Line2.g, Weapon.Line2.b, Weapon.Line2.a)
        for _, v in pairs(Weapon.Letale) do
            item:AddButton(v.label, nil, {RightLabel = ("%s~g~$"):format(v.price)}, function(s)
                if s then
                    if weaponMainMenu:getData('account') ~= nil then
                            ESX.TriggerServerCallback('pixerianshop:buyitemsInWeaponArme', function(returned)
                            end, v.name, weaponMainMenu:getData('account'))
                    else
                        utils:notification("~r~Vous devez choisir un compte")
                    end
                end
            end)
        end
    end)
end)

local function Draw3DText(x, y, z, text)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
	if onScreen then
		SetTextScale(0.35, 0.35)
		SetTextFont(8)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextDropShadow(0, 0, 0, 55)
		SetTextEdge(0, 0, 0, 150)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x,_y)
	end
end

Citizen.CreateThread(function()
    for k,v in pairs(Weapon.Pos) do
        blip = AddBlipForCoord(v.pos.x,v.pos.y,v.pos.z)
        SetBlipSprite(blip, 110)
        SetBlipScale(blip, 0.6)
        SetBlipColour(blip, 64)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName("Armurerie")
        EndTextCommandSetBlipName(blip)
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerPos = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Weapon.Pos) do
            local PositionSup = vector3(v.pos)
            local dst1 = #(playerPos - PositionSup)
            if dst1 < 3.0 then
                sleep = 0
                if scale == nil then
                    scale = 0.75
                end
                Draw3DText(v.pos.x,v.pos.y,v.pos.z, ("Appuyer sur ~c~[~%s~E~c~]~s~ pour ~%s~Interagir"):format(Weapon.MarkerTextColor,Weapon.MarkerTextColor))
                DrawMarker(6, v.pos.x,v.pos.y,v.pos.z-0.95, 0.0, 0.0, 0.0, -90, 0.0, 0.0, scale, scale, 0.75, Weapon.MarkerRGB.r, Weapon.MarkerRGB.g, Weapon.MarkerRGB.b, Weapon.MarkerRGB.a1, false, false, nil, false, false, false, false);
                DrawMarker(1, v.pos.x,v.pos.y,v.pos.z-0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, scale, scale, 0.3, Weapon.MarkerRGB.r, Weapon.MarkerRGB.g, Weapon.MarkerRGB.b, Weapon.MarkerRGB.a2, false, false, nil, false, false, false, false);
                if dst1 < 2.0 then
                    sleep = 0
                    if IsControlJustReleased(1, 38) then
                        weaponMainMenu:openMenu()
                    end
                end
            end
        end
        Wait(sleep)
    end
end)
