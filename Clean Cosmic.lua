-- =========================================
-- Introduction
-- =========================================

-- NOTE: Find the following in the SND .meta file:
    -- Instructions
    -- Prerequisites
    -- Plugin Dependencies
    -- Plugin Settings

-- NOTE: Find the following in my github repo:
    -- Autohook presets
    -- visland routes
    -- To-do's
    -- Usage cases

-- NOTE: Add ONLY the following ICE FSH missions.
    -- /ice add 509 508 510 511 543 544 542

local presetMap = {
    [509] = "MoonGel",
    [508] = "ProcessedMetals",
    [510] = "CrystallicGems",
    [511] = "EelRations",
    [543] = "SunkDrone",
    [544] = "MutatedFish",
    [542] = "EdibleFish",
}
-- =========================================
-- DATA TABLES
-- =========================================

import("System.Numerics")

local fishingHoles = {
    ["Palus Arsenici"]          = { x = 527.0,  y = 53.7,  z = 598.1, route = "SURF PALUS ASSINIRE 100% GUARANTEED" },
    ["Hollow Harbor"]           = { x = -563.5, y = 69.1,  z = -647.4, route = "BASE TO HOLLOW HARBOR 99% GUARANTEE SPECIAL" },
    ["Northward Hop-print"]     = { x = 918.3,  y = -58.8,  z = -337.2, route = "NORTH HOP-PRINT SURELY" },
    ["Southeast Well"]          = { x = 203.7,  y = 19.5,  z = 204.7, route = "SURF TO THE WELL (SOUTHEAST) MAJOR BIGLY" },
    ["Weeping Pool"]            = { x = 70.5,   y = 26.0,  z = -307.1, route = "YOSHIP'S CASUALS TEAR COLLECTION" },
    ["Westward Hop-print"]      = { x = -264.2, y = 22.4,  z = -96.1, route = "OUEST HOP-PRANT" },
    ["Glimmerpond Alpha"]       = { x = -688.1, y = 57.1,  z = 398.9, route = "GIGALPHAPOOCHAD" },
    ["Glimmerpond Beta"]        = { x = -357.5, y = 47.8,  z = 639.8, route = "GIGAPOOBETASISSY" },
    ["Aetherial Falls"]         = { x = 918.2,  y = -58.8, z = -337.2, route = "REALLY???????? FUCK WATERFALLS" },
    ["Critical_Drone_LOC"]        = { x = -124.4, y = 20.1,  z = -286.3, route = "SUNKEN DRONK" },
    ["Critical_EdibleFish_LOC"]   = { x = -299.7, y = 24.4,  z = -102.0, route = "EDIBLE WHAT" },
    ["Critical_MutatedFish_LOC"]  = { x = 110.2,  y = 18.8,  z = -229.5, route = "DONALDTRUMPFISH" },
    ["Critical_Drone_TurnIn"]       = { x = -250.9, y = 19.5,  z = -250.9 },
    ["Critical_EdibleFish_TurnIn"]  = { x = -459.2, y = 37.7,  z = -67.1 },
    ["Critical_MutatedFish_TurnIn"] = { x = 114.9,  y = 19.7,  z = -196.9 },
}

