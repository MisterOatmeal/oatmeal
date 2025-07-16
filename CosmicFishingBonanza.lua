-- =========================================
-- SCRIPT REQUIREMENTS
-- =========================================

-- REQUIRED PLUGINS:
    -- ICE
    -- vnavmesh
    -- Artisan
    -- visland
    -- AutoHook

-- AUTOHOOK PRESETS (see github)

-- VISLAND ROUTES (see github)

-- A-3 HYBRID WEATHER UNLOCK REQUIREMENTS:
    -- GOLD ON: CUL: A-3: Loporrit Dietary Improvement III (A-3: Eel Rations)
    -- GOLD ON: GSM: A-3: Vending Machines (A-3: Crystallic Gems)
        -- GOLD ON: FSH: A-1: Fine-grade Water Filter Materials I
        -- GOLD ON: FSH: A-2: Fine-grade Water Filter Materials II
        -- GOLD ON: FSH: A-3: Fine-grade Water Filter Materials III

-- To Dos:

    -- Scalability/less cumbersome method of adding new missions.
    -- Developing a reliable AH preset portfolio to complete a selection of good missions during Clear Skies.
    -- FGWFM I - III AutoHook Presets
    -- Botany and Mining maybe??

-- =========================================
-- USER CONFIGURATION SECTION
-- =========================================

-- Manually select the missions you want to run in ICE.
    -- Set ICE to "Grab Mission Only"


-- Fill in the following gearset names to match your own gearsets.
    FisherGearset = "Fisher"
    CulinarianGearset = "Culinarian"
    AlchemistGearset = "Alchemist"
    GoldsmithGearset = "Goldsmith"
    BlacksmithGearset = "Blacksmith"


-- AutoHook Preset Map
    -- Do not change the mission IDs. Only change the preset name IF you want to use a different preset than the ones I have provided.

local presetMap = {
    [509] = "MoonGel",
    [508] = "ProcessedMetals",
    [510] = "CrystallicGems",
    [511] = "EelRations",
    [543] = "SunkDrone",
    [544] = "MutatedFish",
    [542] = "EdibleFish",
}

-- More missions are planned to be added in the future, when I have time to develop them reliably.

-- =========================================
-- LIBRARIES
-- =========================================

import("System.Numerics")

-- Fishing Holes (Sinus Ardorum) and Vectors / Routes (for pathfinding). 
    -- If you use my visland routes, you have to use the coordinates in this table. Otherwise, the script will not recognize your character being at the correct location.

local fishingHoles= {
    ["Palus Arsenici"]       = { x = 527.0,  y = 53.7,  z = 598.1 , route = "SURF PALUS ASSINIRE 100% GUARANTEED" },    
    ["Hollow Harbor"]        = { x = -563.5, y = 69.1,  z = -647.4, route = "BASE TO HOLLOW HARBOR 99% GUARANTEE SPECIAL" },
    ["Northward Hop-print"]  = { x = 918.3, y = -58.8,  z = -337.2, route = "NORTH HOP-PRINT SURELY" },
    ["Southeast Well"]       = { x = 203.7,  y = 19.5,  z = 204.7, route = "SURF TO THE WELL (SOUTHEAST) MAJOR BIGLY" },
    ["Weeping Pool"]         = { x = 70.5,   y = 26.0,  z = -307.1, route = "YOSHIP'S CASUALS TEAR COLLECTION" },
    ["Westward Hop-print"]   = { x = -264.2, y = 22.4,  z = -96.1, route = "OUEST HOP-PRANT" },
    ["Glimmerpond Alpha"]    = { x = -688.1, y = 57.1,  z = 398.9, route = "GIGALPHAPOOCHAD" },
    ["Glimmerpond Beta"]     = { x = -357.5, y = 47.8,  z = 639.8, route = "GIGAPOOBETASISSY" },
    ["Aetherial Falls"]      = { x = 918.2,  y = -58.8, z = -337.2, route = "REALLY???????? FUCK WATERFALLS" },
    ["Critical_Drone_LOC"]  = { x = -124.4, y = 20.1, z = -286.3, route = "SUNKEN DRONK" },
    ["Critical_EdibleFish_LOC"] = { x = -297.8, y = 22.9, z = -95.5, route = "EDIBLE WHAT" },
    ["Critical_Drone_TurnIn"] = { route = "dead ai lol" },
    ["Critical_EdibleFish_TurnIn"] = { route = "mmmm edibles" },
}


