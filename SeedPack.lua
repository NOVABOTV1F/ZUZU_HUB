-- SeedPack.lua — Grow a Garden | FULL UPDATE ✅
-- Seed, Tanaman, Sprinkler, Cuaca, Event Lengkap!

local SeedPack = {}

SeedPack.Seeds = {
    -- Basic
    {Name = "Grass Seed", Type = "Basic", GrowTime = 60, SellPrice = 5, Rarity = "Common"},
    {Name = "Dandelion Seed", Type = "Basic", GrowTime = 90, SellPrice = 8, Rarity = "Common"},
    {Name = "Flower Seed", Type = "Basic", GrowTime = 120, SellPrice = 12, Rarity = "Common"},
    -- Vegetable
    {Name = "Carrot Seed", Type = "Vegetable", GrowTime = 300, SellPrice = 35, Rarity = "Uncommon"},
    {Name = "Tomato Seed", Type = "Vegetable", GrowTime = 360, SellPrice = 45, Rarity = "Uncommon"},
    {Name = "Cabbage Seed", Type = "Vegetable", GrowTime = 420, SellPrice = 55, Rarity = "Uncommon"},
    {Name = "Pumpkin Seed", Type = "Vegetable", GrowTime = 900, SellPrice = 150, Rarity = "Rare"},
    {Name = "Watermelon Seed", Type = "Vegetable", GrowTime = 1200, SellPrice = 200, Rarity = "Rare"},
    -- Fruit
    {Name = "Apple Seed", Type = "Fruit", GrowTime = 1800, SellPrice = 300, Rarity = "Rare"},
    {Name = "Coconut Seed", Type = "Fruit", GrowTime = 2400, SellPrice = 450, Rarity = "Rare"},
    {Name = "Mango Seed", Type = "Fruit", GrowTime = 2700, SellPrice = 500, Rarity = "Epic"},
    {Name = "Dragon Fruit Seed", Type = "Fruit", GrowTime = 3600, SellPrice = 800, Rarity = "Epic"},
    {Name = "Cacao Seed", Type = "Fruit", GrowTime = 4200, SellPrice = 950, Rarity = "Epic"},
    -- Event
    {Name = "Sunflower Seed", Type = "Summer", GrowTime = 600, SellPrice = 80, Rarity = "Uncommon"},
    {Name = "Seaweed Seed", Type = "Summer", GrowTime = 480, SellPrice = 65, Rarity = "Uncommon"},
    {Name = "Mushroom Spore", Type = "Mushroom", GrowTime = 720, SellPrice = 120, Rarity = "Uncommon"},
    {Name = "Glowshroom Spore", Type = "Mushroom", GrowTime = 1800, SellPrice = 500, Rarity = "Epic"},
    -- Special
    {Name = "Magic Flower Seed", Type = "Special", GrowTime = 7200, SellPrice = 2500, Rarity = "Legendary"},
    {Name = "Golden Tree Seed", Type = "Special", GrowTime = 14400, SellPrice = 10000, Rarity = "Mythical"},
    {Name = "World Tree Seed", Type = "Special", GrowTime = 43200, SellPrice = 50000, Rarity = "Elder"}
}

SeedPack.Sprinklers = {
    {Name = "Basic Sprinkler", SpeedBoost = 1.1, Range = 5, Price = 100},
    {Name = "Advanced Sprinkler", SpeedBoost = 1.3, Range = 8, Price = 500},
    {Name = "Godly Sprinkler", SpeedBoost = 1.6, Range = 12, Price = 2500},
    {Name = "Master Sprinkler", SpeedBoost = 2.0, Range = 15, Price = 10000},
    {Name = "Grandmaster Sprinkler", SpeedBoost = 2.5, Range = 20, Price = 50000}
}

SeedPack.Weather = {
    ["Rain"] = {SpeedMultiplier = 1.5, Chance = 15},
    ["Heatwave"] = {SpeedMultiplier = 0.8, Chance = 10},
    ["Tornado"] = {SpeedMultiplier = 1.0, DestroyChance = 0.2, Chance = 3},
    ["Windy"] = {SpeedMultiplier = 1.1, Chance = 12},
    ["TropicalRain"] = {SpeedMultiplier = 1.8, Chance = 5},
    ["Thunderstorm"] = {SpeedMultiplier = 1.6, DestroyChance = 0.1, Chance = 4},
    ["SunGod"] = {SpeedMultiplier = 2.0, Chance = 1},
    ["BloodMoonEvent"] = {SpeedMultiplier = 1.3, MutateChance = 0.05, Chance = 2},
    ["MeteorShower"] = {SpeedMultiplier = 1.2, RareDropChance = 0.01, Chance = 1}
}

function SeedPack:GetActualGrowTime(seedName, sprinklerLevel, weather)
    local SeedData, SprinklerData = nil, {SpeedBoost = 1}
    for _, s in ipairs(self.Seeds) do if s.Name == seedName then SeedData = s break end end
    if not SeedData then return 0 end
    if sprinklerLevel then
        for _, s in ipairs(self.Sprinklers) do if s.Name == sprinklerLevel then SprinklerData = s break end end
    end
    local WeatherMult = 1
    if weather and self.Weather[weather] then WeatherMult = self.Weather[weather].SpeedMultiplier end
    return math.floor(SeedData.GrowTime / SprinklerData.SpeedBoost / WeatherMult)
end

return SeedPack