local FishingMissions = {
    -- Prerequisite Missions (UNFINISHED)
    { id = 485, name = "A-1: Fine-grade Water Filter Materials I", hole = "Westward Hop-print", coords = fishingHoles["Westward Hop-print"], requiresCrafting = false },
    { id = 486, name = "A-2: Fine-grade Water Filter Materials II", hole = "Weeping Pool", coords = fishingHoles["Weeping Pool"], requiresCrafting = false },
    { id = 487, name = "A-3: Fine-grade Water Filter Materials III", hole = "Hollow Harbor", coords = fishingHoles["Hollow Harbor"], requiresCrafting = false },

    -- Hybrid Missions
    { id = 510, name = "A-3: Crystallic Gems", fishID = 45928, famount = 14, itemId = 47221, iamount = 3, min_iamount = 1, weatherId = 49, hole = "Palus Arsenici", coords = fishingHoles["Palus Arsenici"], requiresCrafting = true, crafter = "Goldsmith" },
    { id = 511, name = "A-3: Eel Rations", fishID = 45940, famount = 3, itemId = 45934, iamount = 3, min_iamount = 1, weatherId = 148, hole = "Hollow Harbor", coords = fishingHoles["Hollow Harbor"], requiresCrafting = true, crafter = "Culinarian" },
    { id = 509, name = "A-2: Refined Moon Gel", fishID = 45922, famount = 3, itemId = 47593, iamount = 3, min_iamount = 1, weatherId = 1, hole = "Westward Hop-print", coords = fishingHoles["Westward Hop-print"], requiresCrafting = true, crafter = "Alchemist" },
    { id = 508, name = "A-2: Processed Aquatic Metals", fishID = 45917, famount = 14, itemId = 46973, iamount = 3, min_iamount = 1, weatherId = 1, hole = "Southeast Well", coords = fishingHoles["Southeast Well"], requiresCrafting = true, crafter = "Blacksmith" },

    -- Critical Missions
    { id = 543, name = "Sunken Drone Salvage", fishID = 45939, famount = 3, weatherId = 149, hole = "Critical_Drone_LOC", coords = fishingHoles["Critical_Drone_LOC"], turnIn = "Critical_Drone_TurnIn", requiresCrafting = false },
    { id = 544, name = "Mutated Fish", fishID = 45945, famount = 3, weatherId = 197, hole = "Critical_MutatedFish_LOC", coords = fishingHoles["Critical_MutatedFish_LOC"], turnIn = "Critical_MutatedFish_TurnIn", requiresCrafting = false },
    { id = 542, name = "Edible Fish", fishID = 45937, famount = 3, weatherId = 196, hole = "Critical_EdibleFish_LOC", coords = fishingHoles["Critical_EdibleFish_LOC"], turnIn = "Critical_EdibleFish_TurnIn", requiresCrafting = false },
}

-- =========================================
-- HELPER FUNCTIONS
-- =========================================

function EquipFisher()
    if classId ~= 18 then
        yield("/gs change " .. FisherGearset)
        yield("/wait 1")
    end
end

function EnsureMissionWindowOpen()
    if not Addons.GetAddon("WKSMissionInfomation").Ready then
        yield("/callback WKSHud true 11")
        yield("/wait 0.5")
    end
end

local iceStarted = false
function GetActiveMission()
    if not iceStarted then
        yield("/ice start")
        yield("/wait 1")
        iceStarted = true
    end
    while true do
        EnsureMissionWindowOpen()
        if Addons.GetAddon("WKSMissionInfomation").Ready then
            local missionName = Addons.GetAddon("WKSMissionInfomation"):GetNode(1, 3).Text
            for _, mission in ipairs(FishingMissions) do
                if mission.name == missionName then return mission end
            end
        end
        yield("/wait 0.5")
    end
end

function IsCriticalMission(mission)
    return mission.id == 542 or mission.id == 543 or mission.id == 544
end

function GetDistanceToTarget(targetCoords)
    if not targetCoords then return 999 end
    local playerPos = Svc.ClientState.LocalPlayer.Position
    return math.sqrt((playerPos.X - targetCoords.x)^2 + (playerPos.Y - targetCoords.y)^2 + (playerPos.Z - targetCoords.z)^2)
end

function HasMinAnglersArtStacks()
    if not (Svc and Svc.ClientState and Svc.ClientState.LocalPlayer and Svc.ClientState.LocalPlayer.StatusList) then return false end
    for _, status in ipairs(Svc.ClientState.LocalPlayer.StatusList) do
        if status.StatusId == 2778 and status.Param >= 3 then
            return true
        end
    end
    return false
end

function UseAnglersArtStacks()
    if HasMinAnglersArtStacks() then
        yield("/echo Using Angler's Art stacks for GP...")
        while HasMinAnglersArtStacks() do
            Actions.ExecuteGeneralAction(26804) -- Thaliak's Favor
            yield("/wait 1.5")
        end
    end
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
-- CORE SCRIPT LOGIC FUNCTIONS
-- =========================================

function AutoHookPresetByMission(missionId, missionName)
    local preset = presetMap[missionId]
    if preset then
        IPC.AutoHook.SetPreset(preset)
        yield('/echo AutoHook preset set to: "' .. preset .. '".')
        return true
    else
        yield('/echo ERROR: No AutoHook preset found for mission "' .. (missionName or "?") .. '".')
        return false
    end
