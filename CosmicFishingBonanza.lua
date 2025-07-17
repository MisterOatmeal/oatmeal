-- =========================================
-- SCRIPT REQUIREMENTS
-- =========================================

-- REQUIRED PLUGINS:
    -- ICE
    -- vnavmesh
    -- Artisan
    -- visland
    -- AutoHook
    -- Pandora

-- PLUGIN CONFIGS:
    -- ICE:
        -- Enable at least 1 of the required missions (see below). Ideally, all.
        -- [x] Only Grab Mission
        -- [ ] Stop on Errors (off)
        -- Under Gathering Config:
            -- [ ] Auto-Cordial (off) (This does not work in Manual mode, so we have Pandora do it)

    -- vnavmesh:
        -- [x] Align Camera to Movement Direction
        -- [0.75] Randomness Multiplier

    -- Artisan: Under Raphael Solver Settings, Enable the following:
        -- [ ] Ensure 100% Reliability (off)
        -- [x] Allow backloading of progress in macro generation.
        -- [x] Automatically Generate a solution if a valid one hasn't been created.
        -- [x] Automatically switch to the Raphael Solver once a solution has been created.

    -- visland:
        -- Import ALL routes listed on the github.
        -- [x] Extract materia during routes
        -- [x] Repair gear during routes

    -- AutoHook: 
        -- Import presets provided on the github page.
        -- [x] Enable AutoHook Route Generation
        -- [x] Use AutoHook Routes for Navigation

    -- Pandora:
        -- [x] Auto-Cordial
            -- [550] GP Threshold
            -- [x] Prevent Overcap
            -- [x] Use on Fisher

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
    -- Gamba wheel spending, credits per min stats.


-- =========================================
-- USER CONFIGURATION SECTION
-- =========================================

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
-- DATA TABLES
-- =========================================

import("System.Numerics")

local fishingHoles = {
    ["Palus Arsenici"] = { x = 527.0, y = 53.7, z = 598.1, route = "SURF PALUS ASSINIRE 100% GUARANTEED" },
    ["Hollow Harbor"] = { x = -563.5, y = 69.1, z = -647.4, route = "BASE TO HOLLOW HARBOR 99% GUARANTEE SPECIAL" },
    ["Northward Hop-print"] = { x = 918.3, y = -58.8, z = -337.2, route = "NORTH HOP-PRINT SURELY" },
    ["Southeast Well"] = { x = 203.7, y = 19.5, z = 204.7, route = "SURF TO THE WELL (SOUTHEAST) MAJOR BIGLY" },
    ["Weeping Pool"] = { x = 70.5, y = 26.0, z = -307.1, route = "YOSHIP'S CASUALS TEAR COLLECTION" },
    ["Westward Hop-print"] = { x = -264.2, y = 22.4, z = -96.1, route = "OUEST HOP-PRANT" },
    ["Glimmerpond Alpha"] = { x = -688.1, y = 57.1, z = 398.9, route = "GIGALPHAPOOCHAD" },
    ["Glimmerpond Beta"] = { x = -357.5, y = 47.8, z = 639.8, route = "GIGAPOOBETASISSY" },
    ["Aetherial Falls"] = { x = 918.2, y = -58.8, z = -337.2, route = "REALLY???????? FUCK WATERFALLS" },
    ["Critical_Drone_LOC"] = { x = -124.4, y = 20.1, z = -286.3, route = "SUNKEN DRONK" },
    ["Critical_EdibleFish_LOC"] = { x = -299.7, y = 24.4, z = -102.0, route = "EDIBLE WHAT" },
    ["Critical_MutatedFish_LOC"] = { x = 110.2, y = 18.8, z = -229.5, route = "DONALDTRUMPFISH" },
    ["Critical_Drone_TurnIn"] = { x = -250.9, y = 19.5, z = -250.9 },
    ["Critical_EdibleFish_TurnIn"] = { x = -459.2, y = 37.7, z = -67.1 },
    ["Critical_MutatedFish_TurnIn"] = { x = 114.9, y = 19.7, z = -196.9 },
}

