-- ZUZU HUB — Grow a Garden | FULL UPDATE v1.66.0 ✅ | NO KEY!
-- Sumber: Grow a Garden Wiki — Chance & GrowTime 100% Akurat!

local ZUZU_HUB = {}
ZUZU_HUB.__index = ZUZU_HUB

-- Notif Awal
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "🟣 ZUZU HUB";
    Text = "Connected! Loading fitur...";
    Duration = 3;
})
task.wait(2.5)

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZUZU_HUB"
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 880, 0, 580)
MainFrame.Position = UDim2.new(0.05, 0, 0.08, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
MainFrame.CornerRadius = UDim.new(0, 14)
MainFrame.Parent = ScreenGui

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 48)
TitleBar.BackgroundColor3 = Color3.fromRGB(32, 32, 52)
TitleBar.CornerRadius = UDim.new(0, 14)
TitleBar.Parent = MainFrame
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -50, 1, 0)
Title.Position = UDim2.new(0, 18, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🟣 ZUZU HUB — Grow a Garden v1.66.0"
Title.TextColor3 = Color3.fromRGB(200, 100, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

-- Left Panel — Garden & Egg Selection
local LeftPanel = Instance.new("Frame")
LeftPanel.Size = UDim2.new(0.34, 0, 1, -58)
LeftPanel.Position = UDim2.new(0, 12, 0, 52)
LeftPanel.BackgroundColor3 = Color3.fromRGB(28, 28, 42)
LeftPanel.CornerRadius = UDim.new(0, 10)
LeftPanel.Parent = MainFrame

local EggLabel = Instance.new("TextLabel")
EggLabel.Size = UDim2.new(1, -20, 0, 35)
EggLabel.Position = UDim2.new(0, 10, 0, 10)
EggLabel.BackgroundTransparency = 1
EggLabel.Text = "🥚 Egg Selection — Klik & Taruh di Garden"
EggLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
EggLabel.Font = Enum.Font.GothamBold
EggLabel.TextSize = 15
EggLabel.Parent = LeftPanel

-- Egg Container — BENTUK BULAT!
local EggContainer = Instance.new("ScrollingFrame")
EggContainer.Size = UDim2.new(1, -20, 0.72, 0)
EggContainer.Position = UDim2.new(0, 10, 0, 50)
EggContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
EggContainer.CornerRadius = UDim.new(0, 8)
EggContainer.ScrollBarThickness = 6
EggContainer.Parent = LeftPanel

local EggLayout = Instance.new("UIGridLayout")
EggLayout.CellSize = UDim2.new(0, 85, 0, 100)
EggLayout.CellPadding = UDim2.new(0, 10, 0, 10)
EggLayout.Parent = EggContainer

local SelectedEgg = nil
local function CreateEggBtn(eggData)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0, 75, 0, 75)
    Btn.BackgroundColor3 = eggData.Color
    Btn.AutoLocalize = false
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(1, 0) -- BULAT!
    
    local NameLab = Instance.new("TextLabel")
    NameLab.Size = UDim2.new(1, 0, 0, 22)
    NameLab.Position = UDim2.new(0, 0, 1, -22)
    NameLab.BackgroundTransparency = 1
    NameLab.Text = eggData.Name
    NameLab.TextColor3 = Color3.fromRGB(255, 255, 255)
    NameLab.Font = Enum.Font.Gotham
    NameLab.TextSize = 10
    NameLab.TextWrapped = true
    NameLab.Parent = Btn
    
    local TimeLab = Instance.new("TextLabel")
    TimeLab.Size = UDim2.new(1, 0, 0, 16)
    TimeLab.Position = UDim2.new(0, 0, 0, -16)
    TimeLab.BackgroundTransparency = 1
    TimeLab.Text = eggData.GrowTime.."s"
    TimeLab.TextColor3 = Color3.fromRGB(200, 255, 150)
    TimeLab.Font = Enum.Font.GothamBold
    TimeLab.TextSize = 9
    TimeLab.Parent = Btn
    
    Btn.MouseButton1Click:Connect(function()
        SelectedEgg = eggData
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "🥚 Dipilih: "..eggData.Name;
            Text = "Waktu: "..eggData.GrowTime.." detik";
            Duration = 2;
        })
    end)
    Btn.Parent = EggContainer