local FishingMissions = {

        -- Prerequisite Missions (Sequential FSH A-1 to A-3) (incomplete, working on AH Presets)
    {
        id = 485,
        name = "A-1: Fine-grade Water Filter Materials I",
        hole = "Westward Hop-print",
        coords = fishingHoles["Westward Hop-print"],
        requiresCrafting = false,
    },{
        id = 486,
        name = "A-2: Fine-grade Water Filter Materials II",
        hole = "Weeping Pool",
        coords = fishingHoles["Weeping Pool"],
        requiresCrafting = false,
    },{
        id = 487,
        name = "A-3: Fine-grade Water Filter Materials III",
        hole = "Hollow Harbor",
        coords = fishingHoles["Hollow Harbor"],
        requiresCrafting = false
    },

        -- A-3 Weather-Based Hybrid Missions
    {
        id = 510,
        name = "A-3: Crystallic Gems",
        fishID = 45928,
        famount = 14, -- Worth the GP cost.
        itemID = 47221,
        iamount = 2,
        weatherId = 49,
        weatherName = "Umbral Wind",
        hole = "Palus Arsenici",
        coords = fishingHoles["Palus Arsenici"],
        requiresCrafting = true,
        crafter = "Goldsmith",
    },{
        id = 511,
        name = "A-3: Eel Rations",
        fishID = 45940,
        famount = 3,
        itemID = 45934,
        iamount = 3,
        weatherId = 148,
        weatherName = "Moon Dust",
        hole = "Hollow Harbor",
        coords = fishingHoles["Hollow Harbor"],
        requiresCrafting = true,
        crafter = "Culinarian",
    },

        -- A-2 Clear Skies Hybrid Missions
    {
        id = 509,
        name = "A-2: Refined Moon Gel",
        fishID = 45922,
        famount = 3,
        itemID = 47593,
        iamount = 3,
        weatherId = 1,
        weatherName = "Clear Skies",
        hole = "Westward Hop-print",
        coords = fishingHoles["Westward Hop-print"],
        requiresCrafting = true,
        crafter = "Alchemist",
    },{
        id = 508,
        name = "A-2: Processed Aquatic Metals",
        fishID = 45917,
        famount = 14,
        itemId = 46973,
        iamount = 2,
        weatherId = 1,
        weatherName = "Clear Skies",
        hole = "Southeast Well",
        coords = fishingHoles["Southeast Well"],
        requiresCrafting = true,
        crafter = "Blacksmith",
    },

        -- Critical Fishing Missions (α variants)
    {
        id = 543,
        name = "Sunken Drone Salvage",
        fishID = 45939,
        famount = 3,
        weatherId = 149,  -- Astromagnetic Storms (α)
        weatherName = "Astromagnetic Storms",
        hole = "Northward Hop-print",
        coords = fishingHoles["Northward Hop-print"],
        turnIn = "Critical_Drone_TurnIn",
        requiresCrafting = false,
    },

        -- Critical Fishing Missions (β variants)
    {
        id = 544,
        name = "Mutated Fish",
        fishID = 45945,
        famount = 3,
        weatherId = 197,  -- Sporing Mist (β)
        weatherName = "Sporing Mist",
        hole = "Weeping Pool",
        coords = fishingHoles["Weeping Pool"],
        turnIn = {x = 0, y = 0, z = 0}, --finish this
        requiresCrafting = false,
    },{
        id = 542,
        name = "Edible Fish",
        fishID = 45937,
        famount = 3,
        weatherId = 196,  -- Astromagnetic Storms (β)
        weatherName = "Astromagnetic Storms",
        hole = "Northward Hop-print",
        coords = fishingHoles["Northward Hop-print"],
        turnIn = "Critical_EdibleFish_TurnIn",
        requiresCrafting = false,
    },

        -- Meteor Showers (α): Reserved for Future Expansion
    {
        id = 998,
        name = "Meteor Shower Variant (Placeholder - Alpha)",
        fishID = nil,
        famount = nil,
        weatherId = 194,  -- Meteor Showers α
        weatherName = "Meteor Showers (A)",
        hole = nil,
        coords = nil,
        turnIn = nil,
        requiresCrafting = nil,
    },

        -- Meteor Showers (β): Reserved for Future Expansion
    {
        id = 999,
        name = "Meteor Shower Variant (Placeholder - Beta)",
        fishID = nil,
        famount = nil,
        weatherId = 195,  -- Meteor Showers β
        weatherName = "Meteor Showers (B)",
        hole = nil,
        coords = nil,
        turnIn = nil,
        requiresCrafting = nil,
    }
}

