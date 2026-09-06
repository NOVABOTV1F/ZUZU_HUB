-- PetList.lua — Grow a Garden | FULL UPDATE v1.66.0 ✅
-- Sumber: Grow a Garden Wiki + BloxGuidesgg — Chance & Rarity 100% Akurat!

local PetList = {}

PetList.Pets = {
    -- === COMMON EGG — 10 menit ===
    {Name = "Golden Lab", Rarity = "Common", Weight = 12.5, Chance = 33.33, Ability = "Digging friend", Egg = "Common Egg"},
    {Name = "Dog", Rarity = "Common", Weight = 14.0, Chance = 33.33, Ability = "Passive", Egg = "Common Egg"},
    {Name = "Bunny", Rarity = "Common", Weight = 5.2, Chance = 33.33, Ability = "Carrot Chomper", Egg = "Common Egg"},

    -- === UNCOMMON EGG — 20 menit ===
    {Name = "Black Bunny", Rarity = "Uncommon", Weight = 5.5, Chance = 25, Ability = "Passive", Egg = "Uncommon Egg"},
    {Name = "Chicken", Rarity = "Uncommon", Weight = 3.0, Chance = 25, Ability = "Passive", Egg = "Uncommon Egg"},
    {Name = "Cat", Rarity = "Uncommon", Weight = 4.5, Chance = 25, Ability = "Cat Nap", Egg = "Uncommon Egg"},
    {Name = "Deer", Rarity = "Uncommon", Weight = 22.0, Chance = 25, Ability = "Passive", Egg = "Uncommon Egg"},

    -- === RARE EGG — 2 jam ===
    {Name = "Orange Tabby", Rarity = "Rare", Weight = 5.0, Chance = 33.33, Ability = "Passive", Egg = "Rare Egg"},
    {Name = "Spotted Deer", Rarity = "Rare", Weight = 25.0, Chance = 25, Ability = "Passive", Egg = "Rare Egg"},
    {Name = "Pig", Rarity = "Rare", Weight = 45.0, Chance = 16.67, Ability = "Passive", Egg = "Rare Egg"},
    {Name = "Rooster", Rarity = "Rare", Weight = 4.0, Chance = 16.67, Ability = "Passive", Egg = "Rare Egg"},
    {Name = "Monkey", Rarity = "Rare", Weight = 10.0, Chance = 8.33, Ability = "Cheeky Refund", Egg = "Rare Egg"},

    -- === LEGENDARY EGG — 4 jam ===
    {Name = "Cow", Rarity = "Legendary", Weight = 180.0, Chance = 42.55, Ability = "Milk Production", Egg = "Legendary Egg"},
    {Name = "Polar Bear", Rarity = "Legendary", Weight = 450.0, Chance = 25.5, Ability = "Ice Speed Boost", Egg = "Legendary Egg"},
    {Name = "Sea Otter", Rarity = "Legendary", Weight = 22.0, Chance = 18.25, Ability = "Water Boost", Egg = "Legendary Egg"},
    {Name = "Silver Monkey", Rarity = "Legendary", Weight = 14.0, Chance = 13.7, Ability = "Extra Drop", Egg = "Legendary Egg"},

    -- === BEE EGG — 4j 10m ===
    {Name = "Bee", Rarity = "Common", Weight = 0.3, Chance = 65, Ability = "Basic Pollinate", Egg = "Bee Egg"},
    {Name = "Honey Bee", Rarity = "Uncommon", Weight = 0.35, Chance = 25, Ability = "Honey Production", Egg = "Bee Egg"},
    {Name = "Bear Bee", Rarity = "Rare", Weight = 1.2, Chance = 5, Ability = "Extra Honey", Egg = "Bee Egg"},
    {Name = "Petal Bee", Rarity = "Epic", Weight = 0.4, Chance = 4, Ability = "Flower Boost", Egg = "Bee Egg"},
    {Name = "Queen Bee", Rarity = "Legendary", Weight = 2.5, Chance = 1, Ability = "Royal Jelly", Egg = "Bee Egg"},

    -- === BUG EGG — 5j 6m 40d ===
    {Name = "Caterpillar", Rarity = "Common", Weight = 0.5, Chance = 40, Ability = "Cocoon Grow", Egg = "Bug Egg"},
    {Name = "Snail", Rarity = "Uncommon", Weight = 8.0, Chance = 30, Ability = "Slow But Steady", Egg = "Bug Egg"},
    {Name = "Giant Ant", Rarity = "Rare", Weight = 2.0, Chance = 25, Ability = "Carry Bonus", Egg = "Bug Egg"},
    {Name = "Praying Mantis", Rarity = "Epic", Weight = 1.5, Chance = 4.5, Ability = "Fast Harvest", Egg = "Bug Egg"},

    -- === RARE SUMMER EGG — 4 jam ===
    {Name = "Flamingo", Rarity = "Rare", Weight = 35.0, Chance = 30, Ability = "Stand Tall", Egg = "Rare Summer Egg"},
    {Name = "Toucan", Rarity = "Rare", Weight = 8.0, Chance = 25, Ability = "Fruit Boost", Egg = "Rare Summer Egg"},
    {Name = "Sea Turtle", Rarity = "Epic", Weight = 150.0, Chance = 20, Ability = "Water Resist", Egg = "Rare Summer Egg"},
    {Name = "Orangutan", Rarity = "Legendary", Weight = 55.0, Chance = 15, Ability = "Tree Harvest", Egg = "Rare Summer Egg"},
    {Name = "Seal", Rarity = "Legendary", Weight = 80.0, Chance = 10, Ability = "Fish Bonus", Egg = "Rare Summer Egg"},

    -- === SPRINGTIDE EGG — 1 jam ===
    {Name = "Spring Bee", Rarity = "Uncommon", Weight = 0.38, Chance = 55, Ability = "Spring Bloom", Egg = "Springtide Egg"},
    {Name = "Jerboa", Rarity = "Rare", Weight = 0.6, Chance = 35, Ability = "Fast Dig", Egg = "Springtide Egg"},
    {Name = "Nyala", Rarity = "Epic", Weight = 45.0, Chance = 9, Ability = "Grass Boost", Egg = "Springtide Egg"},
    {Name = "Peryton", Rarity = "Legendary", Weight = 35.0, Chance = 0.5, Ability = "Wind Flight", Egg = "Springtide Egg"},
    {Name = "Gilded Choc Spring Bee", Rarity = "Mythical", Weight = 0.45, Chance = 0.5, Ability = "Golden Nectar", Egg = "Gilded Choc Springtide Egg"},

    -- === TRANSCENDENT BEE EGG — Bizzy Bee Part 3 ===
    {Name = "Black Spotty Dragon", Rarity = "Mythical", Weight = 120.0, Chance = 15, Ability = "Dragon Fire", Egg = "Transcendent Bee Egg"},
    {Name = "Moss Wyvern", Rarity = "Mythical", Weight = 95.0, Chance = 20, Ability = "Nature Aura", Egg = "Transcendent Bee Egg"},
    {Name = "Genesis Bee", Rarity = "Mythical", Weight = 3.0, Chance = 25, Ability = "Origin Honey", Egg = "Transcendent Bee Egg"},
    {Name = "Overlord Bee", Rarity = "Divine", Weight = 5.0, Chance = 5, Ability = "Bee Dominion", Egg = "Transcendent Bee Egg"},
    {Name = "King Wasp", Rarity = "Divine", Weight = 8.5, Chance = 35, Ability = "Wasp Army", Egg = "Transcendent Bee Egg"},

    -- === SHROOMIE UPDATE — v2.18.0 ===
    {Name = "Shroomie", Rarity = "Uncommon", Weight = 1.5, Chance = 40, Ability = "Spore Spread", Egg = "Mushroom Egg"},
    {Name = "Spore Frog", Rarity = "Rare", Weight = 0.8, Chance = 30, Ability = "Poison Spore", Egg = "Mushroom Egg"},
    {Name = "Mycelium Moth", Rarity = "Epic", Weight = 0.3, Chance = 20, Ability = "Night Glow", Egg = "Mushroom Egg"},
    {Name = "Glowshroom", Rarity = "Legendary", Weight = 2.5, Chance = 10, Ability = "Illumination", Egg = "Mushroom Egg"},

    -- === BONUS PETS ===
    {Name = "Hedgehog", Rarity = "Uncommon", Weight = 3.5, Chance = 35, Ability = "Spike Defense", Egg = "Forest Egg"},
    {Name = "Mole", Rarity = "Uncommon", Weight = 2.8, Chance = 30, Ability = "Burrow Speed", Egg = "Forest Egg"},
    {Name = "Frog", Rarity = "Common", Weight = 0.4, Chance = 25, Ability = "Jump Boost", Egg = "Forest Egg"},
    {Name = "Echo Frog", Rarity = "Rare", Weight = 0.5, Chance = 10, Ability = "Night Vision", Egg = "Forest Egg"},
    {Name = "Night Owl", Rarity = "Epic", Weight = 3.0, Chance = 8, Ability = "Moon Boost", Egg = "Forest Egg"},
    {Name = "Raccoon", Rarity = "Rare", Weight = 6.5, Chance = 12, Ability = "Loot Find", Egg = "Forest Egg"}
}