end

function MoveToTarget(holeName, targetCoords)

    local maxRetries = 2
    local holeData = fishingHoles[holeName]

    if not (holeData and holeData.route and holeData.route ~= "") then
        yield('/echo ERROR: No Visland route found for "' .. holeName .. '".')
        return false
    end

    for attempt = 1, maxRetries do
        yield('/echo Move attempt ' .. attempt .. '/' .. maxRetries .. ' to "' .. holeName .. '".')
        yield('/visland execonce ' .. holeData.route)
        local startTime = os.time()
        local maxTravelTime = 120
        local lastStuckCheckTime = os.time()
        local lastStuckCheckPos = Svc.ClientState.LocalPlayer.Position
        while IPC.visland.IsRunning() do
            if (os.time() - startTime) > maxTravelTime then
                yield("/echo MOVEMENT TIMEOUT.")
                IPC.visland.StopRoute()
                break
            end

            if (os.time() - lastStuckCheckTime) > 5 then
                local currentPos = Svc.ClientState.LocalPlayer.Position
                local distMoved = math.sqrt((currentPos.X - lastStuckCheckPos.X)^2 + (currentPos.Y - lastStuckCheckPos.Y)^2 + (currentPos.Z - lastStuckCheckPos.Z)^2)
                if distMoved < 1 then
                    yield("/echo STUCK DETECTED.")
                    IPC.visland.StopRoute()
                    break
                end
                lastStuckCheckTime = os.time()
                lastStuckCheckPos = currentPos
            end

            yield("/wait 1")

        end

        if GetDistanceToTarget(targetCoords) <= 5 then
            yield('/echo Arrived at ' .. holeName .. '.')
            return true

        elseif attempt < maxRetries then
            yield("/echo Movement failed. Returning to base to retry...")
            Actions.ExecuteGeneralAction(26) -- "Return" Action
            yield("/wait " .. math.random(7, 12))
        end
    end

    yield("/echo FAILED to reach " .. holeName .. " after " .. maxRetries .. " attempts.")
    return false
end

function PerformFishingMission(mission)

    if not mission.fishID or not mission.famount then
        yield("/echo Mission data incomplete (fishID/famount). Skipping.")
        return false
    end

    if not (IPC and IPC.AutoHook and IPC.AutoHook.SetPluginState) then
        yield("/echo ERROR: AutoHook IPC not available.")
        return false
    end

    IPC.AutoHook.SetPluginState(true)
    local startTime = os.time()
    local maxFishingTime = 480

    while Inventory.GetItemCount(mission.fishID) < mission.famount do
        if (os.time() - startTime) > maxFishingTime then
            yield("/echo FISHING TIMEOUT.")
            IPC.AutoHook.SetPluginState(false)
            return false
        end
        if not Svc.Condition[43] then
            yield("/echo Not fishing, restarting AutoHook.")
            yield('/ahstart')
            yield('/wait 3')
        end
        yield("/wait 1")
    end

    IPC.AutoHook.SetPluginState(false)

    if Svc.Condition[6] then
        yield("/ac quit")
        while Svc.Condition[6] do yield("/wait 0.2") end
    end

    yield("/echo Fishing complete.")
    return true
end

function DoCraftingStep(mission)

    if not mission.requiresCrafting then return true end

    UseAnglersArtStacks()

    if not mission.crafter then
        yield("/echo ERROR: Mission requires crafting, but 'crafter' is not set.")
        return false
    end

    yield("/gs change " .. mission.crafter)
    yield("/wait 2")

    if not (IPC and IPC.Artisan and IPC.Artisan.CraftItem and IPC.Artisan.IsListRunning) then
        yield("/echo ERROR: Artisan IPC not available.")
        return false
    end

    IPC.Artisan.CraftItem(mission.itemId, mission.iamount)
    yield("/wait 1")

    while IPC.Artisan.IsListRunning() do
        yield("/wait 1")
    end

    local craftedCount = Inventory.GetItemCount(mission.itemId)

    if craftedCount >= mission.min_iamount then
        yield("/echo Crafting successful. " .. craftedCount .. " items produced.")
        return true
    else
        yield("/echo ERROR: Crafting failed. Did not produce enough items.")
        return false
    end
