-- Script Path: game:GetService("StarterPlayer").StarterPlayerScripts.ButterShopUI
-- Took 0.01s to decompile.
-- Executor: Potassium (v2.5.0)

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Workspace = game:GetService("Workspace");
local LocalPlayer = Players.LocalPlayer;
local ButterRemotes = ReplicatedStorage:WaitForChild("ButterRemotes");
local BuyUpgrade = ButterRemotes:WaitForChild("BuyUpgrade");
local SyncUpgrades = ButterRemotes:WaitForChild("SyncUpgrades");
local Rebirth = ButterRemotes:WaitForChild("Rebirth");
local u1 = {
    WalkSpeed = {
        name = "Fast Feet",
        desc = "Walk faster around the butter path!",
        maxLevel = 10,
        baseCost = 50,
        costMultiplier = 1.5,
        icon = "👟"
    },
    PointsMultiplier = {
        name = "Butter Boost",
        desc = "Get more points every time you step on butter!",
        maxLevel = 10,
        baseCost = 75,
        costMultiplier = 1.6,
        icon = "🧈"
    }
};
local u2 = { "WalkSpeed", "PointsMultiplier" };

local function getCost(p3, p4) -- Line: 42
    -- upvalues: u1 (copy)
    local v5 = u1[p3];

    return math.floor(v5.baseCost * v5.costMultiplier ^ p4);
end;

local ScreenGui = Instance.new("ScreenGui");
ScreenGui.Name = "ButterShopUI";
ScreenGui.ResetOnSpawn = false;
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui");
local Frame = Instance.new("Frame");
Frame.Size = UDim2.new(0, 450, 0, 440);
Frame.Position = UDim2.new(0.5, -225, 0.5, -220);
Frame.BackgroundColor3 = Color3.fromRGB(255, 250, 230);
Frame.BackgroundTransparency = 0.05;
Frame.BorderSizePixel = 0;
Frame.Visible = false;
Frame.Parent = ScreenGui;
local UICorner = Instance.new("UICorner");
UICorner.CornerRadius = UDim.new(0, 16);
UICorner.Parent = Frame;
local UIStroke = Instance.new("UIStroke");
UIStroke.Color = Color3.fromRGB(220, 180, 40);
UIStroke.Thickness = 3;
UIStroke.Parent = Frame;
local TextLabel = Instance.new("TextLabel");
TextLabel.Size = UDim2.new(1, -60, 0, 50);
TextLabel.Position = UDim2.new(0, 20, 0, 10);
TextLabel.BackgroundTransparency = 1;
TextLabel.Text = "🧈 Butter Shop";
TextLabel.TextColor3 = Color3.fromRGB(100, 70, 0);
TextLabel.TextScaled = true;
TextLabel.Font = Enum.Font.SourceSansBold;
TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
TextLabel.Parent = Frame;
local TextButton = Instance.new("TextButton");
TextButton.Size = UDim2.new(0, 40, 0, 40);
TextButton.Position = UDim2.new(1, -50, 0, 15);
TextButton.BackgroundColor3 = Color3.fromRGB(255, 120, 120);
TextButton.Text = "×";
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255);
TextButton.TextScaled = true;
TextButton.Font = Enum.Font.SourceSansBold;
TextButton.BorderSizePixel = 0;
TextButton.Parent = Frame;
local UICorner2 = Instance.new("UICorner");
UICorner2.CornerRadius = UDim.new(0, 8);
UICorner2.Parent = TextButton;
local Frame2 = Instance.new("Frame");
Frame2.Size = UDim2.new(1, -30, 0, 360);
Frame2.Position = UDim2.new(0, 15, 0, 65);
Frame2.BackgroundTransparency = 1;
Frame2.Parent = Frame;
local UIListLayout = Instance.new("UIListLayout");
UIListLayout.Padding = UDim.new(0, 12);
UIListLayout.Parent = Frame2;
local u6 = {};
local u7 = {
    WalkSpeed = 0,
    PointsMultiplier = 0
};