local FishingMissions = {
    -- Prerequisite Missions (WIP)
    { id = 485, name = "A-1: Fine-grade Water Filter Materials I", hole = "Westward Hop-print", coords = fishingHoles["Westward Hop-print"], requiresCrafting = false },
    { id = 486, name = "A-2: Fine-grade Water Filter Materials II", hole = "Weeping Pool", coords = fishingHoles["Weeping Pool"], requiresCrafting = false },
    { id = 487, name = "A-3: Fine-grade Water Filter Materials III", hole = "Hollow Harbor", coords = fishingHoles["Hollow Harbor"], requiresCrafting = false },
    -- A-3 Weather-Based Hybrid Missions
    { id = 510, name = "A-3: Crystallic Gems", fishID = 45928, famount = 14, itemId = 47221, iamount = 3, min_iamount = 1, weatherId = 49, hole = "Palus Arsenici", coords = fishingHoles["Palus Arsenici"], requiresCrafting = true, crafter = "Goldsmith" },
    { id = 511, name = "A-3: Eel Rations", fishID = 45940, famount = 3, itemId = 45934, iamount = 3, min_iamount = 1, weatherId = 148, hole = "Hollow Harbor", coords = fishingHoles["Hollow Harbor"], requiresCrafting = true, crafter = "Culinarian" },
    -- A-2 Clear Skies Hybrid Missions
    { id = 509, name = "A-2: Refined Moon Gel", fishID = 45922, famount = 3, itemID = 47593, iamount = 3, min_iamount = 1, weatherId = 1, hole = "Westward Hop-print", coords = fishingHoles["Westward Hop-print"], requiresCrafting = true, crafter = "Alchemist" },
    { id = 508, name = "A-2: Processed Aquatic Metals", fishID = 45917, famount = 14, itemId = 46973, iamount = 3, min_iamount = 1, weatherId = 1, hole = "Southeast Well", coords = fishingHoles["Southeast Well"], requiresCrafting = true, crafter = "Blacksmith" },
    -- Critical Fishing Missions
    { id = 543, name = "Sunken Drone Salvage", fishID = 45939, famount = 3, weatherId = 149, hole = "Critical_Drone_LOC", coords = fishingHoles["Critical_Drone_LOC"], turnIn = "Critical_Drone_TurnIn", requiresCrafting = false },
    { id = 544, name = "Mutated Fish", fishID = 45945, famount = 3, weatherId = 197, hole = "Critical_MutatedFish_LOC", coords = fishingHoles["Critical_MutatedFish_LOC"], turnIn = "Critical_MutatedFish_TurnIn", requiresCrafting = false },
    { id = 542, name = "Edible Fish", fishID = 45937, famount = 3, weatherId = 196, hole = "Critical_EdibleFish_LOC", coords = fishingHoles["Critical_EdibleFish_LOC"], turnIn = "Critical_EdibleFish_TurnIn", requiresCrafting = false },
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
        PandorasBox = HasPlugin("PandorasBox"),
}
    local missing = {}
    for name, found in pairs(plugins) do
        if not found then
            table.insert(missing, name)
        end
    end
    if #missing > 0 then
        for i, name in ipairs(missing) do
            yield("/echo You're missing these plugins: " .. name". Stopping the process, astronaut.")
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
    end
end

-- =========================================
-- MISSION IDENTIFICATION (PARSE NODE 29)
-- =========================================

local iceStarted = false

function GetActiveMission()
    if not iceStarted then
        yield("/ice start")
        yield("/wait 0.5")
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
    yield("No active mission detected. Astronaut, you forgot to read the manual. Pick some missions!")
    yield("/snd stop all")
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
        yield('/echo Hookingway applying: "' .. preset .. '" for mission "' .. (missionName or "?") .. '".')
        return true
    else
        yield('/echo Hookingway does not have instructions installed for mission "' .. (missionName or "?") .. '" (ID ' .. tostring(missionId) .. ').')
        return false
    end
end

-- =========================================
-- PATHING TO FISHING LOCATION
-- =========================================

function MoveToTarget(holeName, targetCoords)

    local maxRetries = 2
    local holeData = fishingHoles[holeName]

    if not (holeData and holeData.route and holeData.route ~= "") then
        yield('/echo SurboardTingway has no route to get to "' .. holeName .. '". Maybe you need to import your surfing routes? Abandoning mission.')
        return false
    end

    for attempt = 1, maxRetries do
        yield('/echo SurboardTingway attempt number ' .. attempt .. ' of ' .. maxRetries .. ' to "' .. holeName .. '".')
        local routeName = holeData.route
        IPC.Visland.StartRoute(routeName, false)

        local startTime = os.time()
        local maxTravelTime = 120
        local StuckCheckTime = os.time()
        local StuckCheckPos = Svc.ClientState.LocalPlayer.Position

        while IPC.Visland.IsRouteRunning() do
            if (os.time() - startTime) > maxTravelTime then
                yield("/echo Astronaut, this is taking a bit too long. I think SurboardTingway collided with an unidentified object, or has an unidentified route... One more try!")
                IPC.Visland.StopRoute()
                break
            end

            if (os.time() - StuckCheckTime) > 5 then
                local currentPos = Svc.ClientState.LocalPlayer.Position
                local distMovedOverTime = math.sqrt((currentPos.X - StuckCheckPos.X)^2 + (currentPos.Y - StuckCheckPos.Y)^2 + (currentPos.Z - StuckCheckPos.Z)^2)

                if distMovedOverTime < 1 then
                    yield("/echo SurboardTingway seems to have collided with an unidentified object. Lets try that again.")
                    IPC.Visland.StopRoute()
                    break
                end

                StuckCheckTime = os.time()
                StuckCheckPos = currentPos

            end
            yield("/wait 1")
        end

        if GetDistanceToTarget(targetCoords) <= 5 then
            yield('/echo SurboardTingway is a boss! We are here at ' .. holeName .. '.')
            return true
        elseif attempt < maxRetries then
            yield("/echo Movement failed. Returning to base to retry...")
            Actions.ExecuteGeneralAction(26)
            yield("/wait " .. math.random(7, 12))
        end
    end

    yield("/echo SurfboardTingway failed to reach " .. holeName .. " after " .. maxRetries .. " attempts. Abandoning mission. :(")
    return false