end

-- Load Semua Egg
task.spawn(function()
    local EggData = require(script.Parent.PetEggs)
    for _, egg in ipairs(EggData.Eggs) do
        CreateEggBtn(egg)
    end
end)

-- Garden Area
local GardenArea = Instance.new("Frame")
GardenArea.Size = UDim2.new(1, -20, 0.20, 0)
GardenArea.Position = UDim2.new(0, 10, 0, 83)
GardenArea.BackgroundColor3 = Color3.fromRGB(35, 60, 35)
GardenArea.CornerRadius = UDim.new(0, 8)
GardenArea.Parent = LeftPanel
local GardenText = Instance.new("TextLabel")
GardenText.Size = UDim2.new(1, -10, 1, 0)
GardenText.Position = UDim2.new(0, 5, 0, 0)
GardenText.BackgroundTransparency = 1
GardenText.Text = "🌿 Garden — Klik taruh Egg"
GardenText.TextColor3 = Color3.fromRGB(180, 255, 180)
GardenText.Font = Enum.Font.Gotham
GardenText.TextSize = 12
GardenText.Parent = GardenArea

-- Right Panel — Pet Info & Auto Hatch
local RightPanel = Instance.new("Frame")
RightPanel.Size = UDim2.new(0.62, 0, 1, -58)
RightPanel.Position = UDim2.new(0, 305, 0, 52)
RightPanel.BackgroundColor3 = Color3.fromRGB(28, 28, 42)
RightPanel.CornerRadius = UDim.new(0, 10)
RightPanel.Parent = MainFrame

local PetTitle = Instance.new("TextLabel")
PetTitle.Size = UDim2.new(1, -20, 0, 35)
PetTitle.Position = UDim2.new(0, 10, 0, 10)
PetTitle.BackgroundTransparency = 1
PetTitle.Text = "🐾 Pet Info — Auto Hatch & Sell"
PetTitle.TextColor3 = Color3.fromRGB(255, 180, 120)
PetTitle.Font = Enum.Font.GothamBold
PetTitle.TextSize = 16
PetTitle.Parent = RightPanel

-- Pet Detail
local PetDetail = Instance.new("Frame")
PetDetail.Size = UDim2.new(1, -20, 0.42, 0)
PetDetail.Position = UDim2.new(0, 10, 0, 55)
PetDetail.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
PetDetail.CornerRadius = UDim.new(0, 10)
PetDetail.Parent = RightPanel

local PetName = Instance.new("TextLabel")
PetName.Size = UDim2.new(1, -20, 0, 32)
PetName.Position = UDim2.new(0, 12, 0, 12)
PetName.BackgroundTransparency = 1
PetName.Text = "Nama Pet: —"
PetName.TextColor3 = Color3.fromRGB(255, 255, 255)
PetName.Font = Enum.Font.GothamBold
PetName.TextSize = 20
PetName.TextXAlignment = Enum.TextXAlignment.Left
PetName.Parent = PetDetail

local PetRarity = Instance.new("TextLabel")
PetRarity.Size = UDim2.new(1, -20, 0, 24)
PetRarity.Position = UDim2.new(0, 12, 0, 48)
PetRarity.BackgroundTransparency = 1
PetRarity.Text = "Rarity: —"
PetRarity.TextColor3 = Color3.fromRGB(200, 200, 200)
PetRarity.Font = Enum.Font.Gotham
PetRarity.TextSize = 14
PetRarity.TextXAlignment = Enum.TextXAlignment.Left
PetRarity.Parent = PetDetail

local PetWeight = Instance.new("TextLabel")
PetWeight.Size = UDim2.new(1, -20, 0, 24)
PetWeight.Position = UDim2.new(0, 12, 0, 75)
PetWeight.BackgroundTransparency = 1
PetWeight.Text = "Berat: — kg"
PetWeight.TextColor3 = Color3.fromRGB(150, 220, 255)
PetWeight.Font = Enum.Font.Gotham
PetWeight.TextSize = 14
PetWeight.TextXAlignment = Enum.TextXAlignment.Left
PetWeight.Parent = PetDetail