for _, v in ipairs(u2) do
    local v8 = u1[v];
    local Frame3 = Instance.new("Frame");
    Frame3.Size = UDim2.new(1, 0, 0, 110);
    Frame3.BackgroundColor3 = Color3.fromRGB(255, 245, 200);
    Frame3.BorderSizePixel = 0;
    Frame3.Parent = Frame2;
    local UICorner3 = Instance.new("UICorner");
    UICorner3.CornerRadius = UDim.new(0, 12);
    UICorner3.Parent = Frame3;
    local UIStroke2 = Instance.new("UIStroke");
    UIStroke2.Color = Color3.fromRGB(200, 170, 30);
    UIStroke2.Thickness = 1.5;
    UIStroke2.Parent = Frame3;
    local TextLabel2 = Instance.new("TextLabel");
    TextLabel2.Size = UDim2.new(0, 60, 0, 60);
    TextLabel2.Position = UDim2.new(0, 12, 0.5, -30);
    TextLabel2.BackgroundTransparency = 1;
    TextLabel2.Text = v8.icon;
    TextLabel2.TextScaled = true;
    TextLabel2.Font = Enum.Font.SourceSansBold;
    TextLabel2.Parent = Frame3;
    local TextLabel3 = Instance.new("TextLabel");
    TextLabel3.Size = UDim2.new(1, -200, 0, 30);
    TextLabel3.Position = UDim2.new(0, 85, 0, 10);
    TextLabel3.BackgroundTransparency = 1;
    TextLabel3.Text = v8.name;
    TextLabel3.TextColor3 = Color3.fromRGB(100, 70, 0);
    TextLabel3.TextScaled = true;
    TextLabel3.Font = Enum.Font.SourceSansBold;
    TextLabel3.TextXAlignment = Enum.TextXAlignment.Left;
    TextLabel3.Parent = Frame3;
    local TextLabel4 = Instance.new("TextLabel");
    TextLabel4.Size = UDim2.new(1, -200, 0, 24);
    TextLabel4.Position = UDim2.new(0, 85, 0, 38);
    TextLabel4.BackgroundTransparency = 1;
    TextLabel4.Text = v8.desc;
    TextLabel4.TextColor3 = Color3.fromRGB(120, 100, 30);
    TextLabel4.TextScaled = true;
    TextLabel4.Font = Enum.Font.SourceSans;
    TextLabel4.TextXAlignment = Enum.TextXAlignment.Left;
    TextLabel4.Parent = Frame3;
    local TextLabel5 = Instance.new("TextLabel");
    TextLabel5.Size = UDim2.new(1, -200, 0, 24);
    TextLabel5.Position = UDim2.new(0, 85, 0, 64);
    TextLabel5.BackgroundTransparency = 1;
    TextLabel5.Text = "Level: 0 / " .. v8.maxLevel;
    TextLabel5.TextColor3 = Color3.fromRGB(80, 120, 30);
    TextLabel5.TextScaled = true;
    TextLabel5.Font = Enum.Font.SourceSansBold;
    TextLabel5.TextXAlignment = Enum.TextXAlignment.Left;
    TextLabel5.Parent = Frame3;
    local TextButton2 = Instance.new("TextButton");
    TextButton2.Size = UDim2.new(0, 110, 0, 40);
    TextButton2.Position = UDim2.new(1, -125, 0.5, -20);
    TextButton2.BackgroundColor3 = Color3.fromRGB(80, 200, 80);
    TextButton2.Text = "Buy";
    TextButton2.TextColor3 = Color3.fromRGB(255, 255, 255);
    TextButton2.TextScaled = true;
    TextButton2.Font = Enum.Font.SourceSansBold;
    TextButton2.BorderSizePixel = 0;
    TextButton2.Parent = Frame3;
    local UICorner4 = Instance.new("UICorner");
    UICorner4.CornerRadius = UDim.new(0, 8);
    UICorner4.Parent = TextButton2;
    u6[v] = {
        card = Frame3,
        levelLabel = TextLabel5,
        buyButton = TextButton2
    };
    TextButton2.MouseButton1Click:Connect(function() -- Line: 202
        -- upvalues: BuyUpgrade (copy), v (copy)
        BuyUpgrade:FireServer(v);
    end);