end

-- =========================================
-- FISHING AND (OPTIONAL) CRAFTING STEP
-- =========================================

function PerformFishingMission(mission)
     if not mission.fishID or not mission.famount then
        yield("/echo Hookingway needs more data, astronaut. Did you load different presets or click some extra missions in the manifest?")
        return false
    end

    if IPC and IPC.AutoHook and IPC.AutoHook.SetPluginState then
        IPC.AutoHook.SetPluginState(true)
    else
        yield("/echo Hookingway not active. Cannot proceed with fishing. Abandoning mission!")
        return false
    end

        yield("/echo Hookingway officially engaged. Hurry up and wait.")

    local startTime = os.time() -- Timeout check.
    local maxFishingTime = 480 -- 8 minutes max.

    while Inventory.GetItemCount(mission.fishID) < mission.famount do

        -- Check 1: Timeout
        if (os.time() - startTime) > maxFishingTime then
            yield("/echo SLOW POKE. Took too long to catch the required fish.")
            IPC.AutoHook.SetPluginState(false)
            return false
        end

        -- Check 2: AH interrupted, didn't finish its preset correctly for some reason.
        if not Svc.Condition[43] then
            yield("/echo Not fishing, but still need items. Restarting AutoHook.")
            yield('/ahstart')
            yield('/wait 1')
        end

        yield("/wait 1")
    end

    if IPC and IPC.AutoHook and IPC.AutoHook.SetPluginState then
        IPC.AutoHook.SetPluginState(false)
    end

    if Svc.Condition[6] then
        yield("/ac quit")
        while Svc.Condition[6] do
            yield("/wait 0.2")
        end
    end

    yield("/echo Hey, astronaut, fishing confirmed complete. Proceeding.")
    return true
end

function HasMinAnglersArtStacks()
    if not (Svc and Svc.ClientState and Svc.ClientState.LocalPlayer and Svc.ClientState.LocalPlayer.StatusList) then
        return false
    end

    for _, status in ipairs(Svc.ClientState.LocalPlayer.StatusList) do
        if status.StatusId == 2778 then
            if status.Param >= 3 then
                yield("/echo Angler's Art Stacks detected! Lets use them up for GP!")
                return true
            end
        end
    end
    return false
end

function UseAnglersArtStacks()
    if HasMinAnglersArtStacks() then
        yield("/echo Angler's Art Stacks detected! Using them up for GP...")
        while HasMinAnglersArtStacks() do
            Actions.ExecuteGeneralAction(26804)
            yield("/wait 1.5")
        end
    end
end


function DoCraftingStep(mission)
    if not mission.requiresCrafting then
        return true
    end

    UseAnglersArtStacks()

    -- Final failsafe if can't get out of fisher stance...
    if Svc and Svc.Condition and Svc.Condition[6] then
        yield("/echo Get up and craft... astronaut...")
        yield("/ac quit")
        while Svc.Condition[6] do
            yield("/wait 0.2")
        end
    end

    if not Addons.GetAddon("WKSRecipeNotebook").Ready then
        if not Addons.GetAddon("WKSMissionInfomation").Ready then
            yield("/callback WKSHud true 11")
            yield("/wait 0.2")
        end
        yield("/callback WKSMissionInfomation true 14 1")
        yield("/wait 0.5")
        yield("/echo Crafting way is fired up and ready to go. Copilot commence!")
    end

    IPC.Artisan.SetEnduranceStatus(true)

    while IPC.Artisan.GetEnduranceStatus() == true do
        yield("/wait 1")
    end

    local craftedCount = Inventory.GetItemCount(mission.itemID)

    if craftedCount >= mission.min_iamount then
        yield("/echo Craftingway is a savant. We've got " .. craftedCount .. " items produced! Time to submit to the unknown deity of Sinus Ardorum.")
        return true
    else
        yield("/echo Craftingway failed. Did not meet minimum of " .. mission.min_iamount .. ". Uhhh...")
        return false
    end
end

-- =========================================
-- TURN IN MISSION
-- =========================================

