print("[^5Pixerian - Community^7] [^1INFO^7] ESX ^5AmmuNation^0 initialized")

ESX.RegisterServerCallback('pixerianshop:buyitemsInWeaponBlanche', function(src, cb, name, accountSelected)
    local xPlayer = ESX.GetPlayerFromId(src)
    local id = GetPlayerIdentifier(src)
    if Weapon.Blanche[name].name == name then
        local item = Weapon.Blanche[name]
        if xPlayer.getAccount(accountSelected).money >= item.price then
                xPlayer.removeAccountMoney(accountSelected, item.price)
                xPlayer.addWeapon(item.name, 1)
                xPlayer.showNotification(("Vous avez acheter :\n- ~y~%s ~%s~%s~s~ pour %s~g~$"):format("1", Weapon.MarkerTextColor, item.label, item.price))
                if Weapon.Log == true then
                    print(("[^5Pixerian-Community^7] [^1INFO^7] ^3Identifier ^5 %s ^2a acheter un(e) ^5%s ^0"):format(id, item.label))
                end
                cb(true)
        else
            xPlayer.showNotification(('~r~Vous n\'avez pas assez d\'argent pour acheter un(e) ~%s~%s.'):format(Weapon.MarkerTextColor, item.label))
            cb(false)
        end
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('pixerianshop:buyitemsInWeaponArme', function(src, cb, name, accountSelected)
    local xPlayer = ESX.GetPlayerFromId(src)
    local id = GetPlayerIdentifier(src)
    if Weapon.Letale[name].name == name then
        local item = Weapon.Letale[name]
        if xPlayer.getAccount(accountSelected).money >= item.price then
                xPlayer.removeAccountMoney(accountSelected, item.price)
                xPlayer.addWeapon(item.name, ("%s"):format(Weapon.Munition))
                xPlayer.showNotification(("Vous avez acheter :\n- ~y~%s ~%s~%s~s~ pour %s~g~$"):format("1", Weapon.MarkerTextColor, item.label, item.price))
                if Weapon.Log == true then
                    print(("[^5Pixerian-Community^7] [^1INFO^7] ^3Identifier ^5 %s ^2a acheter un(e) ^5%s ^2avec ^5%s ^2munition^0"):format(id, item.label, Weapon.Munition))
                end
                cb(true)
        else
            xPlayer.showNotification(('~r~Vous n\'avez pas assez d\'argent pour acheter un(e) ~%s~%s.'):format(Weapon.MarkerTextColor, item.label))
            cb(false)
        end
    else
        cb(false)
    end
end)