local PetAbility = Instance.new("TextLabel")
PetAbility.Size = UDim2.new(1, -20, 0, 24)
PetAbility.Position = UDim2.new(0, 12, 0, 102)
PetAbility.BackgroundTransparency = 1
PetAbility.Text = "Ability: —"
PetAbility.TextColor3 = Color3.fromRGB(255, 200, 100)
PetAbility.Font = Enum.Font.Gotham
PetAbility.TextSize = 14
PetAbility.TextXAlignment = Enum.TextXAlignment.Left
PetAbility.Parent = PetDetail

local PetChance = Instance.new("TextLabel")
PetChance.Size = UDim2.new(1, -20, 0, 24)
PetChance.Position = UDim2.new(0, 12, 0, 129)
PetChance.BackgroundTransparency = 1
PetChance.Text = "Chance: —%"
PetChance.TextColor3 = Color3.fromRGB(180, 255, 180)
PetChance.Font = Enum.Font.Gotham
PetChance.TextSize = 14
PetChance.TextXAlignment = Enum.TextXAlignment.Left
PetChance.Parent = PetDetail

-- Tombol
local SellBtn = Instance.new("TextButton")
SellBtn.Size = UDim2.new(0, 150, 0, 45)
SellBtn.Position = UDim2.new(0, 12, 0, 165)
SellBtn.BackgroundColor3 = Color3.fromRGB(220, 70, 70)
SellBtn.CornerRadius = UDim.new(0, 8)
SellBtn.Text = "💰 Sell Pet"
SellBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SellBtn.Font = Enum.Font.GothamBold
SellBtn.TextSize = 15
SellBtn.Parent = PetDetail

local EquipBtn = Instance.new("TextButton")
EquipBtn.Size = UDim2.new(0, 150, 0, 45)
EquipBtn.Position = UDim2.new(0, 175, 0, 165)
EquipBtn.BackgroundColor3 = Color3.fromRGB(70, 160, 255)
EquipBtn.CornerRadius = UDim.new(0, 8)
EquipBtn.Text = "⚔️ Equip Pet"
EquipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EquipBtn.Font = Enum.Font.GothamBold
EquipBtn.TextSize = 15
EquipBtn.Parent = PetDetail

-- Auto Hatch Toggle
local AutoHatchFrame = Instance.new("Frame")
AutoHatchFrame.Size = UDim2.new(1, -20, 0, 60)
AutoHatchFrame.Position = UDim2.new(0, 10, 0, 490)
AutoHatchFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
AutoHatchFrame.CornerRadius = UDim.new(0, 8)
AutoHatchFrame.Parent = RightPanel

local AutoHatchToggle = Instance.new("TextButton")
AutoHatchToggle.Size = UDim2.new(0, 160, 0, 40)
AutoHatchToggle.Position = UDim2.new(0, 12, 0, 10)
AutoHatchToggle.BackgroundColor3 = Color3.fromRGB(80, 220, 120)
AutoHatchToggle.CornerRadius = UDim.new(0, 6)
AutoHatchToggle.Text = "✅ Auto Hatch: ON"
AutoHatchToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoHatchToggle.Font = Enum.Font.GothamBold
AutoHatchToggle.TextSize = 14
AutoHatchToggle.Parent = AutoHatchFrame

local AutoHatchInfo = Instance.new("TextLabel")
AutoHatchInfo.Size = UDim2.new(1, -180, 0, 40)
AutoHatchInfo.Position = UDim2.new(0, 185, 0, 10)
AutoHatchInfo.BackgroundTransparency = 1
AutoHatchInfo.Text = "Hanya menetas setelah tumbuh selesai! ✅"
AutoHatchInfo.TextColor3 = Color3.fromRGB(150, 255, 180)
AutoHatchInfo.Font = Enum.Font.Gotham
AutoHatchInfo.TextSize = 12
AutoHatchInfo.TextXAlignment = Enum.TextXAlignment.Left
AutoHatchInfo.Parent = AutoHatchFrame