function SubmitMission(mission)
    if mission.requiresCrafting then -- Hybrid missions
        if Inventory.GetItemCount(mission.itemId) < mission.min_iamount then
            yield("/echo ERROR: Missing final CRAFTED items.")
            return false
        end
    else -- For fish-only missions
        if not mission.fishID then
            return true -- Incomplete prerequisite mission, consider it a success.
        end
        if Inventory.GetItemCount(mission.fishID) < mission.famount then
            yield("/echo ERROR: Missing FISH for turn-in.")
            return false
        end
    end

    while Svc.Condition[5] do yield("/wait 0.1") end

    EquipFisher()

    yield("/wait 0.5")

    if IsCriticalMission(mission) then
        local turnInCoords = fishingHoles[mission.turnIn]
            if not (turnInCoords and turnInCoords.x) then
                yield("/echo ERROR: Missing coordinates for critical turn-in.")
                return false
            end

        local destVector = Vector3.new(turnInCoords.x, turnInCoords.y, turnInCoords.z)

        IPC.Vnavmesh.PathfindAndMoveTo(destVector, false)

            while IPC.Vnavmesh.IsRunning() do
                yield("/wait 0.5")
            end

        yield('/target "Collection Point"')
        yield("/interact")
        yield("/wait 3")

    else

        if not Addons.GetAddon("WKSMissionInfomation").Ready then
            yield("/callback WKSHud true 11")
            yield("/wait 0.2")
        end

        yield("/callback WKSMissionInfomation true 11 1")
        yield("/wait 1")
    end

    yield("/echo Mission submission complete.")
    return true
end

function CurrentLunarPoints()
    local pointsNode = Addons.GetAddon("WKSHud").GetNode(4, 3)

    if pointsNode and pointsNode.Text then
        local pointsString = string.gsub(pointsNode.Text, ",", "")
        return tonumber(pointsString) or 0
    end
    return 0
end

function CurrentCosmicClassExp()
    local xpNode = Addons.GetAddon("WKSScoreList").GetNode(8, 3, 5)
    if xpNode and xpNode.Text then
        local xpString = xpNode.Text
            xpString = string.gsub(xpString, ",", "")
            xpString = string.gsub(xpString, "%.", "")
        return tonumber(xpString) or 0
    end
    return 0
end

-- =========================================
-- LOOP
-- =========================================

local lastCompletionTime = os.time() -- Kill Condition
local lastLunarPoints = CurrentLunarPoints() -- variables for lunarPPH
local lastClassExp = CurrentCosmicClassExp() -- variables for classPPH
local isFirstRun = true -- prevent first run msg from reoccuring

while true do -- loop logic sequence

    if (os.time() - lastCompletionTime) > 900 then -- kill command if points arent accruing over 15 mins
        yield("/echo Astronaut, we aren't making any progress here!")
        yield("/snd stop all")
        return
    end

    if not CheckPlugins() then return end
    EquipFisher()
    local mission = GetActiveMission() -- start of next mission

    if not mission then -- attempt to register mission if something is acting up
        yield("/echo No active mission detected. Reprocessing...")
        yield("/wait 5")
        goto continue
    end

    local distance = GetDistanceToTarget(mission.coords) -- checking for movement progress against mission coords
    if distance > 5 then
        local moveSuccess = MoveToTarget(mission.hole, mission.coords)
        if not moveSuccess then
            yield("/echo Movement failed. Abandoning current mission.")
            yield("/callback WKSMissionInformation true 12 1")
            yield("/wait 2")
            goto continue
        end
    end

    -- failsafes, attempt another mission before killing script
    if not AutoHookPresetByMission(mission.id, mission.name) then goto continue end
    if not PerformFishingMission(mission) then goto continue end
    if not DoCraftingStep(mission) then goto continue end
    if not SubmitMission(mission) then goto continue end

    -- PPH calc baseline
    if isFirstRun then
        yield("/echo First mission complete, astronaut!")
        isFirstRun = false
    else
        -- PPH calc after first run
        local currentLunarPoints = CurrentLunarPoints()
        local currentClassExp = CurrentCosmicClassExp()
        local lunarGained = currentLunarPoints - lastLunarPoints
        local expGained = currentClassExp - lastClassExp
        local timeElapsed = os.time() - lastCompletionTime

        if timeElapsed > 0 then
            local hoursElapsed = timeElapsed / 3600
            local lunarPPH = math.floor(lunarGained / hoursElapsed)
            local expPPH = math.floor(expGained / hoursElapsed)

            yield("/echo Mission success! Rates -- Lunar Credits: " .. lunarPPH .. "/hr | FSH EXP: " .. expPPH .. "/hr.")
        end
    end

    lastCompletionTime = os.time()
    lastLunarPoints = CurrentLunarPoints()
    lastClassExp = CurrentCosmicClassExp()

    yield("/wait " .. math.random(2, 4))
    ::continue::
end