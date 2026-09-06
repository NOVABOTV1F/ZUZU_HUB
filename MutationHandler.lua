-- MutationHandler.lua — Grow a Garden | FULL UPDATE ✅
-- Mutasi Lengkap: Normal → Shiny → Mutated → Overgrown → Toxic → Solar → Radiant → Godly!

local MutationHandler = {}

MutationHandler.Mutations = {
    ["Normal"] = {WeightBonus = 0, PriceMultiplier = 1, Color = Color3.fromRGB(255,255,255), Chance = 70, Description = "Biasa"},
    ["Shiny"] = {WeightBonus = 1.5, PriceMultiplier = 1.5, Color = Color3.fromRGB(255,215,0), Chance = 15, Description = "Berkilauan ✨"},
    ["Mutated"] = {WeightBonus = 3.0, PriceMultiplier = 2.0, Color = Color3.fromRGB(120,255,120), Chance = 8, Description = "Bermutasi 🧬"},
    ["Overgrown"] = {WeightBonus = 4.0, PriceMultiplier = 2.5, Color = Color3.fromRGB(80,180,80), Chance = 3, Description = "Tumbuh Lebih Besar 🌿"},
    ["Toxic"] = {WeightBonus = 2.5, PriceMultiplier = 3.0, Color = Color3.fromRGB(100,255,100), Chance = 2, Description = "Beracun ☠️"},
    ["Solar"] = {WeightBonus = 3.5, PriceMultiplier = 3.5, Color = Color3.fromRGB(255,200,50), Chance = 1.5, Description = "Tenaga Matahari ☀️"},
    ["Radiant"] = {WeightBonus = 5.0, PriceMultiplier = 5.0, Color = Color3.fromRGB(255,255,150), Chance = 0.4, Description = "Bercahaya Terang 💡"},
    ["Godly"] = {WeightBonus = 6.0, PriceMultiplier = 10.0, Color = Color3.fromRGB(255,80,255), Chance = 0.1, Description = "Dewa 👑"}
}

function MutationHandler:RollMutation(bonusChance)
    bonusChance = bonusChance or 0