-- Logic
local AutoHatchEnabled = true
AutoHatchToggle.MouseButton1Click:Connect(function()
    AutoHatchEnabled = not AutoHatchEnabled
    AutoHatchToggle.Text = AutoHatchEnabled and "✅ Auto Hatch: ON" or "❌ Auto Hatch: OFF"
    AutoHatchToggle.BackgroundColor3 = AutoHatchEnabled and Color3.fromRGB(80, 220, 120) or Color3.fromRGB(220, 80, 80)
end)

-- Auto Hatch — HANYA jika tumbuh selesai!
task.spawn(function()
    local PetEggs = require(script.Parent.PetEggs)
    local PetList = require(script.Parent.PetList)
    while task.wait(1) do
        if not AutoHatchEnabled then continue end
        local Garden = workspace:FindFirstChild("Garden")
        if not Garden then continue end
        for _, plot in ipairs(Garden:GetChildren()) do
            local EggObj = plot:FindFirstChild("Egg")
            if not EggObj then continue end
            local GrowTime = EggObj:GetAttribute("GrowTime") or 0
            local Placed = EggObj:GetAttribute("PlacedTime") or 0
            if os.time() - Placed >= GrowTime and GrowTime > 0 then
                local EggName = EggObj:GetAttribute("EggName") or "Unknown"
                local ResultPet = PetEggs:HatchEgg(EggName)
                if ResultPet then
                    -- Notif Menetas!
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "🥚 EGG HATCHED!";
                        Text = EggName .. " → " .. ResultPet.Name .. "!";
                        Duration = 4;
                    })
                    -- Update Panel
                    PetName.Text = "Nama Pet: " .. ResultPet.Name
                    PetRarity.Text = "Rarity: " .. ResultPet.Rarity
                    PetWeight.Text = "Berat: " .. tostring(ResultPet.Weight) .. " kg"
                    PetAbility.Text = "Ability: " .. (ResultPet.Ability or "—")
                    PetChance.Text = "Chance: " .. tostring(ResultPet.Chance) .. "%"
                    -- Simpan ke Inventory
                    local Inv = Player:FindFirstChild("PetInventory") or Instance.new("Folder")
                    Inv.Name = "PetInventory"
                    Inv.Parent = Player
                    local NewPet = Instance.new("StringValue")
                    NewPet.Name = ResultPet.Name .. "_" .. os.time()
                    NewPet.Value = ResultPet.Rarity .. "|" .. ResultPet.Weight .. "|" .. (ResultPet.Ability or "")
                    NewPet.Parent = Inv
                end
                EggObj:Destroy()
            end
        end
    end
end)

-- Sell Logic
SellBtn.MouseButton1Click:Connect(function()
    local Rarity = PetRarity.Text:gsub("Rarity: ", "")
    local Prices = {Common=5, Uncommon=15, Rare=50, Epic=200, Legendary=1000, Mythical=5000, Divine=10000, Elder=25000}
    local Price = Prices[Rarity] or 10
    local leaderstats = Player:FindFirstChild("leaderstats")
    local Coins = leaderstats and leaderstats:FindFirstChild("Coins")
    if Coins then Coins.Value += Price end
    game:GetService("StarterGui"):SetCore("SendNotification", {Title="💰 Dijual!"; Text="+",tostring(Price)," Coins"; Duration=2})
    PetName.Text = "Nama Pet: —"
    PetRarity.Text = "Rarity: —"
    PetWeight.Text = "Berat: — kg"
    PetAbility.Text = "Ability: —"
    PetChance.Text = "Chance: —%"
end)

-- Drag
local function Drag(frame)
    local s, start, pos
    TitleBar.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then s=true start=i.Position pos=frame.Position end
    end)
    game:GetService("UserInputService").InputChanged:Connect(function(i)
        if s and i.UserInputType == Enum.UserInputType.MouseMovement then
            local d=i.Position-start
            frame.Position=UDim2.new(pos.X.Scale,pos.X.Offset+d.X,pos.Y.Scale,pos.Y.Offset+d.Y)
        end
    end)
    TitleBar.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then s=false end end)
end
Drag(MainFrame)

print("🟣 ZUZU HUB v1.66.0 — Loaded! NO KEY ✅ | All Pets & Eggs Updated!")
return ZUZU_HUB