end;

local Frame3 = Instance.new("Frame");
Frame3.Size = UDim2.new(1, 0, 0, 100);
Frame3.BackgroundColor3 = Color3.fromRGB(240, 220, 255);
Frame3.BorderSizePixel = 0;
Frame3.Parent = Frame2;
local UICorner3 = Instance.new("UICorner");
UICorner3.CornerRadius = UDim.new(0, 12);
UICorner3.Parent = Frame3;
local UIStroke2 = Instance.new("UIStroke");
UIStroke2.Color = Color3.fromRGB(160, 100, 220);
UIStroke2.Thickness = 2;
UIStroke2.Parent = Frame3;
local TextLabel2 = Instance.new("TextLabel");
TextLabel2.Size = UDim2.new(0, 50, 0, 50);
TextLabel2.Position = UDim2.new(0, 12, 0.5, -25);
TextLabel2.BackgroundTransparency = 1;
TextLabel2.Text = "🌟";
TextLabel2.TextScaled = true;
TextLabel2.Font = Enum.Font.SourceSansBold;
TextLabel2.Parent = Frame3;
local TextLabel3 = Instance.new("TextLabel");
TextLabel3.Size = UDim2.new(1, -200, 0, 28);
TextLabel3.Position = UDim2.new(0, 75, 0, 12);
TextLabel3.BackgroundTransparency = 1;
TextLabel3.Text = "Rebirth";
TextLabel3.TextColor3 = Color3.fromRGB(100, 50, 150);
TextLabel3.TextScaled = true;
TextLabel3.Font = Enum.Font.SourceSansBold;
TextLabel3.TextXAlignment = Enum.TextXAlignment.Left;
TextLabel3.Parent = Frame3;
local TextLabel4 = Instance.new("TextLabel");
TextLabel4.Size = UDim2.new(1, -200, 0, 22);
TextLabel4.Position = UDim2.new(0, 75, 0, 40);
TextLabel4.BackgroundTransparency = 1;
TextLabel4.Text = "Reset stats & grow your plot!";
TextLabel4.TextColor3 = Color3.fromRGB(130, 100, 160);
TextLabel4.TextScaled = true;
TextLabel4.Font = Enum.Font.SourceSans;
TextLabel4.TextXAlignment = Enum.TextXAlignment.Left;
TextLabel4.Parent = Frame3;
local TextLabel5 = Instance.new("TextLabel");
TextLabel5.Size = UDim2.new(1, -200, 0, 22);
TextLabel5.Position = UDim2.new(0, 75, 0, 64);
TextLabel5.BackgroundTransparency = 1;
TextLabel5.Text = "Rebirths: 0";
TextLabel5.TextColor3 = Color3.fromRGB(100, 60, 140);
TextLabel5.TextScaled = true;
TextLabel5.Font = Enum.Font.SourceSansBold;
TextLabel5.TextXAlignment = Enum.TextXAlignment.Left;
TextLabel5.Parent = Frame3;
local TextButton2 = Instance.new("TextButton");
TextButton2.Size = UDim2.new(0, 110, 0, 40);
TextButton2.Position = UDim2.new(1, -125, 0.5, -20);
TextButton2.BackgroundColor3 = Color3.fromRGB(170, 100, 220);
TextButton2.Text = "Rebirth";
TextButton2.TextColor3 = Color3.fromRGB(255, 255, 255);
TextButton2.TextScaled = true;
TextButton2.Font = Enum.Font.SourceSansBold;
TextButton2.BorderSizePixel = 0;
TextButton2.Parent = Frame3;
local UICorner4 = Instance.new("UICorner");
UICorner4.CornerRadius = UDim.new(0, 8);
UICorner4.Parent = TextButton2;
TextButton2.MouseButton1Click:Connect(function() -- Line: 280
    -- upvalues: Rebirth (copy)
    Rebirth:FireServer();
end);

