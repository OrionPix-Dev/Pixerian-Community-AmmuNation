Weapon = {}

Weapon.MarkerRGB = { r = 40, g = 80, b = 100, a1 = 250, a2 = 100 } -- ici vous pouvez modifier la couleur du marker en modifiant les 3 valeurs r,g,b
Weapon.MarkerTextColor = "b" -- vous avez la couleur des ecriture du marker
Weapon.Line1 = { r = 255, g = 255, b = 255, a = 100} -- ici vous avez la couleur des ligne du menu
Weapon.Categorie1 = "~g~Arme Blanche" -- ici vous avez le nom de la categorie de votre menu
Weapon.Line2 = { r = 255, g = 255, b = 255, a = 100} -- ici vous avez la couleur des ligne du menu
Weapon.Categorie2 = "~g~Arme Létale" -- ici vous avez le nom de la categorie de votre menu
Weapon.Munition = 250 -- ici vous avez le nombre de munition donner a lachat dune arme 
Weapon.serverName = "ServerName"
Weapon.Log = true -- Laisser true si vous voulez voir les log dans la console du server sinon mettez sur false

Weapon.Pos = {
    {pos = vector3(-662.1, -935.3, 21.8)},
    {pos = vector3(810.2, -2157.3, 29.6)},
    {pos = vector3(1693.4, 3759.5, 34.7)},
    {pos = vector3(-330.2, 6083.8, 31.4)},
    {pos = vector3(252.3, -50.0, 69.9)},
    {pos = vector3(22.0, -1107.2, 29.8)},
    {pos = vector3(2567.6, 294.3, 108.7)},
    {pos = vector3(842.4, -1033.4, 287.1)}
    
}

Weapon.Blanche = {
    WEAPON_KNUCKLE = { name = "WEAPON_KNUCKLE", price = 250, label = "Poing américain"},
    WEAPON_KNIFE = { name = "WEAPON_KNIFE", price = 500, label = "Couteau"},
    WEAPON_HATCHET = { name = "WEAPON_HATCHET", price = 750, label = "Hâche"}
}

Weapon.Letale = {
    WEAPON_PISTOL = { name = "WEAPON_PISTOL", price = 250, label = "Pistolet"},
}