-- =========================================
-- PLUGIN CHECKS
-- =========================================

function HasPlugin(name)
    for plugin in luanet.each(Svc.PluginInterface.InstalledPlugins) do
        if plugin.InternalName == name then
            return true
        end
    end
    return false
end

function CheckPlugins()
    local plugins = {
        AutoHook = HasPlugin("AutoHook"),
        Artisan = HasPlugin("Artisan"),
        ICE = HasPlugin("ICE"),
        vnavmesh = HasPlugin("vnavmesh"),
        visland = HasPlugin("visland"),
}
    local missing = {}
    for name, found in pairs(plugins) do
        if not found then
            table.insert(missing, name)
        end
    end
    if #missing > 0 then
        for i, name in ipairs(missing) do
            yield("/echo You're missing these plugins: " .. name)
        end
        yield("/wait 0.2")      
        yield("/snd stop all")
        return false
    end
    return true
end

-- =========================================
-- GEARSET CHANGE
-- =========================================

function EquipFisher()
    if classId ~= 18 then
        yield("/gs change " .. FisherGearset)
        yield("/wait 0.5")
    end
end

-- =========================================
-- WKSMISSIONINFORMATION CHECK
-- =========================================

function EnsureMissionWindowOpen()
    if not Addons.GetAddon("WKSMissionInfomation").Ready then
        yield("/callback WKSHud true 11")
        yield("/wait 0.2")
    end
end

-- =========================================
-- MISSION IDENTIFICATION (PARSE NODE 29)
-- =========================================

local iceStarted = false

function GetActiveMission()
    if not iceStarted then
        yield("/ice start")
        yield("/wait 2")  
        iceStarted = true
    end

    while true do
        EnsureMissionWindowOpen()
        if Addons.GetAddon("WKSMissionInfomation").Ready then
            local missionName = Addons.GetAddon("WKSMissionInfomation"):GetNode(1,3).Text
            for _, mission in ipairs(FishingMissions) do
                if mission.name == missionName then
                return mission
                end
            end
        end
        yield("/wait 0.5")
    end
end

local mission = GetActiveMission()
    if not mission then
    yield("No active mission detected. You have to select missions in ICE in order for this script to proceed.")
    return
end

function IsCriticalMission(mission)
    return mission.id == 542 or mission.id == 543 or mission.id == 544
end

function GetDistanceToTarget(targetCoords)
    local playerPos = Svc.ClientState.LocalPlayer.Position
    local distance = math.sqrt((playerPos.X - targetCoords.x)^2 + (playerPos.Y - targetCoords.y)^2 + (playerPos.Z - targetCoords.z)^2)
    return distance
end

-- =========================================
-- AUTHOOK PRESET SELECTION
-- =========================================

function AutoHookPresetByMission(missionId, missionName)
    local preset = presetMap[missionId]
    if preset then
        IPC.AutoHook.SetPreset(preset)
        if IPC and IPC.AutoHook and IPC.AutoHook.SetPluginState then
            IPC.AutoHook.SetPluginState(true)
        end
        yield('/echo Set AutoHookingway to preset "' .. preset .. '" for mission "' .. (missionName or "?") .. '".')
    else
        yield('/echo No matching AutoHook preset for mission "' .. (missionName or "?") .. '" (ID ' .. tostring(missionId) .. ').')
        yield("/snd stop all")
        return false
    end
    return true
end

-- =========================================
-- PATHING TO FISHING LOCATION
-- =========================================

