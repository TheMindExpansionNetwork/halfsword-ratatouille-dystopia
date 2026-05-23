-- Ratatouille: Dystopia Edition Lua
-- Full chef chaos mode with funny dystopian flavor

local function ApplyTimeDilation(factor)
    local ws = FindFirstOf("WorldSettings")
    if ws and ws:IsValid() then
        ws.TimeDilation = factor
        print(string.format("[Chef] TimeDilation set to %.2fx", factor))
    end
end

local function BuffPlayerHealth(amount)
    local player = FindFirstOf("Willie_BP_C")
    if player and player:IsValid() then
        player.Health = math.min(200.0, (player.Health or 100.0) + amount)
        print(string.format("[Chef] Iron Chef buff applied! (+%.0f HP)", amount))
    end
end

local function BuffMusclePower(amount)
    local player = FindFirstOf("Willie_BP_C")
    if player and player:IsValid() then
        player["Muscle Power"] = (player["Muscle Power"] or 1.0) + amount
        print(string.format("[Chef] Pan-swing power increased! (+%.1f)", amount))
    end
end

-- Commands
local function Cmd_ChefSlow() ApplyTimeDilation(0.3) end
local function Cmd_ChefFast() ApplyTimeDilation(1.8) end
local function Cmd_ChefNormal() ApplyTimeDilation(1.0) end

local function Cmd_IronChef()
    BuffPlayerHealth(75)
    BuffMusclePower(0.4)
    print("[Chef] FULL IRON CHEF MODE ACTIVATED!")
end

local function Cmd_PanTime()
    ApplyTimeDilation(0.15)
    print("[Chef] PAN TIME!")
end

RegisterConsoleCommand("ChefSlow", Cmd_ChefSlow)
RegisterConsoleCommand("ChefFast", Cmd_ChefFast)
RegisterConsoleCommand("ChefNormal", Cmd_ChefNormal)
RegisterConsoleCommand("IronChef", Cmd_IronChef)
RegisterConsoleCommand("PanTime", Cmd_PanTime)

-- Full Mode Toggle
local dystopiaActive = false
local function ToggleDystopia()
    dystopiaActive = not dystopiaActive
    if dystopiaActive then
        ApplyTimeDilation(0.55)
        print("[CHEF APOCALYPSE] KITCHEN DYSTOPIA MODE ACTIVATED!")
        print("[CHEF APOCALYPSE] The world has become one giant ruined kitchen.")
        print("[CHEF APOCALYPSE] Everyone is a rat. Everyone has a pan. This is the final course.")
    else
        ApplyTimeDilation(1.0)
        print("[CHEF APOCALYPSE] The dream is over. Back to normal suffering.")
    end
end

RegisterConsoleCommand("KitchenDystopia", ToggleDystopia)
RegisterConsoleCommand("ChefApocalypse", ToggleDystopia)

print("[Ratatouille] Commands: KitchenDystopia, IronChef, PanTime, ChefSlow, ChefFast...")
print("[Ratatouille] Remember: Anyone can cook. Not everyone survives.")