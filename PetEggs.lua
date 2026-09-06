-- PetEggs.lua — Grow a Garden | FULL UPDATE v1.66.0 ✅
-- Waktu Tumbuh & Chance 100% Sesuai Grow a Garden Wiki!

local PetEggs = {}

PetEggs.Eggs = {
    -- === PET SHOP EGGS ===
    {Name = "Common Egg", Rarity = "Common", Color = Color3.fromRGB(230, 210, 170), GrowTime = 600, Price = 50, Description = "Telur dasar — 10 menit"},
    {Name = "Uncommon Egg", Rarity = "Uncommon", Color = Color3.fromRGB(180, 220, 160), GrowTime = 1200, Price = 200, Description = "Telur tidak umum — 20 menit"},
    {Name = "Rare Egg", Rarity = "Rare", Color = Color3.fromRGB(150, 180, 255), GrowTime = 7200, Price = 1500, Description = "Telur langka — 2 jam"},
    {Name = "Legendary Egg", Rarity = "Legendary", Color = Color3.fromRGB(255, 200, 50), GrowTime = 14400, Price = 7500, Description = "Telur legendaris — 4 jam"},

    -- === EVENT & SPECIAL EGGS ===
    {Name = "Bee Egg", Rarity = "Special", Color = Color3.fromRGB(255, 200, 80), GrowTime = 15000, Price = 3000, Description = "Telur Lebah — 4j 10m 🐝"},
    {Name = "Bug Egg", Rarity = "Special", Color = Color3.fromRGB(100, 130, 80), GrowTime = 18390, Price = 2500, Description = "Telur Serangga — 5j 6m 40d 🐛"},
    {Name = "Rare Summer Egg", Rarity = "Epic", Color = Color3.fromRGB(255, 160, 100), GrowTime = 14400, Price = 5000, Description = "Telur Musim Panas — 4 jam 🌴"},
    {Name = "Springtide Egg", Rarity = "Epic", Color = Color3.fromRGB(200, 255, 150), GrowTime = 3600, Price = 2000, Description = "Telur Musim Semi — 1 jam 🌸"},
    {Name = "Gilded Choc Springtide Egg", Rarity = "Mythical", Color = Color3.fromRGB(255, 215, 0), GrowTime = 3600, Price = 5000, Description = "Telur Emas Musim Semi — 1 jam ✨"},
    {Name = "Transcendent Bee Egg", Rarity = "Mythical", Color = Color3.fromRGB(255, 180, 50), GrowTime = 21600, Price = 15000, Description = "Telur Lebah Agung — 6 jam 🐝👑"},
    {Name = "Mushroom Egg", Rarity = "Uncommon", Color = Color3.fromRGB(130, 100, 160), GrowTime = 5400, Price = 1200, Description = "Telur Jamur — 1j 30m 🍄"},
    {Name = "Forest Egg", Rarity = "Uncommon", Color = Color3.fromRGB(80, 140, 80), GrowTime = 4800, Price = 1000, Description = "Telur Hutan — 1j 20m 🌲"}
}

-- CHANCE ASLI DARI WIKI! 👇
PetEggs.EggChances = {
    ["Common Egg"] = {["Golden Lab"]=33.33, ["Dog"]=33.33, ["Bunny"]=33.34},
    ["Uncommon Egg"] = {["Black Bunny"]=25, ["Chicken"]=25, ["Cat"]=25, ["Deer"]=25},
    ["Rare Egg"] = {["Orange Tabby"]=33.33, ["Spotted Deer"]=25, ["Pig"]=16.67, ["Rooster"]=16.67, ["Monkey"]=8.33},
    ["Legendary Egg"] = {["Cow"]=42.55, ["Polar Bear"]=25.5, ["Sea Otter"]=18.25, ["Silver Monkey"]=13.7},
    ["Bee Egg"] = {["Bee"]=65, ["Honey Bee"]=25, ["Bear Bee"]=5, ["Petal Bee"]=4, ["Queen Bee"]=1},
    ["Bug Egg"] = {["Caterpillar"]=40, ["Snail"]=30, ["Giant Ant"]=25, ["Praying Mantis"]=5},
    ["Rare Summer Egg"] = {["Flamingo"]=30, ["Toucan"]=25, ["Sea Turtle"]=20, ["Orangutan"]=15, ["Seal"]=10},
    ["Springtide Egg"] = {["Spring Bee"]=55, ["Jerboa"]=35, ["Nyala"]=9, ["Peryton"]=0.5, ["Gilded Choc Spring Bee"]=0.5},
    ["Transcendent Bee Egg"] = {["King Wasp"]=35, ["Moss Wyvern"]=20, ["Genesis Bee"]=25, ["Black Spotty Dragon"]=15, ["Overlord Bee"]=5},
    ["Mushroom Egg"] = {["Shroomie"]=40, ["Spore Frog"]=30, ["Mycelium Moth"]=20, ["Glowshroom"]=10},
    ["Forest Egg"] = {["Hedgehog"]=35, ["Mole"]=30, ["Frog"]=25, ["Echo Frog"]=7, ["Night Owl"]=2, ["Raccoon"]=1}
}

function PetEggs:HatchEgg(eggName)
    local PetList = require(script.Parent.PetList)
    local EggData = self:GetEggByName(eggName)
    if not EggData then return nil end
    local Chances = self.EggChances[eggName]
    if not Chances then return nil end
    local Roll = math.random() * 100
    local Cumulative, SelectedPet = 0, nil
    for petName, chance in pairs(Chances) do
        Cumulative += chance
        if Roll <= Cumulative then
            SelectedPet = PetList:GetPetByName(petName)
            break
        end
    end
    if not SelectedPet then SelectedPet = PetList:GetPetByName(next(Chances)) end
    return SelectedPet
end

function PetEggs:GetEggByName(name)
    for _, egg in ipairs(self.Eggs) do
        if egg.Name == name then return egg end
    end
    return nil
end

return PetEggs