function MoveToTarget(holeName, targetCoords)
    local holeData = fishingHoles[holeName]

    if holeData and holeData.route and holeData.route ~= "" then
        local routeName = holeData.route
        yield('/echo Moving to ' .. holeName .. ' using Visland route: ' .. routeName)
        yield('/visland execonce ' .. routeName)

        local distance = GetDistanceToTarget(targetCoords)
            while distance > 5 do          
            yield("/wait 1")
            distance = GetDistanceToTarget(targetCoords)
            end

        yield('/echo Arrived at ' .. holeName .. '.')
        return true
    else
        yield('/echo ERROR: No Visland route found for "' .. holeName .. '". Stopping script.')
        yield("/snd stop all")
        return false
    end
end

-- =========================================
-- FISHING AND (OPTIONAL) CRAFTING STEP
-- =========================================

function PerformFishingMission(mission)
    if not mission.itemId then
        yield("/echo Mission data is incomplete (missing itemId). Skipping.")
        yield("/wait 3")
        return
    end

    -- Use the IPC call to enable and start the AutoHook fishing process.
    if IPC and IPC.AutoHook and IPC.AutoHook.SetPluginState then
        yield("/echo Starting AutoHook via IPC...")
        IPC.AutoHook.SetPluginState(true)
    else
        yield("/echo ERROR: Could not send command to AutoHook.")
        yield("/snd stop all")
        return
    end

    yield('/wait 1')
  
    -- Wait until the "Fishing" condition (43) is no longer active.
    while Svc.Condition[43] do
        yield("/wait 1")
    end

    -- Turn AutoHook OFF via IPC now that the work is done.
    if IPC and IPC.AutoHook and IPC.AutoHook.SetPluginState then
        IPC.AutoHook.SetPluginState(false)
    end
    
    -- Cleanup logic to ensure the character "stands up".
    if Svc and Svc.Condition and Svc.Condition[6] then
        yield("/ac quit")
        while Svc.Condition[6] do
            yield("/wait 0.2")
        end
    end

    yield("/echo Astronauttingway. Fishing complete. Proceed.")
end

function DoCraftingStep(mission)
    -- First, check if the mission requires crafting at all.
    if not mission.requiresCrafting then
        return
    end

    if not Addons.GetAddon("WKSRecipeNotebook").Ready then
        if not Addons.GetAddon("WKSMissionInfomation").Ready then
            yield("/callback WKSHud true 11")
            yield("/wait 0.2")
        end
        yield("/callback WKSMissionInfomation true 14 1")
        yield("/wait 0.2")
    end

    IPC.Artisan.SetEnduranceStatus(true)

    while IPC.Artisan.GetEnduranceStatus() == true do
        yield("/wait 0.5")
    end

    yield("/echo Craftingway complete.") 
end

-- =========================================
-- TURN IN MISSION
-- =========================================

function SubmitMission(mission)

    EquipFisher()
    yield("/wait 0.2")

    if IsCriticalMission(mission) then
        MoveToTarget(mission.turnIn, fishingHoles[mission.turnIn])
        yield('/target "Collection Point"')
        yield("/interact")
        yield("/wait 2")
    else

        if not Addons.GetAddon("WKSMissionInfomation").Ready then
            yield("/callback WKSHud true 11")
            yield("/wait 0.2")
        end
        yield("/callback WKSMissionInfomation true 11 1")
        yield("/wait 1")
    end
end

-- =========================================
-- LOOP
-- =========================================

while true do
    if not CheckPlugins() then return end

    EquipFisher()

    local mission = GetActiveMission()

    if not mission then
        yield("/echo No active mission detected. Waiting...")
        yield("/wait 5")
        yield("/echo Well, this party is over. We don't have a damn mission to do.")
        yield("/snd stop all")
        goto continue
    end

    local distance = GetDistanceToTarget(mission.coords)

    if distance > 5 then
        yield('/echo Moving to next location.')
        yield('/ac "Duty Action I"')
        yield("/wait 10") -- Wait for teleport to complete
        MoveToTarget(mission.hole, mission.coords)
    end

    AutoHookPresetByMission(mission.id, mission.name)
    PerformFishingMission(mission)
    DoCraftingStep(mission)
    SubmitMission(mission)
    yield("/wait 2")
    ::continue::
end