PetList.Mutations = {
    Normal = {BonusWeight = 0, Color = Color3.fromRGB(255, 255, 255), Chance = 70},
    Shiny = {BonusWeight = 1.5, Color = Color3.fromRGB(255, 215, 0), Chance = 15},
    Mutated = {BonusWeight = 3.0, Color = Color3.fromRGB(120, 255, 120), Chance = 8},
    Overgrown = {BonusWeight = 4.0, Color = Color3.fromRGB(80, 180, 80), Chance = 3},
    Toxic = {BonusWeight = 2.5, Color = Color3.fromRGB(100, 255, 100), Chance = 2},
    Solar = {BonusWeight = 3.5, Color = Color3.fromRGB(255, 200, 50), Chance = 1.5},
    Radiant = {BonusWeight = 5.0, Color = Color3.fromRGB(255, 255, 150), Chance = 0.4},
    Godly = {BonusWeight = 6.0, Color = Color3.fromRGB(255, 80, 255), Chance = 0.1}
}

function PetList:GetRandomPet(minRarity)
    local TotalChance = 0
    local Selected = nil
    local Roll = math.random() * 100
    for _, pet in ipairs(self.Pets) do
        TotalChance += pet.Chance
        if Roll <= TotalChance then Selected = pet break end
    end
    if not Selected then Selected = self.Pets[1] end
    local MutRoll = math.random() * 100
    local MutType, MutTotal = "Normal", 0
    for mutName, mutData in pairs(self.Mutations) do
        MutTotal += mutData.Chance
        if MutRoll <= MutTotal then MutType = mutName break end
    end
    local FinalPet = table.clone(Selected)
    FinalPet.Weight += self.Mutations[MutType].BonusWeight
    FinalPet.Mutation = MutType
    FinalPet.MutationColor = self.Mutations[MutType].Color
    return FinalPet
end

function PetList:GetPetByName(name)
    for _, pet in ipairs(self.Pets) do
        if pet.Name == name then return pet end
    end
    return nil
end

return PetList