local function updateCards() -- Line: 285
    -- upvalues: LocalPlayer (copy), u2 (copy), u1 (copy), u6 (copy), u7 (ref), TextLabel5 (copy), TextButton2 (copy)
    local leaderstats = LocalPlayer:FindFirstChild("leaderstats");
    local v9 = 0;

    if leaderstats then
        local v10 = leaderstats:FindFirstChild("Butter Points");

        if v10 then
            v9 = v10.Value;
        end;
    end;

    for _, v in ipairs(u2) do
        local v11 = u1[v];
        local v12 = u6[v];

        if v12 then
            local v13 = u7[v];
            v12.levelLabel.Text = "Level: " .. v13 .. " / " .. v11.maxLevel;

            if v11.maxLevel <= v13 then
                v12.buyButton.Text = "MAX";
                v12.buyButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200);
                v12.buyButton.AutoButtonColor = false;
            else
                local v14 = u1[v];
                local math_floor_ret = math.floor(v14.baseCost * v14.costMultiplier ^ v13);
                v12.buyButton.Text = tostring(math_floor_ret) .. " BP";

                if math_floor_ret <= v9 then
                    v12.buyButton.BackgroundColor3 = Color3.fromRGB(80, 200, 80);
                    v12.buyButton.AutoButtonColor = true;
                else
                    v12.buyButton.BackgroundColor3 = Color3.fromRGB(200, 100, 100);
                    v12.buyButton.AutoButtonColor = false;
                end;
            end;
        end;
    end;

    if leaderstats then
        leaderstats = leaderstats:FindFirstChild("Rebirths");
    end;

    local v15 = leaderstats and leaderstats.Value or 0;
    TextLabel5.Text = "Rebirths: " .. v15;
    local math_floor_ret = math.floor(1000 * 2 ^ v15);
    TextButton2.Text = tostring(math_floor_ret) .. " BP";

    if math_floor_ret <= v9 then
        TextButton2.BackgroundColor3 = Color3.fromRGB(170, 100, 220);
        TextButton2.AutoButtonColor = true;

        return;
    end;

    TextButton2.BackgroundColor3 = Color3.fromRGB(120, 80, 160);
    TextButton2.AutoButtonColor = false;
end;

SyncUpgrades.OnClientEvent:Connect(function(p16) -- Line: 336
    -- upvalues: u7 (ref), updateCards (copy)
    u7 = p16;
    updateCards();
end);
local leaderstats = LocalPlayer:WaitForChild("leaderstats");
leaderstats:WaitForChild("Butter Points").Changed:Connect(function() -- Line: 344
    -- upvalues: updateCards (copy)
    updateCards();
end);
leaderstats:WaitForChild("Rebirths").Changed:Connect(function() -- Line: 350
    -- upvalues: updateCards (copy)
    updateCards();
end);
local ShopBooth = Workspace:WaitForChild("ShopBooth", 10);

if ShopBooth then
    local Torso = ShopBooth:WaitForChild("Torso", 5);
    local v17 = Torso and Torso:WaitForChild("OpenShop", 5);

    if v17 then
        v17.Triggered:Connect(function() -- Line: 361
            -- upvalues: Frame (copy), updateCards (copy)
            Frame.Visible = true;
            updateCards();
        end);
    end;
end;

TextButton.MouseButton1Click:Connect(function() -- Line: 369
    -- upvalues: Frame (copy)
    Frame.Visible = false;
end);
updateCards();
