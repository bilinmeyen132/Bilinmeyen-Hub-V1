-- BILINMEYEN HUB V1
-- Roblox Studio / LocalScript
-- Arayuz ve ornek pet katalogu; gercek oyun ici satin alma yapmaz.

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "BilinmeyenHubV1"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 320, 0, 390)
main.Position = UDim2.new(0.5, -160, 0.5, -195)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 45)
title.BackgroundColor3 = Color3.fromRGB(95, 45, 180)
title.Text = "BILINMEYEN HUB V1"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 19
title.Font = Enum.Font.GothamBold
title.Parent = main

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = title

local petButton = Instance.new("TextButton")
petButton.Size = UDim2.new(0.88, 0, 0, 38)
petButton.Position = UDim2.new(0.06, 0, 0, 58)
petButton.BackgroundColor3 = Color3.fromRGB(65, 65, 90)
petButton.Text = "PET AL"
petButton.TextColor3 = Color3.new(1, 1, 1)
petButton.TextSize = 16
petButton.Font = Enum.Font.GothamBold
petButton.Parent = main

local list = Instance.new("ScrollingFrame")
list.Name = "PetList"
list.Size = UDim2.new(0.88, 0, 0, 210)
list.Position = UDim2.new(0.06, 0, 0, 105)
list.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
list.BorderSizePixel = 0
list.ScrollBarThickness = 5
list.CanvasSize = UDim2.new(0, 0, 0, 0)
list.Visible = false
list.Parent = main

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 5)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = list

local padding = Instance.new("UIPadding")
padding.PaddingTop = UDim.new(0, 5)
padding.PaddingLeft = UDim.new(0, 5)
padding.PaddingRight = UDim.new(0, 5)
padding.Parent = list

-- Ornek pet katalogu: en pahalidan en ucuza.
local pets = {
    {name = "Pet - 200B", price = 200},
    {name = "Pet - 100B", price = 100},
    {name = "Pet - 50B", price = 50},
    {name = "Pet - 20B", price = 20},
}

local function addPet(pet, index)
    local button = Instance.new("TextButton")
    button.Name = "Pet_" .. index
    button.Size = UDim2.new(1, -5, 0, 40)
    button.BackgroundColor3 = Color3.fromRGB(75, 55, 110)
    button.Text = pet.name
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 14
    button.Font = Enum.Font.Gotham
    button.LayoutOrder = index
    button.Parent = list

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 7)
    buttonCorner.Parent = button

    button.Activated:Connect(function()
        print("Secilen pet:", pet.name)
        print("Fiyat:", pet.price .. "B")
    end)
end

for index, pet in ipairs(pets) do
    addPet(pet, index)
end

local function updateCanvas()
    list.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
end

layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas)
updateCanvas()

petButton.Activated:Connect(function()
    list.Visible = not list.Visible
    petButton.Text = list.Visible and "PET MENUSUNU KAPAT" or "PET AL"
end)

local status = Instance.new("TextLabel")
status.Size = UDim2.new(0.88, 0, 0, 35)
status.Position = UDim2.new(0.06, 0, 0, 330)
status.BackgroundTransparency = 1
status.Text = "Pet katalogu hazir"
status.TextColor3 = Color3.fromRGB(190, 190, 210)
status.TextSize = 13
status.Font = Enum.Font.Gotham
status.Parent = main