end

function SubmitMission(mission)

    if mission.requiresCrafting then
        if Inventory.GetItemCount(mission.itemId) < mission.min_iamount then
            yield("/echo ERROR: Missing final CRAFTED items.")
            return false
        end
    else
        if not mission.fishID then return true end
        if Inventory.GetItemCount(mission.fishID) < mission.famount then
            yield("/echo ERROR: Missing FISH for turn-in.")
            return false
        end
    end

    while Svc.Condition[5] do yield("/wait 0.1") end

    EquipFisher()

    if IsCriticalMission(mission) then
        local turnInCoords = fishingHoles[mission.turnIn]
        if not (turnInCoords and turnInCoords.x) then
            yield("/echo ERROR: Missing coordinates for critical turn-in.")
            return false
        end

        local destVector = Vector3.new(turnInCoords.x, turnInCoords.y, turnInCoords.z)

        if not (IPC and IPC.vnavmesh and IPC.vnavmesh.PathfindAndMoveTo and IPC.vnavmesh.IsRunning) then
            yield("/echo ERROR: vnavmesh IPC not available.")
            return false
        end

        IPC.vnavmesh.PathfindAndMoveTo(destVector, false)

        while IPC.vnavmesh.IsRunning() do
            yield("/wait 0.5")
        end
        yield('/target "Collection Point"')
        yield("/interact")
        yield("/wait 3")
    else

        if not Addons.GetAddon("WKSMissionInfomation").Ready then
            yield("/callback WKSHud true 11")
            yield("/wait 0.5")
        end

        yield("/callback WKSMissionInfomation true 11 1")
        yield("/wait 1")
    end

    yield("/echo Mission submission complete.")
    return true
end

-- =========================================
-- MAIN LOOP
-- =========================================

    -- Pre-loop Checks --

local lastCompletionTime, lastLunarPoints, lastClassExp, isFirstRun

while true do

    if isFirstRun == nil then
        isFirstRun = true
        lastCompletionTime = os.time()
        lastLunarPoints = CurrentLunarPoints()
        lastClassExp = CurrentCosmicClassExp()
    end

    if not isFirstRun and (os.time() - lastCompletionTime) > 900 then
        yield("/echo No progress in 15 minutes. Stopping.")
        yield("/snd stop all")
        return
    end

    -- Main Logic Loop --

    EquipFisher()
    local mission = GetActiveMission()
    if not mission then
        yield("/echo No active mission. Checking again...")
        yield("/wait 5")
        goto continue
    end

    if GetDistanceToTarget(mission.coords) > 5 then
        if not MoveToTarget(mission.hole, mission.coords) then
            yield("/echo Movement failed. Abandoning mission.")
            yield("/callback WKSMissionInformation true 12 1")
            yield("/wait 2")
            goto continue
        end
    end

    if not AutoHookPresetByMission(mission.id, mission.name) then goto continue end
    if not PerformFishingMission(mission) then goto continue end
    if not DoCraftingStep(mission) then goto continue end
    if not SubmitMission(mission) then goto continue end

    -- PPH Calculation and variable reset
    if isFirstRun then
        yield("/echo First mission complete!")
        isFirstRun = false
    else
        local currentLunarPoints = CurrentLunarPoints()
        local currentClassExp = CurrentCosmicClassExp()
        local lunarGained = currentLunarPoints - lastLunarPoints
        local expGained = currentClassExp - lastClassExp
        local timeElapsed = os.time() - lastCompletionTime

        if timeElapsed > 0 then
            local hoursElapsed = timeElapsed / 3600
            local lunarPPH = math.floor(lunarGained / hoursElapsed)
            local expPPH = math.floor(expGained / hoursElapsed)
            yield("/echo Mission success! Rates -- Lunar Credits: " .. lunarPPH .. "/hr | EXP: " .. expPPH .. "/hr.")
        end
    end

    lastCompletionTime = os.time()
    lastLunarPoints = CurrentLunarPoints()
    lastClassExp = CurrentCosmicClassExp()

    yield("/wait " .. math.random(2, 4))
    ::continue::
end